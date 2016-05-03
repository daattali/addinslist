
# TODO if list hasn't been loaded, show the gadget immediately and show "loading" message



.addinsrepo_globals <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) {
  cat("LOADING\n")
  update_addins_file_if_needed()
}

update_addins_file_if_needed <- function() {
  if (is_addins_file_outdated()) {
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
  .addinsrepo_globals$headerNames <- headerNames
  .addinsrepo_globals$cranColumnId <- cranColumnId
  .addinsrepo_globals$packageColumnId <- packageColumnId
  
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
  
  packageNameColumnId <- which(colnames(out) == "internal_pkgname")
  .addinsrepo_globals$packageNameColumnId <- packageNameColumnId
}

update_addins_installed_field <- function() {
  installed_pkgs <- rownames(installed.packages(noCache = TRUE))
  .addinsrepo_globals$addins_list$internal_installed <-
    .addinsrepo_globals$addins_list$internal_pkgname %in% installed_pkgs
}

is_addins_file_outdated <- function() {
  datapath <- rappdirs::user_data_dir("addinsrepo", "daattali")
  htmlfile <- file.path(datapath, "addins.html")
  
  if (!file.exists(htmlfile)) {
    return(TRUE)
  }
  
  .addinsrepo_globals$lastrefresh <- file.mtime(htmlfile)
  SECS_IN_DAY <- 60*60*24
  if (as.numeric(Sys.time() - .addinsrepo_globals$lastrefresh, units = "secs") > SECS_IN_DAY) {
    return(TRUE)
  } else {
    return(FALSE)
  }  
}