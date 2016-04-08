
# THIS CODE IS TERRIBLE AND WAS DONE IN AN HOUR AS A PROOF OF CONCEPT
# DO NOT JUDGE ME!

#' @export
#' @import shiny
gadget <- function() {
  update_addins_installed_field()
  resourcePath <- system.file("lib", "sweetalert-1.0.1", package = "rstudioaddins")
  
  jscode <- "
shinyjs.swal = function(params) { 
  var defaultParams = {
  title : null,
  text : null,
  type : null
  };
  params = shinyjs.getParams(params, defaultParams);
  swal(params);
};
  
  shinyjs.confirmation = function(params) { 
  var defaultParams = {
  type : null,
  package : null 
  };
  params = shinyjs.getParams(params, defaultParams);
  if (params.type == 'install') {
  params.colour = 'green';
  } else {
  params.colour = '#DD6B55';
  }
  
  swal({
  title: 'Are you sure you want to <strong>' + params.type + ' ' + params.package + '</strong>?',
  type: 'warning', showCancelButton: true,
  confirmButtonColor: params.colour, confirmButtonText: 'Yes, ' + params.type + ' away!',
  closeOnConfirm: true, html: true
  }, function(){
  Shiny.onInputChange(params.type, {random: Math.random(), package : params.package}); }
  );
  }
  "
  
  ui <- fluidPage(
    shinyjs::useShinyjs(),
    tags$head(
      includeScript(file.path(resourcePath, "sweetalert.min.js")),
      includeCSS(file.path(resourcePath, "sweetalert.min.css"))
    ),
    shinyjs::extendShinyjs(text = jscode, functions = c("confirmation", "swal")),
    shinyjs::inlineCSS("
                       #addinstable tbody tr { cursor: pointer; }
                       #addinstable tbody tr:hover,
                       #addinstable tbody tr.installed { background: lightgreen;}
                       #addinstable tbody tr.installed:hover { background: #EE9C90;}
                       #installing-overlay{
                       position: fixed;
                       top: 0;
                       bottom: 0;
                       left: 0;
                       right: 0;
                       background: rgba(0,0,0,0.8);text-align: center;
                       z-index: 2;}
                       #installing-msg {
                       margin-top: 100px;
                       font-size: 37px;
                       color: white;
                       font-weight: bold;
                       }
#refresh { margin-left: 5px; }
#last-updated {float: right;}
                       "),
    shinyjs::hidden(div(id = "installing-overlay",
                        div(id = "installing-msg",
                            span(id = "overlay-text"),
                            icon("spinner", class="fa-spin")))),
    div(id = "last-updated",
      span("List was last updated ",
           span(id = "updated_time",
                as.integer(Sys.time() - .addinsrepo_globals$lastrefresh),
                units(Sys.time() - .addinsrepo_globals$lastrefresh), "ago")),
      actionLink("refresh", label = "", icon = icon("refresh"), title = "Refresh")
    ),
    selectInput("download_from", NULL,
                c("Download from CRAN when possible" = "cran",
                  "Always download from GitHub" = "github")),
    checkboxInput("confirmation", "Ask for confirmation before installing or uninstalling a package", TRUE),
    div(style = "display: none;", icon("check")),
    DT::dataTableOutput("addinstable")
    )
  
  server <- function(input, output, session) {
    
    values <- reactiveValues(addins_data = NULL,
                             install_pkg = NULL, uninstall_pkg = NULL)
    values$addins_data <- .addinsrepo_globals$addins_list
    
    observeEvent(input$refresh, {
      shinyjs::show("installing-overlay")
      shinyjs::html("overlay-text", "Refreshing list...")
      
      update_addins_file()
      values$addins_data <- .addinsrepo_globals$addins_list
      shinyjs::html("updated_time", "right now")
      
      shinyjs::hide("installing-overlay")
    })
    
    observeEvent(input$install, {
      values$install_pkg <- input$install$package
    })
    
    observeEvent(input$uninstall, {
      values$uninstall_pkg <- input$uninstall$package
    })
    
    observeEvent(values$install_pkg, {
      shinyjs::show("installing-overlay")
      shinyjs::html("overlay-text", paste0("Installing ", values$install_pkg, "..."))
      
      idx <- which(values$addins_data$internal_pkgname == values$install_pkg)[1]
      
      tryCatch({
        if(values$addins_data[idx, .addinsrepo_globals$cranColumnId] == TRUE && (input$download_from == "cran")) {
          install.packages(values$install_pkg)
        } else {
          devtools::install_github(values$addins_data$internal_github_repo[idx])
        }
      }, error = function(err) {
        shinyjs::js$swal(title = "Error", text = err$message, type = "error")
      })
      
      shinyjs::hide("installing-overlay")
      
      update_addins_installed_field()
      values$addins_data <- .addinsrepo_globals$addins_list
    })
    
    observeEvent(values$uninstall_pkg, {
      shinyjs::show("installing-overlay")
      shinyjs::html("overlay-text", paste0("Uninstalling ", values$install_pkg, "..."))
      
      idx <- which(values$addins_data$internal_pkgname == values$uninstall_pkg)[1]
      remove.packages(values$addins_data[idx, 'internal_pkgname'])
      
      update_addins_installed_field()
      values$addins_data <- .addinsrepo_globals$addins_list
      
      shinyjs::hide("installing-overlay")
    })
    
    observeEvent(input$addinstable_rows_selected, {
      idx <- input$addinstable_rows_selected
      pkg <- values$addins_data[idx, 'internal_pkgname']
      if (pkg == "shinyjs") {
        shinyjs::js$swal(title = "", text = "Cannot uninstall shinyjs, it is required for the current app to work",
                         type = "info")
        return()
      }    
      
      if (input$confirmation) {
        if (!values$addins_data[idx, 'internal_installed']) {
          shinyjs::js$confirmation("install", pkg)
        } else {
          shinyjs::js$confirmation("uninstall", pkg)
        }
      } else {
        if (!values$addins_data[idx, 'internal_installed']) {
          values$install_pkg <- pkg
        } else {
          values$uninstall_pkg <- pkg
        }
      }
    })
    
    output$addinstable <- DT::renderDataTable({
      #pkgsArray <- paste0("[", paste(which(values$addins_data[, 'internal_installed']), collapse = ","), "]")
      
      DT::datatable(
        values$addins_data,
        escape = FALSE, rownames = FALSE, selection = "single",
        class = 'stripe',
        options = list(
          dom = "",
          columnDefs = list(
            list(
              targets = .addinsrepo_globals$cranColumnId - 1,
              render = DT::JS(
                "function(data, type, row, meta) {",
                "return data === 'TRUE' ?",
                "'<i class=\"fa fa-check\" style=\"color:green;\"></i>' : ",
                "'<i class=\"fa fa-times\"></i>';",
                "}")
            ),
            list(
              targets = seq(length(.addinsrepo_globals$headerNames), ncol(values$addins_data) - 1),
              visible = FALSE
            )
          ),
          # initComplete = DT::JS(
          #   "function(settings, json) {",
          #   "$.each(", pkgsArray, ", function(x, y){$($('tr')[y]).css('background', 'lightgreen');});",
          #   "}"),
          searching = FALSE,
          paging = FALSE,
          rowCallback = JS(
            "function(row, data) {",
            "if (data[", ncol(values$addins_data) - 1, "] == true) $(row).addClass('installed');",
            "}")
        )
      )
    })
  }
  
  app <- shinyApp(ui = ui, server = server)
  viewer <- dialogViewer("RStudio addins installer", width = 1000, height = 800)
  runGadget(app, viewer = viewer, stopOnCancel = TRUE)
}

.addinsrepo_globals <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) {
  cat("LOADING\n")
  update_addins_file_if_needed()
}

update_addins_file_if_needed <- function() {
  datapath <- rappdirs::user_data_dir("addinsrepo", "daattali")
  htmlfile <- file.path(datapath, "addins.html")
  
  if (!file.exists(htmlfile)) {
    update_addins_file()
    return()
  }
  
  .addinsrepo_globals$lastrefresh <- file.mtime(htmlfile)
  SECS_IN_DAY <- 60*60*24
  if (as.numeric(Sys.time() - .addinsrepo_globals$lastrefresh, units = "secs") > SECS_IN_DAY) {
    update_addins_file()
  } else {
    update_addins_list()
  }
}

update_addins_file <- function() {
  datapath <- rappdirs::user_data_dir("addinsrepo", "daattali")
  dir.create(datapath, showWarnings = FALSE, recursive = TRUE)
  mdfile <- file.path(datapath, "addins.md")
  htmlfile <- file.path(datapath, "addins.html")
  url <- "https://raw.githubusercontent.com/daattali/rstudio-addins/master/README.md"
  curl::curl_download(url, destfile = mdfile)
  rmarkdown::pandoc_convert(mdfile, to = "html", output = htmlfile)
  .addinsrepo_globals$lastrefresh <- Sys.time()
  update_addins_list()
}

update_addins_list <- function() {
  datapath <- rappdirs::user_data_dir("addinsrepo", "daattali")
  htmlfile <- file.path(datapath, "addins.html")
  
  html <- xml2::read_html(htmlfile)
  headerNames <- xml2::xml_text(xml2::xml_find_all(html, "//thead//th"))
  
  cranColumnId <- which(grepl("cran", headerNames, ignore.case = TRUE))
  packageColumnId <- which(grepl("package", headerNames, ignore.case = TRUE))
  .addinsrepo_globals$cranColumnId <- cranColumnId
  .addinsrepo_globals$packageColumnId <- packageColumnId
  .addinsrepo_globals$headerNames <- headerNames
  
  rows <- xml2::xml_find_all(html, "//tbody/tr")
  
  cells <- lapply(rows, function(x){ rvest::html_nodes(x, xpath = ".//td|.//th") })
  
  installed_pkgs <- rownames(installed.packages(noCache = TRUE))
  out <- matrix(NA_character_, nrow = length(rows), ncol = length(headerNames) + 3)
  colnames(out) <- c(headerNames, "internal_pkgname", "internal_github_repo",
                     "internal_installed")
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
    pkg <- xml2::xml_text(row[[packageColumnId]])
    pkg_url <- xml2::xml_attr(xml2::xml_find_one(row[[packageColumnId]], "a"), "href")
    github <- gsub("(.*)(github.com/)([^/]+)/([^/@#]+)(.*)", "\\3/\\4", pkg_url ) 
    is_installed <- pkg %in% installed_pkgs
    
    values <- c(values, pkg, github, is_installed)
    out[i, ] <- values
  }
  out <- as.data.frame(out, stringsAsFactors = FALSE)
  out$internal_installed <- as.logical(out$internal_installed)
  
  .addinsrepo_globals$addins_list <- out
}

update_addins_installed_field <- function() {
  installed_pkgs <- rownames(installed.packages(noCache = TRUE))
  .addinsrepo_globals$addins_list$internal_installed <-
    .addinsrepo_globals$addins_list$internal_pkgname %in% installed_pkgs
}