Lab 3: Introduction to tidyverse. Economic analysis with R
================

Introduction
------------

-   The aim of this lecture is to summarise the ultimate goals of the tidyverse package, and provide a short tutorial how to manipulate datasets by using the `dplyr` package.

Tidyverse vs. base R (cont.)
----------------------------

One point of convenience is that there is often a direct correspondence between a tidyverse command and its base R equivalent.

These invariably follow a `tidyverse::snake_case` vs `base::period.case` rule. E.g. see: - `?readr::read_csv` vs `?utils::read.csv` - `?tibble::data_frame`vs `?base::data.frame` - `?dplyr::if_else` vs `?base::ifelse` - etc.

If you call up the above examples, you'll see that the tidyverse alternative typically offers some enhancements or other useful options (and sometimes restrictions) over its base counterpart. - Remember: There are always many ways to achieve a single goal in R.

### Tidyverse

Tidyverse is primarily made up of a set of powerful and useful R packages (ggplot2, dplyr, tidyr, purr, readr, and tibble)

It is a way of thinking of implementing tidy data.

### Tidyverse packages

Let's load the tidyverse meta-package and check the output.

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 3.6.1

    ## Warning: package 'ggplot2' was built under R version 3.6.1

    ## Warning: package 'tibble' was built under R version 3.6.1

    ## Warning: package 'dplyr' was built under R version 3.6.1

We see that we have actually loaded a number of packages (which could also be loaded individually): `ggplot2`, `tibble`, `tidyr`, `readr`,`dplyr`, etc.

### Tidyverse packages (cont.)

-   Today, however, I'm only really going to focus on one package: `dplyr`

-   These are the workhorse packages for cleaning and wrangling data. They are thus the ones that you will likely make the most use of (alongside `ggplot2`, which we already employed in previous presentations).

-   Data cleaning and wrangling occupies an enormous amount of time, no matter where you are in your research career

Tutorial
--------

-   In this tutorial, we will use the Hollywod movies dataset that is stored in your folder named data. This data can be also downloaded directly if you are connected to the internet.

-   The way we are going to proceed is as follows: loading the original data and saving it as an object with a meaningful name and an origin suffix. I will only made direct manipulations to the Hollywod movies dataframe.

### Preliminaries

``` r
library(funModeling)
```

    ## Warning: package 'funModeling' was built under R version 3.6.1

    ## Loading required package: Hmisc

    ## Warning: package 'Hmisc' was built under R version 3.6.1

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## 
    ## Attaching package: 'Hmisc'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     src, summarize

    ## The following objects are masked from 'package:base':
    ## 
    ##     format.pval, units

    ## funModeling v.1.8 :)
    ## Examples and tutorials at livebook.datascienceheroes.com

``` r
library(tidyverse)
head(heart_disease,5)  
```

    ##   age gender chest_pain resting_blood_pressure serum_cholestoral
    ## 1  63   male          1                    145               233
    ## 2  67   male          4                    160               286
    ## 3  67   male          4                    120               229
    ## 4  37   male          3                    130               250
    ## 5  41 female          2                    130               204
    ##   fasting_blood_sugar resting_electro max_heart_rate exer_angina oldpeak
    ## 1                   1               2            150           0     2.3
    ## 2                   0               2            108           1     1.5
    ## 3                   0               2            129           1     2.6
    ## 4                   0               0            187           0     3.5
    ## 5                   0               2            172           0     1.4
    ##   slope num_vessels_flour thal heart_disease_severity exter_angina
    ## 1     3                 0    6                      0            0
    ## 2     2                 3    3                      2            1
    ## 3     2                 2    7                      1            1
    ## 4     3                 0    3                      0            0
    ## 5     1                 0    3                      0            0
    ##   has_heart_disease
    ## 1                no
    ## 2               yes
    ## 3               yes
    ## 4                no
    ## 5                no

``` r
heart_disease_orig <- heart_disease
```

### Arrange function

``` r
# Order dataset according to the age variable: 
d1= heart_disease %>% arrange(age)
# you can also type without using the piping. We use head to print out only the first 5 rows in the dataset

arrange(heart_disease, age) %>% head()
```

    ##   age gender chest_pain resting_blood_pressure serum_cholestoral
    ## 1  29   male          2                    130               204
    ## 2  34   male          1                    118               182
    ## 3  34 female          2                    118               210
    ## 4  35 female          4                    138               183
    ## 5  35   male          4                    120               198
    ## 6  35   male          4                    126               282
    ##   fasting_blood_sugar resting_electro max_heart_rate exer_angina oldpeak
    ## 1                   0               2            202           0     0.0
    ## 2                   0               2            174           0     0.0
    ## 3                   0               0            192           0     0.7
    ## 4                   0               0            182           0     1.4
    ## 5                   0               0            130           1     1.6
    ## 6                   0               2            156           1     0.0
    ##   slope num_vessels_flour thal heart_disease_severity exter_angina
    ## 1     1                 0    3                      0            0
    ## 2     1                 0    3                      0            0
    ## 3     1                 0    3                      0            0
    ## 4     1                 0    3                      0            0
    ## 5     2                 0    7                      1            1
    ## 6     1                 0    7                      1            1
    ##   has_heart_disease
    ## 1                no
    ## 2                no
    ## 3                no
    ## 4                no
    ## 5               yes
    ## 6               yes

``` r
# variable chest_pain and age:
d2= heart_disease %>% arrange(chest_pain, age) %>% head()
# descending order:
d3= heart_disease %>% arrange(-age) %>% head()
```

### Select function

``` r
 # Seleccionando algunas variables con `select` 
# thal, age, chest_pain
d4=heart_disease %>% select(thal, age, chest_pain)

# Con el simbolo menos (`-`) eliminamos variables
d5=d4 %>% select(-chest_pain)

# seleccionamos 2 y luego todas
d6=heart_disease %>% select(age, thal, chest_pain, everything())
```

``` r
# Seleccionando por tipo de dato
d9=select_if(heart_disease, is.numeric)
# is.character
# is.factor
is.character(heart_disease$age)
```

    ## [1] FALSE

### Select function

``` r
df_status(heart_disease)
```

    ##                  variable q_zeros p_zeros q_na p_na q_inf p_inf    type
    ## 1                     age       0    0.00    0 0.00     0     0 integer
    ## 2                  gender       0    0.00    0 0.00     0     0  factor
    ## 3              chest_pain       0    0.00    0 0.00     0     0  factor
    ## 4  resting_blood_pressure       0    0.00    0 0.00     0     0 integer
    ## 5       serum_cholestoral       0    0.00    0 0.00     0     0 integer
    ## 6     fasting_blood_sugar     258   85.15    0 0.00     0     0  factor
    ## 7         resting_electro     151   49.83    0 0.00     0     0  factor
    ## 8          max_heart_rate       0    0.00    0 0.00     0     0 integer
    ## 9             exer_angina     204   67.33    0 0.00     0     0 integer
    ## 10                oldpeak      99   32.67    0 0.00     0     0 numeric
    ## 11                  slope       0    0.00    0 0.00     0     0 integer
    ## 12      num_vessels_flour     176   58.09    4 1.32     0     0 integer
    ## 13                   thal       0    0.00    2 0.66     0     0  factor
    ## 14 heart_disease_severity     164   54.13    0 0.00     0     0 integer
    ## 15           exter_angina     204   67.33    0 0.00     0     0  factor
    ## 16      has_heart_disease       0    0.00    0 0.00     0     0  factor
    ##    unique
    ## 1      41
    ## 2       2
    ## 3       4
    ## 4      50
    ## 5     152
    ## 6       2
    ## 7       3
    ## 8      91
    ## 9       2
    ## 10     40
    ## 11      3
    ## 12      4
    ## 13      3
    ## 14      5
    ## 15      2
    ## 16      2

``` r
heart_disease$gender=as.character(heart_disease$gender)
df_status(select_if(heart_disease, is.numeric))
```

    ##                 variable q_zeros p_zeros q_na p_na q_inf p_inf    type
    ## 1                    age       0    0.00    0 0.00     0     0 integer
    ## 2 resting_blood_pressure       0    0.00    0 0.00     0     0 integer
    ## 3      serum_cholestoral       0    0.00    0 0.00     0     0 integer
    ## 4         max_heart_rate       0    0.00    0 0.00     0     0 integer
    ## 5            exer_angina     204   67.33    0 0.00     0     0 integer
    ## 6                oldpeak      99   32.67    0 0.00     0     0 numeric
    ## 7                  slope       0    0.00    0 0.00     0     0 integer
    ## 8      num_vessels_flour     176   58.09    4 1.32     0     0 integer
    ## 9 heart_disease_severity     164   54.13    0 0.00     0     0 integer
    ##   unique
    ## 1     41
    ## 2     50
    ## 3    152
    ## 4     91
    ## 5      2
    ## 6     40
    ## 7      3
    ## 8      4
    ## 9      5

``` r
df_status(select_if(heart_disease, is.factor))
```

    ##              variable q_zeros p_zeros q_na p_na q_inf p_inf   type unique
    ## 1          chest_pain       0    0.00    0 0.00     0     0 factor      4
    ## 2 fasting_blood_sugar     258   85.15    0 0.00     0     0 factor      2
    ## 3     resting_electro     151   49.83    0 0.00     0     0 factor      3
    ## 4                thal       0    0.00    2 0.66     0     0 factor      3
    ## 5        exter_angina     204   67.33    0 0.00     0     0 factor      2
    ## 6   has_heart_disease       0    0.00    0 0.00     0     0 factor      2

``` r
df_status(select_if(heart_disease, is.character))
```

    ##   variable q_zeros p_zeros q_na p_na q_inf p_inf      type unique
    ## 1   gender       0       0    0    0     0     0 character      2

Resources
---------

dplyr official page: <https://dplyr.tidyverse.org/>
===================================================

Introduction to dplyr: <https://dplyr.tidyverse.org/articles/dplyr.html>
========================================================================

\`\`\`
