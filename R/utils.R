.addinsrepo_globals <- new.env(parent = emptyenv())
.addinsrepo_globals$ttl <- 60*60*24  # Expire list after 24 hours

# Update the list of addins
update_addins_list <- function(force = FALSE) {
  # force means grab the latest list from online even if the existing list is recent
  if (force) {
    update_addins_file()
    update_addins_list_helper()
  } else {
    if (is.null(.addinsrepo_globals$addins_list)) {
      update_addins_list_helper()
    } else {
      if (is_expired(.addinsrepo_globals$last_refresh)) {
        update_addins_list_helper()
      } else {
        update_addins_installed_field()
      }
    }
  }
}

# Download a new version of the addins list and store it in a local file
update_addins_file <- function() {
  datapath <- get_files_path()
  dir.create(datapath, showWarnings = FALSE, recursive = TRUE)
  mdfile <- get_md_file()
  htmlfile <- get_html_file()
  url <- "https://raw.githubusercontent.com/daattali/rstudio-addins/master/README.md"
  curl::curl_download(url, destfile = mdfile)
  rmarkdown::pandoc_convert(mdfile, to = "html", output = htmlfile)
}

# Assuming the addins list file exists, parse the markdown table and
# update the list objects
update_addins_list_helper <- function() {
  htmlfile <- get_html_file()
  lastrefresh <- file.mtime(htmlfile)
  .addinsrepo_globals$last_refresh <- lastrefresh
  
  html <- xml2::read_html(htmlfile)
  headerNames <- xml2::xml_text(xml2::xml_find_all(html, "//thead//th"))
  
  cranColumnId <- which(grepl("cran", headerNames, ignore.case = TRUE))
  packageColumnId <- which(grepl("package", headerNames, ignore.case = TRUE))
  .addinsrepo_globals$headerNames <- headerNames
  .addinsrepo_globals$cranColumnId <- cranColumnId
  .addinsrepo_globals$packageColumnId <- packageColumnId
  
  rows <- xml2::xml_find_all(html, "//tbody/tr")
  
  cells <- lapply(rows, function(x){ rvest::html_nodes(x, xpath = ".//td|.//th") })
  
  installed_pkgs <- rownames(utils::installed.packages(noCache = TRUE))
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

# When the list objects already exist, sometimes we just need to update 
# whether or not each package is installed on our system
update_addins_installed_field <- function() {
  installed_pkgs <- rownames(utils::installed.packages(noCache = TRUE))
  .addinsrepo_globals$addins_list$internal_installed <-
    .addinsrepo_globals$addins_list$internal_pkgname %in% installed_pkgs
}

# Return TRUE if a new addins list needs to be downloaded
is_addins_file_outdated <- function() {
  htmlfile <- get_html_file()
  
  if (!file.exists(htmlfile)) {
    return(TRUE)
  }
  
  lastrefresh <- file.mtime(htmlfile)
  return(is_expired(lastrefresh))
}

# Check if a time stamp is expired
is_expired <- function(time) {
  as.numeric(Sys.time() - time, units = "secs") > .addinsrepo_globals$ttl
}

get_files_path <- function() {
  rappdirs::user_data_dir("addinsrepo", "daattali")
}

get_html_file <- function() {
  datapath <- get_files_path()
  htmlfile <- file.path(datapath, "addins.html")
  htmlfile
}

get_md_file <- function() {
  datapath <- get_files_path()
  mdfile <- file.path(datapath, "addins.md")
  mdfile
}