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
library(formattable)
```

    ## Warning: package 'formattable' was built under R version 3.6.1

``` r
formattable(gdf1, align = c("l", "c", "c", "c", "c", "c"))
```

<table class="table table-condensed">
<thead>
<tr>
<th style="text-align:left;">
country
</th>
<th style="text-align:center;">
year
</th>
<th style="text-align:center;">
pop
</th>
<th style="text-align:center;">
continent
</th>
<th style="text-align:center;">
lifeExp
</th>
<th style="text-align:center;">
gdpPercap
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8425333
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
28.80100
</td>
<td style="text-align:center;">
779.4453
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9240934
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
30.33200
</td>
<td style="text-align:center;">
820.8530
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10267083
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
31.99700
</td>
<td style="text-align:center;">
853.1007
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
11537966
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
34.02000
</td>
<td style="text-align:center;">
836.1971
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
13079460
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
36.08800
</td>
<td style="text-align:center;">
739.9811
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
14880372
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
38.43800
</td>
<td style="text-align:center;">
786.1134
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
12881816
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.85400
</td>
<td style="text-align:center;">
978.0114
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
13867957
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
40.82200
</td>
<td style="text-align:center;">
852.3959
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
16317921
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
41.67400
</td>
<td style="text-align:center;">
649.3414
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
22227415
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
41.76300
</td>
<td style="text-align:center;">
635.3414
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
25268405
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
42.12900
</td>
<td style="text-align:center;">
726.7341
</td>
</tr>
<tr>
<td style="text-align:left;">
Afghanistan
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
31889923
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.82800
</td>
<td style="text-align:center;">
974.5803
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1282697
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
55.23000
</td>
<td style="text-align:center;">
1601.0561
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1476505
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
59.28000
</td>
<td style="text-align:center;">
1942.2842
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1728137
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.82000
</td>
<td style="text-align:center;">
2312.8890
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1984060
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.22000
</td>
<td style="text-align:center;">
2760.1969
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2263554
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.69000
</td>
<td style="text-align:center;">
3313.4222
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2509048
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.93000
</td>
<td style="text-align:center;">
3533.0039
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2780097
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.42000
</td>
<td style="text-align:center;">
3630.8807
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3075321
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.00000
</td>
<td style="text-align:center;">
3738.9327
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3326498
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.58100
</td>
<td style="text-align:center;">
2497.4379
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3428038
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.95000
</td>
<td style="text-align:center;">
3193.0546
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3508512
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.65100
</td>
<td style="text-align:center;">
4604.2117
</td>
</tr>
<tr>
<td style="text-align:left;">
Albania
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3600523
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.42300
</td>
<td style="text-align:center;">
5937.0295
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
9279525
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.07700
</td>
<td style="text-align:center;">
2449.0082
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
10270856
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.68500
</td>
<td style="text-align:center;">
3013.9760
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
11000948
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.30300
</td>
<td style="text-align:center;">
2550.8169
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
12760499
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.40700
</td>
<td style="text-align:center;">
3246.9918
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
14760787
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.51800
</td>
<td style="text-align:center;">
4182.6638
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
17152804
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.01400
</td>
<td style="text-align:center;">
4910.4168
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
20033753
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.36800
</td>
<td style="text-align:center;">
5745.1602
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
23254956
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
65.79900
</td>
<td style="text-align:center;">
5681.3585
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
26298373
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
67.74400
</td>
<td style="text-align:center;">
5023.2166
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
29072015
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
69.15200
</td>
<td style="text-align:center;">
4797.2951
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
31287142
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
70.99400
</td>
<td style="text-align:center;">
5288.0404
</td>
</tr>
<tr>
<td style="text-align:left;">
Algeria
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
33333216
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
72.30100
</td>
<td style="text-align:center;">
6223.3675
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4232095
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
30.01500
</td>
<td style="text-align:center;">
3520.6103
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4561361
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
31.99900
</td>
<td style="text-align:center;">
3827.9405
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4826015
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.00000
</td>
<td style="text-align:center;">
4269.2767
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
5247469
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.98500
</td>
<td style="text-align:center;">
5522.7764
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5894858
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.92800
</td>
<td style="text-align:center;">
5473.2880
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
6162675
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.48300
</td>
<td style="text-align:center;">
3008.6474
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
7016384
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.94200
</td>
<td style="text-align:center;">
2756.9537
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7874230
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.90600
</td>
<td style="text-align:center;">
2430.2083
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8735988
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.64700
</td>
<td style="text-align:center;">
2627.8457
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9875024
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.96300
</td>
<td style="text-align:center;">
2277.1409
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10866106
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.00300
</td>
<td style="text-align:center;">
2773.2873
</td>
</tr>
<tr>
<td style="text-align:left;">
Angola
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
12420476
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.73100
</td>
<td style="text-align:center;">
4797.2313
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
17876956
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.48500
</td>
<td style="text-align:center;">
5911.3151
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
19610538
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.39900
</td>
<td style="text-align:center;">
6856.8562
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
21283783
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.14200
</td>
<td style="text-align:center;">
7133.1660
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
22934225
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.63400
</td>
<td style="text-align:center;">
8052.9530
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
24779799
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.06500
</td>
<td style="text-align:center;">
9443.0385
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
26983828
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.48100
</td>
<td style="text-align:center;">
10079.0267
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
29341374
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.94200
</td>
<td style="text-align:center;">
8997.8974
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
31620918
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.77400
</td>
<td style="text-align:center;">
9139.6714
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
33958947
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.86800
</td>
<td style="text-align:center;">
9308.4187
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
36203463
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.27500
</td>
<td style="text-align:center;">
10967.2820
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
38331121
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.34000
</td>
<td style="text-align:center;">
8797.6407
</td>
</tr>
<tr>
<td style="text-align:left;">
Argentina
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
40301927
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.32000
</td>
<td style="text-align:center;">
12779.3796
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8691212
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
69.12000
</td>
<td style="text-align:center;">
10039.5956
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9712569
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
70.33000
</td>
<td style="text-align:center;">
10949.6496
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10794968
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
70.93000
</td>
<td style="text-align:center;">
12217.2269
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
11872264
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
71.10000
</td>
<td style="text-align:center;">
14526.1246
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
13177000
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
71.93000
</td>
<td style="text-align:center;">
16788.6295
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
14074100
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
73.49000
</td>
<td style="text-align:center;">
18334.1975
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
15184200
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
74.74000
</td>
<td style="text-align:center;">
19477.0093
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
16257249
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
76.32000
</td>
<td style="text-align:center;">
21888.8890
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
17481977
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
77.56000
</td>
<td style="text-align:center;">
23424.7668
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
18565243
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
78.83000
</td>
<td style="text-align:center;">
26997.9366
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
19546792
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
80.37000
</td>
<td style="text-align:center;">
30687.7547
</td>
</tr>
<tr>
<td style="text-align:left;">
Australia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
20434176
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
81.23500
</td>
<td style="text-align:center;">
34435.3674
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6927772
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.80000
</td>
<td style="text-align:center;">
6137.0765
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
6965860
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.48000
</td>
<td style="text-align:center;">
8842.5980
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7129864
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.54000
</td>
<td style="text-align:center;">
10750.7211
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
7376998
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.14000
</td>
<td style="text-align:center;">
12834.6024
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
7544201
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.63000
</td>
<td style="text-align:center;">
16661.6256
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
7568430
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.17000
</td>
<td style="text-align:center;">
19749.4223
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
7574613
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.18000
</td>
<td style="text-align:center;">
21597.0836
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7578903
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.94000
</td>
<td style="text-align:center;">
23687.8261
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
7914969
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.04000
</td>
<td style="text-align:center;">
27042.0187
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
8069876
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.51000
</td>
<td style="text-align:center;">
29095.9207
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
8148312
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.98000
</td>
<td style="text-align:center;">
32417.6077
</td>
</tr>
<tr>
<td style="text-align:left;">
Austria
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
8199783
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.82900
</td>
<td style="text-align:center;">
36126.4927
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
120447
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.93900
</td>
<td style="text-align:center;">
9867.0848
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
138655
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.83200
</td>
<td style="text-align:center;">
11635.7995
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
171863
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.92300
</td>
<td style="text-align:center;">
12753.2751
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
202182
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.92300
</td>
<td style="text-align:center;">
14804.6727
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
230800
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.30000
</td>
<td style="text-align:center;">
18268.6584
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
297410
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.59300
</td>
<td style="text-align:center;">
19340.1020
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
377967
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.05200
</td>
<td style="text-align:center;">
19211.1473
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
454612
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.75000
</td>
<td style="text-align:center;">
18524.0241
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
529491
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.60100
</td>
<td style="text-align:center;">
19035.5792
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
598561
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.92500
</td>
<td style="text-align:center;">
20292.0168
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
656397
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.79500
</td>
<td style="text-align:center;">
23403.5593
</td>
</tr>
<tr>
<td style="text-align:left;">
Bahrain
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
708573
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.63500
</td>
<td style="text-align:center;">
29796.0483
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
46886859
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
37.48400
</td>
<td style="text-align:center;">
684.2442
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
51365468
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.34800
</td>
<td style="text-align:center;">
661.6375
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
56839289
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
41.21600
</td>
<td style="text-align:center;">
686.3416
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
62821884
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.45300
</td>
<td style="text-align:center;">
721.1861
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
70759295
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.25200
</td>
<td style="text-align:center;">
630.2336
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
80428306
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
46.92300
</td>
<td style="text-align:center;">
659.8772
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
93074406
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.00900
</td>
<td style="text-align:center;">
676.9819
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
103764241
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.81900
</td>
<td style="text-align:center;">
751.9794
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
113704579
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.01800
</td>
<td style="text-align:center;">
837.8102
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
123315288
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.41200
</td>
<td style="text-align:center;">
972.7700
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
135656790
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.01300
</td>
<td style="text-align:center;">
1136.3904
</td>
</tr>
<tr>
<td style="text-align:left;">
Bangladesh
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
150448339
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.06200
</td>
<td style="text-align:center;">
1391.2538
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8730405
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.00000
</td>
<td style="text-align:center;">
8343.1051
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
8989111
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.24000
</td>
<td style="text-align:center;">
9714.9606
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
9218400
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.25000
</td>
<td style="text-align:center;">
10991.2068
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
9556500
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.94000
</td>
<td style="text-align:center;">
13149.0412
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
9709100
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.44000
</td>
<td style="text-align:center;">
16672.1436
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
9821800
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.80000
</td>
<td style="text-align:center;">
19117.9745
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9856303
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.93000
</td>
<td style="text-align:center;">
20979.8459
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
9870200
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.35000
</td>
<td style="text-align:center;">
22525.5631
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10045622
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.46000
</td>
<td style="text-align:center;">
25575.5707
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10199787
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.53000
</td>
<td style="text-align:center;">
27561.1966
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10311970
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.32000
</td>
<td style="text-align:center;">
30485.8838
</td>
</tr>
<tr>
<td style="text-align:left;">
Belgium
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10392226
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.44100
</td>
<td style="text-align:center;">
33692.6051
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1738315
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.22300
</td>
<td style="text-align:center;">
1062.7522
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1925173
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.35800
</td>
<td style="text-align:center;">
959.6011
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2151895
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.61800
</td>
<td style="text-align:center;">
949.4991
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2427334
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.88500
</td>
<td style="text-align:center;">
1035.8314
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2761407
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.01400
</td>
<td style="text-align:center;">
1085.7969
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3168267
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.19000
</td>
<td style="text-align:center;">
1029.1613
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3641603
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.90400
</td>
<td style="text-align:center;">
1277.8976
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4243788
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.33700
</td>
<td style="text-align:center;">
1225.8560
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4981671
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.91900
</td>
<td style="text-align:center;">
1191.2077
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
6066080
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.77700
</td>
<td style="text-align:center;">
1232.9753
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7026113
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.40600
</td>
<td style="text-align:center;">
1372.8779
</td>
</tr>
<tr>
<td style="text-align:left;">
Benin
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
8078314
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.72800
</td>
<td style="text-align:center;">
1441.2849
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2883315
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
40.41400
</td>
<td style="text-align:center;">
2677.3263
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3211738
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
41.89000
</td>
<td style="text-align:center;">
2127.6863
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3593918
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
43.42800
</td>
<td style="text-align:center;">
2180.9725
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4040665
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
45.03200
</td>
<td style="text-align:center;">
2586.8861
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4565872
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
46.71400
</td>
<td style="text-align:center;">
2980.3313
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5079716
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
50.02300
</td>
<td style="text-align:center;">
3548.0978
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5642224
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
53.85900
</td>
<td style="text-align:center;">
3156.5105
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
6156369
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.25100
</td>
<td style="text-align:center;">
2753.6915
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
6893451
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.95700
</td>
<td style="text-align:center;">
2961.6997
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
7693188
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.05000
</td>
<td style="text-align:center;">
3326.1432
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
8445134
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.88300
</td>
<td style="text-align:center;">
3413.2627
</td>
</tr>
<tr>
<td style="text-align:left;">
Bolivia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
9119152
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.55400
</td>
<td style="text-align:center;">
3822.1371
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2791000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
53.82000
</td>
<td style="text-align:center;">
973.5332
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3076000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
58.45000
</td>
<td style="text-align:center;">
1353.9892
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3349000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.93000
</td>
<td style="text-align:center;">
1709.6837
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3585000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.79000
</td>
<td style="text-align:center;">
2172.3524
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3819000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.45000
</td>
<td style="text-align:center;">
2860.1698
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4086000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.86000
</td>
<td style="text-align:center;">
3528.4813
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4172693
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.69000
</td>
<td style="text-align:center;">
4126.6132
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4338977
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.14000
</td>
<td style="text-align:center;">
4314.1148
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4256013
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.17800
</td>
<td style="text-align:center;">
2546.7814
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3607000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.24400
</td>
<td style="text-align:center;">
4766.3559
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4165416
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.09000
</td>
<td style="text-align:center;">
6018.9752
</td>
</tr>
<tr>
<td style="text-align:left;">
Bosnia and Herzegovina
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4552198
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.85200
</td>
<td style="text-align:center;">
7446.2988
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
442308
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.62200
</td>
<td style="text-align:center;">
851.2411
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
474639
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.61800
</td>
<td style="text-align:center;">
918.2325
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
512764
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.52000
</td>
<td style="text-align:center;">
983.6540
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
553541
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.29800
</td>
<td style="text-align:center;">
1214.7093
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
619351
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.02400
</td>
<td style="text-align:center;">
2263.6111
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
781472
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.31900
</td>
<td style="text-align:center;">
3214.8578
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
970347
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.48400
</td>
<td style="text-align:center;">
4551.1421
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1151184
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
63.62200
</td>
<td style="text-align:center;">
6205.8839
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1342614
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.74500
</td>
<td style="text-align:center;">
7954.1116
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1536536
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.55600
</td>
<td style="text-align:center;">
8647.1423
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1630347
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.63400
</td>
<td style="text-align:center;">
11003.6051
</td>
</tr>
<tr>
<td style="text-align:left;">
Botswana
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1639131
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.72800
</td>
<td style="text-align:center;">
12569.8518
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
56602560
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
50.91700
</td>
<td style="text-align:center;">
2108.9444
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
65551171
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
53.28500
</td>
<td style="text-align:center;">
2487.3660
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
76039390
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.66500
</td>
<td style="text-align:center;">
3336.5858
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
88049823
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.63200
</td>
<td style="text-align:center;">
3429.8644
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
100840058
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.50400
</td>
<td style="text-align:center;">
4985.7115
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
114313951
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.48900
</td>
<td style="text-align:center;">
6660.1187
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
128962939
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.33600
</td>
<td style="text-align:center;">
7030.8359
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
142938076
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.20500
</td>
<td style="text-align:center;">
7807.0958
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
155975974
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.05700
</td>
<td style="text-align:center;">
6950.2830
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
168546719
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.38800
</td>
<td style="text-align:center;">
7957.9808
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
179914212
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.00600
</td>
<td style="text-align:center;">
8131.2128
</td>
</tr>
<tr>
<td style="text-align:left;">
Brazil
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
190010647
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.39000
</td>
<td style="text-align:center;">
9065.8008
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
7274900
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
59.60000
</td>
<td style="text-align:center;">
2444.2866
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7651254
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.61000
</td>
<td style="text-align:center;">
3008.6707
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
8012946
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.51000
</td>
<td style="text-align:center;">
4254.3378
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8310226
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.42000
</td>
<td style="text-align:center;">
5577.0028
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
8576200
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.90000
</td>
<td style="text-align:center;">
6597.4944
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
8797022
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.81000
</td>
<td style="text-align:center;">
7612.2404
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
8892098
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.08000
</td>
<td style="text-align:center;">
8224.1916
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
8971958
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.34000
</td>
<td style="text-align:center;">
8239.8548
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8658506
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.19000
</td>
<td style="text-align:center;">
6302.6234
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
8066057
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.32000
</td>
<td style="text-align:center;">
5970.3888
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7661799
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.14000
</td>
<td style="text-align:center;">
7696.7777
</td>
</tr>
<tr>
<td style="text-align:left;">
Bulgaria
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
7322858
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.00500
</td>
<td style="text-align:center;">
10680.7928
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4469979
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
31.97500
</td>
<td style="text-align:center;">
543.2552
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4713416
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.90600
</td>
<td style="text-align:center;">
617.1835
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4919632
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.81400
</td>
<td style="text-align:center;">
722.5120
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
5127935
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.69700
</td>
<td style="text-align:center;">
794.8266
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5433886
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.59100
</td>
<td style="text-align:center;">
854.7360
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5889574
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.13700
</td>
<td style="text-align:center;">
743.3870
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6634596
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.12200
</td>
<td style="text-align:center;">
807.1986
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7586551
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.55700
</td>
<td style="text-align:center;">
912.0631
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8878303
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.26000
</td>
<td style="text-align:center;">
931.7528
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10352843
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.32400
</td>
<td style="text-align:center;">
946.2950
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
12251209
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.65000
</td>
<td style="text-align:center;">
1037.6452
</td>
</tr>
<tr>
<td style="text-align:left;">
Burkina Faso
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
14326203
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.29500
</td>
<td style="text-align:center;">
1217.0330
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2445618
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.03100
</td>
<td style="text-align:center;">
339.2965
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2667518
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.53300
</td>
<td style="text-align:center;">
379.5646
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2961915
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.04500
</td>
<td style="text-align:center;">
355.2032
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3330989
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.54800
</td>
<td style="text-align:center;">
412.9775
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3529983
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.05700
</td>
<td style="text-align:center;">
464.0995
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3834415
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.91000
</td>
<td style="text-align:center;">
556.1033
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4580410
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.47100
</td>
<td style="text-align:center;">
559.6032
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5126023
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.21100
</td>
<td style="text-align:center;">
621.8188
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5809236
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.73600
</td>
<td style="text-align:center;">
631.6999
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
6121610
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.32600
</td>
<td style="text-align:center;">
463.1151
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7021078
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.36000
</td>
<td style="text-align:center;">
446.4035
</td>
</tr>
<tr>
<td style="text-align:left;">
Burundi
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
8390505
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.58000
</td>
<td style="text-align:center;">
430.0707
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4693836
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.41700
</td>
<td style="text-align:center;">
368.4693
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
5322536
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
41.36600
</td>
<td style="text-align:center;">
434.0383
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
6083619
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.41500
</td>
<td style="text-align:center;">
496.9136
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
6960067
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.41500
</td>
<td style="text-align:center;">
523.4323
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
7450606
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
40.31700
</td>
<td style="text-align:center;">
421.6240
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
6978607
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
31.22000
</td>
<td style="text-align:center;">
524.9722
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
7272485
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.95700
</td>
<td style="text-align:center;">
624.4755
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
8371791
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.91400
</td>
<td style="text-align:center;">
683.8956
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10150094
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.80300
</td>
<td style="text-align:center;">
682.3032
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
11782962
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.53400
</td>
<td style="text-align:center;">
734.2852
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
12926707
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.75200
</td>
<td style="text-align:center;">
896.2260
</td>
</tr>
<tr>
<td style="text-align:left;">
Cambodia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
14131858
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.72300
</td>
<td style="text-align:center;">
1713.7787
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
5009067
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.52300
</td>
<td style="text-align:center;">
1172.6677
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
5359923
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.42800
</td>
<td style="text-align:center;">
1313.0481
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
5793633
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.64300
</td>
<td style="text-align:center;">
1399.6074
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
6335506
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.79900
</td>
<td style="text-align:center;">
1508.4531
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
7021028
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.04900
</td>
<td style="text-align:center;">
1684.1465
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
7959865
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.35500
</td>
<td style="text-align:center;">
1783.4329
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9250831
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.96100
</td>
<td style="text-align:center;">
2367.9833
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
10780667
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.98500
</td>
<td style="text-align:center;">
2602.6642
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
12467171
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.31400
</td>
<td style="text-align:center;">
1793.1633
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
14195809
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.19900
</td>
<td style="text-align:center;">
1694.3375
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
15929988
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.85600
</td>
<td style="text-align:center;">
1934.0114
</td>
</tr>
<tr>
<td style="text-align:left;">
Cameroon
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
17696293
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.43000
</td>
<td style="text-align:center;">
2042.0952
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
14785584
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.75000
</td>
<td style="text-align:center;">
11367.1611
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
17010154
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.96000
</td>
<td style="text-align:center;">
12489.9501
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
18985849
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.30000
</td>
<td style="text-align:center;">
13462.4855
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
20819767
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.13000
</td>
<td style="text-align:center;">
16076.5880
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
22284500
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.88000
</td>
<td style="text-align:center;">
18970.5709
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
23796400
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.21000
</td>
<td style="text-align:center;">
22090.8831
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
25201900
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.76000
</td>
<td style="text-align:center;">
22898.7921
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
26549700
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
76.86000
</td>
<td style="text-align:center;">
26626.5150
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
28523502
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
77.95000
</td>
<td style="text-align:center;">
26342.8843
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
30305843
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.61000
</td>
<td style="text-align:center;">
28954.9259
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
31902268
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
79.77000
</td>
<td style="text-align:center;">
33328.9651
</td>
</tr>
<tr>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
33390141
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
80.65300
</td>
<td style="text-align:center;">
36319.2350
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1291695
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.46300
</td>
<td style="text-align:center;">
1071.3107
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1392284
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.46400
</td>
<td style="text-align:center;">
1190.8443
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1523478
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.47500
</td>
<td style="text-align:center;">
1193.0688
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1733638
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.47800
</td>
<td style="text-align:center;">
1136.0566
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1927260
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.45700
</td>
<td style="text-align:center;">
1070.0133
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2167533
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.77500
</td>
<td style="text-align:center;">
1109.3743
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2476971
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.29500
</td>
<td style="text-align:center;">
956.7530
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2840009
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.48500
</td>
<td style="text-align:center;">
844.8764
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3265124
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.39600
</td>
<td style="text-align:center;">
747.9055
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3696513
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.06600
</td>
<td style="text-align:center;">
740.5063
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4048013
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.30800
</td>
<td style="text-align:center;">
738.6906
</td>
</tr>
<tr>
<td style="text-align:left;">
Central African Republic
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4369038
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.74100
</td>
<td style="text-align:center;">
706.0165
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2682462
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.09200
</td>
<td style="text-align:center;">
1178.6659
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2894855
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.88100
</td>
<td style="text-align:center;">
1308.4956
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3150417
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.71600
</td>
<td style="text-align:center;">
1389.8176
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3495967
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.60100
</td>
<td style="text-align:center;">
1196.8106
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3899068
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.56900
</td>
<td style="text-align:center;">
1104.1040
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4388260
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.38300
</td>
<td style="text-align:center;">
1133.9850
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4875118
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.51700
</td>
<td style="text-align:center;">
797.9081
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5498955
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.05100
</td>
<td style="text-align:center;">
952.3861
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
6429417
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.72400
</td>
<td style="text-align:center;">
1058.0643
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
7562011
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.57300
</td>
<td style="text-align:center;">
1004.9614
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
8835739
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.52500
</td>
<td style="text-align:center;">
1156.1819
</td>
</tr>
<tr>
<td style="text-align:left;">
Chad
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10238807
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.65100
</td>
<td style="text-align:center;">
1704.0637
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6377619
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
54.74500
</td>
<td style="text-align:center;">
3939.9788
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7048426
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.07400
</td>
<td style="text-align:center;">
4315.6227
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7961258
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.92400
</td>
<td style="text-align:center;">
4519.0943
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8858908
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.52300
</td>
<td style="text-align:center;">
5106.6543
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
9717524
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.44100
</td>
<td style="text-align:center;">
5494.0244
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
10599793
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.05200
</td>
<td style="text-align:center;">
4756.7638
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
11487112
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.56500
</td>
<td style="text-align:center;">
5095.6657
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
12463354
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.49200
</td>
<td style="text-align:center;">
5547.0638
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
13572994
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.12600
</td>
<td style="text-align:center;">
7596.1260
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
14599929
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.81600
</td>
<td style="text-align:center;">
10118.0532
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
15497046
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
77.86000
</td>
<td style="text-align:center;">
10778.7838
</td>
</tr>
<tr>
<td style="text-align:left;">
Chile
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
16284741
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.55300
</td>
<td style="text-align:center;">
13171.6388
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
556263528
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
44.00000
</td>
<td style="text-align:center;">
400.4486
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
637408000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.54896
</td>
<td style="text-align:center;">
575.9870
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
665770000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
44.50136
</td>
<td style="text-align:center;">
487.6740
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
754550000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.38112
</td>
<td style="text-align:center;">
612.7057
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
862030000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.11888
</td>
<td style="text-align:center;">
676.9001
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
943455000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.96736
</td>
<td style="text-align:center;">
741.2375
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1000281000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.52500
</td>
<td style="text-align:center;">
962.4214
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1084035000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.27400
</td>
<td style="text-align:center;">
1378.9040
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1164970000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.69000
</td>
<td style="text-align:center;">
1655.7842
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1230075000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.42600
</td>
<td style="text-align:center;">
2289.2341
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1280400000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.02800
</td>
<td style="text-align:center;">
3119.2809
</td>
</tr>
<tr>
<td style="text-align:left;">
China
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1318683096
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.96100
</td>
<td style="text-align:center;">
4959.1149
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
12350771
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
50.64300
</td>
<td style="text-align:center;">
2144.1151
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
14485993
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.11800
</td>
<td style="text-align:center;">
2323.8056
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
17009885
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.86300
</td>
<td style="text-align:center;">
2492.3511
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
19764027
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.96300
</td>
<td style="text-align:center;">
2678.7298
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
22542890
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.62300
</td>
<td style="text-align:center;">
3264.6600
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
25094412
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.83700
</td>
<td style="text-align:center;">
3815.8079
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
27764644
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.65300
</td>
<td style="text-align:center;">
4397.5757
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
30964245
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.76800
</td>
<td style="text-align:center;">
4903.2191
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
34202721
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.42100
</td>
<td style="text-align:center;">
5444.6486
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
37657830
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.31300
</td>
<td style="text-align:center;">
6117.3617
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
41008227
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.68200
</td>
<td style="text-align:center;">
5755.2600
</td>
</tr>
<tr>
<td style="text-align:left;">
Colombia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
44227550
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.88900
</td>
<td style="text-align:center;">
7006.5804
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
153936
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.71500
</td>
<td style="text-align:center;">
1102.9909
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
170928
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.46000
</td>
<td style="text-align:center;">
1211.1485
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
191689
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.46700
</td>
<td style="text-align:center;">
1406.6483
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
217378
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.47200
</td>
<td style="text-align:center;">
1876.0296
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
250027
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.94400
</td>
<td style="text-align:center;">
1937.5777
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
304739
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.93900
</td>
<td style="text-align:center;">
1172.6030
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
348643
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.93300
</td>
<td style="text-align:center;">
1267.1001
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
395114
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.92600
</td>
<td style="text-align:center;">
1315.9808
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
454429
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.93900
</td>
<td style="text-align:center;">
1246.9074
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
527982
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.66000
</td>
<td style="text-align:center;">
1173.6182
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
614382
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.97400
</td>
<td style="text-align:center;">
1075.8116
</td>
</tr>
<tr>
<td style="text-align:left;">
Comoros
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
710960
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
65.15200
</td>
<td style="text-align:center;">
986.1479
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
14100005
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.14300
</td>
<td style="text-align:center;">
780.5423
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
15577932
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.65200
</td>
<td style="text-align:center;">
905.8602
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
17486434
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.12200
</td>
<td style="text-align:center;">
896.3146
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
19941073
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.05600
</td>
<td style="text-align:center;">
861.5932
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
23007669
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.98900
</td>
<td style="text-align:center;">
904.8961
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
26480870
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.80400
</td>
<td style="text-align:center;">
795.7573
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
30646495
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.78400
</td>
<td style="text-align:center;">
673.7478
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
35481645
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.41200
</td>
<td style="text-align:center;">
672.7748
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
41672143
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.54800
</td>
<td style="text-align:center;">
457.7192
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
47798986
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.58700
</td>
<td style="text-align:center;">
312.1884
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
55379852
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.96600
</td>
<td style="text-align:center;">
241.1659
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Dem. Rep.
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
64606759
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.46200
</td>
<td style="text-align:center;">
277.5519
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
854885
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.11100
</td>
<td style="text-align:center;">
2125.6214
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
940458
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.05300
</td>
<td style="text-align:center;">
2315.0566
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1047924
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.43500
</td>
<td style="text-align:center;">
2464.7832
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1179760
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.04000
</td>
<td style="text-align:center;">
2677.9396
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1340458
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.90700
</td>
<td style="text-align:center;">
3213.1527
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1536769
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.62500
</td>
<td style="text-align:center;">
3259.1790
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1774735
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.69500
</td>
<td style="text-align:center;">
4879.5075
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2064095
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.47000
</td>
<td style="text-align:center;">
4201.1949
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
2409073
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.43300
</td>
<td style="text-align:center;">
4016.2395
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2800947
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.96200
</td>
<td style="text-align:center;">
3484.1644
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3328795
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.97000
</td>
<td style="text-align:center;">
3484.0620
</td>
</tr>
<tr>
<td style="text-align:left;">
Congo, Rep.
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3800610
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.32200
</td>
<td style="text-align:center;">
3632.5578
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
926317
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.20600
</td>
<td style="text-align:center;">
2627.0095
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1112300
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.02600
</td>
<td style="text-align:center;">
2990.0108
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1345187
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.84200
</td>
<td style="text-align:center;">
3460.9370
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1588717
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.42400
</td>
<td style="text-align:center;">
4161.7278
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1834796
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.84900
</td>
<td style="text-align:center;">
5118.1469
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2108457
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.75000
</td>
<td style="text-align:center;">
5926.8770
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2424367
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.45000
</td>
<td style="text-align:center;">
5262.7348
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2799811
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.75200
</td>
<td style="text-align:center;">
5629.9153
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3173216
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.71300
</td>
<td style="text-align:center;">
6160.4163
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3518107
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
77.26000
</td>
<td style="text-align:center;">
6677.0453
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3834934
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.12300
</td>
<td style="text-align:center;">
7723.4472
</td>
</tr>
<tr>
<td style="text-align:left;">
Costa Rica
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4133884
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.78200
</td>
<td style="text-align:center;">
9645.0614
</td>
</tr>
<tr>
<td style="text-align:left;">
Cote dIvoire 1952 2977019 Africa 40.477 1388.594732 Cote dIvoire
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3300000
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.46900
</td>
<td style="text-align:center;">
1500.8959
</td>
</tr>
<tr>
<td style="text-align:left;">
Cote dIvoire 1962 3832408 Africa 44.93 1728.869428 Cote dIvoire
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4744870
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.35000
</td>
<td style="text-align:center;">
2052.0505
</td>
</tr>
<tr>
<td style="text-align:left;">
Cote dIvoire 1972 6071696 Africa 49.801 2378.201111 Cote dIvoire
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
7459574
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.37400
</td>
<td style="text-align:center;">
2517.7365
</td>
</tr>
<tr>
<td style="text-align:left;">
Cote dIvoire 1982 9025951 Africa 53.983 2602.710169 Cote dIvoire
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
10761098
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.65500
</td>
<td style="text-align:center;">
2156.9561
</td>
</tr>
<tr>
<td style="text-align:left;">
Cote dIvoire 1992 12772596 Africa 52.044 1648.073791 Cote dIvoire
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
14625967
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.99100
</td>
<td style="text-align:center;">
1786.2654
</td>
</tr>
<tr>
<td style="text-align:left;">
Cote dIvoire 2002 16252726 Africa 46.832 1648.800823 Cote dIvoire
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
18013409
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.32800
</td>
<td style="text-align:center;">
1544.7501
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3882229
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.21000
</td>
<td style="text-align:center;">
3119.2365
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3991242
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.77000
</td>
<td style="text-align:center;">
4338.2316
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4076557
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.13000
</td>
<td style="text-align:center;">
5477.8900
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4174366
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.50000
</td>
<td style="text-align:center;">
6960.2979
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4225310
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.61000
</td>
<td style="text-align:center;">
9164.0901
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4318673
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.64000
</td>
<td style="text-align:center;">
11305.3852
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4413368
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.46000
</td>
<td style="text-align:center;">
13221.8218
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4484310
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.52000
</td>
<td style="text-align:center;">
13822.5839
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4494013
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.52700
</td>
<td style="text-align:center;">
8447.7949
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4444595
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.68000
</td>
<td style="text-align:center;">
9875.6045
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4481020
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.87600
</td>
<td style="text-align:center;">
11628.3890
</td>
</tr>
<tr>
<td style="text-align:left;">
Croatia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4493312
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.74800
</td>
<td style="text-align:center;">
14619.2227
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6007797
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.42100
</td>
<td style="text-align:center;">
5586.5388
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
6640752
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.32500
</td>
<td style="text-align:center;">
6092.1744
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7254373
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.24600
</td>
<td style="text-align:center;">
5180.7559
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8139332
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.29000
</td>
<td style="text-align:center;">
5690.2680
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
8831348
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.72300
</td>
<td style="text-align:center;">
5305.4453
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
9537988
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.64900
</td>
<td style="text-align:center;">
6380.4950
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9789224
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.71700
</td>
<td style="text-align:center;">
7316.9181
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
10239839
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.17400
</td>
<td style="text-align:center;">
7532.9248
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10723260
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.41400
</td>
<td style="text-align:center;">
5592.8440
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10983007
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
76.15100
</td>
<td style="text-align:center;">
5431.9904
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
11226999
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
77.15800
</td>
<td style="text-align:center;">
6340.6467
</td>
</tr>
<tr>
<td style="text-align:left;">
Cuba
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
11416987
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.27300
</td>
<td style="text-align:center;">
8948.1029
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
9125183
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.87000
</td>
<td style="text-align:center;">
6876.1403
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9513758
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.03000
</td>
<td style="text-align:center;">
8256.3439
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
9620282
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.90000
</td>
<td style="text-align:center;">
10136.8671
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
9835109
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.38000
</td>
<td style="text-align:center;">
11399.4449
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
9862158
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.29000
</td>
<td style="text-align:center;">
13108.4536
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
10161915
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.71000
</td>
<td style="text-align:center;">
14800.1606
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
10303704
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.96000
</td>
<td style="text-align:center;">
15377.2285
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
10311597
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.58000
</td>
<td style="text-align:center;">
16310.4434
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10315702
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.40000
</td>
<td style="text-align:center;">
14297.0212
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10300707
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.01000
</td>
<td style="text-align:center;">
16048.5142
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10256295
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.51000
</td>
<td style="text-align:center;">
17596.2102
</td>
</tr>
<tr>
<td style="text-align:left;">
Czech Republic
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10228744
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.48600
</td>
<td style="text-align:center;">
22833.3085
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4334000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.78000
</td>
<td style="text-align:center;">
9692.3852
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4487831
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.81000
</td>
<td style="text-align:center;">
11099.6593
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4646899
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.35000
</td>
<td style="text-align:center;">
13583.3135
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4838800
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.96000
</td>
<td style="text-align:center;">
15937.2112
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4991596
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.47000
</td>
<td style="text-align:center;">
18866.2072
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5088419
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.69000
</td>
<td style="text-align:center;">
20422.9015
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5117810
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.63000
</td>
<td style="text-align:center;">
21688.0405
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5127024
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.80000
</td>
<td style="text-align:center;">
25116.1758
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5171393
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.33000
</td>
<td style="text-align:center;">
26406.7399
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5283663
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.11000
</td>
<td style="text-align:center;">
29804.3457
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5374693
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.18000
</td>
<td style="text-align:center;">
32166.5001
</td>
</tr>
<tr>
<td style="text-align:left;">
Denmark
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
5468120
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.33200
</td>
<td style="text-align:center;">
35278.4187
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
63149
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.81200
</td>
<td style="text-align:center;">
2669.5295
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
71851
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.32800
</td>
<td style="text-align:center;">
2864.9691
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
89898
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.69300
</td>
<td style="text-align:center;">
3020.9893
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
127617
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.07400
</td>
<td style="text-align:center;">
3020.0505
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
178848
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.36600
</td>
<td style="text-align:center;">
3694.2124
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
228694
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.51900
</td>
<td style="text-align:center;">
3081.7610
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
305991
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.81200
</td>
<td style="text-align:center;">
2879.4681
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
311025
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.04000
</td>
<td style="text-align:center;">
2880.1026
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
384156
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.60400
</td>
<td style="text-align:center;">
2377.1562
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
417908
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.15700
</td>
<td style="text-align:center;">
1895.0170
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
447416
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.37300
</td>
<td style="text-align:center;">
1908.2609
</td>
</tr>
<tr>
<td style="text-align:left;">
Djibouti
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
496374
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.79100
</td>
<td style="text-align:center;">
2082.4816
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2491346
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
45.92800
</td>
<td style="text-align:center;">
1397.7171
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2923186
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
49.82800
</td>
<td style="text-align:center;">
1544.4030
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3453434
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
53.45900
</td>
<td style="text-align:center;">
1662.1374
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4049146
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.75100
</td>
<td style="text-align:center;">
1653.7230
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4671329
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.63100
</td>
<td style="text-align:center;">
2189.8745
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5302800
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.78800
</td>
<td style="text-align:center;">
2681.9889
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5968349
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.72700
</td>
<td style="text-align:center;">
2861.0924
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
6655297
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.04600
</td>
<td style="text-align:center;">
2899.8422
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
7351181
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.45700
</td>
<td style="text-align:center;">
3044.2142
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
7992357
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.95700
</td>
<td style="text-align:center;">
3614.1013
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
8650322
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.84700
</td>
<td style="text-align:center;">
4563.8082
</td>
</tr>
<tr>
<td style="text-align:left;">
Dominican Republic
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
9319622
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.23500
</td>
<td style="text-align:center;">
6025.3748
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3548753
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
48.35700
</td>
<td style="text-align:center;">
3522.1107
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4058385
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
51.35600
</td>
<td style="text-align:center;">
3780.5467
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4681707
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
54.64000
</td>
<td style="text-align:center;">
4086.1141
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
5432424
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.67800
</td>
<td style="text-align:center;">
4579.0742
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
6298651
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.79600
</td>
<td style="text-align:center;">
5280.9947
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
7278866
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.31000
</td>
<td style="text-align:center;">
6679.6233
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
8365850
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.34200
</td>
<td style="text-align:center;">
7213.7913
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
9545158
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.23100
</td>
<td style="text-align:center;">
6481.7770
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10748394
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.61300
</td>
<td style="text-align:center;">
7103.7026
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
11911819
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.31200
</td>
<td style="text-align:center;">
7429.4559
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
12921234
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.17300
</td>
<td style="text-align:center;">
5773.0445
</td>
</tr>
<tr>
<td style="text-align:left;">
Ecuador
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
13755680
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.99400
</td>
<td style="text-align:center;">
6873.2623
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
22223309
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.89300
</td>
<td style="text-align:center;">
1418.8224
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
25009741
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.44400
</td>
<td style="text-align:center;">
1458.9153
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
28173309
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.99200
</td>
<td style="text-align:center;">
1693.3359
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
31681188
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.29300
</td>
<td style="text-align:center;">
1814.8807
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
34807417
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.13700
</td>
<td style="text-align:center;">
2024.0081
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
38783863
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.31900
</td>
<td style="text-align:center;">
2785.4936
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
45681811
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.00600
</td>
<td style="text-align:center;">
3503.7296
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
52799062
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.79700
</td>
<td style="text-align:center;">
3885.4607
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
59402198
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
63.67400
</td>
<td style="text-align:center;">
3794.7552
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
66134291
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
67.21700
</td>
<td style="text-align:center;">
4173.1818
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
73312559
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
69.80600
</td>
<td style="text-align:center;">
4754.6044
</td>
</tr>
<tr>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
80264543
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
71.33800
</td>
<td style="text-align:center;">
5581.1810
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2042865
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
45.26200
</td>
<td style="text-align:center;">
3048.3029
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2355805
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
48.57000
</td>
<td style="text-align:center;">
3421.5232
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2747687
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
52.30700
</td>
<td style="text-align:center;">
3776.8036
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3232927
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.85500
</td>
<td style="text-align:center;">
4358.5954
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3790903
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.20700
</td>
<td style="text-align:center;">
4520.2460
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4282586
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.69600
</td>
<td style="text-align:center;">
5138.9224
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4474873
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.60400
</td>
<td style="text-align:center;">
4098.3442
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4842194
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.15400
</td>
<td style="text-align:center;">
4140.4421
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5274649
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.79800
</td>
<td style="text-align:center;">
4444.2317
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5783439
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.53500
</td>
<td style="text-align:center;">
5154.8255
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
6353681
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.73400
</td>
<td style="text-align:center;">
5351.5687
</td>
</tr>
<tr>
<td style="text-align:left;">
El Salvador
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6939688
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.87800
</td>
<td style="text-align:center;">
5728.3535
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
216964
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.48200
</td>
<td style="text-align:center;">
375.6431
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
232922
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.98300
</td>
<td style="text-align:center;">
426.0964
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
249220
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.48500
</td>
<td style="text-align:center;">
582.8420
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
259864
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.98700
</td>
<td style="text-align:center;">
915.5960
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
277603
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.51600
</td>
<td style="text-align:center;">
672.4123
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
192675
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.02400
</td>
<td style="text-align:center;">
958.5668
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
285483
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.66200
</td>
<td style="text-align:center;">
927.8253
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
341244
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.66400
</td>
<td style="text-align:center;">
966.8968
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
387838
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.54500
</td>
<td style="text-align:center;">
1132.0550
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
439971
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.24500
</td>
<td style="text-align:center;">
2814.4808
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
495627
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.34800
</td>
<td style="text-align:center;">
7703.4959
</td>
</tr>
<tr>
<td style="text-align:left;">
Equatorial Guinea
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
551201
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.57900
</td>
<td style="text-align:center;">
12154.0897
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1438760
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.92800
</td>
<td style="text-align:center;">
328.9406
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1542611
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.04700
</td>
<td style="text-align:center;">
344.1619
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1666618
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.15800
</td>
<td style="text-align:center;">
380.9958
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1820319
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.18900
</td>
<td style="text-align:center;">
468.7950
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2260187
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.14200
</td>
<td style="text-align:center;">
514.3242
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2512642
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.53500
</td>
<td style="text-align:center;">
505.7538
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2637297
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.89000
</td>
<td style="text-align:center;">
524.8758
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2915959
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.45300
</td>
<td style="text-align:center;">
521.1341
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3668440
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.99100
</td>
<td style="text-align:center;">
582.8585
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4058319
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.37800
</td>
<td style="text-align:center;">
913.4708
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4414865
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.24000
</td>
<td style="text-align:center;">
765.3500
</td>
</tr>
<tr>
<td style="text-align:left;">
Eritrea
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4906585
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.04000
</td>
<td style="text-align:center;">
641.3695
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
20860941
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.07800
</td>
<td style="text-align:center;">
362.1463
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
22815614
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.66700
</td>
<td style="text-align:center;">
378.9042
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
25145372
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.05900
</td>
<td style="text-align:center;">
419.4564
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
27860297
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.11500
</td>
<td style="text-align:center;">
516.1186
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
30770372
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.51500
</td>
<td style="text-align:center;">
566.2439
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
34617799
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.51000
</td>
<td style="text-align:center;">
556.8084
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
38111756
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.91600
</td>
<td style="text-align:center;">
577.8607
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
42999530
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.68400
</td>
<td style="text-align:center;">
573.7413
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
52088559
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.09100
</td>
<td style="text-align:center;">
421.3535
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
59861301
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.40200
</td>
<td style="text-align:center;">
515.8894
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
67946797
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.72500
</td>
<td style="text-align:center;">
530.0535
</td>
</tr>
<tr>
<td style="text-align:left;">
Ethiopia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
76511887
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.94700
</td>
<td style="text-align:center;">
690.8056
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4090500
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.55000
</td>
<td style="text-align:center;">
6424.5191
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4324000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.49000
</td>
<td style="text-align:center;">
7545.4154
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4491443
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.75000
</td>
<td style="text-align:center;">
9371.8426
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4605744
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.83000
</td>
<td style="text-align:center;">
10921.6363
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4639657
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.87000
</td>
<td style="text-align:center;">
14358.8759
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4738902
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.52000
</td>
<td style="text-align:center;">
15605.4228
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4826933
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.55000
</td>
<td style="text-align:center;">
18533.1576
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4931729
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.83000
</td>
<td style="text-align:center;">
21141.0122
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5041039
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.70000
</td>
<td style="text-align:center;">
20647.1650
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5134406
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.13000
</td>
<td style="text-align:center;">
23723.9502
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5193039
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.37000
</td>
<td style="text-align:center;">
28204.5906
</td>
</tr>
<tr>
<td style="text-align:left;">
Finland
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
5238460
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.31300
</td>
<td style="text-align:center;">
33207.0844
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
42459667
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.41000
</td>
<td style="text-align:center;">
7029.8093
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
44310863
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.93000
</td>
<td style="text-align:center;">
8662.8349
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
47124000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.51000
</td>
<td style="text-align:center;">
10560.4855
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
49569000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.55000
</td>
<td style="text-align:center;">
12999.9177
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
51732000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.38000
</td>
<td style="text-align:center;">
16107.1917
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
53165019
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.83000
</td>
<td style="text-align:center;">
18292.6351
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
54433565
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.89000
</td>
<td style="text-align:center;">
20293.8975
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
55630100
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.34000
</td>
<td style="text-align:center;">
22066.4421
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
57374179
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.46000
</td>
<td style="text-align:center;">
24703.7961
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
58623428
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.64000
</td>
<td style="text-align:center;">
25889.7849
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
59925035
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.59000
</td>
<td style="text-align:center;">
28926.0323
</td>
</tr>
<tr>
<td style="text-align:left;">
France
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
61083916
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.65700
</td>
<td style="text-align:center;">
30470.0167
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
420702
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.00300
</td>
<td style="text-align:center;">
4293.4765
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
434904
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.99900
</td>
<td style="text-align:center;">
4976.1981
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
455661
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.48900
</td>
<td style="text-align:center;">
6631.4592
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
489004
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.59800
</td>
<td style="text-align:center;">
8358.7620
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
537977
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.69000
</td>
<td style="text-align:center;">
11401.9484
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
706367
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.79000
</td>
<td style="text-align:center;">
21745.5733
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
753874
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.56400
</td>
<td style="text-align:center;">
15113.3619
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
880397
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.19000
</td>
<td style="text-align:center;">
11864.4084
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
985739
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.36600
</td>
<td style="text-align:center;">
13522.1575
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1126189
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.46100
</td>
<td style="text-align:center;">
14722.8419
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1299304
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.76100
</td>
<td style="text-align:center;">
12521.7139
</td>
</tr>
<tr>
<td style="text-align:left;">
Gabon
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1454867
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.73500
</td>
<td style="text-align:center;">
13206.4845
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
284320
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
30.00000
</td>
<td style="text-align:center;">
485.2307
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
323150
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
32.06500
</td>
<td style="text-align:center;">
520.9267
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
374020
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
33.89600
</td>
<td style="text-align:center;">
599.6503
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
439593
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.85700
</td>
<td style="text-align:center;">
734.7829
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
517101
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.30800
</td>
<td style="text-align:center;">
756.0868
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
608274
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.84200
</td>
<td style="text-align:center;">
884.7553
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
715523
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.58000
</td>
<td style="text-align:center;">
835.8096
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
848406
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.26500
</td>
<td style="text-align:center;">
611.6589
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1025384
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.64400
</td>
<td style="text-align:center;">
665.6244
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1235767
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.86100
</td>
<td style="text-align:center;">
653.7302
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1457766
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.04100
</td>
<td style="text-align:center;">
660.5856
</td>
</tr>
<tr>
<td style="text-align:left;">
Gambia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1688359
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.44800
</td>
<td style="text-align:center;">
752.7497
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
69145952
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.50000
</td>
<td style="text-align:center;">
7144.1144
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
71019069
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.10000
</td>
<td style="text-align:center;">
10187.8267
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
73739117
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.30000
</td>
<td style="text-align:center;">
12902.4629
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
76368453
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.80000
</td>
<td style="text-align:center;">
14745.6256
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
78717088
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.00000
</td>
<td style="text-align:center;">
18016.1803
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
78160773
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.50000
</td>
<td style="text-align:center;">
20512.9212
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
78335266
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.80000
</td>
<td style="text-align:center;">
22031.5327
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
77718298
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.84700
</td>
<td style="text-align:center;">
24639.1857
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
80597764
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.07000
</td>
<td style="text-align:center;">
26505.3032
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
82011073
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.34000
</td>
<td style="text-align:center;">
27788.8842
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
82350671
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.67000
</td>
<td style="text-align:center;">
30035.8020
</td>
</tr>
<tr>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
82400996
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.40600
</td>
<td style="text-align:center;">
32170.3744
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
5581001
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.14900
</td>
<td style="text-align:center;">
911.2989
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
6391288
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.77900
</td>
<td style="text-align:center;">
1043.5615
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7355248
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.45200
</td>
<td style="text-align:center;">
1190.0411
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8490213
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.07200
</td>
<td style="text-align:center;">
1125.6972
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
9354120
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.87500
</td>
<td style="text-align:center;">
1178.2237
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
10538093
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.75600
</td>
<td style="text-align:center;">
993.2240
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
11400338
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.74400
</td>
<td style="text-align:center;">
876.0326
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
14168101
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.72900
</td>
<td style="text-align:center;">
847.0061
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
16278738
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.50100
</td>
<td style="text-align:center;">
925.0602
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
18418288
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.55600
</td>
<td style="text-align:center;">
1005.2458
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
20550751
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.45300
</td>
<td style="text-align:center;">
1111.9846
</td>
</tr>
<tr>
<td style="text-align:left;">
Ghana
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
22873338
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.02200
</td>
<td style="text-align:center;">
1327.6089
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
7733250
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
65.86000
</td>
<td style="text-align:center;">
3530.6901
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
8096218
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.86000
</td>
<td style="text-align:center;">
4916.2999
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
8448233
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.51000
</td>
<td style="text-align:center;">
6017.1907
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8716441
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.00000
</td>
<td style="text-align:center;">
8513.0970
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
8888628
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.34000
</td>
<td style="text-align:center;">
12724.8296
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
9308479
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.68000
</td>
<td style="text-align:center;">
14195.5243
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9786480
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.24000
</td>
<td style="text-align:center;">
15268.4209
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
9974490
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.67000
</td>
<td style="text-align:center;">
16120.5284
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10325429
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.03000
</td>
<td style="text-align:center;">
17541.4963
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10502372
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.86900
</td>
<td style="text-align:center;">
18747.6981
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10603863
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.25600
</td>
<td style="text-align:center;">
22514.2548
</td>
</tr>
<tr>
<td style="text-align:left;">
Greece
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10706290
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.48300
</td>
<td style="text-align:center;">
27538.4119
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3146381
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
42.02300
</td>
<td style="text-align:center;">
2428.2378
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3640876
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
44.14200
</td>
<td style="text-align:center;">
2617.1560
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4208858
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
46.95400
</td>
<td style="text-align:center;">
2750.3644
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4690773
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
50.01600
</td>
<td style="text-align:center;">
3242.5311
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5149581
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
53.73800
</td>
<td style="text-align:center;">
4031.4083
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5703430
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.02900
</td>
<td style="text-align:center;">
4879.9927
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6395630
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.13700
</td>
<td style="text-align:center;">
4820.4948
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7326406
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.78200
</td>
<td style="text-align:center;">
4246.4860
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8486949
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.37300
</td>
<td style="text-align:center;">
4439.4508
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9803875
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.32200
</td>
<td style="text-align:center;">
4684.3138
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
11178650
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.97800
</td>
<td style="text-align:center;">
4858.3475
</td>
</tr>
<tr>
<td style="text-align:left;">
Guatemala
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
12572928
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.25900
</td>
<td style="text-align:center;">
5186.0500
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2664249
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
33.60900
</td>
<td style="text-align:center;">
510.1965
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2876726
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.55800
</td>
<td style="text-align:center;">
576.2670
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3140003
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.75300
</td>
<td style="text-align:center;">
686.3737
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3451418
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.19700
</td>
<td style="text-align:center;">
708.7595
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3811387
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.84200
</td>
<td style="text-align:center;">
741.6662
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4227026
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.76200
</td>
<td style="text-align:center;">
874.6859
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4710497
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.89100
</td>
<td style="text-align:center;">
857.2504
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5650262
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.55200
</td>
<td style="text-align:center;">
805.5725
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
6990574
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.57600
</td>
<td style="text-align:center;">
794.3484
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
8048834
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.45500
</td>
<td style="text-align:center;">
869.4498
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
8807818
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.67600
</td>
<td style="text-align:center;">
945.5836
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
9947814
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.00700
</td>
<td style="text-align:center;">
942.6542
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
580653
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
32.50000
</td>
<td style="text-align:center;">
299.8503
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
601095
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
33.48900
</td>
<td style="text-align:center;">
431.7905
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
627820
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.48800
</td>
<td style="text-align:center;">
522.0344
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
601287
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.49200
</td>
<td style="text-align:center;">
715.5806
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
625361
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.48600
</td>
<td style="text-align:center;">
820.2246
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
745228
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.46500
</td>
<td style="text-align:center;">
764.7260
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
825987
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.32700
</td>
<td style="text-align:center;">
838.1240
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
927524
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.24500
</td>
<td style="text-align:center;">
736.4154
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1050938
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.26600
</td>
<td style="text-align:center;">
745.5399
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1193708
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.87300
</td>
<td style="text-align:center;">
796.6645
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1332459
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.50400
</td>
<td style="text-align:center;">
575.7047
</td>
</tr>
<tr>
<td style="text-align:left;">
Guinea-Bissau
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1472041
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.38800
</td>
<td style="text-align:center;">
579.2317
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3201488
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
37.57900
</td>
<td style="text-align:center;">
1840.3669
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3507701
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
40.69600
</td>
<td style="text-align:center;">
1726.8879
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3880130
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
43.59000
</td>
<td style="text-align:center;">
1796.5890
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4318137
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
46.24300
</td>
<td style="text-align:center;">
1452.0577
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4698301
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
48.04200
</td>
<td style="text-align:center;">
1654.4569
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4908554
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
49.92300
</td>
<td style="text-align:center;">
1874.2989
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5198399
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
51.46100
</td>
<td style="text-align:center;">
2011.1595
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5756203
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
53.63600
</td>
<td style="text-align:center;">
1823.0160
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
6326682
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.08900
</td>
<td style="text-align:center;">
1456.3095
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
6913545
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
56.67100
</td>
<td style="text-align:center;">
1341.7269
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7607651
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.13700
</td>
<td style="text-align:center;">
1270.3649
</td>
</tr>
<tr>
<td style="text-align:left;">
Haiti
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
8502814
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.91600
</td>
<td style="text-align:center;">
1201.6372
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1517453
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
41.91200
</td>
<td style="text-align:center;">
2194.9262
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1770390
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
44.66500
</td>
<td style="text-align:center;">
2220.4877
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2090162
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
48.04100
</td>
<td style="text-align:center;">
2291.1568
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2500689
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
50.92400
</td>
<td style="text-align:center;">
2538.2694
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2965146
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
53.88400
</td>
<td style="text-align:center;">
2529.8423
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3055235
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.40200
</td>
<td style="text-align:center;">
3203.2081
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3669448
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.90900
</td>
<td style="text-align:center;">
3121.7608
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4372203
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.49200
</td>
<td style="text-align:center;">
3023.0967
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5077347
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.39900
</td>
<td style="text-align:center;">
3081.6946
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5867957
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.65900
</td>
<td style="text-align:center;">
3160.4549
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
6677328
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.56500
</td>
<td style="text-align:center;">
3099.7287
</td>
</tr>
<tr>
<td style="text-align:left;">
Honduras
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
7483763
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.19800
</td>
<td style="text-align:center;">
3548.3308
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2125900
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.96000
</td>
<td style="text-align:center;">
3054.4212
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2736300
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.75000
</td>
<td style="text-align:center;">
3629.0765
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3305200
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.65000
</td>
<td style="text-align:center;">
4692.6483
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3722800
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.00000
</td>
<td style="text-align:center;">
6197.9628
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4115700
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.00000
</td>
<td style="text-align:center;">
8315.9281
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4583700
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.60000
</td>
<td style="text-align:center;">
11186.1413
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5264500
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.45000
</td>
<td style="text-align:center;">
14560.5305
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5584510
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
76.20000
</td>
<td style="text-align:center;">
20038.4727
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5829696
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
77.60100
</td>
<td style="text-align:center;">
24757.6030
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
6495918
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
80.00000
</td>
<td style="text-align:center;">
28377.6322
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
6762476
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
81.49500
</td>
<td style="text-align:center;">
30209.0152
</td>
</tr>
<tr>
<td style="text-align:left;">
Hong Kong, China
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6980412
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
82.20800
</td>
<td style="text-align:center;">
39724.9787
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
9504000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.03000
</td>
<td style="text-align:center;">
5263.6738
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9839000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.41000
</td>
<td style="text-align:center;">
6040.1800
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10063000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.96000
</td>
<td style="text-align:center;">
7550.3599
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
10223422
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.50000
</td>
<td style="text-align:center;">
9326.6447
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
10394091
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.76000
</td>
<td style="text-align:center;">
10168.6561
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
10637171
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.95000
</td>
<td style="text-align:center;">
11674.8374
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
10705535
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.39000
</td>
<td style="text-align:center;">
12545.9907
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
10612740
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.58000
</td>
<td style="text-align:center;">
12986.4800
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10348684
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.17000
</td>
<td style="text-align:center;">
10535.6285
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10244684
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.04000
</td>
<td style="text-align:center;">
11712.7768
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10083313
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.59000
</td>
<td style="text-align:center;">
14843.9356
</td>
</tr>
<tr>
<td style="text-align:left;">
Hungary
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
9956108
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.33800
</td>
<td style="text-align:center;">
18008.9444
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
147962
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.49000
</td>
<td style="text-align:center;">
7267.6884
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
165110
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.47000
</td>
<td style="text-align:center;">
9244.0014
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
182053
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.68000
</td>
<td style="text-align:center;">
10350.1591
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
198676
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.73000
</td>
<td style="text-align:center;">
13319.8957
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
209275
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.46000
</td>
<td style="text-align:center;">
15798.0636
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
221823
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.11000
</td>
<td style="text-align:center;">
19654.9625
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
233997
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.99000
</td>
<td style="text-align:center;">
23269.6075
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
244676
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.23000
</td>
<td style="text-align:center;">
26923.2063
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
259012
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.77000
</td>
<td style="text-align:center;">
25144.3920
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
271192
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.95000
</td>
<td style="text-align:center;">
28061.0997
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
288030
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.50000
</td>
<td style="text-align:center;">
31163.2020
</td>
</tr>
<tr>
<td style="text-align:left;">
Iceland
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
301931
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
81.75700
</td>
<td style="text-align:center;">
36180.7892
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
372000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
37.37300
</td>
<td style="text-align:center;">
546.5657
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
409000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
40.24900
</td>
<td style="text-align:center;">
590.0620
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
454000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.60500
</td>
<td style="text-align:center;">
658.3472
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
506000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
47.19300
</td>
<td style="text-align:center;">
700.7706
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
567000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.65100
</td>
<td style="text-align:center;">
724.0325
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
634000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
54.20800
</td>
<td style="text-align:center;">
813.3373
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
708000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.59600
</td>
<td style="text-align:center;">
855.7235
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
788000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.55300
</td>
<td style="text-align:center;">
976.5127
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
872000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.22300
</td>
<td style="text-align:center;">
1164.4068
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
959000000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.76500
</td>
<td style="text-align:center;">
1458.8174
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1034172547
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.87900
</td>
<td style="text-align:center;">
1746.7695
</td>
</tr>
<tr>
<td style="text-align:left;">
India
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1110396331
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.69800
</td>
<td style="text-align:center;">
2452.2104
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
82052000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
37.46800
</td>
<td style="text-align:center;">
749.6817
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
90124000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.91800
</td>
<td style="text-align:center;">
858.9003
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
99028000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
42.51800
</td>
<td style="text-align:center;">
849.2898
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
109343000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.96400
</td>
<td style="text-align:center;">
762.4318
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
121282000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.20300
</td>
<td style="text-align:center;">
1111.1079
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
136725000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.70200
</td>
<td style="text-align:center;">
1382.7021
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
153343000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.15900
</td>
<td style="text-align:center;">
1516.8730
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
169276000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.13700
</td>
<td style="text-align:center;">
1748.3570
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
184816000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.68100
</td>
<td style="text-align:center;">
2383.1409
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
199278000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.04100
</td>
<td style="text-align:center;">
3119.3356
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
211060000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.58800
</td>
<td style="text-align:center;">
2873.9129
</td>
</tr>
<tr>
<td style="text-align:left;">
Indonesia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
223547000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.65000
</td>
<td style="text-align:center;">
3540.6516
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
17272000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
44.86900
</td>
<td style="text-align:center;">
3035.3260
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
19792000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
47.18100
</td>
<td style="text-align:center;">
3290.2576
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
22874000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.32500
</td>
<td style="text-align:center;">
4187.3298
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
26538000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.46900
</td>
<td style="text-align:center;">
5906.7318
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
30614000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.23400
</td>
<td style="text-align:center;">
9613.8186
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
35480679
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.70200
</td>
<td style="text-align:center;">
11888.5951
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
43072751
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.62000
</td>
<td style="text-align:center;">
7608.3346
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
51889696
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.04000
</td>
<td style="text-align:center;">
6642.8814
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
60397973
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.74200
</td>
<td style="text-align:center;">
7235.6532
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
63327987
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.04200
</td>
<td style="text-align:center;">
8263.5903
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
66907826
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.45100
</td>
<td style="text-align:center;">
9240.7620
</td>
</tr>
<tr>
<td style="text-align:left;">
Iran
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
69453570
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.96400
</td>
<td style="text-align:center;">
11605.7145
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
5441766
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.32000
</td>
<td style="text-align:center;">
4129.7661
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
6248643
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
48.43700
</td>
<td style="text-align:center;">
6229.3336
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7240260
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
51.45700
</td>
<td style="text-align:center;">
8341.7378
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8519282
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
54.45900
</td>
<td style="text-align:center;">
8931.4598
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
10061506
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.95000
</td>
<td style="text-align:center;">
9576.0376
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
11882916
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.41300
</td>
<td style="text-align:center;">
14688.2351
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
14173318
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.03800
</td>
<td style="text-align:center;">
14517.9071
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
16543189
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.04400
</td>
<td style="text-align:center;">
11643.5727
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
17861905
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.46100
</td>
<td style="text-align:center;">
3745.6407
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
20775703
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.81100
</td>
<td style="text-align:center;">
3076.2398
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
24001816
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.04600
</td>
<td style="text-align:center;">
4390.7173
</td>
</tr>
<tr>
<td style="text-align:left;">
Iraq
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
27499638
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.54500
</td>
<td style="text-align:center;">
4471.0619
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2952156
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.91000
</td>
<td style="text-align:center;">
5210.2803
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2878220
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.90000
</td>
<td style="text-align:center;">
5599.0779
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2830000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.29000
</td>
<td style="text-align:center;">
6631.5973
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2900100
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.08000
</td>
<td style="text-align:center;">
7655.5690
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3024400
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.28000
</td>
<td style="text-align:center;">
9530.7729
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3271900
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.03000
</td>
<td style="text-align:center;">
11150.9811
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3480000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.10000
</td>
<td style="text-align:center;">
12618.3214
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3539900
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.36000
</td>
<td style="text-align:center;">
13872.8665
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3557761
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.46700
</td>
<td style="text-align:center;">
17558.8155
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3667233
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.12200
</td>
<td style="text-align:center;">
24521.9471
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3879155
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.78300
</td>
<td style="text-align:center;">
34077.0494
</td>
</tr>
<tr>
<td style="text-align:left;">
Ireland
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4109086
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.88500
</td>
<td style="text-align:center;">
40675.9964
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1620914
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.39000
</td>
<td style="text-align:center;">
4086.5221
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1944401
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.84000
</td>
<td style="text-align:center;">
5385.2785
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2310904
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.39000
</td>
<td style="text-align:center;">
7105.6307
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2693585
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.75000
</td>
<td style="text-align:center;">
8393.7414
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3095893
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.63000
</td>
<td style="text-align:center;">
12786.9322
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3495918
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.06000
</td>
<td style="text-align:center;">
13306.6192
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3858421
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.45000
</td>
<td style="text-align:center;">
15367.0292
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4203148
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.60000
</td>
<td style="text-align:center;">
17122.4799
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4936550
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
76.93000
</td>
<td style="text-align:center;">
18051.5225
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5531387
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
78.26900
</td>
<td style="text-align:center;">
20896.6092
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
6029529
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
79.69600
</td>
<td style="text-align:center;">
21905.5951
</td>
</tr>
<tr>
<td style="text-align:left;">
Israel
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6426679
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
80.74500
</td>
<td style="text-align:center;">
25523.2771
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
47666000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
65.94000
</td>
<td style="text-align:center;">
4931.4042
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
49182000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.81000
</td>
<td style="text-align:center;">
6248.6562
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
50843200
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.24000
</td>
<td style="text-align:center;">
8243.5823
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
52667100
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.06000
</td>
<td style="text-align:center;">
10022.4013
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
54365564
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.19000
</td>
<td style="text-align:center;">
12269.2738
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
56059245
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.48000
</td>
<td style="text-align:center;">
14255.9847
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
56535636
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.98000
</td>
<td style="text-align:center;">
16537.4835
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
56729703
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.42000
</td>
<td style="text-align:center;">
19207.2348
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
56840847
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.44000
</td>
<td style="text-align:center;">
22013.6449
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
57479469
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.82000
</td>
<td style="text-align:center;">
24675.0245
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
57926999
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.24000
</td>
<td style="text-align:center;">
27968.0982
</td>
</tr>
<tr>
<td style="text-align:left;">
Italy
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
58147733
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.54600
</td>
<td style="text-align:center;">
28569.7197
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1426095
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.53000
</td>
<td style="text-align:center;">
2898.5309
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1535090
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.61000
</td>
<td style="text-align:center;">
4756.5258
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1665128
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.61000
</td>
<td style="text-align:center;">
5246.1075
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1861096
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.51000
</td>
<td style="text-align:center;">
6124.7035
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1997616
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.00000
</td>
<td style="text-align:center;">
7433.8893
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2156814
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.11000
</td>
<td style="text-align:center;">
6650.1956
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2298309
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.21000
</td>
<td style="text-align:center;">
6068.0513
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2326606
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.77000
</td>
<td style="text-align:center;">
6351.2375
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
2378618
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.76600
</td>
<td style="text-align:center;">
7404.9237
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2531311
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.26200
</td>
<td style="text-align:center;">
7121.9247
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2664659
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.04700
</td>
<td style="text-align:center;">
6994.7749
</td>
</tr>
<tr>
<td style="text-align:left;">
Jamaica
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
2780132
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.56700
</td>
<td style="text-align:center;">
7320.8803
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
86459025
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.03000
</td>
<td style="text-align:center;">
3216.9563
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
91563009
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.50000
</td>
<td style="text-align:center;">
4317.6944
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
95831757
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.73000
</td>
<td style="text-align:center;">
6576.6495
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
100825279
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.43000
</td>
<td style="text-align:center;">
9847.7886
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
107188273
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.42000
</td>
<td style="text-align:center;">
14778.7864
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
113872473
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.38000
</td>
<td style="text-align:center;">
16610.3770
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
118454974
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
77.11000
</td>
<td style="text-align:center;">
19384.1057
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
122091325
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
78.67000
</td>
<td style="text-align:center;">
22375.9419
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
124329269
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
79.36000
</td>
<td style="text-align:center;">
26824.8951
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
125956499
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
80.69000
</td>
<td style="text-align:center;">
28816.5850
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
127065841
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
82.00000
</td>
<td style="text-align:center;">
28604.5919
</td>
</tr>
<tr>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
127467972
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
82.60300
</td>
<td style="text-align:center;">
31656.0681
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
607914
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.15800
</td>
<td style="text-align:center;">
1546.9078
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
746559
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.66900
</td>
<td style="text-align:center;">
1886.0806
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
933559
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
48.12600
</td>
<td style="text-align:center;">
2348.0092
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1255058
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
51.62900
</td>
<td style="text-align:center;">
2741.7963
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1613551
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.52800
</td>
<td style="text-align:center;">
2110.8563
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1937652
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.13400
</td>
<td style="text-align:center;">
2852.3516
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2347031
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.73900
</td>
<td style="text-align:center;">
4161.4160
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2820042
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.86900
</td>
<td style="text-align:center;">
4448.6799
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3867409
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.01500
</td>
<td style="text-align:center;">
3431.5936
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4526235
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.77200
</td>
<td style="text-align:center;">
3645.3796
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5307470
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.26300
</td>
<td style="text-align:center;">
3844.9172
</td>
</tr>
<tr>
<td style="text-align:left;">
Jordan
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6053193
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.53500
</td>
<td style="text-align:center;">
4519.4612
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6464046
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.27000
</td>
<td style="text-align:center;">
853.5409
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7454779
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.68600
</td>
<td style="text-align:center;">
944.4383
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
8678557
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.94900
</td>
<td style="text-align:center;">
896.9664
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
10191512
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.65400
</td>
<td style="text-align:center;">
1056.7365
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
12044785
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.55900
</td>
<td style="text-align:center;">
1222.3600
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
14500404
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.15500
</td>
<td style="text-align:center;">
1267.6132
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
17661452
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.76600
</td>
<td style="text-align:center;">
1348.2258
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
21198082
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.33900
</td>
<td style="text-align:center;">
1361.9369
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
25020539
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.28500
</td>
<td style="text-align:center;">
1341.9217
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
28263827
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.40700
</td>
<td style="text-align:center;">
1360.4850
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
31386842
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.99200
</td>
<td style="text-align:center;">
1287.5147
</td>
</tr>
<tr>
<td style="text-align:left;">
Kenya
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
35610177
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.11000
</td>
<td style="text-align:center;">
1463.2493
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8865488
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.05600
</td>
<td style="text-align:center;">
1088.2778
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9411381
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
54.08100
</td>
<td style="text-align:center;">
1571.1347
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10917494
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.65600
</td>
<td style="text-align:center;">
1621.6936
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
12617009
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.94200
</td>
<td style="text-align:center;">
2143.5406
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
14781241
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.98300
</td>
<td style="text-align:center;">
3701.6215
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
16325320
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.15900
</td>
<td style="text-align:center;">
4106.3012
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
17647518
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.10000
</td>
<td style="text-align:center;">
4106.5253
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
19067554
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.64700
</td>
<td style="text-align:center;">
4106.4923
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
20711375
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.97800
</td>
<td style="text-align:center;">
3726.0635
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
21585105
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.72700
</td>
<td style="text-align:center;">
1690.7568
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
22215365
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.66200
</td>
<td style="text-align:center;">
1646.7582
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Dem. Rep.
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
23301725
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.29700
</td>
<td style="text-align:center;">
1593.0655
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
20947571
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
47.45300
</td>
<td style="text-align:center;">
1030.5922
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
22611552
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.68100
</td>
<td style="text-align:center;">
1487.5935
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
26420307
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.29200
</td>
<td style="text-align:center;">
1536.3444
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
30131000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.71600
</td>
<td style="text-align:center;">
2029.2281
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
33505000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.61200
</td>
<td style="text-align:center;">
3030.8767
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
36436000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.76600
</td>
<td style="text-align:center;">
4657.2210
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
39326000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.12300
</td>
<td style="text-align:center;">
5622.9425
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
41622000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.81000
</td>
<td style="text-align:center;">
8533.0888
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
43805450
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.24400
</td>
<td style="text-align:center;">
12104.2787
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
46173816
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.64700
</td>
<td style="text-align:center;">
15993.5280
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
47969150
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
77.04500
</td>
<td style="text-align:center;">
19233.9882
</td>
</tr>
<tr>
<td style="text-align:left;">
Korea, Rep.
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
49044790
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
78.62300
</td>
<td style="text-align:center;">
23348.1397
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
160000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.56500
</td>
<td style="text-align:center;">
108382.3529
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
212846
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.03300
</td>
<td style="text-align:center;">
113523.1329
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
358266
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.47000
</td>
<td style="text-align:center;">
95458.1118
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
575003
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.62400
</td>
<td style="text-align:center;">
80894.8833
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
841934
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.71200
</td>
<td style="text-align:center;">
109347.8670
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1140357
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.34300
</td>
<td style="text-align:center;">
59265.4771
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1497494
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.30900
</td>
<td style="text-align:center;">
31354.0357
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1891487
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.17400
</td>
<td style="text-align:center;">
28118.4300
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1418095
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.19000
</td>
<td style="text-align:center;">
34932.9196
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1765345
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
76.15600
</td>
<td style="text-align:center;">
40300.6200
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2111561
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
76.90400
</td>
<td style="text-align:center;">
35110.1057
</td>
</tr>
<tr>
<td style="text-align:left;">
Kuwait
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
2505559
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
77.58800
</td>
<td style="text-align:center;">
47306.9898
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1439529
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.92800
</td>
<td style="text-align:center;">
4834.8041
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1647412
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.48900
</td>
<td style="text-align:center;">
6089.7869
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1886848
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.09400
</td>
<td style="text-align:center;">
5714.5606
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2186894
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.87000
</td>
<td style="text-align:center;">
6006.9830
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2680018
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.42100
</td>
<td style="text-align:center;">
7486.3843
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3115787
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.09900
</td>
<td style="text-align:center;">
8659.6968
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3086876
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.98300
</td>
<td style="text-align:center;">
7640.5195
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3089353
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.92600
</td>
<td style="text-align:center;">
5377.0913
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3219994
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.29200
</td>
<td style="text-align:center;">
6890.8069
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3430388
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.26500
</td>
<td style="text-align:center;">
8754.9639
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3677780
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.02800
</td>
<td style="text-align:center;">
9313.9388
</td>
</tr>
<tr>
<td style="text-align:left;">
Lebanon
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3921278
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.99300
</td>
<td style="text-align:center;">
10461.0587
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
748747
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.13800
</td>
<td style="text-align:center;">
298.8462
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
813338
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.04700
</td>
<td style="text-align:center;">
335.9971
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
893143
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.74700
</td>
<td style="text-align:center;">
411.8006
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
996380
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.49200
</td>
<td style="text-align:center;">
498.6390
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1116779
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.76700
</td>
<td style="text-align:center;">
496.5816
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1251524
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.20800
</td>
<td style="text-align:center;">
745.3695
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1411807
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.07800
</td>
<td style="text-align:center;">
797.2631
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1599200
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.18000
</td>
<td style="text-align:center;">
773.9932
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1803195
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.68500
</td>
<td style="text-align:center;">
977.4863
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1982823
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.55800
</td>
<td style="text-align:center;">
1186.1480
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2046772
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.59300
</td>
<td style="text-align:center;">
1275.1846
</td>
</tr>
<tr>
<td style="text-align:left;">
Lesotho
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
2012649
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.59200
</td>
<td style="text-align:center;">
1569.3314
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
863308
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.48000
</td>
<td style="text-align:center;">
575.5730
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
975950
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.48600
</td>
<td style="text-align:center;">
620.9700
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1112796
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.50200
</td>
<td style="text-align:center;">
634.1952
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1279406
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.53600
</td>
<td style="text-align:center;">
713.6036
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1482628
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.61400
</td>
<td style="text-align:center;">
803.0055
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1703617
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.76400
</td>
<td style="text-align:center;">
640.3224
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1956875
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.85200
</td>
<td style="text-align:center;">
572.1996
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2269414
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.02700
</td>
<td style="text-align:center;">
506.1139
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1912974
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.80200
</td>
<td style="text-align:center;">
636.6229
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2200725
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.22100
</td>
<td style="text-align:center;">
609.1740
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2814651
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.75300
</td>
<td style="text-align:center;">
531.4824
</td>
</tr>
<tr>
<td style="text-align:left;">
Liberia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3193942
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.67800
</td>
<td style="text-align:center;">
414.5073
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1019729
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.72300
</td>
<td style="text-align:center;">
2387.5481
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1201578
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.28900
</td>
<td style="text-align:center;">
3448.2844
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1441863
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.80800
</td>
<td style="text-align:center;">
6757.0308
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1759224
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.22700
</td>
<td style="text-align:center;">
18772.7517
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2183877
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.77300
</td>
<td style="text-align:center;">
21011.4972
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2721783
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.44200
</td>
<td style="text-align:center;">
21951.2118
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3344074
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.15500
</td>
<td style="text-align:center;">
17364.2754
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3799845
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
66.23400
</td>
<td style="text-align:center;">
11770.5898
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4364501
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
68.75500
</td>
<td style="text-align:center;">
9640.1385
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4759670
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
71.55500
</td>
<td style="text-align:center;">
9467.4461
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5368585
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
72.73700
</td>
<td style="text-align:center;">
9534.6775
</td>
</tr>
<tr>
<td style="text-align:left;">
Libya
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6036914
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
73.95200
</td>
<td style="text-align:center;">
12057.4993
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4762912
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.68100
</td>
<td style="text-align:center;">
1443.0117
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
5181679
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.86500
</td>
<td style="text-align:center;">
1589.2027
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
5703324
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.84800
</td>
<td style="text-align:center;">
1643.3871
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
6334556
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.88100
</td>
<td style="text-align:center;">
1634.0473
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
7082430
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.85100
</td>
<td style="text-align:center;">
1748.5630
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
8007166
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.88100
</td>
<td style="text-align:center;">
1544.2286
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9171477
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.96900
</td>
<td style="text-align:center;">
1302.8787
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
10568642
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.35000
</td>
<td style="text-align:center;">
1155.4419
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
12210395
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.21400
</td>
<td style="text-align:center;">
1040.6762
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
14165114
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.97800
</td>
<td style="text-align:center;">
986.2959
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
16473477
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.28600
</td>
<td style="text-align:center;">
894.6371
</td>
</tr>
<tr>
<td style="text-align:left;">
Madagascar
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
19167654
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.44300
</td>
<td style="text-align:center;">
1044.7701
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2917802
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.25600
</td>
<td style="text-align:center;">
369.1651
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3221238
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.20700
</td>
<td style="text-align:center;">
416.3698
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3628608
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.41000
</td>
<td style="text-align:center;">
427.9011
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4147252
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.48700
</td>
<td style="text-align:center;">
495.5148
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4730997
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.76600
</td>
<td style="text-align:center;">
584.6220
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5637246
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.76700
</td>
<td style="text-align:center;">
663.2237
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6502825
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.64200
</td>
<td style="text-align:center;">
632.8039
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7824747
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.45700
</td>
<td style="text-align:center;">
635.5174
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10014249
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.42000
</td>
<td style="text-align:center;">
563.2000
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10419991
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.49500
</td>
<td style="text-align:center;">
692.2758
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
11824495
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.00900
</td>
<td style="text-align:center;">
665.4231
</td>
</tr>
<tr>
<td style="text-align:left;">
Malawi
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
13327079
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.30300
</td>
<td style="text-align:center;">
759.3499
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6748378
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
48.46300
</td>
<td style="text-align:center;">
1831.1329
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7739235
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.10200
</td>
<td style="text-align:center;">
1810.0670
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
8906385
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.73700
</td>
<td style="text-align:center;">
2036.8849
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
10154878
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.37100
</td>
<td style="text-align:center;">
2277.7424
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
11441462
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.01000
</td>
<td style="text-align:center;">
2849.0948
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
12845381
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.25600
</td>
<td style="text-align:center;">
3827.9216
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
14441916
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.00000
</td>
<td style="text-align:center;">
4920.3560
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
16331785
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.50000
</td>
<td style="text-align:center;">
5249.8027
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
18319502
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.69300
</td>
<td style="text-align:center;">
7277.9128
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
20476091
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.93800
</td>
<td style="text-align:center;">
10132.9096
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
22662365
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.04400
</td>
<td style="text-align:center;">
10206.9779
</td>
</tr>
<tr>
<td style="text-align:left;">
Malaysia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
24821286
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.24100
</td>
<td style="text-align:center;">
12451.6558
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3838168
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
33.68500
</td>
<td style="text-align:center;">
452.3370
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4241884
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.30700
</td>
<td style="text-align:center;">
490.3822
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4690372
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.93600
</td>
<td style="text-align:center;">
496.1743
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
5212416
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.48700
</td>
<td style="text-align:center;">
545.0099
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5828158
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.97700
</td>
<td style="text-align:center;">
581.3689
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
6491649
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.71400
</td>
<td style="text-align:center;">
686.3953
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6998256
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.91600
</td>
<td style="text-align:center;">
618.0141
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7634008
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.36400
</td>
<td style="text-align:center;">
684.1716
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8416215
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.38800
</td>
<td style="text-align:center;">
739.0144
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9384984
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.90300
</td>
<td style="text-align:center;">
790.2580
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10580176
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.81800
</td>
<td style="text-align:center;">
951.4098
</td>
</tr>
<tr>
<td style="text-align:left;">
Mali
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
12031795
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.46700
</td>
<td style="text-align:center;">
1042.5816
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1022556
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.54300
</td>
<td style="text-align:center;">
743.1159
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1076852
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.33800
</td>
<td style="text-align:center;">
846.1203
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1146757
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.24800
</td>
<td style="text-align:center;">
1055.8960
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1230542
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.28900
</td>
<td style="text-align:center;">
1421.1452
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1332786
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.43700
</td>
<td style="text-align:center;">
1586.8518
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1456688
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.85200
</td>
<td style="text-align:center;">
1497.4922
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1622136
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.59900
</td>
<td style="text-align:center;">
1481.1502
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1841240
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.14500
</td>
<td style="text-align:center;">
1421.6036
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
2119465
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.33300
</td>
<td style="text-align:center;">
1361.3698
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2444741
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.43000
</td>
<td style="text-align:center;">
1483.1361
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2828858
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.24700
</td>
<td style="text-align:center;">
1579.0195
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritania
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3270065
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
64.16400
</td>
<td style="text-align:center;">
1803.1515
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
516556
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.98600
</td>
<td style="text-align:center;">
1967.9557
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
609816
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.08900
</td>
<td style="text-align:center;">
2034.0380
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
701016
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.24600
</td>
<td style="text-align:center;">
2529.0675
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
789309
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.55700
</td>
<td style="text-align:center;">
2475.3876
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
851334
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.94400
</td>
<td style="text-align:center;">
2575.4842
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
913025
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
64.93000
</td>
<td style="text-align:center;">
3710.9830
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
992040
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
66.71100
</td>
<td style="text-align:center;">
3688.0377
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1042663
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
68.74000
</td>
<td style="text-align:center;">
4783.5869
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1096202
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
69.74500
</td>
<td style="text-align:center;">
6058.2538
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1149818
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
70.73600
</td>
<td style="text-align:center;">
7425.7053
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1200206
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
71.95400
</td>
<td style="text-align:center;">
9021.8159
</td>
</tr>
<tr>
<td style="text-align:left;">
Mauritius
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1250882
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
72.80100
</td>
<td style="text-align:center;">
10956.9911
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
30144317
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
50.78900
</td>
<td style="text-align:center;">
3478.1255
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
35015548
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.19000
</td>
<td style="text-align:center;">
4131.5466
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
41121485
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.29900
</td>
<td style="text-align:center;">
4581.6094
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
47995559
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.11000
</td>
<td style="text-align:center;">
5754.7339
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
55984294
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.36100
</td>
<td style="text-align:center;">
6809.4067
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
63759976
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.03200
</td>
<td style="text-align:center;">
7674.9291
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
71640904
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.40500
</td>
<td style="text-align:center;">
9611.1475
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
80122492
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.49800
</td>
<td style="text-align:center;">
8688.1560
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
88111030
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.45500
</td>
<td style="text-align:center;">
9472.3843
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
95895146
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.67000
</td>
<td style="text-align:center;">
9767.2975
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
102479927
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.90200
</td>
<td style="text-align:center;">
10742.4405
</td>
</tr>
<tr>
<td style="text-align:left;">
Mexico
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
108700891
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
76.19500
</td>
<td style="text-align:center;">
11977.5750
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
800663
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
42.24400
</td>
<td style="text-align:center;">
786.5669
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
882134
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.24800
</td>
<td style="text-align:center;">
912.6626
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1010280
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
48.25100
</td>
<td style="text-align:center;">
1056.3540
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1149500
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
51.25300
</td>
<td style="text-align:center;">
1226.0411
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1320500
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.75400
</td>
<td style="text-align:center;">
1421.7420
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1528000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.49100
</td>
<td style="text-align:center;">
1647.5117
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1756032
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.48900
</td>
<td style="text-align:center;">
2000.6031
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2015133
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.22200
</td>
<td style="text-align:center;">
2338.0083
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
2312802
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.27100
</td>
<td style="text-align:center;">
1785.4020
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2494803
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.62500
</td>
<td style="text-align:center;">
1902.2521
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2674234
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.03300
</td>
<td style="text-align:center;">
2140.7393
</td>
</tr>
<tr>
<td style="text-align:left;">
Mongolia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
2874127
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.80300
</td>
<td style="text-align:center;">
3095.7723
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
413834
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
59.16400
</td>
<td style="text-align:center;">
2647.5856
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
442829
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.44800
</td>
<td style="text-align:center;">
3682.2599
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
474528
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
63.72800
</td>
<td style="text-align:center;">
4649.5938
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
501035
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.17800
</td>
<td style="text-align:center;">
5907.8509
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
527678
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.63600
</td>
<td style="text-align:center;">
7778.4140
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
560073
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.06600
</td>
<td style="text-align:center;">
9595.9299
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
562548
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.10100
</td>
<td style="text-align:center;">
11222.5876
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
569473
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.86500
</td>
<td style="text-align:center;">
11732.5102
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
621621
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.43500
</td>
<td style="text-align:center;">
7003.3390
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
692651
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.44500
</td>
<td style="text-align:center;">
6465.6133
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
720230
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.98100
</td>
<td style="text-align:center;">
6557.1943
</td>
</tr>
<tr>
<td style="text-align:left;">
Montenegro
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
684736
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.54300
</td>
<td style="text-align:center;">
9253.8961
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
9939217
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.87300
</td>
<td style="text-align:center;">
1688.2036
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
11406350
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.42300
</td>
<td style="text-align:center;">
1642.0023
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
13056604
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.92400
</td>
<td style="text-align:center;">
1566.3535
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
14770296
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.33500
</td>
<td style="text-align:center;">
1711.0448
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
16660670
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.86200
</td>
<td style="text-align:center;">
1930.1950
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
18396941
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.73000
</td>
<td style="text-align:center;">
2370.6200
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
20198730
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.65000
</td>
<td style="text-align:center;">
2702.6204
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
22987397
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.67700
</td>
<td style="text-align:center;">
2755.0470
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
25798239
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
65.39300
</td>
<td style="text-align:center;">
2948.0473
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
28529501
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
67.66000
</td>
<td style="text-align:center;">
2982.1019
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
31167783
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
69.61500
</td>
<td style="text-align:center;">
3258.4956
</td>
</tr>
<tr>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
33757175
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
71.16400
</td>
<td style="text-align:center;">
3820.1752
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6446316
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
31.28600
</td>
<td style="text-align:center;">
468.5260
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7038035
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
33.77900
</td>
<td style="text-align:center;">
495.5868
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7788944
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.16100
</td>
<td style="text-align:center;">
556.6864
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8680909
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.11300
</td>
<td style="text-align:center;">
566.6692
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
9809596
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.32800
</td>
<td style="text-align:center;">
724.9178
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
11127868
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.49500
</td>
<td style="text-align:center;">
502.3197
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
12587223
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.79500
</td>
<td style="text-align:center;">
462.2114
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
12891952
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.86100
</td>
<td style="text-align:center;">
389.8762
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
13160731
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.28400
</td>
<td style="text-align:center;">
410.8968
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
16603334
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.34400
</td>
<td style="text-align:center;">
472.3461
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
18473780
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.02600
</td>
<td style="text-align:center;">
633.6179
</td>
</tr>
<tr>
<td style="text-align:left;">
Mozambique
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
19951656
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.08200
</td>
<td style="text-align:center;">
823.6856
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
20092996
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
36.31900
</td>
<td style="text-align:center;">
331.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
21731844
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
41.90500
</td>
<td style="text-align:center;">
350.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
23634436
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.10800
</td>
<td style="text-align:center;">
388.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
25870271
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.37900
</td>
<td style="text-align:center;">
349.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
28466390
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.07000
</td>
<td style="text-align:center;">
357.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
31528087
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.05900
</td>
<td style="text-align:center;">
371.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
34680442
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.05600
</td>
<td style="text-align:center;">
424.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
38028578
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.33900
</td>
<td style="text-align:center;">
385.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
40546538
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.32000
</td>
<td style="text-align:center;">
347.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
43247867
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.32800
</td>
<td style="text-align:center;">
415.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
45598081
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.90800
</td>
<td style="text-align:center;">
611.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Myanmar
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
47761980
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.06900
</td>
<td style="text-align:center;">
944.0000
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
485831
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.72500
</td>
<td style="text-align:center;">
2423.7804
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
548080
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.22600
</td>
<td style="text-align:center;">
2621.4481
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
621392
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.38600
</td>
<td style="text-align:center;">
3173.2156
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
706640
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.15900
</td>
<td style="text-align:center;">
3793.6948
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
821782
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.86700
</td>
<td style="text-align:center;">
3746.0809
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
977026
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.43700
</td>
<td style="text-align:center;">
3876.4860
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1099010
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.96800
</td>
<td style="text-align:center;">
4191.1005
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1278184
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.83500
</td>
<td style="text-align:center;">
3693.7313
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1554253
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.99900
</td>
<td style="text-align:center;">
3804.5380
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1774766
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.90900
</td>
<td style="text-align:center;">
3899.5243
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1972153
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.47900
</td>
<td style="text-align:center;">
4072.3248
</td>
</tr>
<tr>
<td style="text-align:left;">
Namibia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
2055080
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.90600
</td>
<td style="text-align:center;">
4811.0604
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
9182536
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
36.15700
</td>
<td style="text-align:center;">
545.8657
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9682338
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
37.68600
</td>
<td style="text-align:center;">
597.9364
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10332057
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.39300
</td>
<td style="text-align:center;">
652.3969
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
11261690
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
41.47200
</td>
<td style="text-align:center;">
676.4422
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
12412593
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.97100
</td>
<td style="text-align:center;">
674.7881
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
13933198
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
46.74800
</td>
<td style="text-align:center;">
694.1124
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
15796314
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.59400
</td>
<td style="text-align:center;">
718.3731
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
17917180
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.53700
</td>
<td style="text-align:center;">
775.6325
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
20326209
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.72700
</td>
<td style="text-align:center;">
897.7404
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
23001113
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
59.42600
</td>
<td style="text-align:center;">
1010.8921
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
25873917
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.34000
</td>
<td style="text-align:center;">
1057.2063
</td>
</tr>
<tr>
<td style="text-align:left;">
Nepal
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
28901790
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.78500
</td>
<td style="text-align:center;">
1091.3598
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
10381988
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.13000
</td>
<td style="text-align:center;">
8941.5719
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
11026383
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.99000
</td>
<td style="text-align:center;">
11276.1934
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
11805689
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.23000
</td>
<td style="text-align:center;">
12790.8496
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
12596822
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.82000
</td>
<td style="text-align:center;">
15363.2514
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
13329874
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.75000
</td>
<td style="text-align:center;">
18794.7457
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
13852989
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.24000
</td>
<td style="text-align:center;">
21209.0592
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
14310401
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.05000
</td>
<td style="text-align:center;">
21399.4605
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
14665278
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.83000
</td>
<td style="text-align:center;">
23651.3236
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
15174244
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.42000
</td>
<td style="text-align:center;">
26790.9496
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
15604464
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.03000
</td>
<td style="text-align:center;">
30246.1306
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
16122830
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.53000
</td>
<td style="text-align:center;">
33724.7578
</td>
</tr>
<tr>
<td style="text-align:left;">
Netherlands
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
16570613
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.76200
</td>
<td style="text-align:center;">
36797.9333
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1994794
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
69.39000
</td>
<td style="text-align:center;">
10556.5757
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2229407
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
70.26000
</td>
<td style="text-align:center;">
12247.3953
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2488550
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
71.24000
</td>
<td style="text-align:center;">
13175.6780
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2728150
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
71.52000
</td>
<td style="text-align:center;">
14463.9189
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2929100
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
71.89000
</td>
<td style="text-align:center;">
16046.0373
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3164900
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
72.22000
</td>
<td style="text-align:center;">
16233.7177
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3210650
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
73.84000
</td>
<td style="text-align:center;">
17632.4104
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3317166
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
74.32000
</td>
<td style="text-align:center;">
19007.1913
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3437674
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
76.33000
</td>
<td style="text-align:center;">
18363.3249
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3676187
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
77.55000
</td>
<td style="text-align:center;">
21050.4138
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3908037
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
79.11000
</td>
<td style="text-align:center;">
23189.8014
</td>
</tr>
<tr>
<td style="text-align:left;">
New Zealand
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4115771
</td>
<td style="text-align:center;">
Oceania
</td>
<td style="text-align:center;">
80.20400
</td>
<td style="text-align:center;">
25185.0091
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1165790
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
42.31400
</td>
<td style="text-align:center;">
3112.3639
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1358828
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
45.43200
</td>
<td style="text-align:center;">
3457.4159
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1590597
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
48.63200
</td>
<td style="text-align:center;">
3634.3644
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1865490
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
51.88400
</td>
<td style="text-align:center;">
4643.3935
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2182908
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.15100
</td>
<td style="text-align:center;">
4688.5933
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2554598
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.47000
</td>
<td style="text-align:center;">
5486.3711
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2979423
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.29800
</td>
<td style="text-align:center;">
3470.3382
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3344353
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.00800
</td>
<td style="text-align:center;">
2955.9844
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4017939
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.84300
</td>
<td style="text-align:center;">
2170.1517
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4609572
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.42600
</td>
<td style="text-align:center;">
2253.0230
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5146848
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.83600
</td>
<td style="text-align:center;">
2474.5488
</td>
</tr>
<tr>
<td style="text-align:left;">
Nicaragua
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
5675356
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.89900
</td>
<td style="text-align:center;">
2749.3210
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3379468
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.44400
</td>
<td style="text-align:center;">
761.8794
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3692184
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.59800
</td>
<td style="text-align:center;">
835.5234
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4076008
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.48700
</td>
<td style="text-align:center;">
997.7661
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4534062
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.11800
</td>
<td style="text-align:center;">
1054.3849
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5060262
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.54600
</td>
<td style="text-align:center;">
954.2092
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5682086
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.29100
</td>
<td style="text-align:center;">
808.8971
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6437188
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.59800
</td>
<td style="text-align:center;">
909.7221
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7332638
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.55500
</td>
<td style="text-align:center;">
668.3000
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8392818
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.39100
</td>
<td style="text-align:center;">
581.1827
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9666252
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.31300
</td>
<td style="text-align:center;">
580.3052
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
11140655
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.49600
</td>
<td style="text-align:center;">
601.0745
</td>
</tr>
<tr>
<td style="text-align:left;">
Niger
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
12894865
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.86700
</td>
<td style="text-align:center;">
619.6769
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
33119096
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.32400
</td>
<td style="text-align:center;">
1077.2819
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
37173340
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.80200
</td>
<td style="text-align:center;">
1100.5926
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
41871351
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.36000
</td>
<td style="text-align:center;">
1150.9275
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
47287752
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.04000
</td>
<td style="text-align:center;">
1014.5141
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
53740085
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.82100
</td>
<td style="text-align:center;">
1698.3888
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
62209173
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.51400
</td>
<td style="text-align:center;">
1981.9518
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
73039376
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.82600
</td>
<td style="text-align:center;">
1576.9738
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
81551520
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.88600
</td>
<td style="text-align:center;">
1385.0296
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
93364244
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.47200
</td>
<td style="text-align:center;">
1619.8482
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
106207839
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.46400
</td>
<td style="text-align:center;">
1624.9413
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
119901274
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.60800
</td>
<td style="text-align:center;">
1615.2864
</td>
</tr>
<tr>
<td style="text-align:left;">
Nigeria
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
135031164
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.85900
</td>
<td style="text-align:center;">
2013.9773
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3327728
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.67000
</td>
<td style="text-align:center;">
10095.4217
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3491938
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.44000
</td>
<td style="text-align:center;">
11653.9730
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3638919
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.47000
</td>
<td style="text-align:center;">
13450.4015
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3786019
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.08000
</td>
<td style="text-align:center;">
16361.8765
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3933004
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.34000
</td>
<td style="text-align:center;">
18965.0555
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4043205
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.37000
</td>
<td style="text-align:center;">
23311.3494
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
4114787
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.97000
</td>
<td style="text-align:center;">
26298.6353
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
4186147
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.89000
</td>
<td style="text-align:center;">
31540.9748
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4286357
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.32000
</td>
<td style="text-align:center;">
33965.6611
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4405672
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.32000
</td>
<td style="text-align:center;">
41283.1643
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4535591
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.05000
</td>
<td style="text-align:center;">
44683.9753
</td>
</tr>
<tr>
<td style="text-align:left;">
Norway
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4627926
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.19600
</td>
<td style="text-align:center;">
49357.1902
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
507833
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
37.57800
</td>
<td style="text-align:center;">
1828.2303
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
561977
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
40.08000
</td>
<td style="text-align:center;">
2242.7466
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
628164
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.16500
</td>
<td style="text-align:center;">
2924.6381
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
714775
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
46.98800
</td>
<td style="text-align:center;">
4720.9427
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
829050
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.14300
</td>
<td style="text-align:center;">
10618.0385
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1004533
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.36700
</td>
<td style="text-align:center;">
11848.3439
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1301048
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.72800
</td>
<td style="text-align:center;">
12954.7910
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1593882
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.73400
</td>
<td style="text-align:center;">
18115.2231
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1915208
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.19700
</td>
<td style="text-align:center;">
18616.7069
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2283635
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.49900
</td>
<td style="text-align:center;">
19702.0558
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2713462
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.19300
</td>
<td style="text-align:center;">
19774.8369
</td>
</tr>
<tr>
<td style="text-align:left;">
Oman
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3204897
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.64000
</td>
<td style="text-align:center;">
22316.1929
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
41346560
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.43600
</td>
<td style="text-align:center;">
684.5971
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
46679944
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.55700
</td>
<td style="text-align:center;">
747.0835
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
53100671
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
47.67000
</td>
<td style="text-align:center;">
803.3427
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
60641899
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.80000
</td>
<td style="text-align:center;">
942.4083
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
69325921
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
51.92900
</td>
<td style="text-align:center;">
1049.9390
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
78152686
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
54.04300
</td>
<td style="text-align:center;">
1175.9212
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
91462088
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.15800
</td>
<td style="text-align:center;">
1443.4298
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
105186881
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.24500
</td>
<td style="text-align:center;">
1704.6866
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
120065004
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.83800
</td>
<td style="text-align:center;">
1971.8295
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
135564834
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.81800
</td>
<td style="text-align:center;">
2049.3505
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
153403524
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.61000
</td>
<td style="text-align:center;">
2092.7124
</td>
</tr>
<tr>
<td style="text-align:left;">
Pakistan
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
169270617
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.48300
</td>
<td style="text-align:center;">
2605.9476
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
940080
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.19100
</td>
<td style="text-align:center;">
2480.3803
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1063506
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.20100
</td>
<td style="text-align:center;">
2961.8009
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1215725
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.81700
</td>
<td style="text-align:center;">
3536.5403
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1405486
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.07100
</td>
<td style="text-align:center;">
4421.0091
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1616384
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.21600
</td>
<td style="text-align:center;">
5364.2497
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1839782
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.68100
</td>
<td style="text-align:center;">
5351.9121
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2036305
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.47200
</td>
<td style="text-align:center;">
7009.6016
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2253639
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.52300
</td>
<td style="text-align:center;">
7034.7792
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
2484997
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.46200
</td>
<td style="text-align:center;">
6618.7431
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2734531
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.73800
</td>
<td style="text-align:center;">
7113.6923
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2990875
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.71200
</td>
<td style="text-align:center;">
7356.0319
</td>
</tr>
<tr>
<td style="text-align:left;">
Panama
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3242173
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.53700
</td>
<td style="text-align:center;">
9809.1856
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1555876
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
62.64900
</td>
<td style="text-align:center;">
1952.3087
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1770902
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.19600
</td>
<td style="text-align:center;">
2046.1547
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2009813
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.36100
</td>
<td style="text-align:center;">
2148.0271
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2287985
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.95100
</td>
<td style="text-align:center;">
2299.3763
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2614104
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.81500
</td>
<td style="text-align:center;">
2523.3380
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2984494
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.35300
</td>
<td style="text-align:center;">
3248.3733
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3366439
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.87400
</td>
<td style="text-align:center;">
4258.5036
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3886512
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.37800
</td>
<td style="text-align:center;">
3998.8757
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4483945
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.22500
</td>
<td style="text-align:center;">
4196.4111
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5154123
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.40000
</td>
<td style="text-align:center;">
4247.4003
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5884491
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.75500
</td>
<td style="text-align:center;">
3783.6742
</td>
</tr>
<tr>
<td style="text-align:left;">
Paraguay
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6667147
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.75200
</td>
<td style="text-align:center;">
4172.8385
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8025700
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
43.90200
</td>
<td style="text-align:center;">
3758.5234
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9146100
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
46.26300
</td>
<td style="text-align:center;">
4245.2567
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10516500
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
49.09600
</td>
<td style="text-align:center;">
4957.0380
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
12132200
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
51.44500
</td>
<td style="text-align:center;">
5788.0933
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
13954700
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.44800
</td>
<td style="text-align:center;">
5937.8273
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
15990099
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
58.44700
</td>
<td style="text-align:center;">
6281.2909
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
18125129
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.40600
</td>
<td style="text-align:center;">
6434.5018
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
20195924
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.13400
</td>
<td style="text-align:center;">
6360.9434
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
22430449
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.45800
</td>
<td style="text-align:center;">
4446.3809
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
24748122
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.38600
</td>
<td style="text-align:center;">
5838.3477
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
26769436
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.90600
</td>
<td style="text-align:center;">
5909.0201
</td>
</tr>
<tr>
<td style="text-align:left;">
Peru
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
28674757
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.42100
</td>
<td style="text-align:center;">
7408.9056
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
22438691
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
47.75200
</td>
<td style="text-align:center;">
1272.8810
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
26072194
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
51.33400
</td>
<td style="text-align:center;">
1547.9448
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
30325264
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
54.75700
</td>
<td style="text-align:center;">
1649.5522
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
35356600
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.39300
</td>
<td style="text-align:center;">
1814.1274
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
40850141
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.06500
</td>
<td style="text-align:center;">
1989.3741
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
46850962
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.06000
</td>
<td style="text-align:center;">
2373.2043
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
53456774
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.08200
</td>
<td style="text-align:center;">
2603.2738
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
60017788
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.15100
</td>
<td style="text-align:center;">
2189.6350
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
67185766
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.45800
</td>
<td style="text-align:center;">
2279.3240
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
75012988
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.56400
</td>
<td style="text-align:center;">
2536.5349
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
82995088
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.30300
</td>
<td style="text-align:center;">
2650.9211
</td>
</tr>
<tr>
<td style="text-align:left;">
Philippines
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
91077287
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.68800
</td>
<td style="text-align:center;">
3190.4810
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
25730551
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.31000
</td>
<td style="text-align:center;">
4029.3297
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
28235346
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
65.77000
</td>
<td style="text-align:center;">
4734.2530
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
30329617
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.64000
</td>
<td style="text-align:center;">
5338.7521
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
31785378
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.61000
</td>
<td style="text-align:center;">
6557.1528
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
33039545
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.85000
</td>
<td style="text-align:center;">
8006.5070
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
34621254
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.67000
</td>
<td style="text-align:center;">
9508.1415
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
36227381
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.32000
</td>
<td style="text-align:center;">
8451.5310
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
37740710
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.98000
</td>
<td style="text-align:center;">
9082.3512
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
38370697
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.99000
</td>
<td style="text-align:center;">
7738.8812
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
38654957
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.75000
</td>
<td style="text-align:center;">
10159.5837
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
38625976
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.67000
</td>
<td style="text-align:center;">
12002.2391
</td>
</tr>
<tr>
<td style="text-align:left;">
Poland
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
38518241
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.56300
</td>
<td style="text-align:center;">
15389.9247
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8526050
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
59.82000
</td>
<td style="text-align:center;">
3068.3199
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
8817650
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.51000
</td>
<td style="text-align:center;">
3774.5717
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
9019800
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.39000
</td>
<td style="text-align:center;">
4727.9549
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
9103000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.60000
</td>
<td style="text-align:center;">
6361.5180
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
8970450
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.26000
</td>
<td style="text-align:center;">
9022.2474
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
9662600
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.41000
</td>
<td style="text-align:center;">
10172.4857
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9859650
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.77000
</td>
<td style="text-align:center;">
11753.8429
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
9915289
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.06000
</td>
<td style="text-align:center;">
13039.3088
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
9927680
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.86000
</td>
<td style="text-align:center;">
16207.2666
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10156415
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.97000
</td>
<td style="text-align:center;">
17641.0316
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10433867
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.29000
</td>
<td style="text-align:center;">
19970.9079
</td>
</tr>
<tr>
<td style="text-align:left;">
Portugal
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10642836
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.09800
</td>
<td style="text-align:center;">
20509.6478
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2227000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.28000
</td>
<td style="text-align:center;">
3081.9598
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2260000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.54000
</td>
<td style="text-align:center;">
3907.1562
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2448046
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.62000
</td>
<td style="text-align:center;">
5108.3446
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2648961
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.10000
</td>
<td style="text-align:center;">
6929.2777
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2847132
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.16000
</td>
<td style="text-align:center;">
9123.0417
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3080828
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.44000
</td>
<td style="text-align:center;">
9770.5249
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3279001
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.75000
</td>
<td style="text-align:center;">
10330.9891
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3444468
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.63000
</td>
<td style="text-align:center;">
12281.3419
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3585176
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.91100
</td>
<td style="text-align:center;">
14641.5871
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3759430
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.91700
</td>
<td style="text-align:center;">
16999.4333
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3859606
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
77.77800
</td>
<td style="text-align:center;">
18855.6062
</td>
</tr>
<tr>
<td style="text-align:left;">
Puerto Rico
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3942491
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.74600
</td>
<td style="text-align:center;">
19328.7090
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
257700
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.72400
</td>
<td style="text-align:center;">
2718.8853
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
308700
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.09000
</td>
<td style="text-align:center;">
2769.4518
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
358900
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.66600
</td>
<td style="text-align:center;">
3173.7233
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
414024
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.54200
</td>
<td style="text-align:center;">
4021.1757
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
461633
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
64.27400
</td>
<td style="text-align:center;">
5047.6586
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
492095
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
67.06400
</td>
<td style="text-align:center;">
4319.8041
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
517810
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
69.88500
</td>
<td style="text-align:center;">
5267.2194
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
562035
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
71.91300
</td>
<td style="text-align:center;">
5303.3775
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
622191
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
73.61500
</td>
<td style="text-align:center;">
6101.2558
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
684810
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
74.77200
</td>
<td style="text-align:center;">
6071.9414
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
743981
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
75.74400
</td>
<td style="text-align:center;">
6316.1652
</td>
</tr>
<tr>
<td style="text-align:left;">
Reunion
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
798094
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
76.44200
</td>
<td style="text-align:center;">
7670.1226
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
16630000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.05000
</td>
<td style="text-align:center;">
3144.6132
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
17829327
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.10000
</td>
<td style="text-align:center;">
3943.3702
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
18680721
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.80000
</td>
<td style="text-align:center;">
4734.9976
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
19284814
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.80000
</td>
<td style="text-align:center;">
6470.8665
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
20662648
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.21000
</td>
<td style="text-align:center;">
8011.4144
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
21658597
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.46000
</td>
<td style="text-align:center;">
9356.3972
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
22356726
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.66000
</td>
<td style="text-align:center;">
9605.3141
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
22686371
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.53000
</td>
<td style="text-align:center;">
9696.2733
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
22797027
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.36000
</td>
<td style="text-align:center;">
6598.4099
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
22562458
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.72000
</td>
<td style="text-align:center;">
7346.5476
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
22404337
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.32200
</td>
<td style="text-align:center;">
7885.3601
</td>
</tr>
<tr>
<td style="text-align:left;">
Romania
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
22276056
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.47600
</td>
<td style="text-align:center;">
10808.4756
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2534927
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.00000
</td>
<td style="text-align:center;">
493.3239
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2822082
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.50000
</td>
<td style="text-align:center;">
540.2894
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3051242
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.00000
</td>
<td style="text-align:center;">
597.4731
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3451079
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.10000
</td>
<td style="text-align:center;">
510.9637
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3992121
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.60000
</td>
<td style="text-align:center;">
590.5807
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4657072
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.00000
</td>
<td style="text-align:center;">
670.0806
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5507565
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.21800
</td>
<td style="text-align:center;">
881.5706
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
6349365
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.02000
</td>
<td style="text-align:center;">
847.9912
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
7290203
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
23.59900
</td>
<td style="text-align:center;">
737.0686
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
7212583
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.08700
</td>
<td style="text-align:center;">
589.9445
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7852401
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.41300
</td>
<td style="text-align:center;">
785.6538
</td>
</tr>
<tr>
<td style="text-align:left;">
Rwanda
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
8860588
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.24200
</td>
<td style="text-align:center;">
863.0885
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
60011
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.47100
</td>
<td style="text-align:center;">
879.5836
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
61325
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.94500
</td>
<td style="text-align:center;">
860.7369
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
65345
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.89300
</td>
<td style="text-align:center;">
1071.5511
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
70787
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.42500
</td>
<td style="text-align:center;">
1384.8406
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
76595
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.48000
</td>
<td style="text-align:center;">
1532.9853
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
86796
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.55000
</td>
<td style="text-align:center;">
1737.5617
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
98593
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.35100
</td>
<td style="text-align:center;">
1890.2181
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
110812
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.72800
</td>
<td style="text-align:center;">
1516.5255
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
125911
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.74200
</td>
<td style="text-align:center;">
1428.7778
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
145608
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
63.30600
</td>
<td style="text-align:center;">
1339.0760
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
170372
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
64.33700
</td>
<td style="text-align:center;">
1353.0924
</td>
</tr>
<tr>
<td style="text-align:left;">
Sao Tome and Principe
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
199579
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
65.52800
</td>
<td style="text-align:center;">
1598.4351
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4005677
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.87500
</td>
<td style="text-align:center;">
6459.5548
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4419650
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
42.86800
</td>
<td style="text-align:center;">
8157.5912
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4943029
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.91400
</td>
<td style="text-align:center;">
11626.4197
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
5618198
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.90100
</td>
<td style="text-align:center;">
16903.0489
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
6472756
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.88600
</td>
<td style="text-align:center;">
24837.4287
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
8128505
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.69000
</td>
<td style="text-align:center;">
34167.7626
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
11254672
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.01200
</td>
<td style="text-align:center;">
33693.1753
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
14619745
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.29500
</td>
<td style="text-align:center;">
21198.2614
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
16945857
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.76800
</td>
<td style="text-align:center;">
24841.6178
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
21229759
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.53300
</td>
<td style="text-align:center;">
20586.6902
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
24501530
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.62600
</td>
<td style="text-align:center;">
19014.5412
</td>
</tr>
<tr>
<td style="text-align:left;">
Saudi Arabia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
27601038
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.77700
</td>
<td style="text-align:center;">
21654.8319
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2755589
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
37.27800
</td>
<td style="text-align:center;">
1450.3570
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3054547
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.32900
</td>
<td style="text-align:center;">
1567.6530
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3430243
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.45400
</td>
<td style="text-align:center;">
1654.9887
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3965841
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.56300
</td>
<td style="text-align:center;">
1612.4046
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4588696
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.81500
</td>
<td style="text-align:center;">
1597.7121
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5260855
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.87900
</td>
<td style="text-align:center;">
1561.7691
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6147783
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.37900
</td>
<td style="text-align:center;">
1518.4800
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7171347
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.76900
</td>
<td style="text-align:center;">
1441.7207
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8307920
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.19600
</td>
<td style="text-align:center;">
1367.8994
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9535314
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.18700
</td>
<td style="text-align:center;">
1392.3683
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10870037
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.60000
</td>
<td style="text-align:center;">
1519.6353
</td>
</tr>
<tr>
<td style="text-align:left;">
Senegal
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
12267493
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
63.06200
</td>
<td style="text-align:center;">
1712.4721
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
6860147
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
57.99600
</td>
<td style="text-align:center;">
3581.4594
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7271135
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.68500
</td>
<td style="text-align:center;">
4981.0909
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7616060
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.53100
</td>
<td style="text-align:center;">
6289.6292
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
7971222
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.91400
</td>
<td style="text-align:center;">
7991.7071
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
8313288
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.70000
</td>
<td style="text-align:center;">
10522.0675
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
8686367
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.30000
</td>
<td style="text-align:center;">
12980.6696
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9032824
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.16200
</td>
<td style="text-align:center;">
15181.0927
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
9230783
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.21800
</td>
<td style="text-align:center;">
15870.8785
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
9826397
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.65900
</td>
<td style="text-align:center;">
9325.0682
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
10336594
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.23200
</td>
<td style="text-align:center;">
7914.3203
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10111559
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.21300
</td>
<td style="text-align:center;">
7236.0753
</td>
</tr>
<tr>
<td style="text-align:left;">
Serbia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10150265
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.00200
</td>
<td style="text-align:center;">
9786.5347
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2143249
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
30.33100
</td>
<td style="text-align:center;">
879.7877
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2295678
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
31.57000
</td>
<td style="text-align:center;">
1004.4844
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2467895
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
32.76700
</td>
<td style="text-align:center;">
1116.6399
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2662190
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.11300
</td>
<td style="text-align:center;">
1206.0435
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2879013
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
35.40000
</td>
<td style="text-align:center;">
1353.7598
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
3140897
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.78800
</td>
<td style="text-align:center;">
1348.2852
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
3464522
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.44500
</td>
<td style="text-align:center;">
1465.0108
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3868905
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.00600
</td>
<td style="text-align:center;">
1294.4478
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
4260884
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.33300
</td>
<td style="text-align:center;">
1068.6963
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4578212
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.89700
</td>
<td style="text-align:center;">
574.6482
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5359092
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.01200
</td>
<td style="text-align:center;">
699.4897
</td>
</tr>
<tr>
<td style="text-align:left;">
Sierra Leone
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
6144562
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.56800
</td>
<td style="text-align:center;">
862.5408
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1127000
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.39600
</td>
<td style="text-align:center;">
2315.1382
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1445929
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
63.17900
</td>
<td style="text-align:center;">
2843.1044
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1750200
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.79800
</td>
<td style="text-align:center;">
3674.7356
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1977600
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.94600
</td>
<td style="text-align:center;">
4977.4185
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2152400
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.52100
</td>
<td style="text-align:center;">
8597.7562
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2325300
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.79500
</td>
<td style="text-align:center;">
11210.0895
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2651869
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.76000
</td>
<td style="text-align:center;">
15169.1611
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
2794552
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.56000
</td>
<td style="text-align:center;">
18861.5308
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3235865
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.78800
</td>
<td style="text-align:center;">
24769.8912
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3802309
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
77.15800
</td>
<td style="text-align:center;">
33519.4766
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4197776
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
78.77000
</td>
<td style="text-align:center;">
36023.1054
</td>
</tr>
<tr>
<td style="text-align:left;">
Singapore
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4553009
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
79.97200
</td>
<td style="text-align:center;">
47143.1796
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3558137
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.36000
</td>
<td style="text-align:center;">
5074.6591
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3844277
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.45000
</td>
<td style="text-align:center;">
6093.2630
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4237384
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.33000
</td>
<td style="text-align:center;">
7481.1076
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4442238
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.98000
</td>
<td style="text-align:center;">
8412.9024
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4593433
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.35000
</td>
<td style="text-align:center;">
9674.1676
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4827803
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.45000
</td>
<td style="text-align:center;">
10922.6640
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5048043
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.80000
</td>
<td style="text-align:center;">
11348.5459
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
5199318
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.08000
</td>
<td style="text-align:center;">
12037.2676
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
5302888
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.38000
</td>
<td style="text-align:center;">
9498.4677
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
5383010
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.71000
</td>
<td style="text-align:center;">
12126.2306
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
5410052
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.80000
</td>
<td style="text-align:center;">
13638.7784
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovak Republic
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
5447502
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.66300
</td>
<td style="text-align:center;">
18678.3144
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1489518
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
65.57000
</td>
<td style="text-align:center;">
4215.0417
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1533070
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
67.85000
</td>
<td style="text-align:center;">
5862.2766
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1582962
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.15000
</td>
<td style="text-align:center;">
7402.3034
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1646912
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.18000
</td>
<td style="text-align:center;">
9405.4894
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1694510
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.82000
</td>
<td style="text-align:center;">
12383.4862
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1746919
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.97000
</td>
<td style="text-align:center;">
15277.0302
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1861252
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.06300
</td>
<td style="text-align:center;">
17866.7218
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1945870
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.25000
</td>
<td style="text-align:center;">
18678.5349
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1999210
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.64000
</td>
<td style="text-align:center;">
14214.7168
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2011612
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.13000
</td>
<td style="text-align:center;">
17161.1073
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
2011497
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.66000
</td>
<td style="text-align:center;">
20660.0194
</td>
</tr>
<tr>
<td style="text-align:left;">
Slovenia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
2009245
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.92600
</td>
<td style="text-align:center;">
25768.2576
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2526994
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
32.97800
</td>
<td style="text-align:center;">
1135.7498
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2780415
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
34.97700
</td>
<td style="text-align:center;">
1258.1474
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3080153
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
36.98100
</td>
<td style="text-align:center;">
1369.4883
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3428839
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.97700
</td>
<td style="text-align:center;">
1284.7332
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
3840161
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.97300
</td>
<td style="text-align:center;">
1254.5761
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
4353666
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.97400
</td>
<td style="text-align:center;">
1450.9925
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
5828892
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.95500
</td>
<td style="text-align:center;">
1176.8070
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
6921858
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.50100
</td>
<td style="text-align:center;">
1093.2450
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
6099799
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.65800
</td>
<td style="text-align:center;">
926.9603
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
6633514
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.79500
</td>
<td style="text-align:center;">
930.5964
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7753310
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.93600
</td>
<td style="text-align:center;">
882.0818
</td>
</tr>
<tr>
<td style="text-align:left;">
Somalia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
9118773
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.15900
</td>
<td style="text-align:center;">
926.1411
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
14264935
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.00900
</td>
<td style="text-align:center;">
4725.2955
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
16151549
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.98500
</td>
<td style="text-align:center;">
5487.1042
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
18356657
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.95100
</td>
<td style="text-align:center;">
5768.7297
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
20997321
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.92700
</td>
<td style="text-align:center;">
7114.4780
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
23935810
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.69600
</td>
<td style="text-align:center;">
7765.9626
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
27129932
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.52700
</td>
<td style="text-align:center;">
8028.6514
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
31140029
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.16100
</td>
<td style="text-align:center;">
8568.2662
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
35933379
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.83400
</td>
<td style="text-align:center;">
7825.8234
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
39964159
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
61.88800
</td>
<td style="text-align:center;">
7225.0693
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
42835005
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.23600
</td>
<td style="text-align:center;">
7479.1882
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
44433622
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.36500
</td>
<td style="text-align:center;">
7710.9464
</td>
</tr>
<tr>
<td style="text-align:left;">
South Africa
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
43997828
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.33900
</td>
<td style="text-align:center;">
9269.6578
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
28549870
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
64.94000
</td>
<td style="text-align:center;">
3834.0347
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
29841614
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.66000
</td>
<td style="text-align:center;">
4564.8024
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
31158061
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.69000
</td>
<td style="text-align:center;">
5693.8439
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
32850275
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.44000
</td>
<td style="text-align:center;">
7993.5123
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
34513161
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.06000
</td>
<td style="text-align:center;">
10638.7513
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
36439000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.39000
</td>
<td style="text-align:center;">
13236.9212
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
37983310
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.30000
</td>
<td style="text-align:center;">
13926.1700
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
38880702
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.90000
</td>
<td style="text-align:center;">
15764.9831
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
39549438
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.57000
</td>
<td style="text-align:center;">
18603.0645
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
39855442
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.77000
</td>
<td style="text-align:center;">
20445.2990
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
40152517
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.78000
</td>
<td style="text-align:center;">
24835.4717
</td>
</tr>
<tr>
<td style="text-align:left;">
Spain
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
40448191
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.94100
</td>
<td style="text-align:center;">
28821.0637
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
7982342
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.59300
</td>
<td style="text-align:center;">
1083.5320
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9128546
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.45600
</td>
<td style="text-align:center;">
1072.5466
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10421936
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.19200
</td>
<td style="text-align:center;">
1074.4720
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
11737396
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.26600
</td>
<td style="text-align:center;">
1135.5143
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
13016733
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.04200
</td>
<td style="text-align:center;">
1213.3955
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
14116836
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.94900
</td>
<td style="text-align:center;">
1348.7757
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
15410151
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.75700
</td>
<td style="text-align:center;">
1648.0798
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
16495304
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.01100
</td>
<td style="text-align:center;">
1876.7668
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
17587060
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.37900
</td>
<td style="text-align:center;">
2153.7392
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
18698655
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.45700
</td>
<td style="text-align:center;">
2664.4773
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
19576783
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.81500
</td>
<td style="text-align:center;">
3015.3788
</td>
</tr>
<tr>
<td style="text-align:left;">
Sri Lanka
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
20378239
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.39600
</td>
<td style="text-align:center;">
3970.0954
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8504667
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.63500
</td>
<td style="text-align:center;">
1615.9911
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9753392
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.62400
</td>
<td style="text-align:center;">
1770.3371
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
11183227
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.87000
</td>
<td style="text-align:center;">
1959.5938
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
12716129
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.85800
</td>
<td style="text-align:center;">
1687.9976
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
14597019
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.08300
</td>
<td style="text-align:center;">
1659.6528
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
17104986
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.80000
</td>
<td style="text-align:center;">
2202.9884
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
20367053
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.33800
</td>
<td style="text-align:center;">
1895.5441
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
24725960
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.74400
</td>
<td style="text-align:center;">
1507.8192
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
28227588
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.55600
</td>
<td style="text-align:center;">
1492.1970
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
32160729
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.37300
</td>
<td style="text-align:center;">
1632.2108
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
37090298
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.36900
</td>
<td style="text-align:center;">
1993.3983
</td>
</tr>
<tr>
<td style="text-align:left;">
Sudan
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
42292929
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.55600
</td>
<td style="text-align:center;">
2602.3950
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
290243
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.40700
</td>
<td style="text-align:center;">
1148.3766
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
326741
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.42400
</td>
<td style="text-align:center;">
1244.7084
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
370006
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.99200
</td>
<td style="text-align:center;">
1856.1821
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
420690
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.63300
</td>
<td style="text-align:center;">
2613.1017
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
480105
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.55200
</td>
<td style="text-align:center;">
3364.8366
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
551425
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.53700
</td>
<td style="text-align:center;">
3781.4106
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
649901
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.56100
</td>
<td style="text-align:center;">
3895.3840
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
779348
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.67800
</td>
<td style="text-align:center;">
3984.8398
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
962344
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.47400
</td>
<td style="text-align:center;">
3553.0224
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1054486
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
54.28900
</td>
<td style="text-align:center;">
3876.7685
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1130269
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.86900
</td>
<td style="text-align:center;">
4128.1169
</td>
</tr>
<tr>
<td style="text-align:left;">
Swaziland
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1133066
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.61300
</td>
<td style="text-align:center;">
4513.4806
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
7124673
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.86000
</td>
<td style="text-align:center;">
8527.8447
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
7363802
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.49000
</td>
<td style="text-align:center;">
9911.8782
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7561588
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.37000
</td>
<td style="text-align:center;">
12329.4419
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
7867931
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.16000
</td>
<td style="text-align:center;">
15258.2970
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
8122293
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.72000
</td>
<td style="text-align:center;">
17832.0246
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
8251648
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.44000
</td>
<td style="text-align:center;">
18855.7252
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
8325260
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.42000
</td>
<td style="text-align:center;">
20667.3812
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
8421403
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.19000
</td>
<td style="text-align:center;">
23586.9293
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8718867
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.16000
</td>
<td style="text-align:center;">
23880.0168
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
8897619
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.39000
</td>
<td style="text-align:center;">
25266.5950
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
8954175
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.04000
</td>
<td style="text-align:center;">
29341.6309
</td>
</tr>
<tr>
<td style="text-align:left;">
Sweden
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
9031088
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.88400
</td>
<td style="text-align:center;">
33859.7484
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4815000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.62000
</td>
<td style="text-align:center;">
14734.2327
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
5126000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.56000
</td>
<td style="text-align:center;">
17909.4897
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
5666000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.32000
</td>
<td style="text-align:center;">
20431.0927
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
6063000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.77000
</td>
<td style="text-align:center;">
22966.1443
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
6401400
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
73.78000
</td>
<td style="text-align:center;">
27195.1130
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
6316424
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.39000
</td>
<td style="text-align:center;">
26982.2905
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6468126
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.21000
</td>
<td style="text-align:center;">
28397.7151
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
6649942
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.41000
</td>
<td style="text-align:center;">
30281.7046
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
6995447
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.03000
</td>
<td style="text-align:center;">
31871.5303
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
7193761
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.37000
</td>
<td style="text-align:center;">
32135.3230
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
7361757
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
80.62000
</td>
<td style="text-align:center;">
34480.9577
</td>
</tr>
<tr>
<td style="text-align:left;">
Switzerland
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
7554661
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
81.70100
</td>
<td style="text-align:center;">
37506.4191
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3661549
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.88300
</td>
<td style="text-align:center;">
1643.4854
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
4149908
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
48.28400
</td>
<td style="text-align:center;">
2117.2349
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4834621
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.30500
</td>
<td style="text-align:center;">
2193.0371
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
5680812
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.65500
</td>
<td style="text-align:center;">
1881.9236
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
6701172
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
57.29600
</td>
<td style="text-align:center;">
2571.4230
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
7932503
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
61.19500
</td>
<td style="text-align:center;">
3195.4846
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9410494
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.59000
</td>
<td style="text-align:center;">
3761.8377
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
11242847
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.97400
</td>
<td style="text-align:center;">
3116.7743
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
13219062
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.24900
</td>
<td style="text-align:center;">
3340.5428
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
15081016
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.52700
</td>
<td style="text-align:center;">
4014.2390
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
17155814
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.05300
</td>
<td style="text-align:center;">
4090.9253
</td>
</tr>
<tr>
<td style="text-align:left;">
Syria
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
19314747
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.14300
</td>
<td style="text-align:center;">
4184.5481
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8550362
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.50000
</td>
<td style="text-align:center;">
1206.9479
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
10164215
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.40000
</td>
<td style="text-align:center;">
1507.8613
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
11918938
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
65.20000
</td>
<td style="text-align:center;">
1822.8790
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
13648692
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.50000
</td>
<td style="text-align:center;">
2643.8587
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
15226039
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.39000
</td>
<td style="text-align:center;">
4062.5239
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
16785196
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.59000
</td>
<td style="text-align:center;">
5596.5198
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
18501390
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.16000
</td>
<td style="text-align:center;">
7426.3548
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
19757799
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.40000
</td>
<td style="text-align:center;">
11054.5618
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
20686918
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.26000
</td>
<td style="text-align:center;">
15215.6579
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
21628605
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
75.25000
</td>
<td style="text-align:center;">
20206.8210
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
22454239
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
76.99000
</td>
<td style="text-align:center;">
23235.4233
</td>
</tr>
<tr>
<td style="text-align:left;">
Taiwan
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
23174294
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
78.40000
</td>
<td style="text-align:center;">
28718.2768
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
8322925
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.21500
</td>
<td style="text-align:center;">
716.6501
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
9452826
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.97400
</td>
<td style="text-align:center;">
698.5356
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
10863958
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.24600
</td>
<td style="text-align:center;">
722.0038
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
12607312
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.75700
</td>
<td style="text-align:center;">
848.2187
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
14706593
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.62000
</td>
<td style="text-align:center;">
915.9851
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
17129565
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.91900
</td>
<td style="text-align:center;">
962.4923
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
19844382
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.60800
</td>
<td style="text-align:center;">
874.2426
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
23040630
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.53500
</td>
<td style="text-align:center;">
831.8221
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
26605473
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.44000
</td>
<td style="text-align:center;">
825.6825
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
30686889
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.46600
</td>
<td style="text-align:center;">
789.1862
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
34593779
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.65100
</td>
<td style="text-align:center;">
899.0742
</td>
</tr>
<tr>
<td style="text-align:left;">
Tanzania
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
38139640
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.51700
</td>
<td style="text-align:center;">
1107.4822
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
21289402
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.84800
</td>
<td style="text-align:center;">
757.7974
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
25041917
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
53.63000
</td>
<td style="text-align:center;">
793.5774
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
29263397
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.06100
</td>
<td style="text-align:center;">
1002.1992
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
34024249
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.28500
</td>
<td style="text-align:center;">
1295.4607
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
39276153
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.40500
</td>
<td style="text-align:center;">
1524.3589
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
44148285
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.49400
</td>
<td style="text-align:center;">
1961.2246
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
48827160
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.59700
</td>
<td style="text-align:center;">
2393.2198
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
52910342
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
66.08400
</td>
<td style="text-align:center;">
2982.6538
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
56667095
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.29800
</td>
<td style="text-align:center;">
4616.8965
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
60216677
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.52100
</td>
<td style="text-align:center;">
5852.6255
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
62806748
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
68.56400
</td>
<td style="text-align:center;">
5913.1875
</td>
</tr>
<tr>
<td style="text-align:left;">
Thailand
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
65068149
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.61600
</td>
<td style="text-align:center;">
7458.3963
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1219113
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
38.59600
</td>
<td style="text-align:center;">
859.8087
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1357445
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
41.20800
</td>
<td style="text-align:center;">
925.9083
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1528098
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.92200
</td>
<td style="text-align:center;">
1067.5348
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1735550
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.76900
</td>
<td style="text-align:center;">
1477.5968
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2056351
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.75900
</td>
<td style="text-align:center;">
1649.6602
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2308582
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.88700
</td>
<td style="text-align:center;">
1532.7770
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2644765
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.47100
</td>
<td style="text-align:center;">
1344.5780
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3154264
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
56.94100
</td>
<td style="text-align:center;">
1202.2014
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3747553
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.06100
</td>
<td style="text-align:center;">
1034.2989
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
4320890
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.39000
</td>
<td style="text-align:center;">
982.2869
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
4977378
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.56100
</td>
<td style="text-align:center;">
886.2206
</td>
</tr>
<tr>
<td style="text-align:left;">
Togo
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
5701579
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
58.42000
</td>
<td style="text-align:center;">
882.9699
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
662850
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
59.10000
</td>
<td style="text-align:center;">
3023.2719
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
764900
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
61.80000
</td>
<td style="text-align:center;">
4100.3934
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
887498
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
64.90000
</td>
<td style="text-align:center;">
4997.5240
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
960155
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.40000
</td>
<td style="text-align:center;">
5621.3685
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
975199
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.90000
</td>
<td style="text-align:center;">
6619.5514
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1039009
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.30000
</td>
<td style="text-align:center;">
7899.5542
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1116479
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.83200
</td>
<td style="text-align:center;">
9119.5286
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1191336
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.58200
</td>
<td style="text-align:center;">
7388.5978
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
1183669
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.86200
</td>
<td style="text-align:center;">
7370.9909
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
1138101
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.46500
</td>
<td style="text-align:center;">
8792.5731
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
1101832
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.97600
</td>
<td style="text-align:center;">
11460.6002
</td>
</tr>
<tr>
<td style="text-align:left;">
Trinidad and Tobago
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
1056608
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.81900
</td>
<td style="text-align:center;">
18008.5092
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3647735
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.60000
</td>
<td style="text-align:center;">
1468.4756
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3950849
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.10000
</td>
<td style="text-align:center;">
1395.2325
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4286552
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.57900
</td>
<td style="text-align:center;">
1660.3032
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4786986
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.05300
</td>
<td style="text-align:center;">
1932.3602
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5303507
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.60200
</td>
<td style="text-align:center;">
2753.2860
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
6005061
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
59.83700
</td>
<td style="text-align:center;">
3120.8768
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6734098
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
64.04800
</td>
<td style="text-align:center;">
3560.2332
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7724976
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
66.89400
</td>
<td style="text-align:center;">
3810.4193
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8523077
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
70.00100
</td>
<td style="text-align:center;">
4332.7202
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9231669
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
71.97300
</td>
<td style="text-align:center;">
4876.7986
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
9770575
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
73.04200
</td>
<td style="text-align:center;">
5722.8957
</td>
</tr>
<tr>
<td style="text-align:left;">
Tunisia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
10276158
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
73.92300
</td>
<td style="text-align:center;">
7092.9230
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
22235677
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
43.58500
</td>
<td style="text-align:center;">
1969.1010
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
25670939
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
48.07900
</td>
<td style="text-align:center;">
2218.7543
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
29788695
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
52.09800
</td>
<td style="text-align:center;">
2322.8699
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
33411317
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
54.33600
</td>
<td style="text-align:center;">
2826.3564
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
37492953
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
57.00500
</td>
<td style="text-align:center;">
3450.6964
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
42404033
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
59.50700
</td>
<td style="text-align:center;">
4269.1223
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
47328791
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
61.03600
</td>
<td style="text-align:center;">
4241.3563
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
52881328
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
63.10800
</td>
<td style="text-align:center;">
5089.0437
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
58179144
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
66.14600
</td>
<td style="text-align:center;">
5678.3483
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
63047647
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
68.83500
</td>
<td style="text-align:center;">
6601.4299
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
67308928
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.84500
</td>
<td style="text-align:center;">
6508.0857
</td>
</tr>
<tr>
<td style="text-align:left;">
Turkey
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
71158647
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.77700
</td>
<td style="text-align:center;">
8458.2764
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
5824797
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.97800
</td>
<td style="text-align:center;">
734.7535
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
6675501
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.57100
</td>
<td style="text-align:center;">
774.3711
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
7688797
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
45.34400
</td>
<td style="text-align:center;">
767.2717
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
8900294
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.05100
</td>
<td style="text-align:center;">
908.9185
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
10190285
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.01600
</td>
<td style="text-align:center;">
950.7359
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
11457758
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.35000
</td>
<td style="text-align:center;">
843.7331
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
12939400
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
49.84900
</td>
<td style="text-align:center;">
682.2662
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
15283050
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.50900
</td>
<td style="text-align:center;">
617.7244
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
18252190
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.82500
</td>
<td style="text-align:center;">
644.1708
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
21210254
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.57800
</td>
<td style="text-align:center;">
816.5591
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
24739869
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.81300
</td>
<td style="text-align:center;">
927.7210
</td>
</tr>
<tr>
<td style="text-align:left;">
Uganda
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
29170398
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.54200
</td>
<td style="text-align:center;">
1056.3801
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
50430000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
69.18000
</td>
<td style="text-align:center;">
9979.5085
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
51430000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.42000
</td>
<td style="text-align:center;">
11283.1779
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
53292000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
70.76000
</td>
<td style="text-align:center;">
12477.1771
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
54959000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
71.36000
</td>
<td style="text-align:center;">
14142.8509
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
56079000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.01000
</td>
<td style="text-align:center;">
15895.1164
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
56179000
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
72.76000
</td>
<td style="text-align:center;">
17428.7485
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
56339704
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
74.04000
</td>
<td style="text-align:center;">
18232.4245
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
56981620
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
75.00700
</td>
<td style="text-align:center;">
21664.7877
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
57866349
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
76.42000
</td>
<td style="text-align:center;">
22705.0925
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
58808266
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
77.21800
</td>
<td style="text-align:center;">
26074.5314
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
59912431
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
78.47100
</td>
<td style="text-align:center;">
29478.9992
</td>
</tr>
<tr>
<td style="text-align:left;">
United Kingdom
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
60776238
</td>
<td style="text-align:center;">
Europe
</td>
<td style="text-align:center;">
79.42500
</td>
<td style="text-align:center;">
33203.2613
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
157553000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.44000
</td>
<td style="text-align:center;">
13990.4821
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
171984000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.49000
</td>
<td style="text-align:center;">
14847.1271
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
186538000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.21000
</td>
<td style="text-align:center;">
16173.1459
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
198712000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.76000
</td>
<td style="text-align:center;">
19530.3656
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
209896000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.34000
</td>
<td style="text-align:center;">
21806.0359
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
220239000
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.38000
</td>
<td style="text-align:center;">
24072.6321
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
232187835
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.65000
</td>
<td style="text-align:center;">
25009.5591
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
242803533
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.02000
</td>
<td style="text-align:center;">
29884.3504
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
256894189
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
76.09000
</td>
<td style="text-align:center;">
32003.9322
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
272911760
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
76.81000
</td>
<td style="text-align:center;">
35767.4330
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
287675526
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
77.31000
</td>
<td style="text-align:center;">
39097.0995
</td>
</tr>
<tr>
<td style="text-align:left;">
United States
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
301139947
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
78.24200
</td>
<td style="text-align:center;">
42951.6531
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2252965
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
66.07100
</td>
<td style="text-align:center;">
5716.7667
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
2424959
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.04400
</td>
<td style="text-align:center;">
6150.7730
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
2598466
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.25300
</td>
<td style="text-align:center;">
5603.3577
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
2748579
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.46800
</td>
<td style="text-align:center;">
5444.6196
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
2829526
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.67300
</td>
<td style="text-align:center;">
5703.4089
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
2873520
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
69.48100
</td>
<td style="text-align:center;">
6504.3397
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
2953997
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.80500
</td>
<td style="text-align:center;">
6920.2231
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
3045153
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.91800
</td>
<td style="text-align:center;">
7452.3990
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
3149262
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.75200
</td>
<td style="text-align:center;">
8137.0048
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
3262838
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
74.22300
</td>
<td style="text-align:center;">
9230.2407
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3363085
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
75.30700
</td>
<td style="text-align:center;">
7727.0020
</td>
</tr>
<tr>
<td style="text-align:left;">
Uruguay
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
3447496
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
76.38400
</td>
<td style="text-align:center;">
10611.4630
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
5439568
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
55.08800
</td>
<td style="text-align:center;">
7689.7998
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
6702668
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
57.90700
</td>
<td style="text-align:center;">
9802.4665
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
8143375
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
60.77000
</td>
<td style="text-align:center;">
8422.9742
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
9709552
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
63.47900
</td>
<td style="text-align:center;">
9541.4742
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
11515649
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
65.71200
</td>
<td style="text-align:center;">
10505.2597
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
13503563
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
67.45600
</td>
<td style="text-align:center;">
13143.9510
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
15620766
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
68.55700
</td>
<td style="text-align:center;">
11152.4101
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
17910182
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
70.19000
</td>
<td style="text-align:center;">
9883.5846
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
20265563
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
71.15000
</td>
<td style="text-align:center;">
10733.9263
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
22374398
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.14600
</td>
<td style="text-align:center;">
10165.4952
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
24287670
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
72.76600
</td>
<td style="text-align:center;">
8605.0478
</td>
</tr>
<tr>
<td style="text-align:left;">
Venezuela
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
26084662
</td>
<td style="text-align:center;">
Americas
</td>
<td style="text-align:center;">
73.74700
</td>
<td style="text-align:center;">
11415.8057
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
26246839
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
40.41200
</td>
<td style="text-align:center;">
605.0665
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
28998543
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
42.88700
</td>
<td style="text-align:center;">
676.2854
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
33796140
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.36300
</td>
<td style="text-align:center;">
772.0492
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
39463910
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
47.83800
</td>
<td style="text-align:center;">
637.1233
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
44655014
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
50.25400
</td>
<td style="text-align:center;">
699.5016
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
50533506
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.76400
</td>
<td style="text-align:center;">
713.5371
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
56142181
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.81600
</td>
<td style="text-align:center;">
707.2358
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
62826491
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.82000
</td>
<td style="text-align:center;">
820.7994
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
69940728
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.66200
</td>
<td style="text-align:center;">
989.0231
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
76048996
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
70.67200
</td>
<td style="text-align:center;">
1385.8968
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
80908147
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.01700
</td>
<td style="text-align:center;">
1764.4567
</td>
</tr>
<tr>
<td style="text-align:left;">
Vietnam
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
85262356
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
74.24900
</td>
<td style="text-align:center;">
2441.5764
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
1030585
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
43.16000
</td>
<td style="text-align:center;">
1515.5923
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
1070439
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
45.67100
</td>
<td style="text-align:center;">
1827.0677
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
1133134
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
48.12700
</td>
<td style="text-align:center;">
2198.9563
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
1142636
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
51.63100
</td>
<td style="text-align:center;">
2649.7150
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
1089572
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
56.53200
</td>
<td style="text-align:center;">
3133.4093
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
1261091
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.76500
</td>
<td style="text-align:center;">
3682.8315
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
1425876
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
64.40600
</td>
<td style="text-align:center;">
4336.0321
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
1691210
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
67.04600
</td>
<td style="text-align:center;">
5107.1974
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
2104779
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
69.71800
</td>
<td style="text-align:center;">
6017.6548
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
2826046
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
71.09600
</td>
<td style="text-align:center;">
7110.6676
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
3389578
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
72.37000
</td>
<td style="text-align:center;">
4515.4876
</td>
</tr>
<tr>
<td style="text-align:left;">
West Bank and Gaza
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
4018332
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
73.42200
</td>
<td style="text-align:center;">
3025.3498
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
4963829
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
32.54800
</td>
<td style="text-align:center;">
781.7176
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
5498090
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
33.97000
</td>
<td style="text-align:center;">
804.8305
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
6120081
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
35.18000
</td>
<td style="text-align:center;">
825.6232
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
6740785
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
36.98400
</td>
<td style="text-align:center;">
862.4421
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
7407075
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
39.84800
</td>
<td style="text-align:center;">
1265.0470
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
8403990
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
44.17500
</td>
<td style="text-align:center;">
1829.7652
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
9657618
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
49.11300
</td>
<td style="text-align:center;">
1977.5570
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
11219340
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
52.92200
</td>
<td style="text-align:center;">
1971.7415
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
13367997
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
55.59900
</td>
<td style="text-align:center;">
1879.4967
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
15826497
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
58.02000
</td>
<td style="text-align:center;">
2117.4845
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
18701257
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
60.30800
</td>
<td style="text-align:center;">
2234.8208
</td>
</tr>
<tr>
<td style="text-align:left;">
Yemen, Rep.
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
22211743
</td>
<td style="text-align:center;">
Asia
</td>
<td style="text-align:center;">
62.69800
</td>
<td style="text-align:center;">
2280.7699
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
2672000
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.03800
</td>
<td style="text-align:center;">
1147.3888
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3016000
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
44.07700
</td>
<td style="text-align:center;">
1311.9568
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
3421000
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.02300
</td>
<td style="text-align:center;">
1452.7258
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
3900000
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
47.76800
</td>
<td style="text-align:center;">
1777.0773
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
4506497
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.10700
</td>
<td style="text-align:center;">
1773.4983
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
5216550
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.38600
</td>
<td style="text-align:center;">
1588.6883
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
6100407
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
51.82100
</td>
<td style="text-align:center;">
1408.6786
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
7272406
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.82100
</td>
<td style="text-align:center;">
1213.3151
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
8381163
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.10000
</td>
<td style="text-align:center;">
1210.8846
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
9417789
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
40.23800
</td>
<td style="text-align:center;">
1071.3538
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
10595811
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.19300
</td>
<td style="text-align:center;">
1071.6139
</td>
</tr>
<tr>
<td style="text-align:left;">
Zambia
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
11746035
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
42.38400
</td>
<td style="text-align:center;">
1271.2116
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1952
</td>
<td style="text-align:center;">
3080907
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
48.45100
</td>
<td style="text-align:center;">
406.8841
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1957
</td>
<td style="text-align:center;">
3646340
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
50.46900
</td>
<td style="text-align:center;">
518.7643
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1962
</td>
<td style="text-align:center;">
4277736
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
52.35800
</td>
<td style="text-align:center;">
527.2722
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1967
</td>
<td style="text-align:center;">
4995432
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
53.99500
</td>
<td style="text-align:center;">
569.7951
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1972
</td>
<td style="text-align:center;">
5861135
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
55.63500
</td>
<td style="text-align:center;">
799.3622
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1977
</td>
<td style="text-align:center;">
6642107
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
57.67400
</td>
<td style="text-align:center;">
685.5877
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1982
</td>
<td style="text-align:center;">
7636524
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.36300
</td>
<td style="text-align:center;">
788.8550
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1987
</td>
<td style="text-align:center;">
9216418
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
62.35100
</td>
<td style="text-align:center;">
706.1573
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1992
</td>
<td style="text-align:center;">
10704340
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
60.37700
</td>
<td style="text-align:center;">
693.4208
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
1997
</td>
<td style="text-align:center;">
11404948
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
46.80900
</td>
<td style="text-align:center;">
792.4500
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
2002
</td>
<td style="text-align:center;">
11926563
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
39.98900
</td>
<td style="text-align:center;">
672.0386
</td>
</tr>
<tr>
<td style="text-align:left;">
Zimbabwe
</td>
<td style="text-align:center;">
2007
</td>
<td style="text-align:center;">
12311143
</td>
<td style="text-align:center;">
Africa
</td>
<td style="text-align:center;">
43.48700
</td>
<td style="text-align:center;">
469.7093
</td>
</tr>
</tbody>
</table>
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

    ## Warning: package 'Hmisc' was built under R version 3.6.1

    ## Warning: package 'ggplot2' was built under R version 3.6.1

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
