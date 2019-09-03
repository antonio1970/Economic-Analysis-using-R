Lab 1: First Steps in R. Economic Analysis with R
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

### More options

``` r
# We can use the command options digits to set up the number of decimals as you wish
options(digits = 3)
sqrt(10)
```

    ## [1] 3.16

``` r
ceiling(3.5) # round up to next integer
```

    ## [1] 4

``` r
floor(3.5) # round down to the next integer
```

    ## [1] 3

``` r
log(100)  # natural log
```

    ## [1] 4.61

``` r
exp(2)  # exponents
```

    ## [1] 7.39

You can also test for equality. True and false are the keywords. Notice that T and F are synonyms but are discouraged. TRUE FALSE

``` r
1==2 # Equality return TRUE if equal
```

    ## [1] FALSE

``` r
1 !=2 # Return false if unequal
```

    ## [1] TRUE

``` r
10 >= 9  # Greater than
```

    ## [1] TRUE

``` r
4<=1 # Less than
```

    ## [1] FALSE

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

Lastly, most of the them when using variables in a dataframe, you refer to them by using the `$`symbol. This can be avoided by using the `attach` command. This will be explained more in detail in next labs.

Just as an example, let us load one of the built in datasets in R, \`mpg´ from the **ggplot2 package**. This dataset contains observations collected by the US Environmental Protection Agency on 38 models of cars.

``` r
data(mtcars)
mean(mtcars$mpg) # Notice that we get access to the variables with the dollar symbol
```

    ## [1] 20.1

``` r
attach(mtcars)
mean(mpg) # there is no need to use the dollar symbol
```

    ## [1] 20.1

### Working directory

``` r
getwd() # to check your current working directory
```

    ## [1] "C:/Users/anton/OneDrive/Escritorio/Economic-Analysis-using-R/Economic-Analysis-using-R/Labs"

``` r
# setwd() # You can also use the menu  session and then set working directory, otherwise you need to specify the entire path
```

### Packages

R makes extensive use of third-party packages. We will not get into the details right now, but for this class, you will need to install a few of these. Installing packages is quite easy. Type the following two lines of code at the very top of your script:

``` r
install.packages("tidyverse", repos='http://cran.us.r-project.org')
```

    ## package 'tidyverse' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpETgpaA\downloaded_packages

``` r
install.packages("skimr", repos='http://cran.us.r-project.org')
```

    ## package 'skimr' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpETgpaA\downloaded_packages

``` r
install.packages("wooldridge", repos='http://cran.us.r-project.org')
```

    ## package 'wooldridge' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpETgpaA\downloaded_packages

``` r
install.packages("learnr", repos='http://cran.us.r-project.org')
```

    ## package 'learnr' successfully unpacked and MD5 sums checked
    ## 
    ## The downloaded binary packages are in
    ##  C:\Users\anton\AppData\Local\Temp\RtmpETgpaA\downloaded_packages

You've just installed two basic packages. We can also check it out by using the following syntax

``` r
installed.packages()
```

Basically, you have downloaded them onto your laptop. Just like with other software on your computer, you only need to do the installation once. However, you still need to tell R that you will be using the packages (by using the `library`command). Add the following two lines of code to your script (below the first two lines you wrote). Notice how there are no quotation marks inside the parenthese this time.

Whenever you start over a new Rstudio session, you need to load the appropriate libraries.

In RStudio, you can also install packages by using the R interface. You will find it at Tools -&gt; Install Package, and there you will get a pop--up window to type the package you want to install

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

### Citation R and packages

If you need to cite R, just use

``` r
citation()
```

    ## 
    ## To cite R in publications use:
    ## 
    ##   R Core Team (2019). R: A language and environment for
    ##   statistical computing. R Foundation for Statistical Computing,
    ##   Vienna, Austria. URL https://www.R-project.org/.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {R: A Language and Environment for Statistical Computing},
    ##     author = {{R Core Team}},
    ##     organization = {R Foundation for Statistical Computing},
    ##     address = {Vienna, Austria},
    ##     year = {2019},
    ##     url = {https://www.R-project.org/},
    ##   }
    ## 
    ## We have invested a lot of time and effort in creating R, please
    ## cite it when using it for data analysis. See also
    ## 'citation("pkgname")' for citing R packages.

if for instance, you need to cite one of the packages, then use

``` r
citation(package = "ggplot2")
```

    ## 
    ## To cite ggplot2 in publications, please use:
    ## 
    ##   H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
    ##   Springer-Verlag New York, 2016.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Book{,
    ##     author = {Hadley Wickham},
    ##     title = {ggplot2: Elegant Graphics for Data Analysis},
    ##     publisher = {Springer-Verlag New York},
    ##     year = {2016},
    ##     isbn = {978-3-319-24277-4},
    ##     url = {https://ggplot2.tidyverse.org},
    ##   }
