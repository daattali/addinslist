# Discover and install useful RStudio addins

[![Build
Status](https://travis-ci.org/daattali/addinslist.svg?branch=master)](https://travis-ci.org/daattali/addinslist)
[![CRAN
version](http://www.r-pkg.org/badges/version/addinslist)](https://cran.r-project.org/package=addinslist)

> *Copyright 2016 [Dean Attali](http://deanattali.com). Licensed under the MIT license.*

[RStudio addins](https://rstudio.github.io/rstudioaddins/) were released in early 2016 to provide anyone with the ability to add "extensions" to RStudio. This feature has quickly become popular, but discoverability was a problem: **there's just no easy way to know what addins exist.**

The `addinslist` package solves that problem in two ways:

- This package provides a continuously updated list of RStudio addins that you can browse through ([below](#addinslist-table)).

- After installing this package (`install.packages('addinslist')`), your RStudio will get populated with a new addin called "Browse RStudio addins". This addin allows you to interactively browse through the list of addins, see which ones you already have installed, and let you install/uninstall the corresponding package of each addin. The following image shows how to access this "addin of addins" in RStudio.

![Addins menu](https://raw.githubusercontent.com/daattali/addinslist/master/inst/media/addins-menu.png)

<h2 id="addinslist-table">List of addins</h2>

If you made a useful RStudio addin, feel free to make a pull request [on GitHub](https://github.com/daattali/addinslist#readme) to add it to the list. 

| Name | Description | Package | On CRAN? | Author | More links | Notes | 
|------|------|------|------|------|------|------|
| Browse RStudio addins | Browse and install RStudio addins | [addinslist](https://github.com/daattali/addinslist) | :white_check_mark: | [Dean Attali](http://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/addinslist/master/inst/media/addin.png) | |
| Colour picker | Lets you easily select colours | [colourpicker](https://github.com/daattali/colourpicker) | :white_check_mark: | [Dean Attali](http://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/colourpicker/master/inst/img/colourpickerscrnshot.png), [Demo video](https://raw.githubusercontent.com/daattali/colourpicker/master/inst/img/colourPickerGadget.gif) | |
| ggplot2 Marginal Plots | Add marginal plots to ggplot2 | [ggExtra](https://github.com/daattali/ggExtra) | :white_check_mark: | [Dean Attali](http://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/ggExtra/master/inst/img/ggmarginal-gadget.png) | |
| ggplot Theme Assist | Customize your ggplot theme | [ggThemeAssist  ](https://github.com/calligross/ggthemeassist) | :white_check_mark: | [Calli Gross](https://github.com/calligross) | [Demo GIF](https://raw.githubusercontent.com/calligross/ggthemeassist/master/examples/ggThemeAssist2.gif) | |
| Schedule R scripts on Windows | Use Windows task scheduler to schedule your R scripts (Windows) | [taskscheduleR](https://github.com/jwijffels/taskscheduleR) | :x: | [jwijffels](https://github.com/jwijffels) | [Screenshot](https://raw.githubusercontent.com/jwijffels/taskscheduleR/master/inst/img/taskscheduleR-rstudioaddin.png) | |
| Schedule R scripts on Linux/Unix  | Use cron to schedule your R scripts (Linux/Unix) | [cronR](https://github.com/jwijffels/cronR) | :x: | [jwijffels](https://github.com/jwijffels) | [Screenshot](https://raw.githubusercontent.com/jwijffels/cronR/master/inst/img/cronR-rstudioaddin.png) | |
| Assign default values | Set function arguments in selection to their default values | [jadd](https://github.com/jennybc/jadd) | :x: | [Jenny Bryan](https://github.com/jennybc) | [Demo GIF](https://raw.githubusercontent.com/jennybc/jadd/master/internal/assign_defaults.gif) | |
| Wrap Rmd | Wrap selected R Markdown text but don't insert lines breaks into inline R code | [WrapRmd](https://github.com/tjmahr/WrapRmd) | :x: | [TJ Mahr](http://tjmahr.com/) | | |
| Tidy Data | Interactively build tidyr function call (gather) | [tidyshiny](https://github.com/MangoTheCat/tidyshiny/) | :x: | [Mango Solutions](http://www.mango-solutions.com) | | |
| Lattice Plotting | Interactively build plots using the `lattice` system | [addinplots](https://github.com/homerhanumat/addinplots/) | :x: | [Homer White](http://statistics.rainandrhino.org) | | |
| Copy Frame to Clipboard | Copy a `data.frame` to the clipboard | [copydat](https://github.com/BAAQMD/copydat) | :x: | [Bay Area Air Quality Management District](https://github.com/BAAQMD) | | Doesn't work on Windows |
| Render Rmd in Console | Render an R Markdown document in the global environment |  [RStudioConsoleRender](https://github.com/jeffjjohnston/RStudioConsoleRender) | :x: | [Jeff Johnston](https://github.com/jeffjjohnston) | [Blog post](https://jeffjjohnston.github.io/rstudio/rmarkdown/2016/03/01/faster-rendering-in-rstudio.html) | |
| Document This | Auto-generate Roxygen skeletons for functions and data | [docthis](https://github.com/mdlincoln/docthis) | :x: | [Matthew Lincoln](http://matthewlincoln.net/) | | |
| Hist Add-In | Interactively create histograms with ggplot2 and obtain the R Code | [limoaddin](https://github.com/Stan125/limoaddin) | :x: | [Stanislaus Stadlmann](https://github.com/Stan125) | | |
| rpivotGadget | Add-in wrapper around the rpivotTable HTML widget | [rpivotGadget](https://github.com/dkilfoyle/rpivotGadget) | :x: | [Dean Kilfoyle](https://github.com/dkilfoyle) | | |
| Addin Manager | Install and remove addins | [addinmanager](https://github.com/csgillespie/addinmanager) | :x: | Colin Gillespie | [Blog post](https://csgillespie.wordpress.com/2016/04/01/rstudio-addins-manager/) | |
| Levels recoding | Interactively generate code to edit factor levels | [questionr](https://github.com/juba/questionr) | :white_check_mark: | [Julien Barnier](https://github.com/juba/) | [Demo video](https://video.twimg.com/ext_tw_video/709748109992185856/pu/vid/874x720/bLPgibM_9K_2pRHa.mp4) | |
| Levels ordering | Interactively generate code to reorder factor levels | [questionr](https://github.com/juba/questionr) | :white_check_mark: | [Julien Barnier](https://github.com/juba/) | [Demo video](https://video.twimg.com/ext_tw_video/709748628911484928/pu/vid/874x720/ufNktJLtpIdP2fem.mp4) | |
| Variable cutting | Interactively generate `cut()` code  | [questionr](https://github.com/juba/questionr) | :white_check_mark: | [Julien Barnier](https://github.com/juba/) | [Demo video](https://video.twimg.com/ext_tw_video/709749076225560576/pu/vid/874x720/jzl490qfQaJIJjWC.mp4) | |
| ARIMA Picker | Interactively pick ARIMA parameters | [arimaUI](https://github.com/YvesCR/arimaUI) |  :x: | [Yves crutain](https://github.com/YvesCR) | [Blog post](http://data-laborer.eu/2016/04/ARIMA_Picker.html) | |
| Input LaTeX Math | Input math expressions via the MathQuill library | [bookdown](https://github.com/rstudio/bookdown) |  :x: | [RStudio](https://github.com/rstudio/) | | |
| Preview R-markdown Book | Run bookdown's serve_book() to live preview a book | [bookdown](https://github.com/rstudio/bookdown) |  :x: | [RStudio](https://github.com/rstudio/) | | |
| Google API Auth | Authenticate with Google APIs | [googleAuthR](https://github.com/MarkEdmondson1234/googleAuthR) | :white_check_mark: | [Mark Edmondson](https://github.com/MarkEdmondson1234) | | |
| Word count add-in | Count non-code words in Rmd documents | [wordcountaddin](https://github.com/benmarwick/wordcountaddin) |  :x: | [Ben Marwick](https://github.com/benmarwick) |[Screenshot](https://github.com/benmarwick/wordcountaddin/raw/master/inst/wordcountaddin.gif) | |
| Copy value | Copy data to clipboard (arrays, data frames, matrices, tables, vectors) | [snippetsaddin](https://github.com/sfr/RStudio-Addin-Snippets) | :x: | [Juraj Sofranko](https://github.com/sfr) | | Windows only |
| Convert slash | Reverse slashes (eg in file paths) | [snippetsaddin](https://github.com/sfr/RStudio-Addin-Snippets) | :x: | [Juraj Sofranko](https://github.com/sfr) | | Clipboard is Windows only |
| Insert %>% | Insert pipe + reformat surrounding | [snippetsaddin](https://github.com/sfr/RStudio-Addin-Snippets) | :x: | [Juraj Sofranko](https://github.com/sfr) | | |
| Gotta Read 'Em All| RStudio Add-In to interactively read ALL the data into R| [GREA](https://github.com/Stan125/GREA) | :x: | [Stanislaus Stadlmann](https://github.com/Stan125) | | |
| Quick View Data Frame | Quickly render a data frame, or the code which generates it, in the RStudio View window | [RStudioAddIns](https://github.com/digital-dharma/RStudioAddIns) | :x: | [digital-dharma](https://github.com/digital-dharma) | | |
| littleboxes | Easily add a boxed title in R scripts | [littleboxes](https://github.com/ThinkRstat/littleboxes) | :x: | [thinkr](http://thinkr.fr) | | |
| Insert citations | Search a BibTeX-file and insert formatted Markdown citations | [citr](https://github.com/crsh/citr) | :white_check_mark: | [Frederik Aust](https://github.com/crsh/) | [Demo gif](https://github.com/crsh/citr/raw/master/inst/images/addin_demo.gif) | |
| QRAGadget | A Shiny Gadget for Interactive QRA Visualizations | [QRAGadget](https://github.com/paulgovan/QRAGadget) | :white_check_mark: | [Paul Govan](https://github.com/paulgovan) | [Screenshot](https://github.com/paulgovan/QRAGadget/blob/master/inst/images/map.PNG?raw=true) | |
| assignparams | Evaluate function parameter in global environment | [assignparams](https://github.com/petermeissner/assignparams) | :x: | [Peter Meissner](https://github.com/petermeissner) | [DemoVideo](https://raw.githubusercontent.com/petermeissner/assignparams/master/extra/assign_params.gif) | |
| radiant.data | A Shiny interface to visualize, summarize, transform, and combine data | [radiant.data](https://github.com/radiant-rstats/radiant.data) | :x: | [Vincent Nijs](http://rady.ucsd.edu/faculty/directory/nijs) | [Documentation](https://radiant-rstats.github.io/docs) | |
| radiant | A Shiny interface for business analytics in R | [radiant](https://github.com/radiant-rstats/radiant) | :x: | [Vincent Nijs](http://rady.ucsd.edu/faculty/directory/nijs) | [Documentation](https://radiant-rstats.github.io/docs) | |
| Add Crossref Citations | Add a new bibliography entry through Crossref DOI | [rcrossref](https://github.com/ropensci/rcrossref) | :x: | [Hao Zhu](https://github.com/haozhu233) |[Screenshoot](https://pbs.twimg.com/media/CoOo82NUEAAxHUF.jpg:large) | |
| mischelper | microbenchmark, profvis selected code, remove unneeded hard line breaks, flip windows path separator | [mischelper](https://github.com/dracodoc/mischelper) | :x: | [dracodoc](https://github.com/dracodoc) | | |
| Merge data frames | Perform Inner, left, Right and Full Joins and create a new data frame  | [commonUtilAddins](https://github.com/sarupurisailalith/commonUtilAddins) | :x: | [sarupurisailalith](https://github.com/sarupurisailalith) | | |
| Convert Variable type | Convert variables' type into either factor, character or numeric in a data frame  | [commonUtilAddins](https://github.com/sarupurisailalith/commonUtilAddins) | :x: | [sarupurisailalith](https://github.com/sarupurisailalith) | | |
| Add GIFs | Search GIFs through Giphy API and use them in Rmarkdown documents | [giphyr](https://github.com/haozhu233/giphyr) | :x: | [Hao Zhu](https://github.com/haozhu233) | [Screenshot](https://raw.githubusercontent.com/haozhu233/giphyr/master/img/Screenshot.png) | |
| namebrowser | Browse or search all installed packages for function names, insert library(pkg) or pkg:: prefix | [namebrowser](https://github.com/dracodoc/namebrowser) | :x: | [dracodoc](https://github.com/dracodoc) | | |
| mufflr | Keyboard shortcuts for quieter and speedier pipelines | [mufflr](https://github.com/MilesMcBain/mufflr) | :x: | [Miles McBain](https://github.com/milesmcbain) | [Demo Gif](https://raw.githubusercontent.com/milesmcbain/mufflr/master/inst/media/mufflr.gif) | |
| gitgadget | Version Control and Assignment Management using Git | [gitgadget](https://github.com/vnijs/gitgadget) | :white_check_mark: | [Vincent Nijs](https://github.com/vnijs) | | |
| datapasta | Keyboard shortcuts for pasting clipboard data as nicely formatted R vectors/tibbles. | [datapasta](https://github.com/MilesMcBain/datapasta) | :x: | [Miles McBain](https://github.com/milesmcbain) | [Demo Gif](https://raw.githubusercontent.com/milesmcbain/datapasta/master/inst/media/tribble_paste.gif) | |
| Align Assign | Align the assignment operators within a highlighted area | [AlignAssign](https://github.com/seasmith/AlignAssign) | :x: | [Luke Smith](https://github.com/seasmith) | [Demo gif](https://raw.githubusercontent.com/seasmith/AlignAssign/master/inst/media/demo.gif) | |
| strcode | Insert three levels of code block separators | [strcode](https://github.com/lorenzwalthert/strcode) | :x: | [Lorenz Walthert](http://lorenzwalthert.github.io/) | [Demo GIF](https://raw.githubusercontent.com/lorenzwalthert/strcode/master/man/demo/demo_strcode_v0.1.0.gif) | |