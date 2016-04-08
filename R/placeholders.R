# THIS CODE IS TERRIBLE AND WAS DONE IN AN HOUR AS A PROOF OF CONCEPT
# DO NOT JUDGE ME!

gadget <- function() {}

addin <- function() {}

getAddinsList <- function() {}

mdfile <- tempfile(fileext = ".md")
htmlfile <- tempfile(fileext = ".html")
url <- "https://raw.githubusercontent.com/daattali/rstudio-addins/master/README.md"
curl::curl_download(url, destfile = mdfile)
rmarkdown::pandoc_convert(mdfile, to = "html", output = htmlfile)
html <- xml2::read_html(htmlfile)

headerNames <- xml2::xml_text(xml2::xml_find_all(html, "//thead//th"))

cranColumnId <- which(grepl("cran", headerNames, ignore.case = TRUE))
packageColumnId <- which(grepl("package", headerNames, ignore.case = TRUE))

rows <- xml2::xml_find_all(html, "//tbody/tr")

cells <- lapply(rows, function(x){ rvest::html_nodes(x, xpath = ".//td|.//th") })

installed <- rownames(installed.packages(noCache = TRUE))
pkgs <- data.frame(package = character(0),
                   oncran = logical(0),
                   github = character(0),
                   installed = logical(0),
                   stringsAsFactors = FALSE)
out <- matrix(NA_character_, nrow = length(rows), ncol = length(headerNames))
for (i in seq_len(length(rows))) {
  row <- cells[[i]]
  values <- lapply(row, function(x) {
    paste(as.character(xml2::xml_contents(x)), collapse = " ")
  })
  values <- unlist(values)

  if (values[cranColumnId] == ":x:") {
    oncran <- FALSE
  } else if (values[cranColumnId] == ":white_check_mark:") {
    oncran <- TRUE
  } else {
    stop("catch this error so that other rows still work!")
  }
  values[cranColumnId] <- oncran

  out[i, ] <- values

  pkg <- xml2::xml_text(row[[packageColumnId]])
  pkg_url <- xml2::xml_attr(xml2::xml_find_one(row[[packageColumnId]], "a"), "href")
  github <- gsub("(.*)(github.com/)([^/]+)/([^/@#]+)(.*)", "\\3/\\4", pkg_url ) 
    
  pkgs[i, 'package'] <- pkg
  pkgs[i, 'oncran'] <- oncran
  pkgs[i, 'github'] <- github
  pkgs[i, 'installed'] <- pkg %in% installed
}
out <- as.data.frame(out)
colnames(out) <- headerNames



library(shiny)
library(DT)

checkmark <- icon("check")

ui <- fluidPage(
  shinyjs::useShinyjs(),
  shinyjs::inlineCSS("#addinstable tr:hover { background: lightgreen;}"),
  div(style = "display: none;", icon("check")),
  DT::dataTableOutput("addinstable")
)

server <- function(input, output, session) {
  
  values <- reactiveValues(installed = NULL)
  values$installed <- pkgs$installed
  
  observeEvent(input$addinstable_rows_selected, {
    idx <- which(out$Name == input$addinstable_rows_selected)
    if (!values$installed[idx]) {
      if(pkgs$oncran[idx]) {
        install.packages(pkgs$package[idx])
      } else {
        devtools::install_github(pkgs$github[idx])
      }
      values$installed[idx] <- TRUE
    } else {
      shinyjs::info("Uninstalling isn't supported yet!")
    }
  })
  
  output$addinstable <- DT::renderDataTable({
    pkgsArray <- paste0("[", paste(which(values$installed), collapse = ","), "]")
    
    DT::datatable(out, escape = FALSE, rownames = FALSE, options = list(
      columnDefs = list(list(
      targets = cranColumnId - 1,
      render = DT::JS(
        "function(data, type, row, meta) {",
        "return data === 'TRUE' ?",
        "'<i class=\"fa fa-check\" style=\"color:green;\"></i>' : ",
        "'<i class=\"fa fa-times\"></i>';",
        "}"))),
      initComplete = DT::JS(
        "function(settings, json) {",
        "$.each(", pkgsArray, ", function(x, y){$($('tr')[y]).css('background', 'lightgreen');});",
        "}"))
    )
  })

}

shinyApp(ui = ui, server = server)
