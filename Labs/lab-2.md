Lab 2: Reading data and exploratory data analysis
================

### Introduction

``` r
# Reading data from a csv file
# By default, header = TRUE, and sep


countries=read.csv("http://freakonometrics.free.fr/countries.csv",header=TRUE, sep= ';')


# The read.csv & read.csv2 commands are intended to read comma separated value files
# but read.csv2 is quite relevant for countries where they use comma as decimal point and a semicolon as separator  

#check it out

countries1=read.csv2("http://freakonometrics.free.fr/countries.csv",header=TRUE)

# remove  first row in the dataset (blank)

#keep all columns, and remove first row

countries = countries[-1,]

#inspect the dataset (first 6 observations), and the names of the variables in the dataframe

head(countries)
```

    ##       Country Interational.Direct.Dial..IDD..Code ISO.3166 Car.Code
    ## 2 Afghanistan                                  93       AF         
    ## 3     Albania                                 355       AL         
    ## 4     Algeria                                 213       DZ         
    ## 5     Andorra                              33 628       AD         
    ## 6      Angola                                 244       AO         
    ## 7    Anguilla                               1 809       AI         
    ##         Capital              Currency ISO.Currency Digraph  ICAO
    ## 2         Kabul               Afghani          AFA      AF   YA-
    ## 3        Tirana                   Lek          ALL      AL   ZA-
    ## 4       Algiers                 Dinar          DZD      DZ   7T-
    ## 5 And. La Vella          French Franc          FRF      AD   C3-
    ## 6        Luanda           New Irwanza          AON      AO   D2-
    ## 7               East Caribbean Dollar          XCD      AI VP-LA
    ##     Language ISO.639
    ## 2     Pashto      PS
    ## 3   Albanian      SQ
    ## 4     Arabic      AR
    ## 5    Catalan      CA
    ## 6 Portuguese      PT
    ## 7

``` r
names(countries)
```

    ##  [1] "Country"                            
    ##  [2] "Interational.Direct.Dial..IDD..Code"
    ##  [3] "ISO.3166"                           
    ##  [4] "Car.Code"                           
    ##  [5] "Capital"                            
    ##  [6] "Currency"                           
    ##  [7] "ISO.Currency"                       
    ##  [8] "Digraph"                            
    ##  [9] "ICAO"                               
    ## [10] "Language"                           
    ## [11] "ISO.639"

### Another example with gapminder

``` r
gdf <- read.delim("../Labs/data/gapminderDataFiveYear.txt")
head(gdf)
```

    ##       country year      pop continent lifeExp gdpPercap
    ## 1 Afghanistan 1952  8425333      Asia  28.801  779.4453
    ## 2 Afghanistan 1957  9240934      Asia  30.332  820.8530
    ## 3 Afghanistan 1962 10267083      Asia  31.997  853.1007
    ## 4 Afghanistan 1967 11537966      Asia  34.020  836.1971
    ## 5 Afghanistan 1972 13079460      Asia  36.088  739.9811
    ## 6 Afghanistan 1977 14880372      Asia  38.438  786.1134

``` r
# Alternatively we can read the file as

gdf1 = read.table('../Labs/data/gapminderDataFiveYear.txt', header = TRUE, sep = '\t')
head(gdf1,4)
```

    ##       country year      pop continent lifeExp gdpPercap
    ## 1 Afghanistan 1952  8425333      Asia  28.801  779.4453
    ## 2 Afghanistan 1957  9240934      Asia  30.332  820.8530
    ## 3 Afghanistan 1962 10267083      Asia  31.997  853.1007
    ## 4 Afghanistan 1967 11537966      Asia  34.020  836.1971

``` r
# To know the format of the variables included in the dataframe
sapply(gdf1, class)
```

    ##   country      year       pop continent   lifeExp gdpPercap 
    ##  "factor" "integer" "numeric"  "factor" "numeric" "numeric"

``` r
str(gdf1)
```

    ## 'data.frame':    1698 obs. of  6 variables:
    ##  $ country  : Factor w/ 147 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
    ##  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
    ##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
    ##  $ gdpPercap: num  779 821 853 836 740 ...

### Description of the dataset

``` r
summary(gdf1)
```

    ##         country          year           pop               continent  
    ##  Afghanistan:  12   Min.   :1952   Min.   :6.001e+04   Africa  :618  
    ##  Albania    :  12   1st Qu.:1967   1st Qu.:2.783e+06   Americas:300  
    ##  Algeria    :  12   Median :1980   Median :7.024e+06   Asia    :396  
    ##  Angola     :  12   Mean   :1980   Mean   :2.968e+07   Europe  :360  
    ##  Argentina  :  12   3rd Qu.:1996   3rd Qu.:1.972e+07   Oceania : 24  
    ##  Australia  :  12   Max.   :2007   Max.   :1.319e+09                 
    ##  (Other)    :1626                                                    
    ##     lifeExp        gdpPercap       
    ##  Min.   :23.60   Min.   :   241.2  
    ##  1st Qu.:48.25   1st Qu.:  1198.0  
    ##  Median :60.81   Median :  3544.4  
    ##  Mean   :59.51   Mean   :  7234.1  
    ##  3rd Qu.:70.85   3rd Qu.:  9349.0  
    ##  Max.   :82.60   Max.   :113523.1  
    ## 

``` r
anyNA(gdf1)
```

    ## [1] FALSE

``` r
names(gdf1)
```

    ## [1] "country"   "year"      "pop"       "continent" "lifeExp"   "gdpPercap"

``` r
nrow(gdf1)
```

    ## [1] 1698

``` r
colnames(gdf1)
```

    ## [1] "country"   "year"      "pop"       "continent" "lifeExp"   "gdpPercap"

``` r
# A more elegant way to inspect the dataset
library(funModeling)
```

    ## Warning: package 'funModeling' was built under R version 3.6.1

    ## Loading required package: Hmisc

    ## Warning: package 'Hmisc' was built under R version 3.6.1

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## Loading required package: ggplot2

    ## Warning: package 'ggplot2' was built under R version 3.6.1

    ## 
    ## Attaching package: 'Hmisc'

    ## The following objects are masked from 'package:base':
    ## 
    ##     format.pval, units

    ## funModeling v.1.8 :)
    ## Examples and tutorials at livebook.datascienceheroes.com

``` r
df_status(gdf1)
```

    ##    variable q_zeros p_zeros q_na p_na q_inf p_inf    type unique
    ## 1   country       0       0    0    0     0     0  factor    147
    ## 2      year       0       0    0    0     0     0 integer     12
    ## 3       pop       0       0    0    0     0     0 numeric   1698
    ## 4 continent       0       0    0    0     0     0  factor      5
    ## 5   lifeExp       0       0    0    0     0     0 numeric   1620
    ## 6 gdpPercap       0       0    0    0     0     0 numeric   1698

### Manipulating dataframes

``` r
# Generate a subset of the original dataframe, adn extract the first 5 observations
gdf1[1:5,]
```

    ##       country year      pop continent lifeExp gdpPercap
    ## 1 Afghanistan 1952  8425333      Asia  28.801  779.4453
    ## 2 Afghanistan 1957  9240934      Asia  30.332  820.8530
    ## 3 Afghanistan 1962 10267083      Asia  31.997  853.1007
    ## 4 Afghanistan 1967 11537966      Asia  34.020  836.1971
    ## 5 Afghanistan 1972 13079460      Asia  36.088  739.9811

``` r
subset(gdf1, gdf1$lifeExp < 30)
```

    ##          country year     pop continent lifeExp gdpPercap
    ## 1    Afghanistan 1952 8425333      Asia  28.801  779.4453
    ## 1287      Rwanda 1992 7290203    Africa  23.599  737.0686

``` r
gdf1[gdf1$lifeExp < 30, ]
```

    ##          country year     pop continent lifeExp gdpPercap
    ## 1    Afghanistan 1952 8425333      Asia  28.801  779.4453
    ## 1287      Rwanda 1992 7290203    Africa  23.599  737.0686

``` r
# Extract data for Czech Republic from the dataframe

gdf1[gdf1$country == 'Czech Republic', c('year', 'lifeExp', 'pop')]
```

    ##     year lifeExp      pop
    ## 391 1952  66.870  9125183
    ## 392 1957  69.030  9513758
    ## 393 1962  69.900  9620282
    ## 394 1967  70.380  9835109
    ## 395 1972  70.290  9862158
    ## 396 1977  70.710 10161915
    ## 397 1982  70.960 10303704
    ## 398 1987  71.580 10311597
    ## 399 1992  72.400 10315702
    ## 400 1997  74.010 10300707
    ## 401 2002  75.510 10256295
    ## 402 2007  76.486 10228744

``` r
# Generate a data set with only observations for Czech Republic

czech.data = gdf1[gdf1$country == 'Czech Republic', c('year', 'lifeExp', 'pop')]

# Nice way of printing out dataframes with the tibble 

library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.6.1

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:Hmisc':
    ## 
    ##     src, summarize

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
czech.table = tbl_df(gdf1[gdf1$country == 'Czech Republic', c('year', 'lifeExp', 'pop')])
czech.table
```

    ## # A tibble: 12 x 3
    ##     year lifeExp      pop
    ##    <int>   <dbl>    <dbl>
    ##  1  1952    66.9  9125183
    ##  2  1957    69.0  9513758
    ##  3  1962    69.9  9620282
    ##  4  1967    70.4  9835109
    ##  5  1972    70.3  9862158
    ##  6  1977    70.7 10161915
    ##  7  1982    71.0 10303704
    ##  8  1987    71.6 10311597
    ##  9  1992    72.4 10315702
    ## 10  1997    74.0 10300707
    ## 11  2002    75.5 10256295
    ## 12  2007    76.5 10228744
