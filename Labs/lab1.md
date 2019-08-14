Lab 1: Economic Analysis with R
================

First steps
-----------

1.  Open RStudio on yours or a group member's laptop
2.  Check RStudio version (version command, mine )
3.  Click File &gt; New File &gt; R script.

You will see a blank section of screen in the top-left of your RStudio window. This is where you will write your first R script. This is similar to write a do file in Stata. Notice that R code is saved as a `.r file`.

### Four basic areas on your screen

1.  The is the `script` editor as in Stata
2.  The bottom left is the `console` (you can use R interactively by typing commands as in Stata)
3.  The upper right is where you see the list of objects in your workspace. History is also there (you know at aytime what you did type in your console)
4.  The bottom right is where you find the available packages, graphical output, your file structure, and help.

### Help

Getting help with R is easy. To get further information about the syntax of any R function, just type a `?` before the function name. See the example below

``` r
# regression function (fitting linear models by OLS)
?lm
```

    ## starting httpd help server ... done

If you don't know exactly the name of the fuction, just use double question marks

``` r
??cluster
help.search("cluster")
apropos("cluster")
```

    ## character(0)

Finally, the structure of the help for each R function is:

1.  Description
2.  Usage
3.  Arguments
4.  Value
5.  References

### Console

The bottom-left of the screen has a tab called "Console". This is basically a very fancy calculator.

Try the basic calculator by typing something like

``` r
2+2
```

    ## [1] 4

Or even something fancier like

``` r
sqrt(pi)
```

    ## [1] 1.772454

``` r
b <- 1.4156
sqrt(b)
```

    ## [1] 1.18979

### Objects and basic R

R is a oriented object language. For R, everything is an object, and each object has its own name.

1.  To remove any particular object from the current session employ `rm()`
2.  To list all objects in your workspace use `ls()`
3.  To remove all objects from your workingspace just type `rm(list =ls())`

``` r
x<-2 # Creating an object
ls()
```

    ## [1] "b" "x"

``` r
rm(list = ls())
```

Lastly, most of the them when using variables in a dataframe, you refer to them by using the `$`symbol. This can be avoided by using the `attach` command.

Just as an example, let us load one of the built in datasets in R, and compute the gas consumption per mile.

``` r
data(mtcars)
mean(mtcars$mpg) # Notice that we get access to the variables with the dollar symbol
```

    ## [1] 20.09062

``` r
attach(mtcars)
mean(mpg) # there is no need to use the dollar symbol
```

    ## [1] 20.09062

### Packages

R makes extensive use of third-party packages. We will not get into the details right now, but for this class, you will need to install a few of these. Installing packages is quite easy. Type the following two lines of code at the very top of your script:

``` r
install.packages("tidyverse", repos='http://cran.us.r-project.org')
```

    ## package 'tidyverse' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpOYXsUZ\downloaded_packages

``` r
install.packages("skimr", repos='http://cran.us.r-project.org')
```

    ## package 'skimr' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpOYXsUZ\downloaded_packages

``` r
install.packages("wooldridge", repos='http://cran.us.r-project.org')
```

    ## package 'wooldridge' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpOYXsUZ\downloaded_packages

You've just installed two basic packages. We can also check it out by using the following syntax

``` r
installed.packages()
```

    ##               Package        
    ## abind         "abind"        
    ## askpass       "askpass"      
    ## assertthat    "assertthat"   
    ## backports     "backports"    
    ## base64enc     "base64enc"    
    ## BH            "BH"           
    ## bitops        "bitops"       
    ## bookdown      "bookdown"     
    ## broom         "broom"        
    ## callr         "callr"        
    ## car           "car"          
    ## carData       "carData"      
    ## caret         "caret"        
    ## caTools       "caTools"      
    ## cellranger    "cellranger"   
    ## cli           "cli"          
    ## clipr         "clipr"        
    ## colorspace    "colorspace"   
    ## corrplot      "corrplot"     
    ## cowplot       "cowplot"      
    ## cranlogs      "cranlogs"     
    ## crayon        "crayon"       
    ## curl          "curl"         
    ## data.table    "data.table"   
    ## DataExplorer  "DataExplorer" 
    ## DBI           "DBI"          
    ## dbplyr        "dbplyr"       
    ## dendextend    "dendextend"   
    ## digest        "digest"       
    ## dplyr         "dplyr"        
    ## ellipse       "ellipse"      
    ## ellipsis      "ellipsis"     
    ## evaluate      "evaluate"     
    ## extrafont     "extrafont"    
    ## extrafontdb   "extrafontdb"  
    ## factoextra    "factoextra"   
    ## FactoMineR    "FactoMineR"   
    ## fansi         "fansi"        
    ## farver        "farver"       
    ## flashClust    "flashClust"   
    ## flextable     "flextable"    
    ## forcats       "forcats"      
    ## foreach       "foreach"      
    ## fs            "fs"           
    ## gapminder     "gapminder"    
    ## gdtools       "gdtools"      
    ## generics      "generics"     
    ## GGally        "GGally"       
    ## gganimate     "gganimate"    
    ## ggforce       "ggforce"      
    ## ggiraph       "ggiraph"      
    ## ggiraphExtra  "ggiraphExtra" 
    ## ggplot2       "ggplot2"      
    ## ggpubr        "ggpubr"       
    ## ggrepel       "ggrepel"      
    ## ggsci         "ggsci"        
    ## ggsignif      "ggsignif"     
    ## ggthemes      "ggthemes"     
    ## gifski        "gifski"       
    ## glue          "glue"         
    ## gower         "gower"        
    ## gridExtra     "gridExtra"    
    ## gtable        "gtable"       
    ## haven         "haven"        
    ## highr         "highr"        
    ## hms           "hms"          
    ## hrbrthemes    "hrbrthemes"   
    ## htmltools     "htmltools"    
    ## htmlwidgets   "htmlwidgets"  
    ## httpuv        "httpuv"       
    ## httr          "httr"         
    ## igraph        "igraph"       
    ## insight       "insight"      
    ## ipred         "ipred"        
    ## iterators     "iterators"    
    ## jomo          "jomo"         
    ## jsonlite      "jsonlite"     
    ## knitr         "knitr"        
    ## labeling      "labeling"     
    ## later         "later"        
    ## lava          "lava"         
    ## lazyeval      "lazyeval"     
    ## leaps         "leaps"        
    ## lme4          "lme4"         
    ## lubridate     "lubridate"    
    ## magrittr      "magrittr"     
    ## maptools      "maptools"     
    ## markdown      "markdown"     
    ## MatrixModels  "MatrixModels" 
    ## mclust        "mclust"       
    ## mice          "mice"         
    ## mime          "mime"         
    ## minqa         "minqa"        
    ## mitml         "mitml"        
    ## ModelMetrics  "ModelMetrics" 
    ## modelr        "modelr"       
    ## moonBook      "moonBook"     
    ## munsell       "munsell"      
    ## mycor         "mycor"        
    ## naniar        "naniar"       
    ## networkD3     "networkD3"    
    ## nloptr        "nloptr"       
    ## nortest       "nortest"      
    ## numDeriv      "numDeriv"     
    ## officer       "officer"      
    ## openssl       "openssl"      
    ## openxlsx      "openxlsx"     
    ## ordinal       "ordinal"      
    ## pacman        "pacman"       
    ## pan           "pan"          
    ## pander        "pander"       
    ## pbkrtest      "pbkrtest"     
    ## pdp           "pdp"          
    ## pillar        "pillar"       
    ## pkgconfig     "pkgconfig"    
    ## plogr         "plogr"        
    ## plyr          "plyr"         
    ## png           "png"          
    ## polyclip      "polyclip"     
    ## polynom       "polynom"      
    ## ppcor         "ppcor"        
    ## prettyunits   "prettyunits"  
    ## processx      "processx"     
    ## prodlim       "prodlim"      
    ## progress      "progress"     
    ## promises      "promises"     
    ## ps            "ps"           
    ## purrr         "purrr"        
    ## quantreg      "quantreg"     
    ## R6            "R6"           
    ## RColorBrewer  "RColorBrewer" 
    ## Rcpp          "Rcpp"         
    ## RcppEigen     "RcppEigen"    
    ## readr         "readr"        
    ## readstata13   "readstata13"  
    ## readxl        "readxl"       
    ## recipes       "recipes"      
    ## rematch       "rematch"      
    ## remotes       "remotes"      
    ## reprex        "reprex"       
    ## reshape       "reshape"      
    ## reshape2      "reshape2"     
    ## rio           "rio"          
    ## rJava         "rJava"        
    ## rlang         "rlang"        
    ## rmarkdown     "rmarkdown"    
    ## rprojroot     "rprojroot"    
    ## rstudioapi    "rstudioapi"   
    ## Rttf2pt1      "Rttf2pt1"     
    ## rvest         "rvest"        
    ## scales        "scales"       
    ## scatterplot3d "scatterplot3d"
    ## selectr       "selectr"      
    ## servr         "servr"        
    ## sjlabelled    "sjlabelled"   
    ## sjmisc        "sjmisc"       
    ## skimr         "skimr"        
    ## snakecase     "snakecase"    
    ## sp            "sp"           
    ## SparseM       "SparseM"      
    ## SQUAREM       "SQUAREM"      
    ## stargazer     "stargazer"    
    ## stringi       "stringi"      
    ## stringr       "stringr"      
    ## sys           "sys"          
    ## tibble        "tibble"       
    ## tidyr         "tidyr"        
    ## tidyselect    "tidyselect"   
    ## tidyverse     "tidyverse"    
    ## timeDate      "timeDate"     
    ## tinytex       "tinytex"      
    ## tweenr        "tweenr"       
    ## ucminf        "ucminf"       
    ## UpSetR        "UpSetR"       
    ## utf8          "utf8"         
    ## uuid          "uuid"         
    ## vctrs         "vctrs"        
    ## viridis       "viridis"      
    ## viridisLite   "viridisLite"  
    ## visdat        "visdat"       
    ## webshot       "webshot"      
    ## whisker       "whisker"      
    ## withr         "withr"        
    ## wooldridge    "wooldridge"   
    ## xaringan      "xaringan"     
    ## xfun          "xfun"         
    ## xlsx          "xlsx"         
    ## xlsxjars      "xlsxjars"     
    ## xml2          "xml2"         
    ## xtable        "xtable"       
    ## yaml          "yaml"         
    ## zeallot       "zeallot"      
    ## zip           "zip"          
    ## ztable        "ztable"       
    ## base          "base"         
    ## boot          "boot"         
    ## class         "class"        
    ## cluster       "cluster"      
    ## codetools     "codetools"    
    ## compiler      "compiler"     
    ## datasets      "datasets"     
    ## foreign       "foreign"      
    ## graphics      "graphics"     
    ## grDevices     "grDevices"    
    ## grid          "grid"         
    ## KernSmooth    "KernSmooth"   
    ## lattice       "lattice"      
    ## MASS          "MASS"         
    ## Matrix        "Matrix"       
    ## methods       "methods"      
    ## mgcv          "mgcv"         
    ## nlme          "nlme"         
    ## nnet          "nnet"         
    ## parallel      "parallel"     
    ## rpart         "rpart"        
    ## spatial       "spatial"      
    ## splines       "splines"      
    ## stats         "stats"        
    ## stats4        "stats4"       
    ## survival      "survival"     
    ## tcltk         "tcltk"        
    ## tools         "tools"        
    ## translations  "translations" 
    ## utils         "utils"        
    ##               LibPath                                               
    ## abind         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## askpass       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## assertthat    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## backports     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## base64enc     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## BH            "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## bitops        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## bookdown      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## broom         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## callr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## car           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## carData       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## caret         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## caTools       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## cellranger    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## cli           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## clipr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## colorspace    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## corrplot      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## cowplot       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## cranlogs      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## crayon        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## curl          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## data.table    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## DataExplorer  "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## DBI           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## dbplyr        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## dendextend    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## digest        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## dplyr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ellipse       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ellipsis      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## evaluate      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## extrafont     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## extrafontdb   "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## factoextra    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## FactoMineR    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## fansi         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## farver        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## flashClust    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## flextable     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## forcats       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## foreach       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## fs            "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gapminder     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gdtools       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## generics      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## GGally        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gganimate     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggforce       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggiraph       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggiraphExtra  "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggplot2       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggpubr        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggrepel       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggsci         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggsignif      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ggthemes      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gifski        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## glue          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gower         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gridExtra     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## gtable        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## haven         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## highr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## hms           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## hrbrthemes    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## htmltools     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## htmlwidgets   "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## httpuv        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## httr          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## igraph        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## insight       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ipred         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## iterators     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## jomo          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## jsonlite      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## knitr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## labeling      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## later         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## lava          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## lazyeval      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## leaps         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## lme4          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## lubridate     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## magrittr      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## maptools      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## markdown      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## MatrixModels  "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## mclust        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## mice          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## mime          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## minqa         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## mitml         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ModelMetrics  "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## modelr        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## moonBook      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## munsell       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## mycor         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## naniar        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## networkD3     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## nloptr        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## nortest       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## numDeriv      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## officer       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## openssl       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## openxlsx      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ordinal       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pacman        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pan           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pander        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pbkrtest      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pdp           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pillar        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## pkgconfig     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## plogr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## plyr          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## png           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## polyclip      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## polynom       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ppcor         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## prettyunits   "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## processx      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## prodlim       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## progress      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## promises      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ps            "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## purrr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## quantreg      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## R6            "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## RColorBrewer  "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## Rcpp          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## RcppEigen     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## readr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## readstata13   "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## readxl        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## recipes       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rematch       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## remotes       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## reprex        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## reshape       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## reshape2      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rio           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rJava         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rlang         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rmarkdown     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rprojroot     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rstudioapi    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## Rttf2pt1      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## rvest         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## scales        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## scatterplot3d "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## selectr       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## servr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## sjlabelled    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## sjmisc        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## skimr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## snakecase     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## sp            "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## SparseM       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## SQUAREM       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## stargazer     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## stringi       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## stringr       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## sys           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## tibble        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## tidyr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## tidyselect    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## tidyverse     "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## timeDate      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## tinytex       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## tweenr        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ucminf        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## UpSetR        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## utf8          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## uuid          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## vctrs         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## viridis       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## viridisLite   "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## visdat        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## webshot       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## whisker       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## withr         "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## wooldridge    "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## xaringan      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## xfun          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## xlsx          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## xlsxjars      "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## xml2          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## xtable        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## yaml          "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## zeallot       "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## zip           "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## ztable        "C:/Users/anton/OneDrive/Documentos/R/win-library/3.6"
    ## base          "C:/Program Files/R/R-3.6.0/library"                  
    ## boot          "C:/Program Files/R/R-3.6.0/library"                  
    ## class         "C:/Program Files/R/R-3.6.0/library"                  
    ## cluster       "C:/Program Files/R/R-3.6.0/library"                  
    ## codetools     "C:/Program Files/R/R-3.6.0/library"                  
    ## compiler      "C:/Program Files/R/R-3.6.0/library"                  
    ## datasets      "C:/Program Files/R/R-3.6.0/library"                  
    ## foreign       "C:/Program Files/R/R-3.6.0/library"                  
    ## graphics      "C:/Program Files/R/R-3.6.0/library"                  
    ## grDevices     "C:/Program Files/R/R-3.6.0/library"                  
    ## grid          "C:/Program Files/R/R-3.6.0/library"                  
    ## KernSmooth    "C:/Program Files/R/R-3.6.0/library"                  
    ## lattice       "C:/Program Files/R/R-3.6.0/library"                  
    ## MASS          "C:/Program Files/R/R-3.6.0/library"                  
    ## Matrix        "C:/Program Files/R/R-3.6.0/library"                  
    ## methods       "C:/Program Files/R/R-3.6.0/library"                  
    ## mgcv          "C:/Program Files/R/R-3.6.0/library"                  
    ## nlme          "C:/Program Files/R/R-3.6.0/library"                  
    ## nnet          "C:/Program Files/R/R-3.6.0/library"                  
    ## parallel      "C:/Program Files/R/R-3.6.0/library"                  
    ## rpart         "C:/Program Files/R/R-3.6.0/library"                  
    ## spatial       "C:/Program Files/R/R-3.6.0/library"                  
    ## splines       "C:/Program Files/R/R-3.6.0/library"                  
    ## stats         "C:/Program Files/R/R-3.6.0/library"                  
    ## stats4        "C:/Program Files/R/R-3.6.0/library"                  
    ## survival      "C:/Program Files/R/R-3.6.0/library"                  
    ## tcltk         "C:/Program Files/R/R-3.6.0/library"                  
    ## tools         "C:/Program Files/R/R-3.6.0/library"                  
    ## translations  "C:/Program Files/R/R-3.6.0/library"                  
    ## utils         "C:/Program Files/R/R-3.6.0/library"                  
    ##               Version      Priority     
    ## abind         "1.4-5"      NA           
    ## askpass       "1.1"        NA           
    ## assertthat    "0.2.1"      NA           
    ## backports     "1.1.4"      NA           
    ## base64enc     "0.1-3"      NA           
    ## BH            "1.69.0-1"   NA           
    ## bitops        "1.0-6"      NA           
    ## bookdown      "0.12"       NA           
    ## broom         "0.5.2"      NA           
    ## callr         "3.3.1"      NA           
    ## car           "3.0-3"      NA           
    ## carData       "3.0-2"      NA           
    ## caret         "6.0-84"     NA           
    ## caTools       "1.17.1.2"   NA           
    ## cellranger    "1.1.0"      NA           
    ## cli           "1.1.0"      NA           
    ## clipr         "0.7.0"      NA           
    ## colorspace    "1.4-1"      NA           
    ## corrplot      "0.84"       NA           
    ## cowplot       "1.0.0"      NA           
    ## cranlogs      "2.1.1"      NA           
    ## crayon        "1.3.4"      NA           
    ## curl          "4.0"        NA           
    ## data.table    "1.12.2"     NA           
    ## DataExplorer  "0.8.0"      NA           
    ## DBI           "1.0.0"      NA           
    ## dbplyr        "1.4.2"      NA           
    ## dendextend    "1.12.0"     NA           
    ## digest        "0.6.20"     NA           
    ## dplyr         "0.8.3"      NA           
    ## ellipse       "0.4.1"      NA           
    ## ellipsis      "0.2.0.1"    NA           
    ## evaluate      "0.14"       NA           
    ## extrafont     "0.17"       NA           
    ## extrafontdb   "1.0"        NA           
    ## factoextra    "1.0.5"      NA           
    ## FactoMineR    "1.42"       NA           
    ## fansi         "0.4.0"      NA           
    ## farver        "1.1.0"      NA           
    ## flashClust    "1.01-2"     NA           
    ## flextable     "0.5.5"      NA           
    ## forcats       "0.4.0"      NA           
    ## foreach       "1.4.7"      NA           
    ## fs            "1.3.1"      NA           
    ## gapminder     "0.3.0"      NA           
    ## gdtools       "0.1.9"      NA           
    ## generics      "0.0.2"      NA           
    ## GGally        "1.4.0"      NA           
    ## gganimate     "1.0.3"      NA           
    ## ggforce       "0.3.0"      NA           
    ## ggiraph       "0.6.1"      NA           
    ## ggiraphExtra  "0.2.9"      NA           
    ## ggplot2       "3.2.1"      NA           
    ## ggpubr        "0.2.2"      NA           
    ## ggrepel       "0.8.1"      NA           
    ## ggsci         "2.9"        NA           
    ## ggsignif      "0.6.0"      NA           
    ## ggthemes      "4.2.0"      NA           
    ## gifski        "0.8.6"      NA           
    ## glue          "1.3.1"      NA           
    ## gower         "0.2.1"      NA           
    ## gridExtra     "2.3"        NA           
    ## gtable        "0.3.0"      NA           
    ## haven         "2.1.1"      NA           
    ## highr         "0.8"        NA           
    ## hms           "0.5.0"      NA           
    ## hrbrthemes    "0.6.0"      NA           
    ## htmltools     "0.3.6"      NA           
    ## htmlwidgets   "1.3"        NA           
    ## httpuv        "1.5.1"      NA           
    ## httr          "1.4.1"      NA           
    ## igraph        "1.2.4.1"    NA           
    ## insight       "0.4.1"      NA           
    ## ipred         "0.9-9"      NA           
    ## iterators     "1.0.12"     NA           
    ## jomo          "2.6-9"      NA           
    ## jsonlite      "1.6"        NA           
    ## knitr         "1.24"       NA           
    ## labeling      "0.3"        NA           
    ## later         "0.8.0"      NA           
    ## lava          "1.6.6"      NA           
    ## lazyeval      "0.2.2"      NA           
    ## leaps         "3.0"        NA           
    ## lme4          "1.1-21"     NA           
    ## lubridate     "1.7.4"      NA           
    ## magrittr      "1.5"        NA           
    ## maptools      "0.9-5"      NA           
    ## markdown      "1.1"        NA           
    ## MatrixModels  "0.4-1"      NA           
    ## mclust        "5.4.5"      NA           
    ## mice          "3.6.0"      NA           
    ## mime          "0.7"        NA           
    ## minqa         "1.2.4"      NA           
    ## mitml         "0.3-7"      NA           
    ## ModelMetrics  "1.2.2"      NA           
    ## modelr        "0.1.5"      NA           
    ## moonBook      "0.2.3"      NA           
    ## munsell       "0.5.0"      NA           
    ## mycor         "0.1.1"      NA           
    ## naniar        "0.4.2"      NA           
    ## networkD3     "0.4"        NA           
    ## nloptr        "1.2.1"      NA           
    ## nortest       "1.0-4"      NA           
    ## numDeriv      "2016.8-1.1" NA           
    ## officer       "0.3.5"      NA           
    ## openssl       "1.4.1"      NA           
    ## openxlsx      "4.1.0.1"    NA           
    ## ordinal       "2019.4-25"  NA           
    ## pacman        "0.5.1"      NA           
    ## pan           "1.6"        NA           
    ## pander        "0.6.3"      NA           
    ## pbkrtest      "0.4-7"      NA           
    ## pdp           "0.7.0"      NA           
    ## pillar        "1.4.2"      NA           
    ## pkgconfig     "2.0.2"      NA           
    ## plogr         "0.2.0"      NA           
    ## plyr          "1.8.4"      NA           
    ## png           "0.1-7"      NA           
    ## polyclip      "1.10-0"     NA           
    ## polynom       "1.4-0"      NA           
    ## ppcor         "1.1"        NA           
    ## prettyunits   "1.0.2"      NA           
    ## processx      "3.4.1"      NA           
    ## prodlim       "2018.04.18" NA           
    ## progress      "1.2.2"      NA           
    ## promises      "1.0.1"      NA           
    ## ps            "1.3.0"      NA           
    ## purrr         "0.3.2"      NA           
    ## quantreg      "5.51"       NA           
    ## R6            "2.4.0"      NA           
    ## RColorBrewer  "1.1-2"      NA           
    ## Rcpp          "1.0.2"      NA           
    ## RcppEigen     "0.3.3.5.0"  NA           
    ## readr         "1.3.1"      NA           
    ## readstata13   "0.9.2"      NA           
    ## readxl        "1.3.1"      NA           
    ## recipes       "0.1.6"      NA           
    ## rematch       "1.0.1"      NA           
    ## remotes       "2.1.0"      NA           
    ## reprex        "0.3.0"      NA           
    ## reshape       "0.8.8"      NA           
    ## reshape2      "1.4.3"      NA           
    ## rio           "0.5.16"     NA           
    ## rJava         "0.9-11"     NA           
    ## rlang         "0.4.0"      NA           
    ## rmarkdown     "1.14"       NA           
    ## rprojroot     "1.3-2"      NA           
    ## rstudioapi    "0.10"       NA           
    ## Rttf2pt1      "1.3.7"      NA           
    ## rvest         "0.3.4"      NA           
    ## scales        "1.0.0"      NA           
    ## scatterplot3d "0.3-41"     NA           
    ## selectr       "0.4-1"      NA           
    ## servr         "0.15"       NA           
    ## sjlabelled    "1.1.0"      NA           
    ## sjmisc        "2.8.1"      NA           
    ## skimr         "1.0.7"      NA           
    ## snakecase     "0.11.0"     NA           
    ## sp            "1.3-1"      NA           
    ## SparseM       "1.77"       NA           
    ## SQUAREM       "2017.10-1"  NA           
    ## stargazer     "5.2.2"      NA           
    ## stringi       "1.4.3"      NA           
    ## stringr       "1.4.0"      NA           
    ## sys           "3.2"        NA           
    ## tibble        "2.1.3"      NA           
    ## tidyr         "0.8.3"      NA           
    ## tidyselect    "0.2.5"      NA           
    ## tidyverse     "1.2.1"      NA           
    ## timeDate      "3043.102"   NA           
    ## tinytex       "0.15"       NA           
    ## tweenr        "1.0.1"      NA           
    ## ucminf        "1.1-4"      NA           
    ## UpSetR        "1.4.0"      NA           
    ## utf8          "1.1.4"      NA           
    ## uuid          "0.1-2"      NA           
    ## vctrs         "0.2.0"      NA           
    ## viridis       "0.5.1"      NA           
    ## viridisLite   "0.3.0"      NA           
    ## visdat        "0.5.3"      NA           
    ## webshot       "0.5.1"      NA           
    ## whisker       "0.3-2"      NA           
    ## withr         "2.1.2"      NA           
    ## wooldridge    "1.3.1"      NA           
    ## xaringan      "0.11"       NA           
    ## xfun          "0.8"        NA           
    ## xlsx          "0.6.1"      NA           
    ## xlsxjars      "0.6.1"      NA           
    ## xml2          "1.2.2"      NA           
    ## xtable        "1.8-4"      NA           
    ## yaml          "2.2.0"      NA           
    ## zeallot       "0.1.0"      NA           
    ## zip           "2.0.3"      NA           
    ## ztable        "0.2.0"      NA           
    ## base          "3.6.0"      "base"       
    ## boot          "1.3-22"     "recommended"
    ## class         "7.3-15"     "recommended"
    ## cluster       "2.0.8"      "recommended"
    ## codetools     "0.2-16"     "recommended"
    ## compiler      "3.6.0"      "base"       
    ## datasets      "3.6.0"      "base"       
    ## foreign       "0.8-71"     "recommended"
    ## graphics      "3.6.0"      "base"       
    ## grDevices     "3.6.0"      "base"       
    ## grid          "3.6.0"      "base"       
    ## KernSmooth    "2.23-15"    "recommended"
    ## lattice       "0.20-38"    "recommended"
    ## MASS          "7.3-51.4"   "recommended"
    ## Matrix        "1.2-17"     "recommended"
    ## methods       "3.6.0"      "base"       
    ## mgcv          "1.8-28"     "recommended"
    ## nlme          "3.1-139"    "recommended"
    ## nnet          "7.3-12"     "recommended"
    ## parallel      "3.6.0"      "base"       
    ## rpart         "4.1-15"     "recommended"
    ## spatial       "7.3-11"     "recommended"
    ## splines       "3.6.0"      "base"       
    ## stats         "3.6.0"      "base"       
    ## stats4        "3.6.0"      "base"       
    ## survival      "2.44-1.1"   "recommended"
    ## tcltk         "3.6.0"      "base"       
    ## tools         "3.6.0"      "base"       
    ## translations  "3.6.0"      NA           
    ## utils         "3.6.0"      "base"       
    ##               Depends                                          
    ## abind         "R (>= 1.5.0)"                                   
    ## askpass       NA                                               
    ## assertthat    NA                                               
    ## backports     "R (>= 3.0.0)"                                   
    ## base64enc     "R (>= 2.9.0)"                                   
    ## BH            NA                                               
    ## bitops        NA                                               
    ## bookdown      NA                                               
    ## broom         "R (>= 3.1)"                                     
    ## callr         NA                                               
    ## car           "R (>= 3.5.0), carData (>= 3.0-0)"               
    ## carData       "R (>= 3.0)"                                     
    ## caret         "R (>= 3.2.0), lattice (>= 0.20), ggplot2"       
    ## caTools       "R (>= 2.2.0)"                                   
    ## cellranger    "R (>= 3.0.0)"                                   
    ## cli           "R (>= 2.10)"                                    
    ## clipr         NA                                               
    ## colorspace    "R (>= 3.0.0), methods"                          
    ## corrplot      NA                                               
    ## cowplot       "R (>= 3.5.0)"                                   
    ## cranlogs      NA                                               
    ## crayon        NA                                               
    ## curl          "R (>= 3.0.0)"                                   
    ## data.table    "R (>= 3.1.0)"                                   
    ## DataExplorer  "R (>= 3.4)"                                     
    ## DBI           "R (>= 3.0.0), methods"                          
    ## dbplyr        "R (>= 3.1)"                                     
    ## dendextend    "R (>= 3.0.0)"                                   
    ## digest        "R (>= 3.1.0)"                                   
    ## dplyr         "R (>= 3.2.0)"                                   
    ## ellipse       "R (>= 2.0.0),graphics,stats"                    
    ## ellipsis      "R (>= 3.1)"                                     
    ## evaluate      "R (>= 3.0.2)"                                   
    ## extrafont     "R (>= 2.15)"                                    
    ## extrafontdb   "R (>= 2.14)"                                    
    ## factoextra    "R (>= 3.1.2), ggplot2 (>= 2.2.0)"               
    ## FactoMineR    "R (>= 3.0.0)"                                   
    ## fansi         "R (>= 3.1.0)"                                   
    ## farver        NA                                               
    ## flashClust    "R (>= 2.3.0)"                                   
    ## flextable     NA                                               
    ## forcats       "R (>= 3.1)"                                     
    ## foreach       "R (>= 2.5.0)"                                   
    ## fs            "R (>= 3.1)"                                     
    ## gapminder     "R (>= 3.1.0)"                                   
    ## gdtools       NA                                               
    ## generics      "R (>= 3.1)"                                     
    ## GGally        "R (>= 3.1), ggplot2 (> 2.2.0)"                  
    ## gganimate     "ggplot2 (>= 3.0.0)"                             
    ## ggforce       "ggplot2 (>= 3.0.0), R (>= 3.3.0)"               
    ## ggiraph       NA                                               
    ## ggiraphExtra  "R (>= 2.10)"                                    
    ## ggplot2       "R (>= 3.2)"                                     
    ## ggpubr        "R (>= 3.1.0), ggplot2, magrittr"                
    ## ggrepel       "R (>= 3.0.0), ggplot2 (>= 2.2.0)"               
    ## ggsci         "R (>= 3.0.2)"                                   
    ## ggsignif      NA                                               
    ## ggthemes      "R (>= 3.3.0)"                                   
    ## gifski        NA                                               
    ## glue          "R (>= 3.1)"                                     
    ## gower         NA                                               
    ## gridExtra     NA                                               
    ## gtable        "R (>= 3.0)"                                     
    ## haven         "R (>= 3.2)"                                     
    ## highr         "R (>= 3.2.3)"                                   
    ## hms           NA                                               
    ## hrbrthemes    "R (>= 3.2.0)"                                   
    ## htmltools     "R (>= 2.14.1)"                                  
    ## htmlwidgets   NA                                               
    ## httpuv        "R (>= 2.15.1)"                                  
    ## httr          "R (>= 3.2)"                                     
    ## igraph        "methods"                                        
    ## insight       "R (>= 3.0), stats, utils"                       
    ## ipred         "R (>= 2.10)"                                    
    ## iterators     "R (>= 2.5.0), utils"                            
    ## jomo          NA                                               
    ## jsonlite      "methods"                                        
    ## knitr         "R (>= 3.2.3)"                                   
    ## labeling      NA                                               
    ## later         NA                                               
    ## lava          "R (>= 3.0)"                                     
    ## lazyeval      "R (>= 3.1.0)"                                   
    ## leaps         ""                                               
    ## lme4          "R (>= 3.2.0), Matrix (>= 1.2-1), methods, stats"
    ## lubridate     "methods, R (>= 3.0.0)"                          
    ## magrittr      NA                                               
    ## maptools      "R (>= 2.10), sp (>= 1.0-11)"                    
    ## markdown      "R (>= 2.11.1)"                                  
    ## MatrixModels  "R (>= 3.0.1)"                                   
    ## mclust        "R (>= 3.0)"                                     
    ## mice          "methods, R (>= 2.10.0), lattice"                
    ## mime          NA                                               
    ## minqa         NA                                               
    ## mitml         NA                                               
    ## ModelMetrics  "R (>= 3.2.2)"                                   
    ## modelr        "R (>= 3.2)"                                     
    ## moonBook      "R (>= 3.1.2)"                                   
    ## munsell       NA                                               
    ## mycor         "R (>= 3.1.1)"                                   
    ## naniar        "R (>= 3.1.2)"                                   
    ## networkD3     "R (>= 3.0.0)"                                   
    ## nloptr        NA                                               
    ## nortest       NA                                               
    ## numDeriv      "R (>= 2.11.1)"                                  
    ## officer       NA                                               
    ## openssl       NA                                               
    ## openxlsx      "R (>= 3.3.0)"                                   
    ## ordinal       "R (>= 2.13.0), stats, methods"                  
    ## pacman        "R (>= 3.5.0)"                                   
    ## pan           NA                                               
    ## pander        "R (>= 2.15.0)"                                  
    ## pbkrtest      "R (>= 3.2.3), lme4 (>= 1.1.10)"                 
    ## pdp           "R (>= 3.2.5)"                                   
    ## pillar        NA                                               
    ## pkgconfig     NA                                               
    ## plogr         NA                                               
    ## plyr          "R (>= 3.1.0)"                                   
    ## png           "R (>= 2.9.0)"                                   
    ## polyclip      "R (>= 3.0.0)"                                   
    ## polynom       NA                                               
    ## ppcor         "R (>= 2.6.0), MASS"                             
    ## prettyunits   NA                                               
    ## processx      NA                                               
    ## prodlim       "R (>= 2.9.0)"                                   
    ## progress      NA                                               
    ## promises      NA                                               
    ## ps            "R (>= 3.1)"                                     
    ## purrr         "R (>= 3.1)"                                     
    ## quantreg      "R (>= 2.6), stats, SparseM"                     
    ## R6            "R (>= 3.0)"                                     
    ## RColorBrewer  "R (>= 2.0.0)"                                   
    ## Rcpp          "R (>= 3.0.0)"                                   
    ## RcppEigen     "R (>= 2.15.1)"                                  
    ## readr         "R (>= 3.1)"                                     
    ## readstata13   NA                                               
    ## readxl        NA                                               
    ## recipes       "R (>= 3.1), dplyr"                              
    ## rematch       NA                                               
    ## remotes       "R (>= 3.0.0)"                                   
    ## reprex        "R (>= 3.1)"                                     
    ## reshape       "R (>= 2.6.1)"                                   
    ## reshape2      "R (>= 3.1)"                                     
    ## rio           "R (>= 2.15.0)"                                  
    ## rJava         "R (>= 2.5.0), methods"                          
    ## rlang         "R (>= 3.2.0)"                                   
    ## rmarkdown     "R (>= 3.0)"                                     
    ## rprojroot     "R (>= 3.0.0)"                                   
    ## rstudioapi    NA                                               
    ## Rttf2pt1      "R (>= 2.15)"                                    
    ## rvest         "R (>= 3.2), xml2"                               
    ## scales        "R (>= 3.1)"                                     
    ## scatterplot3d "R (>= 2.7.0)"                                   
    ## selectr       "R (>= 3.0)"                                     
    ## servr         "R (>= 3.0.0)"                                   
    ## sjlabelled    "R (>= 3.2), stats"                              
    ## sjmisc        "R (>= 3.2), stats, utils"                       
    ## skimr         "R (>= 3.1.2)"                                   
    ## snakecase     "R (>= 3.2)"                                     
    ## sp            "R (>= 3.0.0), methods"                          
    ## SparseM       "R (>= 2.15), methods"                           
    ## SQUAREM       "R (>= 3.0)"                                     
    ## stargazer     NA                                               
    ## stringi       "R (>= 2.14)"                                    
    ## stringr       "R (>= 3.1)"                                     
    ## sys           NA                                               
    ## tibble        "R (>= 3.1.0)"                                   
    ## tidyr         "R (>= 3.1)"                                     
    ## tidyselect    "R (>= 3.1)"                                     
    ## tidyverse     NA                                               
    ## timeDate      "R (>= 2.15.1), graphics, utils, stats, methods" 
    ## tinytex       NA                                               
    ## tweenr        "R (>= 3.2.0)"                                   
    ## ucminf        NA                                               
    ## UpSetR        "R (>= 3.0)"                                     
    ## utf8          "R (>= 2.10)"                                    
    ## uuid          "R (>= 2.9.0)"                                   
    ## vctrs         "R (>= 3.2)"                                     
    ## viridis       "R (>= 2.10), viridisLite (>= 0.3.0)"            
    ## viridisLite   "R (>= 2.10)"                                    
    ## visdat        "R (>= 3.2.2)"                                   
    ## webshot       "R (>= 3.0)"                                     
    ## whisker       NA                                               
    ## withr         "R (>= 3.0.2)"                                   
    ## wooldridge    "R (>= 3.2.0)"                                   
    ## xaringan      NA                                               
    ## xfun          NA                                               
    ## xlsx          NA                                               
    ## xlsxjars      "rJava"                                          
    ## xml2          "R (>= 3.1.0)"                                   
    ## xtable        "R (>= 2.10.0)"                                  
    ## yaml          NA                                               
    ## zeallot       NA                                               
    ## zip           NA                                               
    ## ztable        "R (>= 3.1.2)"                                   
    ## base          NA                                               
    ## boot          "R (>= 3.0.0), graphics, stats"                  
    ## class         "R (>= 3.0.0), stats, utils"                     
    ## cluster       "R (>= 3.3.0)"                                   
    ## codetools     "R (>= 2.1)"                                     
    ## compiler      NA                                               
    ## datasets      NA                                               
    ## foreign       "R (>= 3.0.0)"                                   
    ## graphics      NA                                               
    ## grDevices     NA                                               
    ## grid          NA                                               
    ## KernSmooth    "R (>= 2.5.0), stats"                            
    ## lattice       "R (>= 3.0.0)"                                   
    ## MASS          "R (>= 3.1.0), grDevices, graphics, stats, utils"
    ## Matrix        "R (>= 3.2.0)"                                   
    ## methods       NA                                               
    ## mgcv          "R (>= 2.14.0), nlme (>= 3.1-64)"                
    ## nlme          "R (>= 3.4.0)"                                   
    ## nnet          "R (>= 2.14.0), stats, utils"                    
    ## parallel      NA                                               
    ## rpart         "R (>= 2.15.0), graphics, stats, grDevices"      
    ## spatial       "R (>= 3.0.0), graphics, stats, utils"           
    ## splines       NA                                               
    ## stats         NA                                               
    ## stats4        NA                                               
    ## survival      "R (>= 2.13.0)"                                  
    ## tcltk         NA                                               
    ## tools         NA                                               
    ## translations  NA                                               
    ## utils         NA                                               
    ##               Imports                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## abind         "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## askpass       "sys (>= 2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## assertthat    "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## backports     "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## base64enc     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## BH            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## bitops        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## bookdown      "htmltools (>= 0.3.6), knitr (>= 1.22), rmarkdown (>= 1.12),\nxfun (>= 0.6), tinytex (>= 0.12)"                                                                                                                                                                                                                                                                                                                                                                                       
    ## broom         "backports, dplyr, generics (>= 0.0.2), methods, nlme, purrr,\nreshape2, stringr, tibble, tidyr"                                                                                                                                                                                                                                                                                                                                                                                      
    ## callr         "processx (>= 3.4.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## car           "abind, MASS, mgcv, nnet, pbkrtest (>= 0.4-4), quantreg,\ngrDevices, utils, stats, graphics, maptools, rio, lme4, nlme"                                                                                                                                                                                                                                                                                                                                                               
    ## carData       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## caret         "foreach, methods, plyr, ModelMetrics (>= 1.1.0), nlme,\nreshape2, stats, stats4, utils, grDevices, recipes (>= 0.1.4),\nwithr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                            
    ## caTools       "bitops"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## cellranger    "rematch, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## cli           "assertthat, crayon (>= 1.3.4), methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## clipr         "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## colorspace    "graphics, grDevices, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## corrplot      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## cowplot       "ggplot2 (> 2.2.1), grid, gtable, grDevices, methods, rlang,\nscales, utils"                                                                                                                                                                                                                                                                                                                                                                                                          
    ## cranlogs      "httr, jsonlite"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## crayon        "grDevices, methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## curl          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## data.table    "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## DataExplorer  "data.table (>= 1.11), reshape2 (>= 1.4), scales (>= 1.0),\nggplot2 (>= 2.2), gridExtra (>= 2.3), rmarkdown (>= 1.10),\nnetworkD3 (>= 0.4), stats, utils, tools, parallel"                                                                                                                                                                                                                                                                                                            
    ## DBI           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## dbplyr        "assertthat (>= 0.2.0), DBI (>= 1.0.0), dplyr (>= 0.8.0), glue\n(>= 1.2.0), methods, purrr (>= 0.2.5), R6 (>= 2.2.2), rlang (>=\n0.2.0), tibble (>= 1.4.2), tidyselect (>= 0.2.4), utils"                                                                                                                                                                                                                                                                                             
    ## dendextend    "utils, stats, datasets, magrittr (>= 1.0.1), ggplot2, viridis"                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## digest        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## dplyr         "assertthat (>= 0.2.0), glue (>= 1.3.0), magrittr (>= 1.5),\nmethods, pkgconfig, R6, Rcpp (>= 1.0.1), rlang (>= 0.4.0),\ntibble (>= 2.0.0), tidyselect (>= 0.2.5), utils"                                                                                                                                                                                                                                                                                                             
    ## ellipse       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## ellipsis      "rlang (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## evaluate      "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## extrafont     "extrafontdb, grDevices, utils, Rttf2pt1"                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## extrafontdb   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## factoextra    "abind, cluster, dendextend, FactoMineR, ggpubr(>= 0.1.5),\ngrid, stats, reshape2, ggrepel, tidyr"                                                                                                                                                                                                                                                                                                                                                                                    
    ## FactoMineR    "car,cluster,ellipse,flashClust,graphics,grDevices,lattice,leaps,MASS,scatterplot3d,stats,utils"                                                                                                                                                                                                                                                                                                                                                                                      
    ## fansi         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## farver        "Rcpp (>= 0.12.15)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## flashClust    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## flextable     "stats, utils, grDevices, graphics, officer (>= 0.2.0),\nrmarkdown, knitr, htmltools, xml2, data.table, gdtools (>=\n0.1.6), rlang, base64enc"                                                                                                                                                                                                                                                                                                                                        
    ## forcats       "ellipsis, magrittr, rlang, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## foreach       "codetools, utils, iterators"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## fs            "methods, Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## gapminder     "tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## gdtools       "Rcpp (>= 0.12.12), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## generics      "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## GGally        "grDevices, grid, gtable (>= 0.2.0), plyr (>= 1.8.3), progress,\nRColorBrewer, reshape (>= 0.8.5), utils, rlang"                                                                                                                                                                                                                                                                                                                                                                      
    ## gganimate     "stringi, tweenr (>= 1.0.1), grid, rlang, glue, progress, plyr,\nscales, grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                            
    ## ggforce       "Rcpp (>= 0.12.2), grid, scales, MASS, tweenr (>= 0.1.5),\ngtable, rlang, polyclip, stats, grDevices, tidyselect, withr,\nutils"                                                                                                                                                                                                                                                                                                                                                      
    ## ggiraph       "grid, ggplot2 (>= 3.0.0), htmlwidgets (>= 0.6), stats, xml2\n(>= 1.0.0), htmltools, Rcpp (>= 0.12.12), gdtools (>= 0.1.6),"                                                                                                                                                                                                                                                                                                                                                          
    ## ggiraphExtra  "ggplot2 (>= 2.2.0), ggiraph (>= 0.3.2), scales, reshape2,\nplyr, mycor, ppcor, grid, mgcv, sjlabelled, sjmisc, stringr,\nwebshot, tidyr, purrr, dplyr, magrittr, ggforce, ztable,\nRColorBrewer"                                                                                                                                                                                                                                                                                     
    ## ggplot2       "digest, grDevices, grid, gtable (>= 0.1.1), lazyeval, MASS,\nmgcv, reshape2, rlang (>= 0.3.0), scales (>= 0.5.0), stats,\ntibble, viridisLite, withr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                     
    ## ggpubr        "ggrepel, grid, ggsci, stats, utils, tidyr, purrr, dplyr (>=\n0.7.1), cowplot, ggsignif, scales, gridExtra, glue, polynom,\nrlang"                                                                                                                                                                                                                                                                                                                                                    
    ## ggrepel       "grid, Rcpp, scales (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## ggsci         "grDevices, scales, ggplot2 (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## ggsignif      "ggplot2 (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## ggthemes      "ggplot2 (>= 3.0.0), graphics, grid, methods, purrr, scales,\nstringr, tibble"                                                                                                                                                                                                                                                                                                                                                                                                        
    ## gifski        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## glue          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## gower         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## gridExtra     "gtable, grid, grDevices, graphics, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## gtable        "grid"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## haven         "forcats (>= 0.2.0), hms, Rcpp (>= 0.11.4), readr (>= 0.1.0),\ntibble"                                                                                                                                                                                                                                                                                                                                                                                                                
    ## highr         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## hms           "methods, pkgconfig, rlang, vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## hrbrthemes    "ggplot2 (>= 2.2.1), grDevices, grid, scales, extrafont, knitr,\nrmarkdown, htmltools, tools, magrittr, gdtools"                                                                                                                                                                                                                                                                                                                                                                      
    ## htmltools     "utils, digest, Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## htmlwidgets   "grDevices, htmltools (>= 0.3), jsonlite (>= 0.9.16), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## httpuv        "Rcpp (>= 0.11.0), utils, R6, promises, later (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## httr          "curl (>= 3.0.0), jsonlite, mime, openssl (>= 0.8), R6"                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## igraph        "graphics, grDevices, magrittr, Matrix, pkgconfig (>= 2.0.0),\nstats, utils"                                                                                                                                                                                                                                                                                                                                                                                                          
    ## insight       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## ipred         "rpart (>= 3.1-8), MASS, survival, nnet, class, prodlim"                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## iterators     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## jomo          "stats, lme4, survival, MASS, ordinal"                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## jsonlite      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## knitr         "evaluate (>= 0.10), highr, markdown, stringr (>= 0.6), yaml\n(>= 2.1.19), methods, xfun, tools"                                                                                                                                                                                                                                                                                                                                                                                      
    ## labeling      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## later         "Rcpp (>= 0.12.9), rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## lava          "grDevices, graphics, methods, numDeriv, stats, survival,\nSQUAREM, utils"                                                                                                                                                                                                                                                                                                                                                                                                            
    ## lazyeval      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## leaps         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## lme4          "graphics, grid, splines, utils, parallel, MASS, lattice, boot,\nnlme (>= 3.1-123), minqa (>= 1.1.15), nloptr (>= 1.0.4)"                                                                                                                                                                                                                                                                                                                                                             
    ## lubridate     "stringr, Rcpp (>= 0.12.13),"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## magrittr      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## maptools      "foreign (>= 0.8), methods, grid, lattice, stats, utils,\ngrDevices"                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## markdown      "utils, xfun, mime (>= 0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## MatrixModels  "stats, methods, Matrix (>= 1.1-5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## mclust        "stats, utils, graphics, grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## mice          "broom, dplyr, grDevices, graphics, MASS, mitml, nnet,\nparallel, Rcpp, rlang, rpart, splines, stats, survival, utils"                                                                                                                                                                                                                                                                                                                                                                
    ## mime          "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## minqa         "Rcpp (>= 0.9.10)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## mitml         "pan, jomo, haven, grDevices, graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## ModelMetrics  "Rcpp, data.table"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## modelr        "broom, dplyr, magrittr, purrr (>= 0.2.2), rlang (>= 0.2.0),\ntibble, tidyr (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                               
    ## moonBook      "nortest, survival, sjmisc, purrr, stringr, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## munsell       "colorspace, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## mycor         "lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## naniar        "dplyr, ggplot2, purrr, tidyr, tibble, magrittr, stats, visdat,\nrlang, forcats, viridis, glue, UpSetR"                                                                                                                                                                                                                                                                                                                                                                               
    ## networkD3     "htmlwidgets (>= 0.3.2), igraph, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## nloptr        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## nortest       "stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## numDeriv      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## officer       "Rcpp (>= 0.12.12), R6, grDevices, base64enc, zip (>= 2.0.0),\ndigest,uuid,stats, magrittr,htmltools,rlang, xml2 (>= 1.1.0)"                                                                                                                                                                                                                                                                                                                                                          
    ## openssl       "askpass"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## openxlsx      "methods, Rcpp, grDevices, stats, utils, zip"                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## ordinal       "ucminf, MASS, Matrix, numDeriv"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## pacman        "remotes, methods, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## pan           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## pander        "grDevices, graphics, methods, utils, stats, digest, tools,\nRcpp"                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## pbkrtest      "Matrix (>= 1.2.3), parallel, MASS, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## pdp           "ggplot2 (>= 0.9.0), grDevices, gridExtra, lattice, magrittr,\nmethods, mgcv, plyr, stats, viridis, utils"                                                                                                                                                                                                                                                                                                                                                                            
    ## pillar        "cli, crayon (>= 1.3.4), fansi, rlang (>= 0.3.0), utf8 (>=\n1.1.0), vctrs"                                                                                                                                                                                                                                                                                                                                                                                                            
    ## pkgconfig     "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## plogr         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## plyr          "Rcpp (>= 0.11.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## png           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## polyclip      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## polynom       "stats, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## ppcor         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## prettyunits   "magrittr, assertthat, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## processx      "ps (>= 1.2.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## prodlim       "Rcpp (>= 0.11.5), stats, graphics, survival, KernSmooth, lava"                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## progress      "hms, prettyunits, R6, crayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## promises      "R6, Rcpp, later, rlang, stats, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## ps            "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## purrr         "magrittr (>= 1.5), rlang (>= 0.3.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## quantreg      "methods, graphics, Matrix, MatrixModels"                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## R6            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## RColorBrewer  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## Rcpp          "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## RcppEigen     "Matrix (>= 1.1-0), Rcpp (>= 0.11.0), stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## readr         "Rcpp (>= 0.12.0.5), tibble, hms (>= 0.4.1), R6, clipr, crayon,\nmethods"                                                                                                                                                                                                                                                                                                                                                                                                             
    ## readstata13   "Rcpp (>= 0.11.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## readxl        "cellranger, Rcpp (>= 0.12.18), tibble (>= 1.3.1), utils"                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## recipes       "generics, glue, gower, ipred, lubridate, magrittr, Matrix,\npurrr (>= 0.2.3), rlang (>= 0.4.0), stats, tibble, tidyr,\ntidyselect (>= 0.2.5), timeDate, utils, withr"                                                                                                                                                                                                                                                                                                                
    ## rematch       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## remotes       "methods, stats, tools, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## reprex        "callr (>= 2.0.0), clipr (>= 0.4.0), fs, rlang, rmarkdown,\nutils, whisker, withr"                                                                                                                                                                                                                                                                                                                                                                                                    
    ## reshape       "plyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## reshape2      "plyr (>= 1.8.1), Rcpp, stringr"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## rio           "tools, stats, utils, foreign, haven (>= 1.1.0), curl (>= 0.6),\ndata.table (>= 1.9.8), readxl (>= 0.1.1), openxlsx, tibble"                                                                                                                                                                                                                                                                                                                                                          
    ## rJava         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## rlang         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## rmarkdown     "tools, utils, knitr (>= 1.22), yaml (>= 2.1.19), htmltools (>=\n0.3.5), evaluate (>= 0.13), base64enc, jsonlite, mime, tinytex\n(>= 0.11), xfun, methods, stringr (>= 1.2.0)"                                                                                                                                                                                                                                                                                                        
    ## rprojroot     "backports"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## rstudioapi    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## Rttf2pt1      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## rvest         "httr (>= 0.5), magrittr, selectr"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## scales        "labeling, munsell (>= 0.5), R6, RColorBrewer, Rcpp,\nviridisLite"                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## scatterplot3d "grDevices, graphics, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## selectr       "methods, stringr, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## servr         "mime (>= 0.2), httpuv (>= 1.4.0), xfun, jsonlite"                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## sjlabelled    "haven (>= 1.1.2), insight, magrittr, purrr, rlang, tidyselect,\nutils"                                                                                                                                                                                                                                                                                                                                                                                                               
    ## sjmisc        "dplyr (>= 0.8.0), insight (>= 0.3.0), magrittr, methods,\npurrr, rlang, sjlabelled (>= 1.1.0)"                                                                                                                                                                                                                                                                                                                                                                                       
    ## skimr         "cli, dplyr (>= 0.7), magrittr, pander, purrr, rlang, stats,\nstringr (>= 1.1), knitr (>= 1.2), tibble (>= 0.6), tidyr (>=\n0.7), tidyselect (>= 0.2.4)"                                                                                                                                                                                                                                                                                                                              
    ## snakecase     "stringr, stringi"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## sp            "utils, stats, graphics, grDevices, lattice, grid"                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## SparseM       "graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## SQUAREM       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## stargazer     "stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## stringi       "tools, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## stringr       "glue (>= 1.2.0), magrittr, stringi (>= 1.1.7)"                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## sys           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## tibble        "cli, crayon (>= 1.3.4), fansi (>= 0.4.0), methods, pillar (>=\n1.3.1), pkgconfig, rlang (>= 0.3.0), utils"                                                                                                                                                                                                                                                                                                                                                                           
    ## tidyr         "dplyr (>= 0.7.0), glue, magrittr, purrr, Rcpp, rlang, stringi,\ntibble, tidyselect (>= 0.2.5), utils"                                                                                                                                                                                                                                                                                                                                                                                
    ## tidyselect    "glue (>= 1.3.0), purrr, rlang (>= 0.2.2), Rcpp (>= 0.12.0)"                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## tidyverse     "broom (>= 0.4.2), cli (>= 1.0.0), crayon (>= 1.3.4), dplyr (>=\n0.7.4), dbplyr (>= 1.1.0), forcats (>= 0.2.0), ggplot2 (>=\n2.2.1), haven (>= 1.1.0), hms (>= 0.3), httr (>= 1.3.1),\njsonlite (>= 1.5), lubridate (>= 1.7.1), magrittr (>= 1.5),\nmodelr (>= 0.1.1), purrr (>= 0.2.4), readr (>= 1.1.1), readxl\n(>= 1.0.0), reprex (>= 0.1.1), rlang (>= 0.1.4), rstudioapi (>=\n0.7), rvest (>= 0.3.2), stringr (>= 1.2.0), tibble (>= 1.3.4),\ntidyr (>= 0.7.2), xml2 (>= 1.1.1)"
    ## timeDate      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## tinytex       "xfun (>= 0.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## tweenr        "Rcpp (>= 0.12.3), grDevices, farver, magrittr, rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## ucminf        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## UpSetR        "ggplot2, gridExtra, plyr, utils, stats, methods, grDevices,\nscales"                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## utf8          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## uuid          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## vctrs         "backports, ellipsis (>= 0.2.0), digest, glue, rlang (>=\n0.4.0), zeallot"                                                                                                                                                                                                                                                                                                                                                                                                            
    ## viridis       "stats, ggplot2 (>= 1.0.1), gridExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## viridisLite   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## visdat        "ggplot2, tidyr, dplyr, purrr, readr, magrittr, stats, tibble,\nglue"                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## webshot       "magrittr, jsonlite, callr"                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## whisker       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## withr         "stats, graphics, grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## wooldridge    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## xaringan      "htmltools, knitr (>= 1.21), servr (>= 0.13), xfun (>= 0.6),\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                              
    ## xfun          "stats, tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## xlsx          "rJava, xlsxjars, grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## xlsxjars      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## xml2          "Rcpp, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## xtable        "stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## yaml          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## zeallot       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## zip           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## ztable        "stringr, magrittr, RColorBrewer, flextable, officer, moonBook,\nscales"                                                                                                                                                                                                                                                                                                                                                                                                              
    ## base          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## boot          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## class         "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## cluster       "graphics, grDevices, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## codetools     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## compiler      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## datasets      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## foreign       "methods, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## graphics      "grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## grDevices     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## grid          "grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## KernSmooth    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## lattice       "grid, grDevices, graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## MASS          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## Matrix        "methods, graphics, grid, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## methods       "utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## mgcv          "methods, stats, graphics, Matrix, splines, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## nlme          "graphics, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## nnet          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## parallel      "tools, compiler"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## rpart         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## spatial       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## splines       "graphics, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## stats         "utils, grDevices, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## stats4        "graphics, methods, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## survival      "graphics, Matrix, methods, splines, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## tcltk         "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## tools         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## translations  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## utils         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ##               LinkingTo                              
    ## abind         NA                                     
    ## askpass       NA                                     
    ## assertthat    NA                                     
    ## backports     NA                                     
    ## base64enc     NA                                     
    ## BH            NA                                     
    ## bitops        NA                                     
    ## bookdown      NA                                     
    ## broom         NA                                     
    ## callr         NA                                     
    ## car           NA                                     
    ## carData       NA                                     
    ## caret         NA                                     
    ## caTools       NA                                     
    ## cellranger    NA                                     
    ## cli           NA                                     
    ## clipr         NA                                     
    ## colorspace    NA                                     
    ## corrplot      NA                                     
    ## cowplot       NA                                     
    ## cranlogs      NA                                     
    ## crayon        NA                                     
    ## curl          NA                                     
    ## data.table    NA                                     
    ## DataExplorer  NA                                     
    ## DBI           NA                                     
    ## dbplyr        NA                                     
    ## dendextend    NA                                     
    ## digest        NA                                     
    ## dplyr         "BH, plogr (>= 0.2.0), Rcpp (>= 1.0.1)"
    ## ellipse       NA                                     
    ## ellipsis      NA                                     
    ## evaluate      NA                                     
    ## extrafont     NA                                     
    ## extrafontdb   NA                                     
    ## factoextra    NA                                     
    ## FactoMineR    NA                                     
    ## fansi         NA                                     
    ## farver        "Rcpp"                                 
    ## flashClust    NA                                     
    ## flextable     NA                                     
    ## forcats       NA                                     
    ## foreach       NA                                     
    ## fs            "Rcpp"                                 
    ## gapminder     NA                                     
    ## gdtools       "Rcpp"                                 
    ## generics      NA                                     
    ## GGally        NA                                     
    ## gganimate     NA                                     
    ## ggforce       "Rcpp, RcppEigen"                      
    ## ggiraph       "Rcpp, gdtools"                        
    ## ggiraphExtra  NA                                     
    ## ggplot2       NA                                     
    ## ggpubr        NA                                     
    ## ggrepel       "Rcpp"                                 
    ## ggsci         NA                                     
    ## ggsignif      NA                                     
    ## ggthemes      NA                                     
    ## gifski        NA                                     
    ## glue          NA                                     
    ## gower         NA                                     
    ## gridExtra     NA                                     
    ## gtable        NA                                     
    ## haven         "Rcpp"                                 
    ## highr         NA                                     
    ## hms           NA                                     
    ## hrbrthemes    NA                                     
    ## htmltools     "Rcpp"                                 
    ## htmlwidgets   NA                                     
    ## httpuv        "Rcpp, BH, later"                      
    ## httr          NA                                     
    ## igraph        NA                                     
    ## insight       NA                                     
    ## ipred         NA                                     
    ## iterators     NA                                     
    ## jomo          NA                                     
    ## jsonlite      NA                                     
    ## knitr         NA                                     
    ## labeling      NA                                     
    ## later         "Rcpp, BH"                             
    ## lava          NA                                     
    ## lazyeval      NA                                     
    ## leaps         NA                                     
    ## lme4          "Rcpp (>= 0.10.5), RcppEigen"          
    ## lubridate     "Rcpp,"                                
    ## magrittr      NA                                     
    ## maptools      NA                                     
    ## markdown      NA                                     
    ## MatrixModels  NA                                     
    ## mclust        NA                                     
    ## mice          "Rcpp"                                 
    ## mime          NA                                     
    ## minqa         "Rcpp"                                 
    ## mitml         NA                                     
    ## ModelMetrics  "Rcpp"                                 
    ## modelr        NA                                     
    ## moonBook      NA                                     
    ## munsell       NA                                     
    ## mycor         NA                                     
    ## naniar        NA                                     
    ## networkD3     NA                                     
    ## nloptr        NA                                     
    ## nortest       NA                                     
    ## numDeriv      NA                                     
    ## officer       "Rcpp"                                 
    ## openssl       NA                                     
    ## openxlsx      "Rcpp"                                 
    ## ordinal       NA                                     
    ## pacman        NA                                     
    ## pan           NA                                     
    ## pander        "Rcpp"                                 
    ## pbkrtest      NA                                     
    ## pdp           NA                                     
    ## pillar        NA                                     
    ## pkgconfig     NA                                     
    ## plogr         NA                                     
    ## plyr          "Rcpp"                                 
    ## png           NA                                     
    ## polyclip      NA                                     
    ## polynom       NA                                     
    ## ppcor         NA                                     
    ## prettyunits   NA                                     
    ## processx      NA                                     
    ## prodlim       "Rcpp"                                 
    ## progress      NA                                     
    ## promises      "later, Rcpp"                          
    ## ps            NA                                     
    ## purrr         NA                                     
    ## quantreg      NA                                     
    ## R6            NA                                     
    ## RColorBrewer  NA                                     
    ## Rcpp          NA                                     
    ## RcppEigen     "Rcpp"                                 
    ## readr         "Rcpp, BH"                             
    ## readstata13   "Rcpp"                                 
    ## readxl        "progress, Rcpp"                       
    ## recipes       NA                                     
    ## rematch       NA                                     
    ## remotes       NA                                     
    ## reprex        NA                                     
    ## reshape       NA                                     
    ## reshape2      "Rcpp"                                 
    ## rio           NA                                     
    ## rJava         NA                                     
    ## rlang         NA                                     
    ## rmarkdown     NA                                     
    ## rprojroot     NA                                     
    ## rstudioapi    NA                                     
    ## Rttf2pt1      NA                                     
    ## rvest         NA                                     
    ## scales        "Rcpp"                                 
    ## scatterplot3d NA                                     
    ## selectr       NA                                     
    ## servr         NA                                     
    ## sjlabelled    NA                                     
    ## sjmisc        NA                                     
    ## skimr         NA                                     
    ## snakecase     NA                                     
    ## sp            NA                                     
    ## SparseM       NA                                     
    ## SQUAREM       NA                                     
    ## stargazer     NA                                     
    ## stringi       NA                                     
    ## stringr       NA                                     
    ## sys           NA                                     
    ## tibble        NA                                     
    ## tidyr         "Rcpp"                                 
    ## tidyselect    "Rcpp (>= 0.12.0),"                    
    ## tidyverse     NA                                     
    ## timeDate      NA                                     
    ## tinytex       NA                                     
    ## tweenr        "Rcpp"                                 
    ## ucminf        NA                                     
    ## UpSetR        NA                                     
    ## utf8          NA                                     
    ## uuid          NA                                     
    ## vctrs         NA                                     
    ## viridis       NA                                     
    ## viridisLite   NA                                     
    ## visdat        NA                                     
    ## webshot       NA                                     
    ## whisker       NA                                     
    ## withr         NA                                     
    ## wooldridge    NA                                     
    ## xaringan      NA                                     
    ## xfun          NA                                     
    ## xlsx          NA                                     
    ## xlsxjars      NA                                     
    ## xml2          "Rcpp (>= 0.12.12)"                    
    ## xtable        NA                                     
    ## yaml          NA                                     
    ## zeallot       NA                                     
    ## zip           NA                                     
    ## ztable        NA                                     
    ## base          NA                                     
    ## boot          NA                                     
    ## class         NA                                     
    ## cluster       NA                                     
    ## codetools     NA                                     
    ## compiler      NA                                     
    ## datasets      NA                                     
    ## foreign       NA                                     
    ## graphics      NA                                     
    ## grDevices     NA                                     
    ## grid          NA                                     
    ## KernSmooth    NA                                     
    ## lattice       NA                                     
    ## MASS          NA                                     
    ## Matrix        NA                                     
    ## methods       NA                                     
    ## mgcv          NA                                     
    ## nlme          NA                                     
    ## nnet          NA                                     
    ## parallel      NA                                     
    ## rpart         NA                                     
    ## spatial       NA                                     
    ## splines       NA                                     
    ## stats         NA                                     
    ## stats4        NA                                     
    ## survival      NA                                     
    ## tcltk         NA                                     
    ## tools         NA                                     
    ## translations  NA                                     
    ## utils         NA                                     
    ##               Suggests                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## abind         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## askpass       "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## assertthat    "testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## backports     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## base64enc     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## BH            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## bitops        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## bookdown      "htmlwidgets, rstudioapi, miniUI, rsconnect (>= 0.4.3), servr\n(>= 0.13), shiny, testit (>= 0.9), tufte, webshot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## broom         "AER, akima, AUC, bbmle, betareg, biglm, binGroup, boot, brms,\nbtergm, car, caret, coda, covr, e1071, emmeans, ergm, gam (>=\n1.15), gamlss, gamlss.data, gamlss.dist, geepack, ggplot2,\nglmnet, gmm, Hmisc, irlba, joineRML, Kendall, knitr, ks,\nLahman, lavaan, lfe, lme4, lmodel2, lmtest, lsmeans, maps,\nmaptools, MASS, Matrix, mclust, mgcv, muhaz, multcomp, network,\nnnet, orcutt (>= 2.2), ordinal, plm, plyr, poLCA, psych,\nquantreg, rgeos, rmarkdown, robust, rsample, rstan, rstanarm,\nsp, speedglm, statnet.common, survey, survival, testthat,\ntseries, xergm, zoo"
    ## callr         "cliapp, covr, crayon, knitr, pingr, ps, rmarkdown, rprojroot,\nspelling, testthat, tibble, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## car           "alr4, boot, coxme, leaps, lmtest, Matrix, MatrixModels, rgl\n(>= 0.93.960), sandwich, SparseM, survival, survey"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## carData       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## caret         "BradleyTerry2, e1071, earth (>= 2.2-3), fastICA, gam (>=\n1.15), ipred, kernlab, knitr, klaR, MASS, ellipse, mda, mgcv,\nmlbench, MLmetrics, nnet, party (>= 0.9-99992), pls, pROC,\nproxy, randomForest, RANN, spls, subselect, pamr, superpc,\nCubist, testthat (>= 0.9.1), rpart, dplyr"                                                                                                                                                                                                                                                                                              
    ## caTools       "MASS, rpart"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## cellranger    "covr, testthat (>= 1.0.0), knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## cli           "covr, fansi, mockery, testthat, webshot, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## clipr         "covr, knitr, rmarkdown, rstudioapi (>= 0.5), testthat (>=\n2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## colorspace    "datasets, utils, KernSmooth, MASS, kernlab, mvtnorm, vcd,\ntcltk, shiny, shinyjs, ggplot2, dplyr, scales, grid, png, jpeg,\nknitr, rmarkdown, RColorBrewer, rcartocolor, scico, viridis,\nwesanderson"                                                                                                                                                                                                                                                                                                                                                                                   
    ## corrplot      "knitr, RColorBrewer, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## cowplot       "Cairo, covr, dplyr, forcats, gridGraphics (>= 0.4-0), knitr,\nlattice, magick, maps, PASWR, rmarkdown, testthat (>= 1.0.0),\ntidyr, vdiffr (>= 0.3.0), VennDiagram"                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## cranlogs      "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## crayon        "mockery, rstudioapi, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## curl          "askpass, spelling, testthat (>= 1.0.0), knitr, jsonlite,\nrmarkdown, magrittr, httpuv (>= 1.4.4), webutils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## data.table    "bit64, curl, R.utils, knitr, xts, nanotime, zoo"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## DataExplorer  "testthat, covr, knitr, jsonlite, nycflights13"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## DBI           "blob, covr, hms, knitr, magrittr, rprojroot, rmarkdown,\nRSQLite (>= 1.1-2), testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## dbplyr        "bit64, covr, knitr, Lahman, nycflights13, RMariaDB (>=\n1.0.2), rmarkdown, RMySQL (>= 0.10.11), RPostgreSQL (>= 0.4.1),\nRSQLite (>= 2.1.0), testthat (>= 2.0.0), withr (>= 2.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                      
    ## dendextend    "knitr, rmarkdown, testthat, seriation, colorspace, ape,\nprofdpm, microbenchmark, gplots, heatmaply, d3heatmap,\ndynamicTreeCut, pvclust, corrplot, DendSer, MASS, cluster, fpc,\ncirclize (>= 0.2.5), covr"                                                                                                                                                                                                                                                                                                                                                                             
    ## digest        "tinytest, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## dplyr         "bit64, callr, covr, crayon (>= 1.3.4), DBI, dbplyr, dtplyr,\nggplot2, hms, knitr, Lahman, lubridate, MASS, mgcv,\nmicrobenchmark, nycflights13, rmarkdown, RMySQL, RPostgreSQL,\nRSQLite, testthat, withr, broom, purrr, readr"                                                                                                                                                                                                                                                                                                                                                          
    ## ellipse       "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## ellipsis      "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## evaluate      "testthat, lattice, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## extrafont     "fontcm"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## extrafontdb   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## factoextra    "ade4, ca, igraph, MASS, knitr, mclust"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## FactoMineR    "missMDA,knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## fansi         "unitizer, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## farver        "testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## flashClust    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## flextable     "testthat, xtable, magrittr, webshot, magick, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## forcats       "covr, ggplot2, testthat, readr, knitr, rmarkdown, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## foreach       "randomForest"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## fs            "testthat, covr, pillar (>= 1.0.0), crayon, rmarkdown, knitr,\nwithr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## gapminder     "dplyr, ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## gdtools       "htmltools, testthat, fontquiver (>= 0.2.0), curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## generics      "covr, pkgload, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## GGally        "broom (>= 0.4.0), chemometrics, geosphere (>= 1.5-1), igraph\n(>= 1.0.1), intergraph (>= 2.0-2), maps (>= 3.1.0), mapproj,\nnetwork (>= 1.12.0), scagnostics, scales (>= 0.4.0), sna (>=\n2.3-2), survival, packagedocs (>= 0.4.0), rmarkdown, roxygen2,\ntestthat, crosstalk"                                                                                                                                                                                                                                                                                                           
    ## gganimate     "magick, svglite, knitr, rmarkdown, testthat, base64enc,\nhtmltools, covr, transformr, av, png, gifski"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## ggforce       "sessioninfo, concaveman, deldir, reshape2, units (>= 0.4-6)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## ggiraph       "knitr, testthat, rmarkdown, maps, shiny, sf (>= 0.3-4), dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## ggiraphExtra  "TH.data, moonBook, maps, gcookbook, knitr, rmarkdown,\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## ggplot2       "covr, dplyr, ggplot2movies, hexbin, Hmisc, knitr, lattice,\nmapproj, maps, maptools, multcomp, munsell, nlme, profvis,\nquantreg, rgeos, rmarkdown, rpart, sf (>= 0.7-3), svglite (>=\n1.2.0.9001), testthat (>= 0.11.0), vdiffr (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                             
    ## ggpubr        "grDevices, knitr, RColorBrewer, gtable"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## ggrepel       "knitr, rmarkdown, testthat, gridExtra, devtools, prettydoc"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## ggsci         "knitr, rmarkdown, gridExtra, reshape2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## ggsignif      "testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## ggthemes      "dplyr, covr, extrafont, glue, knitr, lattice, lintr, maps,\nmapproj, pander, rlang, rmarkdown, spelling, testthat, tidyr,\nvdiffr, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## gifski        "ggplot2, gapminder"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## glue          "testthat, covr, magrittr, crayon, knitr, rmarkdown, DBI,\nRSQLite, R.utils, forcats, microbenchmark, rprintf, stringr,\nggplot2, dplyr, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## gower         "tinytest (>= 0.9.3),"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## gridExtra     "ggplot2, egg, lattice, knitr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## gtable        "covr, testthat, knitr, rmarkdown, ggplot2, profvis"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## haven         "covr, fs, knitr, rmarkdown, testthat, pillar (>= 1.1.1), cli,\ncrayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## highr         "knitr, testit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## hms           "crayon, lubridate, pillar (>= 1.1.0), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## hrbrthemes    "testthat, dplyr, gridExtra, hunspell, stringi, gcookbook,\nclipr, vdiffr, svglite"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## htmltools     "markdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## htmlwidgets   "knitr (>= 1.8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## httpuv        "testthat, callr, curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## httr          "covr, httpuv, jpeg, knitr, png, readr, rmarkdown, testthat\n(>= 0.8.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## igraph        "ape, digest, graph, igraphdata, rgl, scales, stats4, tcltk,\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## insight       "AER, afex, aod, BayesFactor, bayestestR, betareg, biglm,\nblme, brms, censReg, crch, coxme, covr, estimatr, feisr, gam,\ngamm4, gamlss, gbm, gee, geepack, GLMMadaptive, glmmTMB, gmnl,\nHRQoL, httr, lfe, logistf, MASS, MCMCglmm, mlogit, multgee,\nlme4, mgcv, nnet, nlme, ordinal, panelr, plm, pscl, quantreg,\nrms, robust, robustbase, robustlmm, rstanarm, rstudioapi,\nspeedglm, splines, survey, survival, truncreg, testthat, VGAM,\nknitr, rmarkdown"                                                                                                                        
    ## ipred         "mvtnorm, mlbench, TH.data"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## iterators     "RUnit, foreach"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## jomo          "mitml"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## jsonlite      "httr, curl, plyr, testthat, knitr, rmarkdown, R.rsp, sp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## knitr         "formatR, testit, digest, rgl (>= 0.95.1201), codetools,\nrmarkdown, htmlwidgets (>= 0.7), webshot, tikzDevice (>= 0.10),\ntinytex, reticulate (>= 1.4), JuliaCall (>= 0.11.1), magick,\npng, jpeg, gifski, xml2 (>= 1.2.0), httr, DBI (>= 0.4-1),\nshowtext, tibble, styler"                                                                                                                                                                                                                                                                                                             
    ## labeling      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## later         "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## lava          "KernSmooth, Matrix, Rgraphviz, data.table, ellipse, fields,\nforeach, geepack, gof (>= 0.9), graph, igraph (>= 0.6),\nlava.tobit (>= 0.4.7), lme4, mets (>= 1.1), nlme, optimx,\npolycor, quantreg, rgl, testthat (>= 0.11), visNetwork, zoo"                                                                                                                                                                                                                                                                                                                                            
    ## lazyeval      "knitr, rmarkdown (>= 0.2.65), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## leaps         "biglm"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## lme4          "knitr, rmarkdown, PKPDmodels, MEMSS, testthat (>= 0.8.1),\nggplot2, mlmRev, optimx (>= 2013.8.6), gamm4, pbkrtest, HSAUR2,\nnumDeriv, car, dfoptim"                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## lubridate     "testthat, knitr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## magrittr      "testthat, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## maptools      "rgeos (>= 0.1-8), spatstat (>= 1.50), PBSmapping, maps,\nRColorBrewer, raster, polyclip, spatstat.utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## markdown      "knitr, RCurl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## MatrixModels  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## mclust        "knitr (>= 1.12), rmarkdown (>= 0.9), mix (>= 1.0), geometry\n(>= 0.3-6), MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## mice          "AGD, CALIBERrfimpute, gamlss, lme4, mitools, nlme, pan,\nrandomForest, Zelig, BSDA, knitr, rmarkdown, testthat, HSAUR3,\nmicemd, miceadds, tidyr"                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## mime          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## minqa         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## mitml         "mice, miceadds, Amelia, lme4, nlme, geepack, survival, knitr,\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## ModelMetrics  "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## modelr        "compiler, covr, ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## moonBook      "testthat, knitr, ggplot2, ztable, sjlabelled, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## munsell       "ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## mycor         "knitr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## naniar        "knitr, rmarkdown, testthat, rpart, rpart.plot, covr,\ngridExtra, wakefield, vdiffr, here, simputation, imputeTS,\ngdtools, Hmisc, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## networkD3     "htmltools (>= 0.2.6), jsonlite,"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## nloptr        "testthat (>= 0.8.1), knitr, rmarkdown, inline (>= 0.3.14)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## nortest       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## numDeriv      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## officer       "testthat, devEMF,tibble,ggplot2, rmarkdown, knitr, rsvg"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## openssl       "testthat, digest, knitr, rmarkdown, jsonlite, jose, sodium"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## openxlsx      "knitr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## ordinal       "lme4, nnet, xtable, testthat (>= 0.8), tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## pacman        "BiocManager, knitr, lattice, testthat (>= 0.9.0), XML"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## pan           "mitools, lme4"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## pander        "grid, lattice, ggplot2 (>= 0.9.2), sylly, sylly.en,\nfutile.logger, survival, microbenchmark, zoo, nlme, descr,\nMASS, knitr, rmarkdown, tables, reshape, memisc, Epi,\nrandomForest, tseries, gtable, rms, forecast, data.table"                                                                                                                                                                                                                                                                                                                                                        
    ## pbkrtest      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## pdp           "adabag, AmesHousing, C50, caret, Cubist, doParallel, dplyr,\ne1071, earth, gbm, ipred, keras, kernlab, MASS, mda, nnet,\nparty, partykit, progress, randomForest, ranger, rpart,\ntestthat, xgboost (>= 0.6-0), knitr, rmarkdown, vip"                                                                                                                                                                                                                                                                                                                                                   
    ## pillar        "knitr, lubridate, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## pkgconfig     "covr, testthat, disposables (>= 1.0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## plogr         "Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## plyr          "abind, testthat, tcltk, foreach, doParallel, itertools,\niterators, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## png           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## polyclip      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## polynom       "knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## ppcor         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## prettyunits   "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## processx      "callr (>= 3.2.0), codetools, covr, crayon, curl, debugme,\nparallel, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## prodlim       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## progress      "Rcpp, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## promises      "testthat, future, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## ps            "callr, covr, curl, pingr, processx (>= 3.1.0), R6, rlang,\ntestthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## purrr         "covr, crayon, dplyr (>= 0.7.8), knitr, rmarkdown, testthat,\ntibble, tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## quantreg      "tripack, akima, MASS, survival, rgl, logspline, nor1mix,\nFormula, zoo, R.rsp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## R6            "knitr, microbenchmark, pryr, testthat, ggplot2, scales"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## RColorBrewer  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## Rcpp          "RUnit, inline, rbenchmark, knitr, rmarkdown, pinp, pkgKitten\n(>= 0.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## RcppEigen     "inline, RUnit, pkgKitten, microbenchmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## readr         "curl, testthat, knitr, rmarkdown, stringi, covr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## readstata13   "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## readxl        "covr, knitr, rmarkdown, rprojroot (>= 1.1), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## recipes       "covr, ddalpha, dimRed (>= 0.2.2), fastICA, ggplot2, igraph,\nkernlab, knitr, pls, RANN, RcppRoll, rmarkdown, rpart, rsample,\nRSpectra, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## rematch       "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## remotes       "brew, callr, codetools, curl, covr, git2r (>= 0.23.0), knitr,\nmockery, pkgbuild (>= 1.0.1), pingr, rmarkdown, rprojroot,\ntestthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## reprex        "covr, devtools, fortunes, knitr, miniUI, rprojroot,\nrstudioapi, shiny, styler (>= 1.0.2), testthat (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## reshape       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## reshape2      "covr, lattice, testthat (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## rio           "datasets, bit64, testthat, knitr, magrittr, clipr, csvy,\nfeather, fst, hexView, jsonlite, readODS (>= 1.6.4), readr,\nrmatio, xml2 (>= 1.2.0), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## rJava         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## rlang         "covr, crayon, magrittr, methods, pillar, rmarkdown, testthat\n(>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## rmarkdown     "shiny (>= 0.11), tufte, testthat, digest, dygraphs, tibble,\nfs, pkgdown, callr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## rprojroot     "testthat, mockr, knitr, withr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## rstudioapi    "testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## Rttf2pt1      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## rvest         "covr, knitr, png, rmarkdown, spelling, stringi (>= 0.3.1),\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## scales        "dichromat, bit64, covr, hms, testthat (>= 2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## scatterplot3d NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## selectr       "testthat, XML, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## servr         "tools, later, rstudioapi, knitr (>= 1.9), rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## sjlabelled    "dplyr, sjmisc, sjPlot, knitr, rmarkdown, snakecase, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## sjmisc        "ggplot2, graphics, haven (>= 1.1.2), mice, sjPlot, sjstats,\nknitr, rmarkdown, stringdist, testthat, tidyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## skimr         "extrafont, rmarkdown, testthat (>= 2.0.0), withr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## snakecase     "testthat, covr, tibble, purrrlyr, knitr, rmarkdown, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## sp            "RColorBrewer, rgdal (>= 0.8-7), rgeos (>= 0.3-13), gstat,\nmaptools, deldir"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## SparseM       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## SQUAREM       "setRNG"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## stargazer     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## stringi       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## stringr       "covr, htmltools, htmlwidgets, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## sys           "unix (>= 1.4), spelling, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## tibble        "bench, covr, dplyr, htmltools, import, knitr, mockr,\nnycflights13, rmarkdown, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## tidyr         "covr, gapminder, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## tidyselect    "covr, dplyr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## tidyverse     "feather (>= 0.3.1), knitr (>= 1.17), rmarkdown (>= 1.7.4)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## timeDate      "date, RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## tinytex       "testit, rstudioapi"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## tweenr        "testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## ucminf        "numDeriv"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## UpSetR        "knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## utf8          "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## uuid          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## vctrs         "bit64, covr, crayon, generics, knitr, pillar (>= 1.4.1),\npkgdown, rmarkdown, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## viridis       "hexbin (>= 1.27.0), scales, MASS, knitr, dichromat,\ncolorspace, rasterVis, httr, mapproj, vdiffr, svglite (>=\n1.2.0), testthat, covr, rmarkdown, rgdal"                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## viridisLite   "hexbin (>= 1.27.0), ggplot2 (>= 1.0.1), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## visdat        "testthat, plotly (>= 4.5.6), knitr, rmarkdown, vdiffr,\ngdtools, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## webshot       "httpuv, knitr, rmarkdown, shiny"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## whisker       "markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## withr         "testthat, covr, lattice, DBI, RSQLite, methods, knitr,\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    ## wooldridge    "AER, knitr, plm, prais, rmarkdown, stargazer, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    ## xaringan      "rstudioapi, testit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## xfun          "testit, parallel, rstudioapi, tinytex, mime, markdown, knitr,\nhtmltools, base64enc, remotes, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## xlsx          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## xlsxjars      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## xml2          "covr, curl, httr, knitr, magrittr, mockery, rmarkdown,\ntestthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## xtable        "knitr, plm, zoo, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## yaml          "RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ## zeallot       "testthat, knitr, rmarkdown, purrr, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## zip           "covr, processx, R6, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    ## ztable        "MASS, survival, testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## base          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## boot          "MASS, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## class         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## cluster       "MASS, Matrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    ## codetools     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## compiler      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## datasets      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## foreign       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## graphics      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## grDevices     "KernSmooth"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## grid          "lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## KernSmooth    "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## lattice       "KernSmooth, MASS, latticeExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## MASS          "lattice, nlme, nnet, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    ## Matrix        "expm, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## methods       "codetools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ## mgcv          "parallel, survival, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## nlme          "Hmisc, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    ## nnet          "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## parallel      "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    ## rpart         "survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## spatial       "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    ## splines       "Matrix, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## stats         "MASS, Matrix, SuppDists, methods, stats4"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    ## stats4        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## survival      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## tcltk         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## tools         "codetools, methods, xml2, curl, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ## translations  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    ## utils         "methods, xml2, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    ##               Enhances                                                                                                                                                                                                                                                         
    ## abind         NA                                                                                                                                                                                                                                                               
    ## askpass       NA                                                                                                                                                                                                                                                               
    ## assertthat    NA                                                                                                                                                                                                                                                               
    ## backports     NA                                                                                                                                                                                                                                                               
    ## base64enc     "png"                                                                                                                                                                                                                                                            
    ## BH            NA                                                                                                                                                                                                                                                               
    ## bitops        NA                                                                                                                                                                                                                                                               
    ## bookdown      NA                                                                                                                                                                                                                                                               
    ## broom         NA                                                                                                                                                                                                                                                               
    ## callr         NA                                                                                                                                                                                                                                                               
    ## car           NA                                                                                                                                                                                                                                                               
    ## carData       NA                                                                                                                                                                                                                                                               
    ## caret         NA                                                                                                                                                                                                                                                               
    ## caTools       NA                                                                                                                                                                                                                                                               
    ## cellranger    NA                                                                                                                                                                                                                                                               
    ## cli           NA                                                                                                                                                                                                                                                               
    ## clipr         NA                                                                                                                                                                                                                                                               
    ## colorspace    NA                                                                                                                                                                                                                                                               
    ## corrplot      NA                                                                                                                                                                                                                                                               
    ## cowplot       NA                                                                                                                                                                                                                                                               
    ## cranlogs      NA                                                                                                                                                                                                                                                               
    ## crayon        NA                                                                                                                                                                                                                                                               
    ## curl          NA                                                                                                                                                                                                                                                               
    ## data.table    NA                                                                                                                                                                                                                                                               
    ## DataExplorer  NA                                                                                                                                                                                                                                                               
    ## DBI           NA                                                                                                                                                                                                                                                               
    ## dbplyr        NA                                                                                                                                                                                                                                                               
    ## dendextend    "ggdendro, dendroextras, Hmisc, data.table, rpart"                                                                                                                                                                                                               
    ## digest        NA                                                                                                                                                                                                                                                               
    ## dplyr         NA                                                                                                                                                                                                                                                               
    ## ellipse       NA                                                                                                                                                                                                                                                               
    ## ellipsis      NA                                                                                                                                                                                                                                                               
    ## evaluate      NA                                                                                                                                                                                                                                                               
    ## extrafont     NA                                                                                                                                                                                                                                                               
    ## extrafontdb   NA                                                                                                                                                                                                                                                               
    ## factoextra    NA                                                                                                                                                                                                                                                               
    ## FactoMineR    NA                                                                                                                                                                                                                                                               
    ## fansi         NA                                                                                                                                                                                                                                                               
    ## farver        NA                                                                                                                                                                                                                                                               
    ## flashClust    NA                                                                                                                                                                                                                                                               
    ## flextable     NA                                                                                                                                                                                                                                                               
    ## forcats       NA                                                                                                                                                                                                                                                               
    ## foreach       "compiler, doMC, RUnit, doParallel"                                                                                                                                                                                                                              
    ## fs            NA                                                                                                                                                                                                                                                               
    ## gapminder     NA                                                                                                                                                                                                                                                               
    ## gdtools       NA                                                                                                                                                                                                                                                               
    ## generics      NA                                                                                                                                                                                                                                                               
    ## GGally        NA                                                                                                                                                                                                                                                               
    ## gganimate     NA                                                                                                                                                                                                                                                               
    ## ggforce       NA                                                                                                                                                                                                                                                               
    ## ggiraph       NA                                                                                                                                                                                                                                                               
    ## ggiraphExtra  NA                                                                                                                                                                                                                                                               
    ## ggplot2       "sp"                                                                                                                                                                                                                                                             
    ## ggpubr        NA                                                                                                                                                                                                                                                               
    ## ggrepel       NA                                                                                                                                                                                                                                                               
    ## ggsci         NA                                                                                                                                                                                                                                                               
    ## ggsignif      NA                                                                                                                                                                                                                                                               
    ## ggthemes      NA                                                                                                                                                                                                                                                               
    ## gifski        NA                                                                                                                                                                                                                                                               
    ## glue          NA                                                                                                                                                                                                                                                               
    ## gower         NA                                                                                                                                                                                                                                                               
    ## gridExtra     NA                                                                                                                                                                                                                                                               
    ## gtable        NA                                                                                                                                                                                                                                                               
    ## haven         NA                                                                                                                                                                                                                                                               
    ## highr         NA                                                                                                                                                                                                                                                               
    ## hms           NA                                                                                                                                                                                                                                                               
    ## hrbrthemes    NA                                                                                                                                                                                                                                                               
    ## htmltools     "knitr"                                                                                                                                                                                                                                                          
    ## htmlwidgets   "shiny (>= 1.1)"                                                                                                                                                                                                                                                 
    ## httpuv        NA                                                                                                                                                                                                                                                               
    ## httr          NA                                                                                                                                                                                                                                                               
    ## igraph        NA                                                                                                                                                                                                                                                               
    ## insight       NA                                                                                                                                                                                                                                                               
    ## ipred         NA                                                                                                                                                                                                                                                               
    ## iterators     NA                                                                                                                                                                                                                                                               
    ## jomo          NA                                                                                                                                                                                                                                                               
    ## jsonlite      NA                                                                                                                                                                                                                                                               
    ## knitr         NA                                                                                                                                                                                                                                                               
    ## labeling      NA                                                                                                                                                                                                                                                               
    ## later         NA                                                                                                                                                                                                                                                               
    ## lava          NA                                                                                                                                                                                                                                                               
    ## lazyeval      NA                                                                                                                                                                                                                                                               
    ## leaps         NA                                                                                                                                                                                                                                                               
    ## lme4          NA                                                                                                                                                                                                                                                               
    ## lubridate     "chron, fts, timeSeries, timeDate, tis, tseries, xts, zoo"                                                                                                                                                                                                       
    ## magrittr      NA                                                                                                                                                                                                                                                               
    ## maptools      "gpclib, RArcInfo"                                                                                                                                                                                                                                               
    ## markdown      NA                                                                                                                                                                                                                                                               
    ## MatrixModels  NA                                                                                                                                                                                                                                                               
    ## mclust        NA                                                                                                                                                                                                                                                               
    ## mice          NA                                                                                                                                                                                                                                                               
    ## mime          NA                                                                                                                                                                                                                                                               
    ## minqa         NA                                                                                                                                                                                                                                                               
    ## mitml         NA                                                                                                                                                                                                                                                               
    ## ModelMetrics  NA                                                                                                                                                                                                                                                               
    ## modelr        NA                                                                                                                                                                                                                                                               
    ## moonBook      NA                                                                                                                                                                                                                                                               
    ## munsell       NA                                                                                                                                                                                                                                                               
    ## mycor         NA                                                                                                                                                                                                                                                               
    ## naniar        NA                                                                                                                                                                                                                                                               
    ## networkD3     "knitr, shiny"                                                                                                                                                                                                                                                   
    ## nloptr        NA                                                                                                                                                                                                                                                               
    ## nortest       NA                                                                                                                                                                                                                                                               
    ## numDeriv      NA                                                                                                                                                                                                                                                               
    ## officer       NA                                                                                                                                                                                                                                                               
    ## openssl       NA                                                                                                                                                                                                                                                               
    ## openxlsx      NA                                                                                                                                                                                                                                                               
    ## ordinal       NA                                                                                                                                                                                                                                                               
    ## pacman        NA                                                                                                                                                                                                                                                               
    ## pan           NA                                                                                                                                                                                                                                                               
    ## pander        NA                                                                                                                                                                                                                                                               
    ## pbkrtest      NA                                                                                                                                                                                                                                                               
    ## pdp           NA                                                                                                                                                                                                                                                               
    ## pillar        NA                                                                                                                                                                                                                                                               
    ## pkgconfig     NA                                                                                                                                                                                                                                                               
    ## plogr         NA                                                                                                                                                                                                                                                               
    ## plyr          NA                                                                                                                                                                                                                                                               
    ## png           NA                                                                                                                                                                                                                                                               
    ## polyclip      NA                                                                                                                                                                                                                                                               
    ## polynom       NA                                                                                                                                                                                                                                                               
    ## ppcor         NA                                                                                                                                                                                                                                                               
    ## prettyunits   NA                                                                                                                                                                                                                                                               
    ## processx      NA                                                                                                                                                                                                                                                               
    ## prodlim       NA                                                                                                                                                                                                                                                               
    ## progress      NA                                                                                                                                                                                                                                                               
    ## promises      NA                                                                                                                                                                                                                                                               
    ## ps            NA                                                                                                                                                                                                                                                               
    ## purrr         NA                                                                                                                                                                                                                                                               
    ## quantreg      NA                                                                                                                                                                                                                                                               
    ## R6            NA                                                                                                                                                                                                                                                               
    ## RColorBrewer  NA                                                                                                                                                                                                                                                               
    ## Rcpp          NA                                                                                                                                                                                                                                                               
    ## RcppEigen     NA                                                                                                                                                                                                                                                               
    ## readr         NA                                                                                                                                                                                                                                                               
    ## readstata13   NA                                                                                                                                                                                                                                                               
    ## readxl        NA                                                                                                                                                                                                                                                               
    ## recipes       NA                                                                                                                                                                                                                                                               
    ## rematch       NA                                                                                                                                                                                                                                                               
    ## remotes       NA                                                                                                                                                                                                                                                               
    ## reprex        NA                                                                                                                                                                                                                                                               
    ## reshape       NA                                                                                                                                                                                                                                                               
    ## reshape2      NA                                                                                                                                                                                                                                                               
    ## rio           NA                                                                                                                                                                                                                                                               
    ## rJava         NA                                                                                                                                                                                                                                                               
    ## rlang         NA                                                                                                                                                                                                                                                               
    ## rmarkdown     NA                                                                                                                                                                                                                                                               
    ## rprojroot     NA                                                                                                                                                                                                                                                               
    ## rstudioapi    NA                                                                                                                                                                                                                                                               
    ## Rttf2pt1      NA                                                                                                                                                                                                                                                               
    ## rvest         NA                                                                                                                                                                                                                                                               
    ## scales        NA                                                                                                                                                                                                                                                               
    ## scatterplot3d NA                                                                                                                                                                                                                                                               
    ## selectr       NA                                                                                                                                                                                                                                                               
    ## servr         NA                                                                                                                                                                                                                                                               
    ## sjlabelled    NA                                                                                                                                                                                                                                                               
    ## sjmisc        NA                                                                                                                                                                                                                                                               
    ## skimr         NA                                                                                                                                                                                                                                                               
    ## snakecase     NA                                                                                                                                                                                                                                                               
    ## sp            NA                                                                                                                                                                                                                                                               
    ## SparseM       NA                                                                                                                                                                                                                                                               
    ## SQUAREM       NA                                                                                                                                                                                                                                                               
    ## stargazer     "AER, betareg, brglm, censReg, dynlm, eha, erer, ergm, fGarch,\ngee, glmx, gmm, lfe, lme4, lmtest, MASS, mclogit, mgcv, mlogit,\nmnlogit, nlme, nnet, ordinal, plm, pscl, quantreg, rms,\nrelevent, robustbase, sampleSelection, spdep, survey, survival,\nZelig"
    ## stringi       NA                                                                                                                                                                                                                                                               
    ## stringr       NA                                                                                                                                                                                                                                                               
    ## sys           NA                                                                                                                                                                                                                                                               
    ## tibble        NA                                                                                                                                                                                                                                                               
    ## tidyr         NA                                                                                                                                                                                                                                                               
    ## tidyselect    NA                                                                                                                                                                                                                                                               
    ## tidyverse     NA                                                                                                                                                                                                                                                               
    ## timeDate      NA                                                                                                                                                                                                                                                               
    ## tinytex       NA                                                                                                                                                                                                                                                               
    ## tweenr        NA                                                                                                                                                                                                                                                               
    ## ucminf        NA                                                                                                                                                                                                                                                               
    ## UpSetR        NA                                                                                                                                                                                                                                                               
    ## utf8          NA                                                                                                                                                                                                                                                               
    ## uuid          NA                                                                                                                                                                                                                                                               
    ## vctrs         NA                                                                                                                                                                                                                                                               
    ## viridis       NA                                                                                                                                                                                                                                                               
    ## viridisLite   NA                                                                                                                                                                                                                                                               
    ## visdat        NA                                                                                                                                                                                                                                                               
    ## webshot       NA                                                                                                                                                                                                                                                               
    ## whisker       NA                                                                                                                                                                                                                                                               
    ## withr         NA                                                                                                                                                                                                                                                               
    ## wooldridge    NA                                                                                                                                                                                                                                                               
    ## xaringan      NA                                                                                                                                                                                                                                                               
    ## xfun          NA                                                                                                                                                                                                                                                               
    ## xlsx          NA                                                                                                                                                                                                                                                               
    ## xlsxjars      NA                                                                                                                                                                                                                                                               
    ## xml2          NA                                                                                                                                                                                                                                                               
    ## xtable        NA                                                                                                                                                                                                                                                               
    ## yaml          NA                                                                                                                                                                                                                                                               
    ## zeallot       NA                                                                                                                                                                                                                                                               
    ## zip           NA                                                                                                                                                                                                                                                               
    ## ztable        NA                                                                                                                                                                                                                                                               
    ## base          NA                                                                                                                                                                                                                                                               
    ## boot          NA                                                                                                                                                                                                                                                               
    ## class         NA                                                                                                                                                                                                                                                               
    ## cluster       NA                                                                                                                                                                                                                                                               
    ## codetools     NA                                                                                                                                                                                                                                                               
    ## compiler      NA                                                                                                                                                                                                                                                               
    ## datasets      NA                                                                                                                                                                                                                                                               
    ## foreign       NA                                                                                                                                                                                                                                                               
    ## graphics      NA                                                                                                                                                                                                                                                               
    ## grDevices     NA                                                                                                                                                                                                                                                               
    ## grid          NA                                                                                                                                                                                                                                                               
    ## KernSmooth    NA                                                                                                                                                                                                                                                               
    ## lattice       "chron"                                                                                                                                                                                                                                                          
    ## MASS          NA                                                                                                                                                                                                                                                               
    ## Matrix        "MatrixModels, graph, SparseM, sfsmisc"                                                                                                                                                                                                                          
    ## methods       NA                                                                                                                                                                                                                                                               
    ## mgcv          NA                                                                                                                                                                                                                                                               
    ## nlme          NA                                                                                                                                                                                                                                                               
    ## nnet          NA                                                                                                                                                                                                                                                               
    ## parallel      "snow, nws, Rmpi"                                                                                                                                                                                                                                                
    ## rpart         NA                                                                                                                                                                                                                                                               
    ## spatial       NA                                                                                                                                                                                                                                                               
    ## splines       NA                                                                                                                                                                                                                                                               
    ## stats         NA                                                                                                                                                                                                                                                               
    ## stats4        NA                                                                                                                                                                                                                                                               
    ## survival      NA                                                                                                                                                                                                                                                               
    ## tcltk         NA                                                                                                                                                                                                                                                               
    ## tools         NA                                                                                                                                                                                                                                                               
    ## translations  NA                                                                                                                                                                                                                                                               
    ## utils         NA                                                                                                                                                                                                                                                               
    ##               License                                  License_is_FOSS
    ## abind         "LGPL (>= 2)"                            NA             
    ## askpass       "MIT + file LICENSE"                     NA             
    ## assertthat    "GPL-3"                                  NA             
    ## backports     "GPL-2"                                  NA             
    ## base64enc     "GPL-2 | GPL-3"                          NA             
    ## BH            "BSL-1.0"                                NA             
    ## bitops        "GPL (>= 2)"                             NA             
    ## bookdown      "GPL-3"                                  NA             
    ## broom         "MIT + file LICENSE"                     NA             
    ## callr         "MIT + file LICENSE"                     NA             
    ## car           "GPL (>= 2)"                             NA             
    ## carData       "GPL (>= 2)"                             NA             
    ## caret         "GPL (>= 2)"                             NA             
    ## caTools       "GPL-3"                                  NA             
    ## cellranger    "MIT + file LICENSE"                     NA             
    ## cli           "MIT + file LICENSE"                     NA             
    ## clipr         "GPL-3"                                  NA             
    ## colorspace    "BSD_3_clause + file LICENSE"            NA             
    ## corrplot      "GPL"                                    NA             
    ## cowplot       "GPL-2"                                  NA             
    ## cranlogs      "MIT + file LICENSE"                     NA             
    ## crayon        "MIT + file LICENSE"                     NA             
    ## curl          "MIT + file LICENSE"                     NA             
    ## data.table    "MPL-2.0 | file LICENSE"                 NA             
    ## DataExplorer  "MIT + file LICENSE"                     NA             
    ## DBI           "LGPL (>= 2)"                            NA             
    ## dbplyr        "MIT + file LICENSE"                     NA             
    ## dendextend    "GPL-2 | GPL-3"                          NA             
    ## digest        "GPL (>= 2)"                             NA             
    ## dplyr         "MIT + file LICENSE"                     NA             
    ## ellipse       "GPL (>= 2)"                             NA             
    ## ellipsis      "GPL-3"                                  NA             
    ## evaluate      "MIT + file LICENSE"                     NA             
    ## extrafont     "GPL-2"                                  NA             
    ## extrafontdb   "GPL-2"                                  NA             
    ## factoextra    "GPL-2"                                  NA             
    ## FactoMineR    "GPL (>= 2)"                             NA             
    ## fansi         "GPL (>= 2)"                             NA             
    ## farver        "MIT + file LICENSE"                     NA             
    ## flashClust    "GPL (>= 2)"                             NA             
    ## flextable     "GPL-3"                                  NA             
    ## forcats       "GPL-3"                                  NA             
    ## foreach       "Apache License (== 2.0)"                NA             
    ## fs            "GPL-3"                                  NA             
    ## gapminder     "CC0"                                    NA             
    ## gdtools       "GPL-3 | file LICENSE"                   NA             
    ## generics      "GPL-2"                                  NA             
    ## GGally        "GPL (>= 2.0)"                           NA             
    ## gganimate     "MIT + file LICENSE"                     NA             
    ## ggforce       "MIT + file LICENSE"                     NA             
    ## ggiraph       "GPL-3"                                  NA             
    ## ggiraphExtra  "GPL-3"                                  NA             
    ## ggplot2       "GPL-2 | file LICENSE"                   NA             
    ## ggpubr        "GPL-2"                                  NA             
    ## ggrepel       "GPL-3 | file LICENSE"                   NA             
    ## ggsci         "GPL-3 | file LICENSE"                   NA             
    ## ggsignif      "GPL-3"                                  NA             
    ## ggthemes      "GPL-2"                                  NA             
    ## gifski        "MIT + file LICENSE"                     NA             
    ## glue          "MIT + file LICENSE"                     NA             
    ## gower         "GPL-3"                                  NA             
    ## gridExtra     "GPL (>= 2)"                             NA             
    ## gtable        "GPL-2"                                  NA             
    ## haven         "MIT + file LICENSE"                     NA             
    ## highr         "GPL"                                    NA             
    ## hms           "GPL-3"                                  NA             
    ## hrbrthemes    "MIT + file LICENSE"                     NA             
    ## htmltools     "GPL (>= 2)"                             NA             
    ## htmlwidgets   "MIT + file LICENSE"                     NA             
    ## httpuv        "GPL (>= 2) | file LICENSE"              NA             
    ## httr          "MIT + file LICENSE"                     NA             
    ## igraph        "GPL (>= 2)"                             NA             
    ## insight       "GPL-3"                                  NA             
    ## ipred         "GPL (>= 2)"                             NA             
    ## iterators     "Apache License (== 2.0)"                NA             
    ## jomo          "GPL-2"                                  NA             
    ## jsonlite      "MIT + file LICENSE"                     NA             
    ## knitr         "GPL"                                    NA             
    ## labeling      "MIT + file LICENSE | Unlimited"         NA             
    ## later         "GPL (>= 2)"                             NA             
    ## lava          "GPL-3"                                  NA             
    ## lazyeval      "GPL-3"                                  NA             
    ## leaps         "GPL (>= 2)"                             NA             
    ## lme4          "GPL (>= 2)"                             NA             
    ## lubridate     "GPL (>= 2)"                             NA             
    ## magrittr      "MIT + file LICENSE"                     NA             
    ## maptools      "GPL (>= 2)"                             NA             
    ## markdown      "GPL-2"                                  NA             
    ## MatrixModels  "GPL (>= 2)"                             NA             
    ## mclust        "GPL (>= 2)"                             NA             
    ## mice          "GPL-2 | GPL-3"                          NA             
    ## mime          "GPL"                                    NA             
    ## minqa         "GPL-2"                                  NA             
    ## mitml         "GPL (>= 2)"                             NA             
    ## ModelMetrics  "GPL (>= 2)"                             NA             
    ## modelr        "GPL-3"                                  NA             
    ## moonBook      "GPL-2"                                  NA             
    ## munsell       "MIT + file LICENSE"                     NA             
    ## mycor         "CC0"                                    NA             
    ## naniar        "MIT + file LICENSE"                     NA             
    ## networkD3     "GPL (>= 3)"                             NA             
    ## nloptr        "LGPL-3"                                 NA             
    ## nortest       "GPL (>= 2)"                             NA             
    ## numDeriv      "GPL-2"                                  NA             
    ## officer       "GPL-3"                                  NA             
    ## openssl       "MIT + file LICENSE"                     NA             
    ## openxlsx      "MIT + file LICENSE"                     NA             
    ## ordinal       "GPL (>= 2)"                             NA             
    ## pacman        "GPL-2"                                  NA             
    ## pan           "GPL-3"                                  NA             
    ## pander        "AGPL-3 | file LICENSE"                  NA             
    ## pbkrtest      "GPL (>= 2)"                             NA             
    ## pdp           "GPL (>= 2)"                             NA             
    ## pillar        "GPL-3"                                  NA             
    ## pkgconfig     "MIT + file LICENSE"                     NA             
    ## plogr         "MIT + file LICENSE"                     NA             
    ## plyr          "MIT + file LICENSE"                     NA             
    ## png           "GPL-2 | GPL-3"                          NA             
    ## polyclip      "BSL"                                    NA             
    ## polynom       "GPL-2"                                  NA             
    ## ppcor         "GPL-2"                                  NA             
    ## prettyunits   "MIT + file LICENSE"                     NA             
    ## processx      "MIT + file LICENSE"                     NA             
    ## prodlim       "GPL (>= 2)"                             NA             
    ## progress      "MIT + file LICENSE"                     NA             
    ## promises      "MIT + file LICENSE"                     NA             
    ## ps            "BSD_3_clause + file LICENSE"            NA             
    ## purrr         "GPL-3 | file LICENSE"                   NA             
    ## quantreg      "GPL (>= 2)"                             NA             
    ## R6            "MIT + file LICENSE"                     NA             
    ## RColorBrewer  "Apache License 2.0"                     NA             
    ## Rcpp          "GPL (>= 2)"                             NA             
    ## RcppEigen     "GPL (>= 2) | file LICENSE"              NA             
    ## readr         "GPL (>= 2) | file LICENSE"              NA             
    ## readstata13   "GPL-2 | file LICENSE"                   NA             
    ## readxl        "GPL-3"                                  NA             
    ## recipes       "GPL-2"                                  NA             
    ## rematch       "MIT + file LICENSE"                     NA             
    ## remotes       "GPL (>= 2)"                             NA             
    ## reprex        "MIT + file LICENSE"                     NA             
    ## reshape       "MIT + file LICENSE"                     NA             
    ## reshape2      "MIT + file LICENSE"                     NA             
    ## rio           "GPL-2"                                  NA             
    ## rJava         "GPL-2"                                  NA             
    ## rlang         "GPL-3"                                  NA             
    ## rmarkdown     "GPL-3"                                  NA             
    ## rprojroot     "GPL-3"                                  NA             
    ## rstudioapi    "MIT + file LICENSE"                     NA             
    ## Rttf2pt1      "file LICENSE"                           "yes"          
    ## rvest         "GPL-3"                                  NA             
    ## scales        "MIT + file LICENSE"                     NA             
    ## scatterplot3d "GPL-2"                                  NA             
    ## selectr       "BSD_3_clause + file LICENCE"            NA             
    ## servr         "GPL"                                    NA             
    ## sjlabelled    "GPL-3"                                  NA             
    ## sjmisc        "GPL-3"                                  NA             
    ## skimr         "GPL-3"                                  NA             
    ## snakecase     "GPL-3"                                  NA             
    ## sp            "GPL (>= 2)"                             NA             
    ## SparseM       "GPL (>= 2)"                             NA             
    ## SQUAREM       "GPL (>= 2)"                             NA             
    ## stargazer     "GPL (>= 2)"                             NA             
    ## stringi       "file LICENSE"                           "yes"          
    ## stringr       "GPL-2 | file LICENSE"                   NA             
    ## sys           "MIT + file LICENSE"                     NA             
    ## tibble        "MIT + file LICENSE"                     NA             
    ## tidyr         "MIT + file LICENSE"                     NA             
    ## tidyselect    "GPL-3"                                  NA             
    ## tidyverse     "GPL-3 | file LICENSE"                   NA             
    ## timeDate      "GPL (>= 2)"                             NA             
    ## tinytex       "MIT + file LICENSE"                     NA             
    ## tweenr        "MIT + file LICENSE"                     NA             
    ## ucminf        "GPL (>= 2)"                             NA             
    ## UpSetR        "MIT + file LICENSE"                     NA             
    ## utf8          "Apache License (== 2.0) | file LICENSE" NA             
    ## uuid          "MIT + file LICENSE"                     NA             
    ## vctrs         "GPL-3"                                  NA             
    ## viridis       "MIT + file LICENSE"                     NA             
    ## viridisLite   "MIT + file LICENSE"                     NA             
    ## visdat        "MIT + file LICENSE"                     NA             
    ## webshot       "GPL-2"                                  NA             
    ## whisker       "GPL-3"                                  NA             
    ## withr         "GPL (>= 2)"                             NA             
    ## wooldridge    "GPL-3"                                  NA             
    ## xaringan      "MIT + file LICENSE"                     NA             
    ## xfun          "MIT + file LICENSE"                     NA             
    ## xlsx          "GPL-3"                                  NA             
    ## xlsxjars      "GPL-3"                                  NA             
    ## xml2          "GPL (>= 2)"                             NA             
    ## xtable        "GPL (>= 2)"                             NA             
    ## yaml          "BSD_3_clause + file LICENSE"            NA             
    ## zeallot       "MIT + file LICENSE"                     NA             
    ## zip           "CC0"                                    NA             
    ## ztable        "GPL-2"                                  NA             
    ## base          "Part of R 3.6.0"                        NA             
    ## boot          "Unlimited"                              NA             
    ## class         "GPL-2 | GPL-3"                          NA             
    ## cluster       "GPL (>= 2)"                             NA             
    ## codetools     "GPL"                                    NA             
    ## compiler      "Part of R 3.6.0"                        NA             
    ## datasets      "Part of R 3.6.0"                        NA             
    ## foreign       "GPL (>= 2)"                             NA             
    ## graphics      "Part of R 3.6.0"                        NA             
    ## grDevices     "Part of R 3.6.0"                        NA             
    ## grid          "Part of R 3.6.0"                        NA             
    ## KernSmooth    "Unlimited"                              NA             
    ## lattice       "GPL (>= 2)"                             NA             
    ## MASS          "GPL-2 | GPL-3"                          NA             
    ## Matrix        "GPL (>= 2) | file LICENCE"              NA             
    ## methods       "Part of R 3.6.0"                        NA             
    ## mgcv          "GPL (>= 2)"                             NA             
    ## nlme          "GPL (>= 2) | file LICENCE"              NA             
    ## nnet          "GPL-2 | GPL-3"                          NA             
    ## parallel      "Part of R 3.6.0"                        NA             
    ## rpart         "GPL-2 | GPL-3"                          NA             
    ## spatial       "GPL-2 | GPL-3"                          NA             
    ## splines       "Part of R 3.6.0"                        NA             
    ## stats         "Part of R 3.6.0"                        NA             
    ## stats4        "Part of R 3.6.0"                        NA             
    ## survival      "LGPL (>= 2)"                            NA             
    ## tcltk         "Part of R 3.6.0"                        NA             
    ## tools         "Part of R 3.6.0"                        NA             
    ## translations  "Part of R 3.6.0"                        NA             
    ## utils         "Part of R 3.6.0"                        NA             
    ##               License_restricts_use OS_type MD5sum NeedsCompilation
    ## abind         NA                    NA      NA     "no"            
    ## askpass       NA                    NA      NA     "yes"           
    ## assertthat    NA                    NA      NA     "no"            
    ## backports     NA                    NA      NA     "yes"           
    ## base64enc     NA                    NA      NA     "yes"           
    ## BH            NA                    NA      NA     "no"            
    ## bitops        NA                    NA      NA     "yes"           
    ## bookdown      NA                    NA      NA     "no"            
    ## broom         NA                    NA      NA     "no"            
    ## callr         NA                    NA      NA     "no"            
    ## car           NA                    NA      NA     "no"            
    ## carData       NA                    NA      NA     "no"            
    ## caret         NA                    NA      NA     "yes"           
    ## caTools       NA                    NA      NA     "yes"           
    ## cellranger    NA                    NA      NA     "no"            
    ## cli           NA                    NA      NA     "no"            
    ## clipr         NA                    NA      NA     "no"            
    ## colorspace    NA                    NA      NA     "yes"           
    ## corrplot      NA                    NA      NA     "no"            
    ## cowplot       NA                    NA      NA     "no"            
    ## cranlogs      NA                    NA      NA     "no"            
    ## crayon        NA                    NA      NA     "no"            
    ## curl          NA                    NA      NA     "yes"           
    ## data.table    NA                    NA      NA     "yes"           
    ## DataExplorer  NA                    NA      NA     "no"            
    ## DBI           NA                    NA      NA     "no"            
    ## dbplyr        NA                    NA      NA     "no"            
    ## dendextend    NA                    NA      NA     "no"            
    ## digest        NA                    NA      NA     "yes"           
    ## dplyr         NA                    NA      NA     "yes"           
    ## ellipse       NA                    NA      NA     "no"            
    ## ellipsis      NA                    NA      NA     "yes"           
    ## evaluate      NA                    NA      NA     "no"            
    ## extrafont     NA                    NA      NA     "no"            
    ## extrafontdb   NA                    NA      NA     NA              
    ## factoextra    NA                    NA      NA     "no"            
    ## FactoMineR    NA                    NA      NA     "no"            
    ## fansi         NA                    NA      NA     "yes"           
    ## farver        NA                    NA      NA     "yes"           
    ## flashClust    NA                    NA      NA     NA              
    ## flextable     NA                    NA      NA     "no"            
    ## forcats       NA                    NA      NA     "no"            
    ## foreach       NA                    NA      NA     "no"            
    ## fs            NA                    NA      NA     "yes"           
    ## gapminder     NA                    NA      NA     "no"            
    ## gdtools       NA                    NA      NA     "yes"           
    ## generics      NA                    NA      NA     "no"            
    ## GGally        NA                    NA      NA     "no"            
    ## gganimate     NA                    NA      NA     "no"            
    ## ggforce       NA                    NA      NA     "yes"           
    ## ggiraph       NA                    NA      NA     "yes"           
    ## ggiraphExtra  NA                    NA      NA     "no"            
    ## ggplot2       NA                    NA      NA     "no"            
    ## ggpubr        NA                    NA      NA     "no"            
    ## ggrepel       NA                    NA      NA     "yes"           
    ## ggsci         NA                    NA      NA     "no"            
    ## ggsignif      NA                    NA      NA     "no"            
    ## ggthemes      NA                    NA      NA     "no"            
    ## gifski        NA                    NA      NA     "yes"           
    ## glue          NA                    NA      NA     "yes"           
    ## gower         NA                    NA      NA     "yes"           
    ## gridExtra     NA                    NA      NA     "no"            
    ## gtable        NA                    NA      NA     "no"            
    ## haven         NA                    NA      NA     "yes"           
    ## highr         NA                    NA      NA     "no"            
    ## hms           NA                    NA      NA     "no"            
    ## hrbrthemes    NA                    NA      NA     "no"            
    ## htmltools     NA                    NA      NA     "yes"           
    ## htmlwidgets   NA                    NA      NA     "no"            
    ## httpuv        NA                    NA      NA     "yes"           
    ## httr          NA                    NA      NA     "no"            
    ## igraph        NA                    NA      NA     "yes"           
    ## insight       NA                    NA      NA     "no"            
    ## ipred         NA                    NA      NA     "yes"           
    ## iterators     NA                    NA      NA     "no"            
    ## jomo          NA                    NA      NA     "yes"           
    ## jsonlite      NA                    NA      NA     "yes"           
    ## knitr         NA                    NA      NA     "no"            
    ## labeling      NA                    NA      NA     "no"            
    ## later         NA                    NA      NA     "yes"           
    ## lava          NA                    NA      NA     "no"            
    ## lazyeval      NA                    NA      NA     "yes"           
    ## leaps         NA                    NA      NA     "yes"           
    ## lme4          NA                    NA      NA     "yes"           
    ## lubridate     NA                    NA      NA     "yes"           
    ## magrittr      NA                    NA      NA     "no"            
    ## maptools      NA                    NA      NA     "yes"           
    ## markdown      NA                    NA      NA     "yes"           
    ## MatrixModels  NA                    NA      NA     "no"            
    ## mclust        NA                    NA      NA     "yes"           
    ## mice          NA                    NA      NA     "yes"           
    ## mime          NA                    NA      NA     "yes"           
    ## minqa         NA                    NA      NA     "yes"           
    ## mitml         NA                    NA      NA     "no"            
    ## ModelMetrics  NA                    NA      NA     "yes"           
    ## modelr        NA                    NA      NA     "no"            
    ## moonBook      NA                    NA      NA     "no"            
    ## munsell       NA                    NA      NA     "no"            
    ## mycor         NA                    NA      NA     "no"            
    ## naniar        NA                    NA      NA     "no"            
    ## networkD3     NA                    NA      NA     "no"            
    ## nloptr        NA                    NA      NA     "yes"           
    ## nortest       NA                    NA      NA     "no"            
    ## numDeriv      NA                    NA      NA     "no"            
    ## officer       NA                    NA      NA     "yes"           
    ## openssl       NA                    NA      NA     "yes"           
    ## openxlsx      NA                    NA      NA     "yes"           
    ## ordinal       NA                    NA      NA     "yes"           
    ## pacman        NA                    NA      NA     "no"            
    ## pan           "no"                  NA      NA     "yes"           
    ## pander        NA                    NA      NA     "yes"           
    ## pbkrtest      NA                    NA      NA     "no"            
    ## pdp           NA                    NA      NA     "yes"           
    ## pillar        NA                    NA      NA     "no"            
    ## pkgconfig     NA                    NA      NA     "no"            
    ## plogr         NA                    NA      NA     "no"            
    ## plyr          NA                    NA      NA     "yes"           
    ## png           NA                    NA      NA     "yes"           
    ## polyclip      NA                    NA      NA     "yes"           
    ## polynom       NA                    NA      NA     "no"            
    ## ppcor         NA                    NA      NA     "no"            
    ## prettyunits   NA                    NA      NA     "no"            
    ## processx      NA                    NA      NA     "yes"           
    ## prodlim       NA                    NA      NA     "yes"           
    ## progress      NA                    NA      NA     "no"            
    ## promises      NA                    NA      NA     "yes"           
    ## ps            NA                    NA      NA     "yes"           
    ## purrr         NA                    NA      NA     "yes"           
    ## quantreg      NA                    NA      NA     "yes"           
    ## R6            NA                    NA      NA     "no"            
    ## RColorBrewer  NA                    NA      NA     "no"            
    ## Rcpp          NA                    NA      NA     "yes"           
    ## RcppEigen     NA                    NA      NA     "yes"           
    ## readr         NA                    NA      NA     "yes"           
    ## readstata13   NA                    NA      NA     "yes"           
    ## readxl        NA                    NA      NA     "yes"           
    ## recipes       NA                    NA      NA     "no"            
    ## rematch       NA                    NA      NA     "no"            
    ## remotes       NA                    NA      NA     "no"            
    ## reprex        NA                    NA      NA     "no"            
    ## reshape       NA                    NA      NA     "yes"           
    ## reshape2      NA                    NA      NA     "yes"           
    ## rio           NA                    NA      NA     "no"            
    ## rJava         NA                    NA      NA     "yes"           
    ## rlang         NA                    NA      NA     "yes"           
    ## rmarkdown     NA                    NA      NA     "no"            
    ## rprojroot     NA                    NA      NA     "no"            
    ## rstudioapi    NA                    NA      NA     "no"            
    ## Rttf2pt1      NA                    NA      NA     "yes"           
    ## rvest         NA                    NA      NA     "no"            
    ## scales        NA                    NA      NA     "yes"           
    ## scatterplot3d NA                    NA      NA     "no"            
    ## selectr       NA                    NA      NA     "no"            
    ## servr         NA                    NA      NA     "no"            
    ## sjlabelled    NA                    NA      NA     "no"            
    ## sjmisc        NA                    NA      NA     "no"            
    ## skimr         NA                    NA      NA     "no"            
    ## snakecase     NA                    NA      NA     "no"            
    ## sp            NA                    NA      NA     "yes"           
    ## SparseM       NA                    NA      NA     "yes"           
    ## SQUAREM       NA                    NA      NA     "no"            
    ## stargazer     NA                    NA      NA     "no"            
    ## stringi       NA                    NA      NA     "yes"           
    ## stringr       NA                    NA      NA     "no"            
    ## sys           NA                    NA      NA     "yes"           
    ## tibble        NA                    NA      NA     "yes"           
    ## tidyr         NA                    NA      NA     "yes"           
    ## tidyselect    NA                    NA      NA     "yes"           
    ## tidyverse     NA                    NA      NA     "no"            
    ## timeDate      NA                    NA      NA     "no"            
    ## tinytex       NA                    NA      NA     "no"            
    ## tweenr        NA                    NA      NA     "yes"           
    ## ucminf        NA                    NA      NA     "yes"           
    ## UpSetR        NA                    NA      NA     "no"            
    ## utf8          NA                    NA      NA     "yes"           
    ## uuid          NA                    NA      NA     "yes"           
    ## vctrs         NA                    NA      NA     "yes"           
    ## viridis       NA                    NA      NA     "no"            
    ## viridisLite   NA                    NA      NA     "no"            
    ## visdat        NA                    NA      NA     "no"            
    ## webshot       NA                    NA      NA     "no"            
    ## whisker       NA                    NA      NA     "no"            
    ## withr         NA                    NA      NA     "no"            
    ## wooldridge    NA                    NA      NA     "no"            
    ## xaringan      NA                    NA      NA     "no"            
    ## xfun          NA                    NA      NA     "no"            
    ## xlsx          NA                    NA      NA     "no"            
    ## xlsxjars      NA                    NA      NA     "no"            
    ## xml2          NA                    NA      NA     "yes"           
    ## xtable        NA                    NA      NA     "no"            
    ## yaml          NA                    NA      NA     "yes"           
    ## zeallot       NA                    NA      NA     "no"            
    ## zip           NA                    NA      NA     "yes"           
    ## ztable        NA                    NA      NA     "no"            
    ## base          NA                    NA      NA     NA              
    ## boot          NA                    NA      NA     "no"            
    ## class         NA                    NA      NA     "yes"           
    ## cluster       NA                    NA      NA     "yes"           
    ## codetools     NA                    NA      NA     "no"            
    ## compiler      NA                    NA      NA     NA              
    ## datasets      NA                    NA      NA     NA              
    ## foreign       NA                    NA      NA     "yes"           
    ## graphics      NA                    NA      NA     "yes"           
    ## grDevices     NA                    NA      NA     "yes"           
    ## grid          NA                    NA      NA     "yes"           
    ## KernSmooth    NA                    NA      NA     "yes"           
    ## lattice       NA                    NA      NA     "yes"           
    ## MASS          NA                    NA      NA     "yes"           
    ## Matrix        NA                    NA      NA     "yes"           
    ## methods       NA                    NA      NA     "yes"           
    ## mgcv          NA                    NA      NA     "yes"           
    ## nlme          NA                    NA      NA     "yes"           
    ## nnet          NA                    NA      NA     "yes"           
    ## parallel      NA                    NA      NA     "yes"           
    ## rpart         NA                    NA      NA     "yes"           
    ## spatial       NA                    NA      NA     "yes"           
    ## splines       NA                    NA      NA     "yes"           
    ## stats         NA                    NA      NA     "yes"           
    ## stats4        NA                    NA      NA     NA              
    ## survival      NA                    NA      NA     "yes"           
    ## tcltk         NA                    NA      NA     "yes"           
    ## tools         NA                    NA      NA     "yes"           
    ## translations  NA                    NA      NA     NA              
    ## utils         NA                    NA      NA     "yes"           
    ##               Built  
    ## abind         "3.6.0"
    ## askpass       "3.6.0"
    ## assertthat    "3.6.0"
    ## backports     "3.6.0"
    ## base64enc     "3.6.0"
    ## BH            "3.6.0"
    ## bitops        "3.6.0"
    ## bookdown      "3.6.1"
    ## broom         "3.6.0"
    ## callr         "3.6.1"
    ## car           "3.6.1"
    ## carData       "3.6.0"
    ## caret         "3.6.1"
    ## caTools       "3.6.1"
    ## cellranger    "3.6.0"
    ## cli           "3.6.0"
    ## clipr         "3.6.1"
    ## colorspace    "3.6.0"
    ## corrplot      "3.6.0"
    ## cowplot       "3.6.1"
    ## cranlogs      "3.6.1"
    ## crayon        "3.6.0"
    ## curl          "3.6.1"
    ## data.table    "3.6.0"
    ## DataExplorer  "3.6.0"
    ## DBI           "3.6.0"
    ## dbplyr        "3.6.1"
    ## dendextend    "3.6.0"
    ## digest        "3.6.1"
    ## dplyr         "3.6.1"
    ## ellipse       "3.6.0"
    ## ellipsis      "3.6.1"
    ## evaluate      "3.6.1"
    ## extrafont     "3.6.0"
    ## extrafontdb   "3.6.0"
    ## factoextra    "3.6.0"
    ## FactoMineR    "3.6.1"
    ## fansi         "3.6.0"
    ## farver        "3.6.0"
    ## flashClust    "3.6.0"
    ## flextable     "3.6.1"
    ## forcats       "3.6.0"
    ## foreach       "3.6.1"
    ## fs            "3.6.0"
    ## gapminder     "3.6.0"
    ## gdtools       "3.6.1"
    ## generics      "3.6.0"
    ## GGally        "3.6.0"
    ## gganimate     "3.6.0"
    ## ggforce       "3.6.1"
    ## ggiraph       "3.6.0"
    ## ggiraphExtra  "3.6.0"
    ## ggplot2       "3.6.1"
    ## ggpubr        "3.6.1"
    ## ggrepel       "3.6.0"
    ## ggsci         "3.6.0"
    ## ggsignif      "3.6.1"
    ## ggthemes      "3.6.1"
    ## gifski        "3.6.0"
    ## glue          "3.6.0"
    ## gower         "3.6.0"
    ## gridExtra     "3.6.0"
    ## gtable        "3.6.0"
    ## haven         "3.6.1"
    ## highr         "3.6.0"
    ## hms           "3.6.1"
    ## hrbrthemes    "3.6.1"
    ## htmltools     "3.6.0"
    ## htmlwidgets   "3.6.0"
    ## httpuv        "3.6.1"
    ## httr          "3.6.1"
    ## igraph        "3.6.0"
    ## insight       "3.6.1"
    ## ipred         "3.6.1"
    ## iterators     "3.6.1"
    ## jomo          "3.6.1"
    ## jsonlite      "3.6.0"
    ## knitr         "3.6.1"
    ## labeling      "3.6.0"
    ## later         "3.6.1"
    ## lava          "3.6.1"
    ## lazyeval      "3.6.0"
    ## leaps         "3.6.0"
    ## lme4          "3.6.0"
    ## lubridate     "3.6.0"
    ## magrittr      "3.6.0"
    ## maptools      "3.6.0"
    ## markdown      "3.6.1"
    ## MatrixModels  "3.6.0"
    ## mclust        "3.6.1"
    ## mice          "3.6.1"
    ## mime          "3.6.0"
    ## minqa         "3.6.0"
    ## mitml         "3.6.1"
    ## ModelMetrics  "3.6.1"
    ## modelr        "3.6.1"
    ## moonBook      "3.6.0"
    ## munsell       "3.6.0"
    ## mycor         "3.6.0"
    ## naniar        "3.6.0"
    ## networkD3     "3.6.0"
    ## nloptr        "3.6.0"
    ## nortest       "3.6.0"
    ## numDeriv      "3.6.0"
    ## officer       "3.6.1"
    ## openssl       "3.6.1"
    ## openxlsx      "3.6.1"
    ## ordinal       "3.6.1"
    ## pacman        "3.6.1"
    ## pan           "3.6.1"
    ## pander        "3.6.0"
    ## pbkrtest      "3.6.0"
    ## pdp           "3.6.0"
    ## pillar        "3.6.1"
    ## pkgconfig     "3.6.0"
    ## plogr         "3.6.0"
    ## plyr          "3.6.0"
    ## png           "3.6.0"
    ## polyclip      "3.6.0"
    ## polynom       "3.6.0"
    ## ppcor         "3.6.0"
    ## prettyunits   "3.6.0"
    ## processx      "3.6.1"
    ## prodlim       "3.6.1"
    ## progress      "3.6.0"
    ## promises      "3.6.1"
    ## ps            "3.6.0"
    ## purrr         "3.6.0"
    ## quantreg      "3.6.1"
    ## R6            "3.6.0"
    ## RColorBrewer  "3.6.0"
    ## Rcpp          "3.6.1"
    ## RcppEigen     "3.6.0"
    ## readr         "3.6.0"
    ## readstata13   "3.6.1"
    ## readxl        "3.6.0"
    ## recipes       "3.6.1"
    ## rematch       "3.6.0"
    ## remotes       "3.6.1"
    ## reprex        "3.6.0"
    ## reshape       "3.6.0"
    ## reshape2      "3.6.0"
    ## rio           "3.6.0"
    ## rJava         "3.6.0"
    ## rlang         "3.6.1"
    ## rmarkdown     "3.6.1"
    ## rprojroot     "3.6.1"
    ## rstudioapi    "3.6.0"
    ## Rttf2pt1      "3.6.0"
    ## rvest         "3.6.0"
    ## scales        "3.6.1"
    ## scatterplot3d "3.6.0"
    ## selectr       "3.6.0"
    ## servr         "3.6.1"
    ## sjlabelled    "3.6.1"
    ## sjmisc        "3.6.1"
    ## skimr         "3.6.1"
    ## snakecase     "3.6.1"
    ## sp            "3.6.0"
    ## SparseM       "3.6.0"
    ## SQUAREM       "3.6.0"
    ## stargazer     "3.6.0"
    ## stringi       "3.6.0"
    ## stringr       "3.6.0"
    ## sys           "3.6.0"
    ## tibble        "3.6.1"
    ## tidyr         "3.6.0"
    ## tidyselect    "3.6.0"
    ## tidyverse     "3.6.1"
    ## timeDate      "3.6.0"
    ## tinytex       "3.6.1"
    ## tweenr        "3.6.0"
    ## ucminf        "3.6.0"
    ## UpSetR        "3.6.1"
    ## utf8          "3.6.0"
    ## uuid          "3.6.0"
    ## vctrs         "3.6.1"
    ## viridis       "3.6.0"
    ## viridisLite   "3.6.0"
    ## visdat        "3.6.0"
    ## webshot       "3.6.0"
    ## whisker       "3.6.0"
    ## withr         "3.6.0"
    ## wooldridge    "3.6.1"
    ## xaringan      "3.6.1"
    ## xfun          "3.6.1"
    ## xlsx          "3.6.0"
    ## xlsxjars      "3.6.0"
    ## xml2          "3.6.1"
    ## xtable        "3.6.0"
    ## yaml          "3.6.0"
    ## zeallot       "3.6.0"
    ## zip           "3.6.1"
    ## ztable        "3.6.0"
    ## base          "3.6.0"
    ## boot          "3.6.0"
    ## class         "3.6.0"
    ## cluster       "3.6.0"
    ## codetools     "3.6.0"
    ## compiler      "3.6.0"
    ## datasets      "3.6.0"
    ## foreign       "3.6.0"
    ## graphics      "3.6.0"
    ## grDevices     "3.6.0"
    ## grid          "3.6.0"
    ## KernSmooth    "3.6.0"
    ## lattice       "3.6.0"
    ## MASS          "3.6.0"
    ## Matrix        "3.6.0"
    ## methods       "3.6.0"
    ## mgcv          "3.6.0"
    ## nlme          "3.6.0"
    ## nnet          "3.6.0"
    ## parallel      "3.6.0"
    ## rpart         "3.6.0"
    ## spatial       "3.6.0"
    ## splines       "3.6.0"
    ## stats         "3.6.0"
    ## stats4        "3.6.0"
    ## survival      "3.6.0"
    ## tcltk         "3.6.0"
    ## tools         "3.6.0"
    ## translations  "3.6.0"
    ## utils         "3.6.0"

Basically, you have downloaded them onto your laptop. Just like with other software on your computer, you only need to do the installation once. However, you still need to tell R that you will be using the packages (by using the `library`command). Add the following two lines of code to your script (below the first two lines you wrote). Notice how there are no quotation marks inside the parenthese this time.

``` r
library(tidyverse) # one of the most famous R pacakge for data manipulation
library(skimr)  # for data exploration
library(wooldridge) # it refers to Wooldrige's undergraduate texbook
```

Whenever you start over a new Rstudio session, you need to load the approrpiate libraries.

### Running a script

To execute the script, click on the word "Source" in the top-right corner of the top-left window pane. This will take what is in your script and automatically send it to the console (as if you typed it directly into the console)

To save the script, click on the disk icon at the top of your script pane (but not the disk icon at the very top of RStudio). Name your script `ICL1_XYZ.R` where `XYZ` are your initials.

### Commenting

Now, put a hashtag (\#) in front of the first two lines of code in your script, like so:

``` r
#install.packages("tidyverse")
#install.packages("skimr")
#install.packages("wooldridge")
```

The hashtag is how you tell R not to run the code in your script. This is known as "commenting" your code.

At the very top of your script, type the names of your group members with a hashtag in front.

**From now on, add all of the code you see to your script.**

Exploring data
--------------

Now that you've got some of the basics of R, let's look at some data!

### Loading data

We're going to load a data set from the `wooldridge` package. The data set is called `wage1`.

``` r
df <- as_tibble(wage1)
```

What we did there was convert it to a `tibble`, which is a nice format for data sets (see Ch. 10 of @r4ds). We called the converted tibble `df`, but you can call it whatever you want: `mydata`, `data123`, whatever
