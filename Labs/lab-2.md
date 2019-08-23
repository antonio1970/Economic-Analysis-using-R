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
