Lab : Instrumental variables approach
================

The purpose of this in-class lab is to use R to practice with instrumental variables estimation. The lab should be completed in your group. To get credit, upload your .R script to the appropriate place on Canvas.

For starters
------------

You may need to install the package `AER`. (It may have already been installed when you previously installed `car` and `zoo`.)

Open up a new R script (named `ICL13_XYZ.R`, where `XYZ` are your initials) and add the usual "preamble" to the top:

``` r
# Add names of group members HERE
library(tidyverse)
library(wooldridge)
library(broom)
library(AER)
library(magrittr)
library(stargazer)
```

### Load the data

We're going to use data on fertility of Botswanian women.

``` r
df <- as_tibble(fertil2)
```

### Summary statistics

We can easily compute summary statistics of our data by using the `stargazer` package:

``` r
df %>% as.data.frame %>% stargazer(type="text")
```

    ## 
    ## ================================================================
    ## Statistic   N    Mean   St. Dev.  Min   Pctl(25) Pctl(75)  Max  
    ## ----------------------------------------------------------------
    ## mnthborn  4,361  6.331   3.323     1       3        9       12  
    ## yearborn  4,361 60.434   8.683     38      55       68      73  
    ## age       4,361 27.405   8.685     15      20       33      49  
    ## electric  4,358  0.140   0.347   0.000   0.000    0.000   1.000 
    ## radio     4,359  0.702   0.458   0.000   0.000    1.000   1.000 
    ## tv        4,359  0.093   0.290   0.000   0.000    0.000   1.000 
    ## bicycle   4,358  0.276   0.447   0.000   0.000    1.000   1.000 
    ## educ      4,361  5.856   3.927     0       3        8       20  
    ## ceb       4,361  2.442   2.407     0       1        4       13  
    ## agefbrth  3,273 19.011   3.092   10.000  17.000   20.000  38.000
    ## children  4,361  2.268   2.222     0       0        4       13  
    ## knowmeth  4,354  0.963   0.188   0.000   1.000    1.000   1.000 
    ## usemeth   4,290  0.578   0.494   0.000   0.000    1.000   1.000 
    ## monthfm   2,079  6.270   3.620   1.000   3.000    9.000   12.000
    ## yearfm    2,079 76.912   7.760   50.000  72.000   83.000  88.000
    ## agefm     2,079 20.686   5.002   10.000  17.000   23.000  46.000
    ## idlnchld  4,241  4.616   2.219   0.000   3.000    6.000   20.000
    ## heduc     1,956  5.145   4.803   0.000   0.000    8.000   20.000
    ## agesq     4,361 826.460 526.923   225     400     1,089   2,401 
    ## urban     4,361  0.517   0.500     0       0        1       1   
    ## urb_educ  4,361  3.469   4.294     0       0        7       20  
    ## spirit    4,361  0.422   0.494     0       0        1       1   
    ## protest   4,361  0.228   0.419     0       0        0       1   
    ## catholic  4,361  0.102   0.303     0       0        0       1   
    ## frsthalf  4,361  0.540   0.498     0       0        1       1   
    ## educ0     4,361  0.208   0.406     0       0        0       1   
    ## evermarr  4,361  0.477   0.500     0       0        1       1   
    ## ----------------------------------------------------------------

1.  What do you think is going on when you see varying numbers of observations across the different variables?

Determinants of fertility
-------------------------

Suppose we want to see if education causes lower fertility (as can be seen when comparing more- and less-educated countries):
*c**h**i**l**d**r**e**n* = *β*<sub>0</sub> + *β*<sub>1</sub>*e**d**u**c* + *β*<sub>2</sub>*a**g**e* + *β*<sub>3</sub>*a**g**e*<sup>2</sup> + *u*
 where *c**h**i**l**d**r**e**n* is the number of children born to the woman, *e**d**u**c* is years of education, and *a**g**e* is age (in years).

1.  Interpret the estimates of the regression:

``` r
est.ols <- lm(children ~ educ + age + I(age^2), data=df)
```

(Note: include `I(age^2)` puts the quadratic term in automatically without us having to use `mutate()` to create a new variable called `age.sq`.)

We can also use stargazer to examine the output. It puts the standard errors of each variable in parentheses under the estimated coefficient.

``` r
stargazer(est.ols, type="text")
```

    ## 
    ## ===============================================
    ##                         Dependent variable:    
    ##                     ---------------------------
    ##                              children          
    ## -----------------------------------------------
    ## educ                         -0.091***         
    ##                               (0.006)          
    ##                                                
    ## age                          0.332***          
    ##                               (0.017)          
    ##                                                
    ## I(age2)                      -0.003***         
    ##                              (0.0003)          
    ##                                                
    ## Constant                     -4.138***         
    ##                               (0.241)          
    ##                                                
    ## -----------------------------------------------
    ## Observations                   4,361           
    ## R2                             0.569           
    ## Adjusted R2                    0.568           
    ## Residual Std. Error      1.460 (df = 4357)     
    ## F Statistic         1,915.196*** (df = 3; 4357)
    ## ===============================================
    ## Note:               *p<0.1; **p<0.05; ***p<0.01

### Instrumenting for endogenous education

We know that education is endogenous (i.e. people choose the level of education that maximizes their utility). A possible instrument for education is *f**i**r**s**t**h**a**l**f*, which is a dummy equal to 1 if the woman was born in the first half of the calendar year, and 0 otherwise.

Let's create this variable:

``` r
df %<>% mutate(firsthalf = mnthborn<7)
```

We will assume that *f**i**r**s**t**h**a**l**f* is uncorrelated with *u*.

1.  Check that *f**i**r**s**t**h**a**l**f* is correlated with *e**d**u**c* by running a regression. (I will suppress the code, since it should be old hat) Call the output `est.iv1`.

### IV estimation

Now let's do the IV regression:

``` r
est.iv <- ivreg(children ~ educ + age + I(age^2) | firsthalf + age + I(age^2), data=df)
```

The variables on the right hand side of the `|` are the instruments (including the *x*'s that we assume to be exogenous, like *a**g**e*). The endogenous *x* is the first one after the `~`.

Now we can compare the output for each of the models:

``` r
stargazer(est.ols,est.iv1,est.iv, type="text")
```

    ## 
    ## ==========================================================================================
    ##                                              Dependent variable:                          
    ##                     ----------------------------------------------------------------------
    ##                              children                     educ               children     
    ##                                 OLS                       OLS              instrumental   
    ##                                                                              variable     
    ##                                 (1)                       (2)                   (3)       
    ## ------------------------------------------------------------------------------------------
    ## educ                         -0.091***                                       -0.171***    
    ##                               (0.006)                                         (0.053)     
    ##                                                                                           
    ## age                          0.332***                                        0.324***     
    ##                               (0.017)                                         (0.018)     
    ##                                                                                           
    ## I(age2)                      -0.003***                                       -0.003***    
    ##                              (0.0003)                                        (0.0003)     
    ##                                                                                           
    ## firsthalf                                              -0.938***                          
    ##                                                         (0.118)                           
    ##                                                                                           
    ## Constant                     -4.138***                  6.363***             -3.388***    
    ##                               (0.241)                   (0.087)               (0.548)     
    ##                                                                                           
    ## ------------------------------------------------------------------------------------------
    ## Observations                   4,361                     4,361                 4,361      
    ## R2                             0.569                     0.014                 0.550      
    ## Adjusted R2                    0.568                     0.014                 0.550      
    ## Residual Std. Error      1.460 (df = 4357)         3.900 (df = 4359)     1.491 (df = 4357)
    ## F Statistic         1,915.196*** (df = 3; 4357) 62.620*** (df = 1; 4359)                  
    ## ==========================================================================================
    ## Note:                                                          *p<0.1; **p<0.05; ***p<0.01
