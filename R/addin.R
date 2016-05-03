#' Addin for browsing and installing RStudio addins
#'
#' This addin allows you to interactively browse through the list of existing
#' addins, see which ones you already have installed, and let you
#' install/uninstall the corresponding package of each addin. This addin can be
#' invoked from RStudio's "Addins" menu.
#' @export
#' @import shiny
addinslistAddin <- function() {
  resourcePath <- system.file("gadgets", "addinslist", package = "addinslist")
  system.file("lib", "sweetalert-1.0.1", package = "addinslist")
  addResourcePath("addinslistres", resourcePath)
  
  ui <- miniUI::miniPage(
    shinyjs::useShinyjs(),
    shinyjs::extendShinyjs(
      script = file.path(resourcePath, "js", "shinyjs-funcs.js"),
      functions = c("swal", "confirmation")
    ),
    tags$head(
      includeScript(file.path(resourcePath, "lib", "sweetalert-1.0.1", "sweetalert.min.js")),
      includeCSS(file.path(resourcePath, "lib", "sweetalert-1.0.1", "sweetalert.min.css")),
      includeCSS(file.path(resourcePath, "css", "app.css"))
    ),
    miniUI::miniContentPanel(
      padding = 0,
      shinyjs::hidden(
        div(
          id = "installing-overlay",
          div(id = "installing-msg",
              span(id = "overlay-text"),
              icon("spinner", class="fa-spin"))
        )
      ),
      div(
        id = "top-section",
        h2(id = "title", "RStudio addins"),
        div(id = "last-updated",
            span("Last updated ",
                 textOutput("updated_time", inline = TRUE)),
            actionLink("refresh", label = "", icon = icon("refresh"), title = "Refresh")
        ),
        checkboxInput(
          "confirmation",
          "Ask for confirmation before installing or uninstalling a package",
          TRUE,
          width = "auto"
        ),
        selectInput("download_from", NULL,
                    c("Download from CRAN when possible" = "cran",
                      "Always download from GitHub" = "github"))
      ),
      div(style = "display: none;", icon("check")),
      DT::dataTableOutput("addinstable")
    )
  )
  
  server <- function(input, output, session) {
    
    # values used throughout the app
    values <- reactiveValues(addins_data = NULL, last_refresh = NULL,
                             install_pkg = NULL, uninstall_pkg = NULL)
    
    # Function to update the addins list and the corresponding reactive values
    update_addins_list_values <- function(...) {
      update_addins_list(...)
      values$addins_data <- .addinsrepo_globals$addins_list
      values$last_refresh <- .addinsrepo_globals$last_refresh
    }
    
    # Function to refresh the addins list and show the user a loading message
    refresh_list <- function() {
      shinyjs::show("installing-overlay")
      shinyjs::html("overlay-text", "Refreshing addins list...")
      update_addins_list_values(force = TRUE)
      shinyjs::hide("installing-overlay")
    }     
    
    # When the app starts, ensure the data is up-to-date
    if (is_addins_file_outdated()) {
      refresh_list()
    } else {
      update_addins_list_values()
    }

    
    # Show when the list was last updated
    output$updated_time <- renderText({
      if (!is.null(values$last_refresh)) {
        paste(
          round(Sys.time() - values$last_refresh),
          units(Sys.time() - values$last_refresh),
          "ago"
        )
      }
    })
  
    # User wants to refresh the list of addins
    observeEvent(input$refresh, {
      refresh_list()
    })
  
    # JS sent a message to Shiny to install/uninstall a package (after user confirm)
    observeEvent(input$install, {
      values$install_pkg <- input$install[1]
    })
    observeEvent(input$uninstall, {
      values$uninstall_pkg <- input$uninstall[1]
    })
    
    # Install/uninstall a package
    observeEvent(values$install_pkg, {
      shinyjs::show("installing-overlay")
      shinyjs::html("overlay-text", paste0("Installing ", values$install_pkg, "..."))
      
      # Figure out which package to install and attempt to install it
      idx <- which(values$addins_data$internal_pkgname == values$install_pkg)[1]
      tryCatch({
        if(values$addins_data[idx, .addinsrepo_globals$cranColumnId] == TRUE && (input$download_from == "cran")) {
          utils::install.packages(values$install_pkg)
        } else {
          devtools::install_github(values$addins_data$internal_github_repo[idx])
        }
      }, error = function(err) {
        shinyjs::js$swal(title = "Error", text = err$message, type = "error")
      })
      
      shinyjs::hide("installing-overlay")
      values$install_pkg <- NULL
      update_addins_list_values()
    })
    observeEvent(values$uninstall_pkg, {
      shinyjs::show("installing-overlay")
      shinyjs::html("overlay-text", paste0("Uninstalling ", values$uninstall_pkg, "..."))
      
      # Figure out which package to uninstall and do it
      idx <- which(values$addins_data$internal_pkgname == values$uninstall_pkg)[1]
      utils::remove.packages(values$addins_data[idx, 'internal_pkgname'])
      
      values$uninstall_pkg <- NULL
      shinyjs::hide("installing-overlay")
      update_addins_list_values()
    })
    
    # User clicked on a row in the table; need to install/uninstall based on selection
    observeEvent(input$rowclick, {
      pkg <- input$rowclick[1]
      if (pkg == "shinyjs") {
        shinyjs::js$swal(title = "", text = "Cannot uninstall shinyjs, it is required for the current app to work",
                         type = "info")
        return()
      }
      if (pkg == "addinslist") {
        shinyjs::js$swal(title = "", text = "Cannot uninstall addinslist, it is required for the current app to work",
                         type = "info")
        return()
      }   
      
      # Figure out which package was selected and ask for confirmation/do it
      idx <- which(values$addins_data$internal_pkgname == pkg)[1]
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
    
    # Render the table
    output$addinstable <- DT::renderDataTable({
      DT::datatable(
        values$addins_data,
        escape = FALSE,
        rownames = FALSE,
        selection = "none",
        class = 'stripe',
        options = list(
          dom = "iftlp",
          language = list(
            zeroRecords = "No addins found",
            info = "_TOTAL_ addins found",
            infoFiltered = "",
            infoPostFix = " (click any row to install/uninstall the addin's package)",
            infoEmpty = "No addins found",
            search = "",
            searchPlaceholder = "Search..."
          ),
          columnDefs = list(
            list(
              # show a checkmark or an X in the column for "is on CRAN?"
              targets = .addinsrepo_globals$cranColumnId - 1,
              render = DT::JS(
                "function(data, type, row, meta) {",
                "return data === 'TRUE' ?",
                "'<i class=\"fa fa-check\" style=\"color:green;\"></i>' : ",
                "'<i class=\"fa fa-times\"></i>';",
                "}")
            ),
            list(
              # don't show the internal variables
              targets = seq(length(.addinsrepo_globals$headerNames),
                            ncol(values$addins_data) - 1),
              visible = FALSE
            )
          ),
          searching = TRUE,
          paging = FALSE,
          rowCallback = DT::JS(
            # add the package name and whether or not it's installed to every row
            "function(row, data) {
              $(row).addClass('pkgrow');
               var pkgname = data[", .addinsrepo_globals$packageNameColumnId - 1 ,"];
               $(row).attr('data-pkgname', pkgname);
               var isinstalled = data[", ncol(values$addins_data) - 1, "].toString().trim().toLowerCase();
               if (isinstalled == 'true') {
                 $(row).addClass('installed');
               }
            }")
        )
      )
    })
  }
  
  # Run the addin
  app <- shinyApp(ui = ui, server = server)
  viewer <- dialogViewer("Discover and install useful RStudio addins", width = 1200, height = 900)
  runGadget(app, viewer = viewer, stopOnCancel = TRUE)
}