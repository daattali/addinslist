# Discover and install useful RStudio addins

[![R Build
Status](https://github.com/daattali/addinslist/workflows/R-CMD-check/badge.svg)](https://github.com/daattali/addinslist/actions)
[![CRAN
version](https://www.r-pkg.org/badges/version/addinslist)](https://cran.r-project.org/package=addinslist)

> Created by [Dean Attali](https://deanattali.com)

[RStudio addins](https://rstudio.github.io/rstudioaddins/) were released in early 2016 to provide anyone with the ability to add "extensions" to RStudio. This feature has quickly become popular, but discoverability was a problem: **there's just no easy way to know what addins exist.**

The `addinslist` package solves that problem in two ways:

- This package provides a continuously updated list of RStudio addins that you can browse through ([below](#addinslist-table)).

- After installing this package (`install.packages('addinslist')`), your RStudio will get populated with a new addin called "Browse RStudio addins". This addin allows you to interactively browse through the list of addins, see which ones you already have installed, and let you install/uninstall the corresponding package of each addin. The following image shows how to access this "addin of addins" in RStudio.

![Addins menu](https://raw.githubusercontent.com/daattali/addinslist/master/inst/media/addins-menu.png)

---

**Need Shiny help? [I’m available for
consulting](https://attalitech.com/).**<br/> **If you find
{addinslist} useful, please consider [supporting my
work](https://github.com/sponsors/daattali) to unlock rewards\! ❤**

<p align="center">

<a style="display: inline-block;" href="https://github.com/sponsors/daattali">
<img height="35" src="https://i.imgur.com/034B8vq.png" /> </a>

<a style="display: inline-block;" href="https://paypal.me/daattali">
<img height="35" src="https://camo.githubusercontent.com/0e9e5cac101f7093336b4589c380ab5dcfdcbab0/68747470733a2f2f63646e2e6a7364656c6976722e6e65742f67682f74776f6c66736f6e2f70617970616c2d6769746875622d627574746f6e40312e302e302f646973742f627574746f6e2e737667" />
</a>

</p>

<h2 id="sponsors">Sponsors 🏆</h2>

> There are no sponsors yet

[Become the first sponsor for {addinslist} and unlock special rewards\!](https://github.com/sponsors/daattali/sponsorships?tier_id=39856)

<h2 id="addinslist-table">List of addins</h2>

If you made a useful RStudio addin, feel free to make a pull request [on GitHub](https://github.com/daattali/addinslist#readme) to add it to the list. 

| Name | Date Added | Description | Package | On CRAN? | Author | More links | Notes | 
|------|------|------|------|------|------|------|------|
| Add Crossref Citations | 2016-07-25 | Add a new bibliography entry through Crossref DOI | [rcrossref](https://github.com/ropensci/rcrossref) | :white_check_mark: | [Hao Zhu](https://github.com/haozhu233) |[Screenshoot](https://pbs.twimg.com/media/CoOo82NUEAAxHUF.jpg:large) | |
| Add GIFs | 2016-08-10 | Search GIFs through Giphy API and use them in Rmarkdown documents | [giphyr](https://github.com/haozhu233/giphyr) | :white_check_mark: | [Hao Zhu](https://github.com/haozhu233) | [Screenshot](https://raw.githubusercontent.com/haozhu233/giphyr/master/img/Screenshot.png) | |
| Addin Manager | 2016-04-01 | Install and remove addins | [addinmanager](https://github.com/csgillespie/addinmanager) | :x: | Colin Gillespie | [Blog post](https://csgillespie.wordpress.com/2016/04/01/rstudio-addins-manager/) | |
| addinit | 2018-06-06 | Initialize an 'RStudio' Project | [addinit](https://github.com/dreamRs/addinit) | :x: | [dreamRs](https://github.com/dreamRs) | | | 
| Align Assign | 2016-10-03 | Align the assignment operators within a highlighted area | [AlignAssign](https://github.com/seasmith/AlignAssign) | :x: | [Luke Smith](https://github.com/seasmith) | [Demo gif](https://raw.githubusercontent.com/seasmith/AlignAssign/master/inst/media/demo.gif) | |
| ARIMA Picker | 2016-04-25 | Interactively pick ARIMA parameters | [arimaUI](https://github.com/YvesCR/arimaUI) |  :x: | [Yves crutain](https://github.com/YvesCR) | [Blog post](http://data-laborer.eu/statistic/ARIMA_Picker) | |
| asis chunk | 2019-08-12 | Insert code chunk calling asis engine | [asischunk](https://github.com/enricomanlapig/asischunk) |  :x: | [Enrico Manlapig](https://emanlapig.net/) |  | |
| Assign default values | 2016-03-30 | Set function arguments in selection to their default values | [jadd](https://github.com/jennybc/jadd) | :x: | [Jenny Bryan](https://github.com/jennybc) | [Demo GIF](https://raw.githubusercontent.com/jennybc/jadd/master/internal/assign_defaults.gif) | |
| assignparams | 2016-06-29 | Evaluate function parameter in global environment | [assignparams](https://github.com/petermeissner/assignparams) | :x: | [Peter Meissner](https://github.com/petermeissner) | [DemoVideo](https://raw.githubusercontent.com/petermeissner/assignparams/master/extra/assign_params.gif) | |
| beautifyR | 2018-04-21 | Format RMarkdown tables beautifully | [beautifyR](https://github.com/mwip/beautifyR) | :x: | [Matthias Weigand](https://github.com/mwip/) | [Demo GIF](https://github.com/mwip/beautifyR#beautifyr-in-action) | | 
| Browse RStudio addins | 2016-03-30 | Browse and install RStudio addins | [addinslist](https://github.com/daattali/addinslist) | :white_check_mark: | [Dean Attali](https://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/addinslist/master/inst/media/addin.png) | |
| Build bounding boxes | 2021-01-21 | Draw spatial bounding boxes in a `leaflet` interface | [bbb](https://github.com/baslat/bbb) | :x: | [Abasi Latcham](https://github.com/baslat) | | |
| Case converter | 2018-09-20 | Convert text cases to lower, upper, snake, camel cases | [caseconverter](https://github.com/strboul/caseconverter) | :x: | [strboul](https://github.com/strboul) | [Demo GIF](https://raw.githubusercontent.com/strboul/caseconverter/master/inst/media/caseconverter.gif) | |
| Colour picker | 2016-03-30 | Lets you easily select colours | [colourpicker](https://github.com/daattali/colourpicker) | :white_check_mark: | [Dean Attali](https://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/colourpicker/master/inst/img/colourpickerscrnshot.png), [Demo video](https://raw.githubusercontent.com/daattali/colourpicker/master/inst/img/colourPickerGadget.gif) | |
| compareAreas | 2018-11-26 | Compare areas across square meters, kilometers, feet, miles, and acres | [compareAreas](https://github.com/daranzolin/compareAreas) | :x: | [David Ranzolin](https://daranzolin.github.io/) | | |
| compareWith | 2019-08-28 | Enhanced diff and merge tools for RStudio | [compareWith](https://github.com/miraisolutions/compareWith#readme) | :x: | [Mirai Solutions](https://mirai-solutions.ch) | [Blog post](https://mirai-solutions.ch/news/2019/07/04/compareWith) | |
| Convert slash | 2016-05-10 | Reverse slashes (eg in file paths) | [snippetsaddin](https://github.com/sfr/RStudio-Addin-Snippets) | :x: | [Juraj Sofranko](https://github.com/sfr) | | Clipboard is Windows only |
| Convert Variable type | 2016-08-05 | Convert variables' type into either factor, character or numeric in a data frame  | [commonUtilAddins](https://github.com/sarupurisailalith/commonUtilAddins) | :x: | [sarupurisailalith](https://github.com/sarupurisailalith) | | |
| Copy Frame to Clipboard | 2016-03-30 | Copy a `data.frame` to the clipboard | [copydat](https://github.com/BAAQMD/copydat) | :x: | [Bay Area Air Quality Management District](https://github.com/BAAQMD) | | Doesn't work on Windows |
| Copy value | 2016-05-10 | Copy data to clipboard (arrays, data frames, matrices, tables, vectors) | [snippetsaddin](https://github.com/sfr/RStudio-Addin-Snippets) | :x: | [Juraj Sofranko](https://github.com/sfr) | | Windows only |
| CRANsearcher | 2017-09-17 | RStudio addin to search CRAN packages titles and descriptions | [CRANsearcher](https://github.com/RhoInc/CRANsearcher) | :white_check_mark: | [Rho Inc](https://github.com/RhoInc) | | |
| datapasta | 2016-09-28 |Keyboard shortcuts for pasting clipboard data as nicely formatted R vectors/tibbles. | [datapasta](https://github.com/MilesMcBain/datapasta) | :white_check_mark: | [Miles McBain](https://github.com/milesmcbain) | [Demo Gif](https://raw.githubusercontent.com/milesmcbain/datapasta/master/inst/media/tribble_paste.gif) | |
| datasets.load | 2016-12-15 | Loading datasets from all installed packages | [datasets.load](https://github.com/bquast/datasets.load) | :white_check_mark: | [Bastiaan Quast](https://qua.st/) | [Demo Gif](https://github.com/bquast/datasets.load) | |
| Document This | 2016-03-30 | Auto-generate Roxygen skeletons for functions and data | [docthis](https://github.com/mdlincoln/docthis) | :x: | [Matthew Lincoln](http://matthewlincoln.net/) | | |
| Enhanced View | 2018-07-12 | Enhanced data viewer, allows column selection and filtering | [viewenhance](https://github.com/kieranjmartin/viewenhance) | :x: | [Kieran Martin](https://github.com/kieranjmartin) | | | 
| ermoji | 2018-04-24 | Search and Copy Emoji | [ermoji](https://github.com/gadenbuie/ermoji) | :x: | [Garrick Aden-Buie](https://www.garrickadenbuie.com) | [Screenshots](https://github.com/gadenbuie/ermoji/#usage) | |
| Escape strings | 2018-09-17 | Convert non-ASCII strings to a portable format | [uniscape](https://github.com/mvkorpel/uniscape) | :x: | [Mikko Korpela](https://github.com/mvkorpel) | [Screenshot](https://raw.githubusercontent.com/mvkorpel/uniscape/master/media/escape_strings.png) | | 
| esquisse | 2018-06-06 | Make plots with ggplot2 | [esquisse](https://github.com/dreamRs/esquisse) | :white_check_mark: | [dreamRs](https://github.com/dreamRs) | | | 
| Explode a call with `boom()` | 2021-04-15 | Print the Output of Intermediate Steps of a Call | [boomer](https://github.com/moodymudskipper/boomer) | :x: | [Antoine Fabri](https://github.com/moodymudskipper)  | | |
| extraInserts | 2017-12-26 | Insert various (pipe) operators | [extraInserts](https://github.com/konradedgar/extraInserts) | :x: | [Konrad Zdeb](https://github.com/konradzdeb) | | |
| get_fn_args | 2018-07-12 | Reads highlighted default values into console, translating commas to semi colons |  [getfunctionargs](https://github.com/kieranjmartin/getfunctionargs) | :x: | [Kieran Martin](https://github.com/kieranjmartin) | | | 
| ggedit | 2017-05-04 | Reproducible layer, scale and theme editing for ggplot2 | [ggedit](https://github.com/metrumresearchgroup/ggedit) | :white_check_mark: | [Jonathan Sidi](https://yonicd.netlify.com/) | [Youtube Clip](https://www.youtube.com/watch?v=693XhHt8fug) | |
| ggplot Theme Assist | 2016-03-30 | Customize your ggplot theme | [ggThemeAssist](https://github.com/calligross/ggthemeassist) | :white_check_mark: | [Calli Gross](https://github.com/calligross) | [Demo GIF](https://raw.githubusercontent.com/calligross/ggthemeassist/master/examples/ggThemeAssist2.gif) | |
| ggplot2 Marginal Plots | 2016-03-30 | Add marginal plots to ggplot2 | [ggExtra](https://github.com/daattali/ggExtra) | :white_check_mark: | [Dean Attali](https://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/ggExtra/master/inst/img/ggmarginal-gadget.png) | |
| gitgadget | 2016-09-16 | Version Control and Assignment Management using Git | [gitgadget](https://github.com/vnijs/gitgadget) | :white_check_mark: | [Vincent Nijs](https://github.com/vnijs) | | |
| Google API Auth | 2016-05-03 | Authenticate with Google APIs | [googleAuthR](https://github.com/MarkEdmondson1234/googleAuthR) | :white_check_mark: | [Mark Edmondson](https://github.com/MarkEdmondson1234) | | |
| Gotta Read 'Em All | 2016-05-10 | RStudio Add-In to interactively read ALL the data into R| [GREA](https://github.com/Stan125/GREA) | :x: | [Stanislaus Stadlmann](https://github.com/Stan125) | | |
| Hist Add-In | 2016-03-31 | Interactively create histograms with ggplot2 and obtain the R Code | [limoaddin](https://github.com/Stan125/limoaddin) | :x: | [Stanislaus Stadlmann](https://github.com/Stan125) | | |
| imageclipr | 2016-04-06 | Copy and paste images from clipboard to Rmarkdown .Rmd files | [imageclipr](https://github.com/Timag/imageclipr) | :x: | [Tonio Liebrand](https://github.com/Timag/) | | |
| Input LaTeX Math | 2016-04-25 | Input math expressions via the MathQuill library | [bookdown](https://github.com/rstudio/bookdown) |  :white_check_mark: | [RStudio](https://github.com/rstudio/) | | |
| Insert %>% | 2016-05-10 | Insert pipe + reformat surrounding | [snippetsaddin](https://github.com/sfr/RStudio-Addin-Snippets) | :x: | [Juraj Sofranko](https://github.com/sfr) | | |
| Insert citations | 2016-06-28 | Search a BibTeX-file and insert formatted Markdown citations | [citr](https://github.com/crsh/citr) | :white_check_mark: | [Frederik Aust](https://github.com/crsh/) | [Demo gif](https://raw.githubusercontent.com/crsh/citr/master/tools/images/addin_demo.gif) | |
| Insert IPA symbols | 2018-10-17 | Insert IPA phonetic symbols in R Markdown by searching their phonetic features in a shiny gadget | [linguisticsdown](https://github.com/liao961120/linguisticsdown) | :white_check_mark: | [Yongfu Liao](https://liao961120.github.io) | [Pkg Website](https://liao961120.github.io/linguisticsdown/) | |
| insertImage | 2017-03-02 | Insert image into R Markdown with file chooser. Copy image file to project. | [insertImage](https://github.com/LudvigOlsen/insertImage) | :x: | [Ludvig R Olsen](http://ludvigolsen.dk/?lang=en) | | |
| inserttable | 2018-04-07 | RStudio add-in facilitating insertion of nicely formatted tables in R markdown documents or plain R scripts. | [inserttable](https://github.com/lbusett/insert_table) | :x: | [Lorenzo Busetto](https://github.com/lbusett/) | [Blog Post](https://lbusett.netlify.com/post/a-new-rstudio-addin-to-facilitate-inserting-tables-in-rmarkdown-documents/) | | 
| jagsAddIn | 2020-02-11 | RStudio add-in to create template code for running jags from R. | [jagsAddIn](https://github.com/n8thangreen/jagsAddIn) | :x: | [Nathan Green](https://github.com/n8thangreen/) |  [Demo gif](https://github.com/n8thangreen/jagsAddIn/blob/master/docs/example.gif) | | 
| Keyboard shortcuts for str,plot etc | 2019-06-18 | Examine selected objects; open function source code on github | [rskey](https://github.com/brry/rskey#rskey) | :white_check_mark: | [Berry Boessenkool ](https://brry.github.io) |  | Can set keyboard shortcuts on disc with rskey::setKeyboardBindings() |
| Lattice Plotting | 2016-03-30 | Interactively build plots using the `lattice` system | [addinplots](https://github.com/homerhanumat/addinplots/) | :x: | | | |
| Levels ordering | 2016-04-06 | Interactively generate code to reorder factor levels | [questionr](https://github.com/juba/questionr) | :white_check_mark: | [Julien Barnier](https://github.com/juba/) | [Demo video](https://video.twimg.com/ext_tw_video/709748628911484928/pu/vid/874x720/ufNktJLtpIdP2fem.mp4) | |
| Levels recoding | 2016-04-06 | Interactively generate code to edit factor levels | [questionr](https://github.com/juba/questionr) | :white_check_mark: | [Julien Barnier](https://github.com/juba/) | [Demo video](https://video.twimg.com/ext_tw_video/709748109992185856/pu/vid/874x720/bLPgibM_9K_2pRHa.mp4) | |
| littleboxes | 2016-06-09 | Easily add a boxed title in R scripts | [littleboxes](https://github.com/ThinkRstat/littleboxes) | :x: | [thinkr](http://thinkr.fr) | | |
| makeOxygen | 2017-04-12 | Self-populating roxygen2 skeletons | [sinew](https://github.com/metrumresearchgroup/sinew) | :white_check_mark: | [Jonathan Sidi](https://yonicd.netlify.com/) | | |
| mapedit.addin | 2018-12-15 | Create and save spatial data in GUI | [mapedit.addin](https://github.com/mrjoh3/mapedit.addin) | :x: | [Matt Johnson](https://github.com/mrjoh3) | | saves to `.GlobalEnv` and/or disk |
| Merge data frames | 2016-08-05 | Perform Inner, left, Right and Full Joins and create a new data frame  | [commonUtilAddins](https://github.com/sarupurisailalith/commonUtilAddins) | :x: | [sarupurisailalith](https://github.com/sarupurisailalith) | | |
| mischelper | 2016-07-30 | microbenchmark, profvis selected code, remove unneeded hard line breaks, flip windows path separator | [mischelper](https://github.com/dracodoc/mischelper) | :x: | [dracodoc](https://github.com/dracodoc) | | |
| mufflr | 2016-08-30 | Keyboard shortcuts for quieter and speedier pipelines | [mufflr](https://github.com/MilesMcBain/mufflr) | :x: | [Miles McBain](https://github.com/milesmcbain) | [Demo Gif](https://raw.githubusercontent.com/milesmcbain/mufflr/master/inst/media/mufflr.gif) | |
| namebrowser | 2016-08-18 | Browse or search all installed packages for function names, insert library(pkg) or pkg:: prefix | [namebrowser](https://github.com/dracodoc/namebrowser) | :x: | [dracodoc](https://github.com/dracodoc) | | |
| objectremover | 2019-08-04 | Remove objects from the Global environment based on text patterns and object type | [objectremover](https://github.com/alan-y/objectremover) | :white_check_mark: | [Alan Yeung](https://github.com/alan-y) | [Demo gif](https://raw.githubusercontent.com/alan-y/objectremover/master/inst/img/objectremover_demo.gif) | |
| Path To Clipboard | 2020-01-02 | Copy the active document's absolute path to clipboard. | [pathToClip](https://github.com/dcomtois/pathToClip) | :x: | [Dominic Comtois](https://github.com/dcomtois) | [Demo Gif](https://github.com/dcomtois/pathToClip/blob/ca9f97aa6d7ed65ee51e70ba5246e72cf904df6f/inst/media/pathToClip_demo.gif) | |
| Plot Colour Helper | 2016-03-30 | Interactively pick colours to use in your plot | [colourpicker](https://github.com/daattali/colourpicker) | :white_check_mark: | [Dean Attali](https://deanattali.com/) | [Screenshot](https://raw.githubusercontent.com/daattali/colourpicker/master/inst/img/plothelper-demo.png), [Demo video](https://raw.githubusercontent.com/daattali/colourpicker/master/inst/img/plothelper-demo.gif) | |
| prefixer | 2018-06-06 | Prefix function with their namespace | [prefixer](https://github.com/dreamRs/prefixer) | :x: | [dreamRs](https://github.com/dreamRs) | | | 
| Preview R-markdown Book | 2016-04-25 | Run bookdown's serve_book() to live preview a book | [bookdown](https://github.com/rstudio/bookdown) |  :white_check_mark: | [RStudio](https://github.com/rstudio/) | | |
| QRAGadget | 2016-06-28 | A Shiny Gadget for Interactive QRA Visualizations | [QRAGadget](https://github.com/paulgovan/QRAGadget) | :white_check_mark: | [Paul Govan](https://github.com/paulgovan) | [Screenshot](https://github.com/paulgovan/QRAGadget/blob/master/inst/images/map.PNG?raw=true) | |
| quickview | 2019-04-12 | Quickly inspect your data in a View tab of RStudio | [quickview](https://github.com/fkeck/quickview) | :x: | [Francois Keck](https://github.com/fkeck) | [Demo gif](https://raw.githubusercontent.com/fkeck/quickview/master/inst/screencast_qv.gif) | |
| r6methods | 2020-03-16 | Generate methods for R6 classes | [r6methods](https://github.com/jakubsob/r6methods) | :white_check_mark: | [Jakub Sobolewski](https://github.com/jakubsob) | | |
| radiant | 2016-06-30 | A Shiny interface for business analytics in R | [radiant](https://github.com/radiant-rstats/radiant) | :x: | [Vincent Nijs](http://rady.ucsd.edu/faculty/directory/nijs) | [Documentation](https://radiant-rstats.github.io/docs) | |
| radiant.data | 2016-06-30 | A Shiny interface to visualize, summarize, transform, and combine data | [radiant.data](https://github.com/radiant-rstats/radiant.data) | :x: | [Vincent Nijs](http://rady.ucsd.edu/faculty/directory/nijs) | [Documentation](https://radiant-rstats.github.io/docs) | |
| rdoxygen | 2017-08-14 | Create doxygen documentation for source code | [rdoxygen](https://github.com/nevrome/rdoxygen) | :white_check_mark: | [Clemens Schmid](https://github.com/nevrome) | | |
| RegExplain | 2018-04-04 | Interactive regular expression utility belt | [regexplain](https://github.com/gadenbuie/regexplain) | :x: | [Garrick Aden-Buie](https://www.garrickadenbuie.com) | [Demo gifs](https://github.com/gadenbuie/regexplain/#overview) | | 
| remedy | 2017-09-08 | RStudio Addins to Simplify Markdown Writing | [remedy](https://github.com/ThinkR-open/remedy) | :white_check_mark: | [ThinkR](https://thinkr.fr/) | [How it works](https://github.com/ThinkR-open/remedy/blob/master/README.md) | |
| Render Rmd in Console | 2016-03-30 | Render an R Markdown document in the global environment |  [RStudioConsoleRender](https://github.com/jeffjjohnston/RStudioConsoleRender) | :x: | [Jeff Johnston](https://github.com/jeffjjohnston) | [Blog post](https://jeffjjohnston.github.io/rstudio/rmarkdown/2016/03/01/faster-rendering-in-rstudio.html) | |
|Rmd or Blogdown post Image Paste | 2020-05-11 | Use 'ctrl+v' to paste images into a blogdown post or Rmd files |  [RmdImgPaste](https://github.com/xiaoa6435/RmdImgPaste) | :x: | zhangzhenhao 
| rpivotGadget | 2016-04-04 | Add-in wrapper around the rpivotTable HTML widget | [rpivotGadget](https://github.com/dkilfoyle/rpivotGadget) | :x: | [Dean Kilfoyle](https://github.com/dkilfoyle) | | |
| rsam | 2018-01-14 | Manage installed RStudio addins keyboard shortcuts and IDE dropdown list | [rsam](https://github.com/yonicd/rsam) | :x: | [Jonathan Sidi](https://yonicd.netlify.com/) | [YouTube](https://www.youtube.com/watch?v=-XZWv7CJrs8) | Writes to Disk |
| Schedule R scripts on Linux/Unix | 2016-03-30 | Use cron to schedule your R scripts (Linux/Unix) | [cronR](https://github.com/bnosac/cronR) | :white_check_mark: | [jwijffels](https://github.com/jwijffels) | [Screenshot](https://raw.githubusercontent.com/bnosac/cronR/master/vignettes/cronR-rstudioaddin.png) | |
| Schedule R scripts on Windows | 2016-03-30 | Use Windows task scheduler to schedule your R scripts (Windows) | [taskscheduleR](https://github.com/bnosac/taskscheduleR) | :white_check_mark: | [jwijffels](https://github.com/jwijffels) | [Screenshot](https://raw.githubusercontent.com/bnosac/taskscheduleR/master/vignettes/taskscheduleR-rstudioaddin.png) | |
| scribblr | 2021-06-19 | Open scribblr note editor for taking project-related notes in RStudio | [scribblr](https://github.com/vgherard/scribblr) | :x: | [Valerio Gherardi](https://github.com/vgherard) | | |
| SeaClass | 2017-08-08 | An interactive R GUI for classification problems | [SeaClass](https://github.com/ChrisDienes/SeaClass) | :x: | [Chris Dienes](https://github.com/ChrisDienes) | [Screenshots](https://github.com/ChrisDienes/SeaClass/blob/master/screen_shots.png) | |
| Search CRAN packages | 2019-11-26 | Search and explore CRAN packages | [pkgsearch](https://github.com/r-hub/pkgsearch) | :white_check_mark: | [R-hub](https://github.com/r-hub/) | [Pkg Website](https://r-hub.github.io/pkgsearch/reference/pkg_search_addin.html) | |
| shinyExams | 2018-06-27 | RStudio addin to create exercises | [shinyExams](https://github.com/flaviobarros/shinyExams) | :x: | | [Demo GIF](https://github.com/flaviobarros/shinyExams#usage) | | 
| ShinyQuickStarter | 2021-03-05 | Build Shiny Apps per Drag & Drop | [ShinyQuickStarter](https://github.com/cran/ShinyQuickStarter) | :white_check_mark: | [Leon Binder](https://github.com/lbinder357) | | | 
| Snake caser | 2016-05-06 | Convert a character string to snake_case | [snakecaser](https://github.com/benmarwick/snakecaser) | :x: | [Ben Marwick](https://github.com/benmarwick) | | | 
| sortLines | 2017-03-11 | Sort selected lines in the editor with a number-smart algorithm. | [sortLines](https://github.com/dcomtois/sortLines) | :x: | [Dominic Comtois](https://github.com/dcomtois) | [Demo Gif](https://raw.githubusercontent.com/dcomtois/sortLines/master/inst/media/sortLinesDemo.gif) | |
| splitChunk | 2017-02-22 | Split code chunk in R Markdown | [splitChunk](https://github.com/LudvigOlsen/splitChunk) | :x: | [Ludvig R Olsen](http://ludvigolsen.dk/?lang=en) | | |
| straddin | 2017-12-17 | Peek at objects with a keystroke. | [straddin](https://github.com/famuvie/straddin) | :x: | [Facundo Munoz](https://github.com/famuvie) | | |
| strcode | 2016-12-02 | Insert code block separators and section titles | [strcode](https://github.com/lorenzwalthert/strcode) | :x: | [Lorenz Walthert](http://lorenzwalthert.github.io/) | [Demo GIF](https://raw.githubusercontent.com/lorenzwalthert/strcode/master/demos/strcode_v0.2.0_video_to_gif2_large.gif) | |
| styler | 2017-11-28 | RStudio Addin to provide non-invasive pretty-printing of R source code while adhering to the tidyverse formatting rules. | [styler](https://github.com/r-lib/styler) | :white_check_mark: | [R infrastructure](https://github.com/r-lib) | [Demo gif](https://raw.githubusercontent.com/lorenzwalthert/some_raw_data/master/styler_0.1.gif) | |
| testthis | 2017-01-28 | Utility functions and Rstudio addins to make using the testthat package even more fun | [testthis](https://github.com/s-fleck/testthis) | :white_check_mark: | |  | |
| Tidy Data | 2016-03-30 | Interactively build tidyr function call (gather) | [tidyshiny](https://github.com/MangoTheCat/tidyshiny/) | :x: | [Mango Solutions](http://www.mango-solutions.com) | | |
| TODOr | 2017-11-13 | Finds all TODO, FIXME, CHANGED etc. comments in your project and shows them as markers. | [TODOr](https://github.com/dokato/todor) | :white_check_mark: | [Dominik Krzeminski](https://github.com/dokato) | | |
| tsviz | 2019-07-28 | Easy and interactive time series visualization | [tsviz](https://github.com/xtreamsrl/tsviz) | :white_check_mark: | [xtream](https://xtreamers.io) | [Blog post](https://medium.com/@donlelef/introducing-tsviz-interactive-time-series-visualization-in-r-studio-a96cde507a14) | |
| typeStringsGadget | 2017-02-18 | Type strings unencumbered | [typeStringsGadget](https://github.com/daranzolin/typeStringsGadget) | :x: | [David Ranzolin](http://daranzolin.github.io) | | |
| unnestIfElse | 2021-01-28 | Quickly and roughly convert nested ifelse() statements to dplyr::case_when() | [unnestIfElse](https://github.com/erictleung/unnestIfElse) | :x: | [Eric Leung](https://github.com/erictleung) | [Demo Gif](https://github.com/erictleung/unnestIfElse/blob/master/inst/media/nested_if_else.gif) | |
| upnews GitHub pkgs | 2018-11-15 | Display news and update outdated github R packages  | [upnews](https://github.com/ginolhac/upnews) | :x: | [Aurelien Ginolhac](https://github.com/ginolhac) | [Demo gif](https://raw.githubusercontent.com/ginolhac/upnews/master/docs/demo.gif) | |
| Variable cutting | 2016-04-06 | Interactively generate `cut()` code  | [questionr](https://github.com/juba/questionr) | :white_check_mark: | [Julien Barnier](https://github.com/juba/) | [Demo video](https://video.twimg.com/ext_tw_video/709749076225560576/pu/vid/874x720/jzl490qfQaJIJjWC.mp4) | |
| ViewPipeSteps | 2018-02-23 | Create View Tabs of Each Piped Step | [ViewPipeSteps](https://github.com/daranzolin/ViewPipeSteps) | :x: | [David Ranzolin](https://daranzolin.github.io/) | [Demo gif](https://media.giphy.com/media/24p7Q2DkFpy5slRhOy/giphy.gif) | | 
| viewxl | 2018-06-06 | Open data.frame(s) in Excel | [viewxl](https://github.com/dreamRs/viewxl) | :x: | [dreamRs](https://github.com/dreamRs) | | | 
| wellspell.addin | 2018-12-15 | Quick spellcheck with hunspell | [wellspell.addin](https://github.com/nevrome/wellspell.addin) | :x: | [Clemens Schmid](https://github.com/nevrome) | | |
| Word count add-in | 2016-05-06 | Count non-code words in Rmd documents | [wordcountaddin](https://github.com/benmarwick/wordcountaddin) |  :x: | [Ben Marwick](https://github.com/benmarwick) | | |
| Wrap Rmd | 2016-03-30 | Wrap selected R Markdown text but don't insert lines breaks into inline R code | [WrapRmd](https://github.com/tjmahr/WrapRmd) | :x: | [TJ Mahr](http://tjmahr.com/) | | |
