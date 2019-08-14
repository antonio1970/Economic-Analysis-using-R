Lab 4: Regression Analysis
================

Regression Analysis
-------------------

``` r
library(caret)
```

    ## Warning: package 'caret' was built under R version 3.6.1

    ## Loading required package: lattice

    ## Loading required package: ggplot2

    ## Warning: package 'ggplot2' was built under R version 3.6.1

``` r
auto <- read.csv("../Labs/auto-mpg.csv")
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3c", "4c", "5c", "6c", "8c"))

set.seed(2018)
t.id <- createDataPartition(auto$mpg, p = 0.7, list = F)
names(auto)
```

    ## [1] "No"           "mpg"          "cylinders"    "displacement"
    ## [5] "horsepower"   "weight"       "acceleration" "model_year"  
    ## [9] "car_name"

``` r
mod <- lm(mpg ~ ., data = auto[t.id,-c(1,8,9)])

mod
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ ., data = auto[t.id, -c(1, 8, 9)])
    ## 
    ## Coefficients:
    ##  (Intercept)   cylinders4c   cylinders5c   cylinders6c   cylinders8c  
    ##    37.284202      6.231475      8.248195      2.131026      4.568171  
    ## displacement    horsepower        weight  acceleration  
    ##     0.002245     -0.057543     -0.004665      0.050745

``` r
#mpg = 38.607312 +
#     + 7.212652*4c + 5.610350*5c + 3.307172*6c + 6.211343*8c +
#     + 0.006878 * displacement - 0.072209 * horsepower +
#     - 0.005156 * weight + 0.024852 * acceleration

summary(mod)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ ., data = auto[t.id, -c(1, 8, 9)])
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -10.0606  -2.4686  -0.4435   1.9821  16.0907 
    ## 
    ## Coefficients:
    ##                Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  37.2842024  3.6497412  10.216  < 2e-16 ***
    ## cylinders4c   6.2314753  2.4926855   2.500  0.01301 *  
    ## cylinders5c   8.2481946  3.8091396   2.165  0.03123 *  
    ## cylinders6c   2.1310256  2.7759570   0.768  0.44335    
    ## cylinders8c   4.5681710  3.2054454   1.425  0.15527    
    ## displacement  0.0022449  0.0108924   0.206  0.83687    
    ## horsepower   -0.0575428  0.0202773  -2.838  0.00489 ** 
    ## weight       -0.0046652  0.0009999  -4.665 4.84e-06 ***
    ## acceleration  0.0507454  0.1443575   0.352  0.72547    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 4.092 on 271 degrees of freedom
    ## Multiple R-squared:  0.7304, Adjusted R-squared:  0.7224 
    ## F-statistic: 91.75 on 8 and 271 DF,  p-value: < 2.2e-16

``` r
boxplot(mod$residuals)
```

![](lab-4_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
sqrt(mean((mod$fitted.values - auto[t.id,]$mpg)^2))
```

    ## [1] 4.026021

``` r
pred <- predict(mod, auto[-t.id, -c(1,8,9)])
sqrt(mean((pred - auto[-t.id,]$mpg)^2))
```

    ## [1] 3.894627

``` r
par(mfrow=c(2,2))
plot(mod)
```

![](lab-4_files/figure-markdown_github/unnamed-chunk-1-2.png)
