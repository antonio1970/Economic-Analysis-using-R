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

-   For futher description of the dataset \[link to description of the dataset\] (<https://archive.ics.uci.edu/ml/datasets/heart+Disease>)

### Dataset: heart\_disease

-   Age (age in years)
-   Sex (1 = male; 0 = female)
-   CP (chest pain type)
-   TRESTBPS (resting blood pressure (in mm Hg on admission to the hospital))
-   CHOL (serum cholestoral in mg/dl)
-   FPS (fasting blood sugar &gt; 120 mg/dl) (1 = true; 0 = false)
-   RESTECH (resting electrocardiographic results)
-   THALACH (maximum heart rate achieved)
-   EXANG (exercise induced angina (1 = yes; 0 = no))
-   OLDPEAK (ST depression induced by exercise relative to rest)
-   SLOPE (the slope of the peak exercise ST segment)
-   CA (number of major vessels (0-3) colored by flourosopy)
-   THAL (3 = normal; 6 = fixed defect; 7 = reversable defect)
-   TARGET (1 or 0)

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
str(heart_disease)
```

    ## 'data.frame':    303 obs. of  16 variables:
    ##  $ age                   : int  63 67 67 37 41 56 62 57 63 53 ...
    ##  $ gender                : Factor w/ 2 levels "female","male": 2 2 2 2 1 2 1 1 2 2 ...
    ##  $ chest_pain            : Factor w/ 4 levels "1","2","3","4": 1 4 4 3 2 2 4 4 4 4 ...
    ##  $ resting_blood_pressure: int  145 160 120 130 130 120 140 120 130 140 ...
    ##  $ serum_cholestoral     : int  233 286 229 250 204 236 268 354 254 203 ...
    ##  $ fasting_blood_sugar   : Factor w/ 2 levels "0","1": 2 1 1 1 1 1 1 1 1 2 ...
    ##  $ resting_electro       : Factor w/ 3 levels "0","1","2": 3 3 3 1 3 1 3 1 3 3 ...
    ##  $ max_heart_rate        : int  150 108 129 187 172 178 160 163 147 155 ...
    ##  $ exer_angina           : int  0 1 1 0 0 0 0 1 0 1 ...
    ##  $ oldpeak               : num  2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
    ##  $ slope                 : int  3 2 2 3 1 1 3 1 2 3 ...
    ##  $ num_vessels_flour     : int  0 3 2 0 0 0 2 0 1 0 ...
    ##  $ thal                  : Factor w/ 3 levels "3","6","7": 2 1 3 1 1 1 1 1 3 3 ...
    ##  $ heart_disease_severity: int  0 2 1 0 0 0 3 0 2 1 ...
    ##  $ exter_angina          : Factor w/ 2 levels "0","1": 1 2 2 1 1 1 1 2 1 2 ...
    ##  $ has_heart_disease     : Factor w/ 2 levels "no","yes": 1 2 2 1 1 1 2 1 2 2 ...

``` r
summary(heart_disease)
```

    ##       age           gender    chest_pain resting_blood_pressure
    ##  Min.   :29.00   female: 97   1: 23      Min.   : 94.0         
    ##  1st Qu.:48.00   male  :206   2: 50      1st Qu.:120.0         
    ##  Median :56.00                3: 86      Median :130.0         
    ##  Mean   :54.44                4:144      Mean   :131.7         
    ##  3rd Qu.:61.00                           3rd Qu.:140.0         
    ##  Max.   :77.00                           Max.   :200.0         
    ##                                                                
    ##  serum_cholestoral fasting_blood_sugar resting_electro max_heart_rate 
    ##  Min.   :126.0     0:258               0:151           Min.   : 71.0  
    ##  1st Qu.:211.0     1: 45               1:  4           1st Qu.:133.5  
    ##  Median :241.0                         2:148           Median :153.0  
    ##  Mean   :246.7                                         Mean   :149.6  
    ##  3rd Qu.:275.0                                         3rd Qu.:166.0  
    ##  Max.   :564.0                                         Max.   :202.0  
    ##                                                                       
    ##   exer_angina        oldpeak         slope       num_vessels_flour
    ##  Min.   :0.0000   Min.   :0.00   Min.   :1.000   Min.   :0.0000   
    ##  1st Qu.:0.0000   1st Qu.:0.00   1st Qu.:1.000   1st Qu.:0.0000   
    ##  Median :0.0000   Median :0.80   Median :2.000   Median :0.0000   
    ##  Mean   :0.3267   Mean   :1.04   Mean   :1.601   Mean   :0.6722   
    ##  3rd Qu.:1.0000   3rd Qu.:1.60   3rd Qu.:2.000   3rd Qu.:1.0000   
    ##  Max.   :1.0000   Max.   :6.20   Max.   :3.000   Max.   :3.0000   
    ##                                                  NA's   :4        
    ##    thal     heart_disease_severity exter_angina has_heart_disease
    ##  3   :166   Min.   :0.0000         0:204        no :164          
    ##  6   : 18   1st Qu.:0.0000         1: 99        yes:139          
    ##  7   :117   Median :0.0000                                       
    ##  NA's:  2   Mean   :0.9373                                       
    ##             3rd Qu.:2.0000                                       
    ##             Max.   :4.0000                                       
    ## 

``` r
sum(is.na(heart_disease))
```

    ## [1] 6

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

### Filter function

``` r
#With piping. Filter observations where gender = male
heart_disease %>% filter(gender =="male") %>% head()
```

    ##   age gender chest_pain resting_blood_pressure serum_cholestoral
    ## 1  63   male          1                    145               233
    ## 2  67   male          4                    160               286
    ## 3  67   male          4                    120               229
    ## 4  37   male          3                    130               250
    ## 5  56   male          2                    120               236
    ## 6  63   male          4                    130               254
    ##   fasting_blood_sugar resting_electro max_heart_rate exer_angina oldpeak
    ## 1                   1               2            150           0     2.3
    ## 2                   0               2            108           1     1.5
    ## 3                   0               2            129           1     2.6
    ## 4                   0               0            187           0     3.5
    ## 5                   0               0            178           0     0.8
    ## 6                   0               2            147           0     1.4
    ##   slope num_vessels_flour thal heart_disease_severity exter_angina
    ## 1     3                 0    6                      0            0
    ## 2     2                 3    3                      2            1
    ## 3     2                 2    7                      1            1
    ## 4     3                 0    3                      0            0
    ## 5     1                 0    3                      0            0
    ## 6     2                 1    7                      2            0
    ##   has_heart_disease
    ## 1                no
    ## 2               yes
    ## 3               yes
    ## 4                no
    ## 5                no
    ## 6               yes

``` r
#without piping
filter(heart_disease, gender == "male")
```

    ##     age gender chest_pain resting_blood_pressure serum_cholestoral
    ## 1    63   male          1                    145               233
    ## 2    67   male          4                    160               286
    ## 3    67   male          4                    120               229
    ## 4    37   male          3                    130               250
    ## 5    56   male          2                    120               236
    ## 6    63   male          4                    130               254
    ## 7    53   male          4                    140               203
    ## 8    57   male          4                    140               192
    ## 9    56   male          3                    130               256
    ## 10   44   male          2                    120               263
    ## 11   52   male          3                    172               199
    ## 12   57   male          3                    150               168
    ## 13   48   male          2                    110               229
    ## 14   54   male          4                    140               239
    ## 15   49   male          2                    130               266
    ## 16   64   male          1                    110               211
    ## 17   58   male          2                    120               284
    ## 18   58   male          3                    132               224
    ## 19   60   male          4                    130               206
    ## 20   43   male          4                    150               247
    ## 21   40   male          4                    110               167
    ## 22   60   male          4                    117               230
    ## 23   64   male          3                    140               335
    ## 24   59   male          4                    135               234
    ## 25   44   male          3                    130               233
    ## 26   42   male          4                    140               226
    ## 27   43   male          4                    120               177
    ## 28   57   male          4                    150               276
    ## 29   55   male          4                    132               353
    ## 30   61   male          3                    150               243
    ## 31   40   male          1                    140               199
    ## 32   59   male          3                    150               212
    ## 33   58   male          3                    112               230
    ## 34   51   male          3                    110               175
    ## 35   50   male          4                    150               243
    ## 36   53   male          3                    130               197
    ## 37   65   male          4                    120               177
    ## 38   44   male          4                    112               290
    ## 39   44   male          2                    130               219
    ## 40   60   male          4                    130               253
    ## 41   54   male          4                    124               266
    ## 42   50   male          3                    140               233
    ## 43   41   male          4                    110               172
    ## 44   54   male          3                    125               273
    ## 45   51   male          1                    125               213
    ## 46   58   male          4                    128               216
    ## 47   54   male          4                    120               188
    ## 48   60   male          4                    145               282
    ## 49   60   male          3                    140               185
    ## 50   54   male          3                    150               232
    ## 51   59   male          4                    170               326
    ## 52   46   male          3                    150               231
    ## 53   67   male          4                    125               254
    ## 54   62   male          4                    120               267
    ## 55   65   male          4                    110               248
    ## 56   44   male          4                    110               197
    ## 57   60   male          4                    125               258
    ## 58   48   male          2                    130               245
    ## 59   58   male          4                    150               270
    ## 60   45   male          4                    104               208
    ## 61   39   male          3                    140               321
    ## 62   68   male          3                    180               274
    ## 63   52   male          2                    120               325
    ## 64   44   male          3                    140               235
    ## 65   47   male          3                    138               257
    ## 66   66   male          4                    120               302
    ## 67   62   male          3                    130               231
    ## 68   52   male          4                    128               255
    ## 69   59   male          4                    110               239
    ## 70   52   male          2                    134               201
    ## 71   48   male          4                    122               222
    ## 72   45   male          4                    115               260
    ## 73   34   male          1                    118               182
    ## 74   49   male          3                    120               188
    ## 75   54   male          2                    108               309
    ## 76   59   male          4                    140               177
    ## 77   57   male          3                    128               229
    ## 78   61   male          4                    120               260
    ## 79   39   male          4                    118               219
    ## 80   56   male          4                    125               249
    ## 81   52   male          1                    118               186
    ## 82   41   male          2                    135               203
    ## 83   58   male          3                    140               211
    ## 84   63   male          4                    130               330
    ## 85   65   male          4                    135               254
    ## 86   48   male          4                    130               256
    ## 87   51   male          3                    100               222
    ## 88   55   male          4                    140               217
    ## 89   65   male          1                    138               282
    ## 90   54   male          4                    110               239
    ## 91   44   male          2                    120               220
    ## 92   54   male          3                    120               258
    ## 93   51   male          3                     94               227
    ## 94   29   male          2                    130               204
    ## 95   51   male          4                    140               261
    ## 96   70   male          4                    145               174
    ## 97   62   male          2                    120               281
    ## 98   35   male          4                    120               198
    ## 99   51   male          3                    125               245
    ## 100  59   male          2                    140               221
    ## 101  59   male          1                    170               288
    ## 102  52   male          2                    128               205
    ## 103  64   male          3                    125               309
    ## 104  58   male          3                    105               240
    ## 105  47   male          3                    108               243
    ## 106  57   male          4                    165               289
    ## 107  41   male          3                    112               250
    ## 108  45   male          2                    128               308
    ## 109  52   male          1                    152               298
    ## 110  55   male          4                    160               289
    ## 111  64   male          4                    120               246
    ## 112  70   male          4                    130               322
    ## 113  51   male          4                    140               299
    ## 114  58   male          4                    125               300
    ## 115  60   male          4                    140               293
    ## 116  68   male          3                    118               277
    ## 117  46   male          2                    101               197
    ## 118  77   male          4                    125               304
    ## 119  48   male          3                    124               255
    ## 120  57   male          4                    132               207
    ## 121  52   male          3                    138               223
    ## 122  35   male          4                    126               282
    ## 123  70   male          3                    160               269
    ## 124  53   male          4                    142               226
    ## 125  64   male          4                    145               212
    ## 126  57   male          4                    152               274
    ## 127  52   male          4                    108               233
    ## 128  56   male          4                    132               184
    ## 129  43   male          3                    130               315
    ## 130  53   male          3                    130               246
    ## 131  48   male          4                    124               274
    ## 132  42   male          1                    148               244
    ## 133  59   male          1                    178               270
    ## 134  42   male          3                    120               240
    ## 135  66   male          2                    160               246
    ## 136  54   male          2                    192               283
    ## 137  69   male          3                    140               254
    ## 138  50   male          3                    129               196
    ## 139  51   male          4                    140               298
    ## 140  43   male          4                    132               247
    ## 141  67   male          4                    100               299
    ## 142  69   male          1                    160               234
    ## 143  59   male          1                    160               273
    ## 144  57   male          3                    150               126
    ## 145  43   male          4                    110               211
    ## 146  45   male          4                    142               309
    ## 147  58   male          4                    128               259
    ## 148  50   male          4                    144               200
    ## 149  55   male          2                    130               262
    ## 150  38   male          1                    120               231
    ## 151  41   male          3                    130               214
    ## 152  52   male          4                    112               230
    ## 153  56   male          1                    120               193
    ## 154  59   male          4                    138               271
    ## 155  53   male          4                    123               282
    ## 156  47   male          4                    112               204
    ## 157  54   male          4                    110               206
    ## 158  66   male          4                    112               212
    ## 159  49   male          3                    118               149
    ## 160  54   male          4                    122               286
    ## 161  56   male          4                    130               283
    ## 162  46   male          4                    120               249
    ## 163  42   male          2                    120               295
    ## 164  41   male          2                    110               235
    ## 165  61   male          1                    134               234
    ## 166  67   male          4                    120               237
    ## 167  58   male          4                    100               234
    ## 168  47   male          4                    110               275
    ## 169  52   male          4                    125               212
    ## 170  62   male          2                    128               208
    ## 171  57   male          4                    110               201
    ## 172  58   male          4                    146               218
    ## 173  64   male          4                    128               263
    ## 174  43   male          4                    115               303
    ## 175  70   male          2                    156               245
    ## 176  57   male          2                    124               261
    ## 177  44   male          3                    120               226
    ## 178  61   male          4                    138               166
    ## 179  42   male          4                    136               315
    ## 180  52   male          4                    128               204
    ## 181  59   male          3                    126               218
    ## 182  40   male          4                    152               223
    ## 183  42   male          3                    130               180
    ## 184  61   male          4                    140               207
    ## 185  66   male          4                    160               228
    ## 186  46   male          4                    140               311
    ## 187  59   male          1                    134               204
    ## 188  64   male          1                    170               227
    ## 189  57   male          2                    154               232
    ## 190  57   male          4                    110               335
    ## 191  47   male          3                    130               253
    ## 192  35   male          2                    122               192
    ## 193  61   male          4                    148               203
    ## 194  58   male          4                    114               318
    ## 195  58   male          2                    125               220
    ## 196  56   male          2                    130               221
    ## 197  56   male          2                    120               240
    ## 198  67   male          3                    152               212
    ## 199  44   male          4                    120               169
    ## 200  63   male          4                    140               187
    ## 201  41   male          2                    120               157
    ## 202  59   male          4                    164               176
    ## 203  45   male          1                    110               264
    ## 204  68   male          4                    144               193
    ## 205  57   male          4                    130               131
    ## 206  38   male          3                    138               175
    ##     fasting_blood_sugar resting_electro max_heart_rate exer_angina oldpeak
    ## 1                     1               2            150           0     2.3
    ## 2                     0               2            108           1     1.5
    ## 3                     0               2            129           1     2.6
    ## 4                     0               0            187           0     3.5
    ## 5                     0               0            178           0     0.8
    ## 6                     0               2            147           0     1.4
    ## 7                     1               2            155           1     3.1
    ## 8                     0               0            148           0     0.4
    ## 9                     1               2            142           1     0.6
    ## 10                    0               0            173           0     0.0
    ## 11                    1               0            162           0     0.5
    ## 12                    0               0            174           0     1.6
    ## 13                    0               0            168           0     1.0
    ## 14                    0               0            160           0     1.2
    ## 15                    0               0            171           0     0.6
    ## 16                    0               2            144           1     1.8
    ## 17                    0               2            160           0     1.8
    ## 18                    0               2            173           0     3.2
    ## 19                    0               2            132           1     2.4
    ## 20                    0               0            171           0     1.5
    ## 21                    0               2            114           1     2.0
    ## 22                    1               0            160           1     1.4
    ## 23                    0               0            158           0     0.0
    ## 24                    0               0            161           0     0.5
    ## 25                    0               0            179           1     0.4
    ## 26                    0               0            178           0     0.0
    ## 27                    0               2            120           1     2.5
    ## 28                    0               2            112           1     0.6
    ## 29                    0               0            132           1     1.2
    ## 30                    1               0            137           1     1.0
    ## 31                    0               0            178           1     1.4
    ## 32                    1               0            157           0     1.6
    ## 33                    0               2            165           0     2.5
    ## 34                    0               0            123           0     0.6
    ## 35                    0               2            128           0     2.6
    ## 36                    1               2            152           0     1.2
    ## 37                    0               0            140           0     0.4
    ## 38                    0               2            153           0     0.0
    ## 39                    0               2            188           0     0.0
    ## 40                    0               0            144           1     1.4
    ## 41                    0               2            109           1     2.2
    ## 42                    0               0            163           0     0.6
    ## 43                    0               2            158           0     0.0
    ## 44                    0               2            152           0     0.5
    ## 45                    0               2            125           1     1.4
    ## 46                    0               2            131           1     2.2
    ## 47                    0               0            113           0     1.4
    ## 48                    0               2            142           1     2.8
    ## 49                    0               2            155           0     3.0
    ## 50                    0               2            165           0     1.6
    ## 51                    0               2            140           1     3.4
    ## 52                    0               0            147           0     3.6
    ## 53                    1               0            163           0     0.2
    ## 54                    0               0             99           1     1.8
    ## 55                    0               2            158           0     0.6
    ## 56                    0               2            177           0     0.0
    ## 57                    0               2            141           1     2.8
    ## 58                    0               2            180           0     0.2
    ## 59                    0               2            111           1     0.8
    ## 60                    0               2            148           1     3.0
    ## 61                    0               2            182           0     0.0
    ## 62                    1               2            150           1     1.6
    ## 63                    0               0            172           0     0.2
    ## 64                    0               2            180           0     0.0
    ## 65                    0               2            156           0     0.0
    ## 66                    0               2            151           0     0.4
    ## 67                    0               0            146           0     1.8
    ## 68                    0               0            161           1     0.0
    ## 69                    0               2            142           1     1.2
    ## 70                    0               0            158           0     0.8
    ## 71                    0               2            186           0     0.0
    ## 72                    0               2            185           0     0.0
    ## 73                    0               2            174           0     0.0
    ## 74                    0               0            139           0     2.0
    ## 75                    0               0            156           0     0.0
    ## 76                    0               0            162           1     0.0
    ## 77                    0               2            150           0     0.4
    ## 78                    0               0            140           1     3.6
    ## 79                    0               0            140           0     1.2
    ## 80                    1               2            144           1     1.2
    ## 81                    0               2            190           0     0.0
    ## 82                    0               0            132           0     0.0
    ## 83                    1               2            165           0     0.0
    ## 84                    1               2            132           1     1.8
    ## 85                    0               2            127           0     2.8
    ## 86                    1               2            150           1     0.0
    ## 87                    0               0            143           1     1.2
    ## 88                    0               0            111           1     5.6
    ## 89                    1               2            174           0     1.4
    ## 90                    0               0            126           1     2.8
    ## 91                    0               0            170           0     0.0
    ## 92                    0               2            147           0     0.4
    ## 93                    0               0            154           1     0.0
    ## 94                    0               2            202           0     0.0
    ## 95                    0               2            186           1     0.0
    ## 96                    0               0            125           1     2.6
    ## 97                    0               2            103           0     1.4
    ## 98                    0               0            130           1     1.6
    ## 99                    1               2            166           0     2.4
    ## 100                   0               0            164           1     0.0
    ## 101                   0               2            159           0     0.2
    ## 102                   1               0            184           0     0.0
    ## 103                   0               0            131           1     1.8
    ## 104                   0               2            154           1     0.6
    ## 105                   0               0            152           0     0.0
    ## 106                   1               2            124           0     1.0
    ## 107                   0               0            179           0     0.0
    ## 108                   0               2            170           0     0.0
    ## 109                   1               0            178           0     1.2
    ## 110                   0               2            145           1     0.8
    ## 111                   0               2             96           1     2.2
    ## 112                   0               2            109           0     2.4
    ## 113                   0               0            173           1     1.6
    ## 114                   0               2            171           0     0.0
    ## 115                   0               2            170           0     1.2
    ## 116                   0               0            151           0     1.0
    ## 117                   1               0            156           0     0.0
    ## 118                   0               2            162           1     0.0
    ## 119                   1               0            175           0     0.0
    ## 120                   0               0            168           1     0.0
    ## 121                   0               0            169           0     0.0
    ## 122                   0               2            156           1     0.0
    ## 123                   0               0            112           1     2.9
    ## 124                   0               2            111           1     0.0
    ## 125                   0               2            132           0     2.0
    ## 126                   0               0             88           1     1.2
    ## 127                   1               0            147           0     0.1
    ## 128                   0               2            105           1     2.1
    ## 129                   0               0            162           0     1.9
    ## 130                   1               2            173           0     0.0
    ## 131                   0               2            166           0     0.5
    ## 132                   0               2            178           0     0.8
    ## 133                   0               2            145           0     4.2
    ## 134                   1               0            194           0     0.8
    ## 135                   0               0            120           1     0.0
    ## 136                   0               2            195           0     0.0
    ## 137                   0               2            146           0     2.0
    ## 138                   0               0            163           0     0.0
    ## 139                   0               0            122           1     4.2
    ## 140                   1               2            143           1     0.1
    ## 141                   0               2            125           1     0.9
    ## 142                   1               2            131           0     0.1
    ## 143                   0               2            125           0     0.0
    ## 144                   1               0            173           0     0.2
    ## 145                   0               0            161           0     0.0
    ## 146                   0               2            147           1     0.0
    ## 147                   0               2            130           1     3.0
    ## 148                   0               2            126           1     0.9
    ## 149                   0               0            155           0     0.0
    ## 150                   0               0            182           1     3.8
    ## 151                   0               2            168           0     2.0
    ## 152                   0               0            160           0     0.0
    ## 153                   0               2            162           0     1.9
    ## 154                   0               2            182           0     0.0
    ## 155                   0               0             95           1     2.0
    ## 156                   0               0            143           0     0.1
    ## 157                   0               2            108           1     0.0
    ## 158                   0               2            132           1     0.1
    ## 159                   0               2            126           0     0.8
    ## 160                   0               2            116           1     3.2
    ## 161                   1               2            103           1     1.6
    ## 162                   0               2            144           0     0.8
    ## 163                   0               0            162           0     0.0
    ## 164                   0               0            153           0     0.0
    ## 165                   0               0            145           0     2.6
    ## 166                   0               0             71           0     1.0
    ## 167                   0               0            156           0     0.1
    ## 168                   0               2            118           1     1.0
    ## 169                   0               0            168           0     1.0
    ## 170                   1               2            140           0     0.0
    ## 171                   0               0            126           1     1.5
    ## 172                   0               0            105           0     2.0
    ## 173                   0               0            105           1     0.2
    ## 174                   0               0            181           0     1.2
    ## 175                   0               2            143           0     0.0
    ## 176                   0               0            141           0     0.3
    ## 177                   0               0            169           0     0.0
    ## 178                   0               2            125           1     3.6
    ## 179                   0               0            125           1     1.8
    ## 180                   1               0            156           1     1.0
    ## 181                   1               0            134           0     2.2
    ## 182                   0               0            181           0     0.0
    ## 183                   0               0            150           0     0.0
    ## 184                   0               2            138           1     1.9
    ## 185                   0               2            138           0     2.3
    ## 186                   0               0            120           1     1.8
    ## 187                   0               0            162           0     0.8
    ## 188                   0               2            155           0     0.6
    ## 189                   0               2            164           0     0.0
    ## 190                   0               0            143           1     3.0
    ## 191                   0               0            179           0     0.0
    ## 192                   0               0            174           0     0.0
    ## 193                   0               0            161           0     0.0
    ## 194                   0               1            140           0     4.4
    ## 195                   0               0            144           0     0.4
    ## 196                   0               2            163           0     0.0
    ## 197                   0               0            169           0     0.0
    ## 198                   0               2            150           0     0.8
    ## 199                   0               0            144           1     2.8
    ## 200                   0               2            144           1     4.0
    ## 201                   0               0            182           0     0.0
    ## 202                   1               2             90           0     1.0
    ## 203                   0               0            132           0     1.2
    ## 204                   1               0            141           0     3.4
    ## 205                   0               0            115           1     1.2
    ## 206                   0               0            173           0     0.0
    ##     slope num_vessels_flour thal heart_disease_severity exter_angina
    ## 1       3                 0    6                      0            0
    ## 2       2                 3    3                      2            1
    ## 3       2                 2    7                      1            1
    ## 4       3                 0    3                      0            0
    ## 5       1                 0    3                      0            0
    ## 6       2                 1    7                      2            0
    ## 7       3                 0    7                      1            1
    ## 8       2                 0    6                      0            0
    ## 9       2                 1    6                      2            1
    ## 10      1                 0    7                      0            0
    ## 11      1                 0    7                      0            0
    ## 12      1                 0    3                      0            0
    ## 13      3                 0    7                      1            0
    ## 14      1                 0    3                      0            0
    ## 15      1                 0    3                      0            0
    ## 16      2                 0    3                      0            1
    ## 17      2                 0    3                      1            0
    ## 18      1                 2    7                      3            0
    ## 19      2                 2    7                      4            1
    ## 20      1                 0    3                      0            0
    ## 21      2                 0    7                      3            1
    ## 22      1                 2    7                      2            1
    ## 23      1                 0    3                      1            0
    ## 24      2                 0    7                      0            0
    ## 25      1                 0    3                      0            1
    ## 26      1                 0    3                      0            0
    ## 27      2                 0    7                      3            1
    ## 28      2                 1    6                      1            1
    ## 29      2                 1    7                      3            1
    ## 30      2                 0    3                      0            1
    ## 31      1                 0    7                      0            1
    ## 32      1                 0    3                      0            0
    ## 33      2                 1    7                      4            0
    ## 34      1                 0    3                      0            0
    ## 35      2                 0    7                      4            0
    ## 36      3                 0    3                      0            0
    ## 37      1                 0    7                      0            0
    ## 38      1                 1    3                      2            0
    ## 39      1                 0    3                      0            0
    ## 40      1                 1    7                      1            1
    ## 41      2                 1    7                      1            1
    ## 42      2                 1    7                      1            0
    ## 43      1                 0    7                      1            0
    ## 44      3                 1    3                      0            0
    ## 45      1                 1    3                      0            1
    ## 46      2                 3    7                      1            1
    ## 47      2                 1    7                      2            0
    ## 48      2                 2    7                      2            1
    ## 49      2                 0    3                      1            0
    ## 50      1                 0    7                      0            0
    ## 51      3                 0    7                      2            1
    ## 52      2                 0    3                      1            0
    ## 53      2                 2    7                      3            0
    ## 54      2                 2    7                      1            1
    ## 55      1                 2    6                      1            0
    ## 56      1                 1    3                      1            0
    ## 57      2                 1    7                      1            1
    ## 58      2                 0    3                      0            0
    ## 59      1                 0    7                      3            1
    ## 60      2                 0    3                      0            1
    ## 61      1                 0    3                      0            0
    ## 62      2                 0    7                      3            1
    ## 63      1                 0    3                      0            0
    ## 64      1                 0    3                      0            0
    ## 65      1                 0    3                      0            0
    ## 66      2                 0    3                      0            0
    ## 67      2                 3    7                      0            0
    ## 68      1                 1    7                      1            1
    ## 69      2                 1    7                      2            1
    ## 70      1                 1    3                      0            0
    ## 71      1                 0    3                      0            0
    ## 72      1                 0    3                      0            0
    ## 73      1                 0    3                      0            0
    ## 74      2                 3    7                      3            0
    ## 75      1                 0    7                      0            0
    ## 76      1                 1    7                      2            1
    ## 77      2                 1    7                      1            0
    ## 78      2                 1    7                      2            1
    ## 79      2                 0    7                      3            0
    ## 80      2                 1    3                      1            1
    ## 81      2                 0    6                      0            0
    ## 82      2                 0    6                      0            0
    ## 83      1                 0    3                      0            0
    ## 84      1                 3    7                      3            1
    ## 85      2                 1    7                      2            0
    ## 86      1                 2    7                      3            1
    ## 87      2                 0    3                      0            1
    ## 88      3                 0    7                      3            1
    ## 89      2                 1    3                      1            0
    ## 90      2                 1    7                      3            1
    ## 91      1                 0    3                      0            0
    ## 92      2                 0    7                      0            0
    ## 93      1                 1    7                      0            1
    ## 94      1                 0    3                      0            0
    ## 95      1                 0    3                      0            1
    ## 96      3                 0    7                      4            1
    ## 97      2                 1    7                      3            0
    ## 98      2                 0    7                      1            1
    ## 99      2                 0    3                      0            0
    ## 100     1                 0    3                      0            1
    ## 101     2                 0    7                      1            0
    ## 102     1                 0    3                      0            0
    ## 103     2                 0    7                      1            1
    ## 104     2                 0    7                      0            1
    ## 105     1                 0    3                      1            0
    ## 106     2                 3    7                      4            0
    ## 107     1                 0    3                      0            0
    ## 108     1                 0    3                      0            0
    ## 109     2                 0    7                      0            0
    ## 110     2                 1    7                      4            1
    ## 111     3                 1    3                      3            1
    ## 112     2                 3    3                      1            0
    ## 113     1                 0    7                      1            1
    ## 114     1                 2    7                      1            0
    ## 115     2                 2    7                      2            0
    ## 116     1                 1    7                      0            0
    ## 117     1                 0    7                      0            0
    ## 118     1                 3    3                      4            1
    ## 119     1                 2    3                      0            0
    ## 120     1                 0    7                      0            1
    ## 121     1                NA    3                      0            0
    ## 122     1                 0    7                      1            1
    ## 123     2                 1    7                      3            1
    ## 124     1                 0    7                      0            1
    ## 125     2                 2    6                      4            0
    ## 126     2                 1    7                      1            1
    ## 127     1                 3    7                      0            0
    ## 128     2                 1    6                      1            1
    ## 129     1                 1    3                      0            0
    ## 130     1                 3    3                      0            0
    ## 131     2                 0    7                      3            0
    ## 132     1                 2    3                      0            0
    ## 133     3                 0    7                      0            0
    ## 134     3                 0    7                      0            0
    ## 135     2                 3    6                      2            1
    ## 136     1                 1    7                      1            0
    ## 137     2                 3    7                      2            0
    ## 138     1                 0    3                      0            0
    ## 139     2                 3    7                      3            1
    ## 140     2                NA    7                      1            1
    ## 141     2                 2    3                      3            1
    ## 142     2                 1    3                      0            0
    ## 143     1                 0    3                      1            0
    ## 144     1                 1    7                      0            0
    ## 145     1                 0    7                      0            0
    ## 146     2                 3    7                      3            1
    ## 147     2                 2    7                      3            1
    ## 148     2                 0    7                      3            1
    ## 149     1                 0    3                      0            0
    ## 150     2                 0    7                      4            1
    ## 151     2                 0    3                      0            0
    ## 152     1                 1    3                      1            0
    ## 153     2                 0    7                      0            0
    ## 154     1                 0    3                      0            0
    ## 155     2                 2    7                      3            1
    ## 156     1                 0    3                      0            0
    ## 157     2                 1    3                      3            1
    ## 158     1                 1    3                      2            1
    ## 159     1                 3    3                      1            0
    ## 160     2                 2    3                      3            1
    ## 161     3                 0    7                      2            1
    ## 162     1                 0    7                      1            0
    ## 163     1                 0    3                      0            0
    ## 164     1                 0    3                      0            0
    ## 165     2                 2    3                      2            0
    ## 166     2                 0    3                      2            0
    ## 167     1                 1    7                      2            0
    ## 168     2                 1    3                      1            1
    ## 169     1                 2    7                      3            0
    ## 170     1                 0    3                      0            0
    ## 171     2                 0    6                      0            1
    ## 172     2                 1    7                      1            0
    ## 173     2                 1    7                      0            1
    ## 174     2                 0    3                      0            0
    ## 175     1                 0    3                      0            0
    ## 176     1                 0    7                      1            0
    ## 177     1                 0    3                      0            0
    ## 178     2                 1    3                      4            1
    ## 179     2                 0    6                      2            1
    ## 180     2                 0 <NA>                      2            1
    ## 181     2                 1    6                      2            0
    ## 182     1                 0    7                      1            0
    ## 183     1                 0    3                      0            0
    ## 184     1                 1    7                      1            1
    ## 185     1                 0    6                      0            0
    ## 186     2                 2    7                      2            1
    ## 187     1                 2    3                      1            0
    ## 188     2                 0    7                      0            0
    ## 189     1                 1    3                      1            0
    ## 190     2                 1    7                      2            1
    ## 191     1                 0    3                      0            0
    ## 192     1                 0    3                      0            0
    ## 193     1                 1    7                      2            0
    ## 194     3                 3    6                      4            0
    ## 195     2                NA    7                      0            0
    ## 196     1                 0    7                      0            0
    ## 197     3                 0    3                      0            0
    ## 198     2                 0    7                      1            0
    ## 199     3                 0    6                      2            1
    ## 200     1                 2    7                      2            1
    ## 201     1                 0    3                      0            0
    ## 202     2                 2    6                      3            0
    ## 203     2                 0    7                      1            0
    ## 204     2                 2    7                      2            0
    ## 205     2                 1    7                      3            1
    ## 206     1                NA    3                      0            0
    ##     has_heart_disease
    ## 1                  no
    ## 2                 yes
    ## 3                 yes
    ## 4                  no
    ## 5                  no
    ## 6                 yes
    ## 7                 yes
    ## 8                  no
    ## 9                 yes
    ## 10                 no
    ## 11                 no
    ## 12                 no
    ## 13                yes
    ## 14                 no
    ## 15                 no
    ## 16                 no
    ## 17                yes
    ## 18                yes
    ## 19                yes
    ## 20                 no
    ## 21                yes
    ## 22                yes
    ## 23                yes
    ## 24                 no
    ## 25                 no
    ## 26                 no
    ## 27                yes
    ## 28                yes
    ## 29                yes
    ## 30                 no
    ## 31                 no
    ## 32                 no
    ## 33                yes
    ## 34                 no
    ## 35                yes
    ## 36                 no
    ## 37                 no
    ## 38                yes
    ## 39                 no
    ## 40                yes
    ## 41                yes
    ## 42                yes
    ## 43                yes
    ## 44                 no
    ## 45                 no
    ## 46                yes
    ## 47                yes
    ## 48                yes
    ## 49                yes
    ## 50                 no
    ## 51                yes
    ## 52                yes
    ## 53                yes
    ## 54                yes
    ## 55                yes
    ## 56                yes
    ## 57                yes
    ## 58                 no
    ## 59                yes
    ## 60                 no
    ## 61                 no
    ## 62                yes
    ## 63                 no
    ## 64                 no
    ## 65                 no
    ## 66                 no
    ## 67                 no
    ## 68                yes
    ## 69                yes
    ## 70                 no
    ## 71                 no
    ## 72                 no
    ## 73                 no
    ## 74                yes
    ## 75                 no
    ## 76                yes
    ## 77                yes
    ## 78                yes
    ## 79                yes
    ## 80                yes
    ## 81                 no
    ## 82                 no
    ## 83                 no
    ## 84                yes
    ## 85                yes
    ## 86                yes
    ## 87                 no
    ## 88                yes
    ## 89                yes
    ## 90                yes
    ## 91                 no
    ## 92                 no
    ## 93                 no
    ## 94                 no
    ## 95                 no
    ## 96                yes
    ## 97                yes
    ## 98                yes
    ## 99                 no
    ## 100                no
    ## 101               yes
    ## 102                no
    ## 103               yes
    ## 104                no
    ## 105               yes
    ## 106               yes
    ## 107                no
    ## 108                no
    ## 109                no
    ## 110               yes
    ## 111               yes
    ## 112               yes
    ## 113               yes
    ## 114               yes
    ## 115               yes
    ## 116                no
    ## 117                no
    ## 118               yes
    ## 119                no
    ## 120                no
    ## 121                no
    ## 122               yes
    ## 123               yes
    ## 124                no
    ## 125               yes
    ## 126               yes
    ## 127                no
    ## 128               yes
    ## 129                no
    ## 130                no
    ## 131               yes
    ## 132                no
    ## 133                no
    ## 134                no
    ## 135               yes
    ## 136               yes
    ## 137               yes
    ## 138                no
    ## 139               yes
    ## 140               yes
    ## 141               yes
    ## 142                no
    ## 143               yes
    ## 144                no
    ## 145                no
    ## 146               yes
    ## 147               yes
    ## 148               yes
    ## 149                no
    ## 150               yes
    ## 151                no
    ## 152               yes
    ## 153                no
    ## 154                no
    ## 155               yes
    ## 156                no
    ## 157               yes
    ## 158               yes
    ## 159               yes
    ## 160               yes
    ## 161               yes
    ## 162               yes
    ## 163                no
    ## 164                no
    ## 165               yes
    ## 166               yes
    ## 167               yes
    ## 168               yes
    ## 169               yes
    ## 170                no
    ## 171                no
    ## 172               yes
    ## 173                no
    ## 174                no
    ## 175                no
    ## 176               yes
    ## 177                no
    ## 178               yes
    ## 179               yes
    ## 180               yes
    ## 181               yes
    ## 182               yes
    ## 183                no
    ## 184               yes
    ## 185                no
    ## 186               yes
    ## 187               yes
    ## 188                no
    ## 189               yes
    ## 190               yes
    ## 191                no
    ## 192                no
    ## 193               yes
    ## 194               yes
    ## 195                no
    ## 196                no
    ## 197                no
    ## 198               yes
    ## 199               yes
    ## 200               yes
    ## 201                no
    ## 202               yes
    ## 203               yes
    ## 204               yes
    ## 205               yes
    ## 206                no

### Mutate function

``` r
# crear variable mayor a 40 años
heart_disease2 = heart_disease %>% mutate(es_mayor_40 = age > 40)

# ifelse(condicion, por true, por false)
heart_disease2$nueva_var=ifelse(heart_disease$age > 40, "es mayor a 40 años", "es menor o igual a 40 años") 
select(heart_disease2, nueva_var)
```

    ##                      nueva_var
    ## 1           es mayor a 40 años
    ## 2           es mayor a 40 años
    ## 3           es mayor a 40 años
    ## 4   es menor o igual a 40 años
    ## 5           es mayor a 40 años
    ## 6           es mayor a 40 años
    ## 7           es mayor a 40 años
    ## 8           es mayor a 40 años
    ## 9           es mayor a 40 años
    ## 10          es mayor a 40 años
    ## 11          es mayor a 40 años
    ## 12          es mayor a 40 años
    ## 13          es mayor a 40 años
    ## 14          es mayor a 40 años
    ## 15          es mayor a 40 años
    ## 16          es mayor a 40 años
    ## 17          es mayor a 40 años
    ## 18          es mayor a 40 años
    ## 19          es mayor a 40 años
    ## 20          es mayor a 40 años
    ## 21          es mayor a 40 años
    ## 22          es mayor a 40 años
    ## 23          es mayor a 40 años
    ## 24          es mayor a 40 años
    ## 25          es mayor a 40 años
    ## 26          es mayor a 40 años
    ## 27          es mayor a 40 años
    ## 28          es mayor a 40 años
    ## 29          es mayor a 40 años
    ## 30  es menor o igual a 40 años
    ## 31          es mayor a 40 años
    ## 32          es mayor a 40 años
    ## 33          es mayor a 40 años
    ## 34          es mayor a 40 años
    ## 35          es mayor a 40 años
    ## 36          es mayor a 40 años
    ## 37          es mayor a 40 años
    ## 38          es mayor a 40 años
    ## 39          es mayor a 40 años
    ## 40          es mayor a 40 años
    ## 41          es mayor a 40 años
    ## 42  es menor o igual a 40 años
    ## 43          es mayor a 40 años
    ## 44          es mayor a 40 años
    ## 45          es mayor a 40 años
    ## 46          es mayor a 40 años
    ## 47          es mayor a 40 años
    ## 48          es mayor a 40 años
    ## 49          es mayor a 40 años
    ## 50          es mayor a 40 años
    ## 51          es mayor a 40 años
    ## 52          es mayor a 40 años
    ## 53          es mayor a 40 años
    ## 54          es mayor a 40 años
    ## 55          es mayor a 40 años
    ## 56          es mayor a 40 años
    ## 57          es mayor a 40 años
    ## 58          es mayor a 40 años
    ## 59          es mayor a 40 años
    ## 60          es mayor a 40 años
    ## 61          es mayor a 40 años
    ## 62          es mayor a 40 años
    ## 63          es mayor a 40 años
    ## 64          es mayor a 40 años
    ## 65          es mayor a 40 años
    ## 66          es mayor a 40 años
    ## 67          es mayor a 40 años
    ## 68          es mayor a 40 años
    ## 69          es mayor a 40 años
    ## 70          es mayor a 40 años
    ## 71          es mayor a 40 años
    ## 72          es mayor a 40 años
    ## 73          es mayor a 40 años
    ## 74          es mayor a 40 años
    ## 75          es mayor a 40 años
    ## 76          es mayor a 40 años
    ## 77          es mayor a 40 años
    ## 78          es mayor a 40 años
    ## 79          es mayor a 40 años
    ## 80          es mayor a 40 años
    ## 81          es mayor a 40 años
    ## 82          es mayor a 40 años
    ## 83  es menor o igual a 40 años
    ## 84          es mayor a 40 años
    ## 85          es mayor a 40 años
    ## 86          es mayor a 40 años
    ## 87          es mayor a 40 años
    ## 88          es mayor a 40 años
    ## 89          es mayor a 40 años
    ## 90          es mayor a 40 años
    ## 91          es mayor a 40 años
    ## 92          es mayor a 40 años
    ## 93          es mayor a 40 años
    ## 94          es mayor a 40 años
    ## 95          es mayor a 40 años
    ## 96          es mayor a 40 años
    ## 97          es mayor a 40 años
    ## 98          es mayor a 40 años
    ## 99          es mayor a 40 años
    ## 100         es mayor a 40 años
    ## 101         es mayor a 40 años
    ## 102 es menor o igual a 40 años
    ## 103         es mayor a 40 años
    ## 104         es mayor a 40 años
    ## 105         es mayor a 40 años
    ## 106         es mayor a 40 años
    ## 107         es mayor a 40 años
    ## 108         es mayor a 40 años
    ## 109         es mayor a 40 años
    ## 110 es menor o igual a 40 años
    ## 111         es mayor a 40 años
    ## 112         es mayor a 40 años
    ## 113         es mayor a 40 años
    ## 114         es mayor a 40 años
    ## 115         es mayor a 40 años
    ## 116         es mayor a 40 años
    ## 117         es mayor a 40 años
    ## 118 es menor o igual a 40 años
    ## 119         es mayor a 40 años
    ## 120         es mayor a 40 años
    ## 121         es mayor a 40 años
    ## 122         es mayor a 40 años
    ## 123         es mayor a 40 años
    ## 124         es mayor a 40 años
    ## 125         es mayor a 40 años
    ## 126         es mayor a 40 años
    ## 127         es mayor a 40 años
    ## 128         es mayor a 40 años
    ## 129         es mayor a 40 años
    ## 130         es mayor a 40 años
    ## 131         es mayor a 40 años
    ## 132         es mayor a 40 años
    ## 133 es menor o igual a 40 años
    ## 134         es mayor a 40 años
    ## 135         es mayor a 40 años
    ## 136         es mayor a 40 años
    ## 137         es mayor a 40 años
    ## 138         es mayor a 40 años
    ## 139 es menor o igual a 40 años
    ## 140         es mayor a 40 años
    ## 141         es mayor a 40 años
    ## 142         es mayor a 40 años
    ## 143         es mayor a 40 años
    ## 144         es mayor a 40 años
    ## 145         es mayor a 40 años
    ## 146         es mayor a 40 años
    ## 147         es mayor a 40 años
    ## 148         es mayor a 40 años
    ## 149         es mayor a 40 años
    ## 150         es mayor a 40 años
    ## 151         es mayor a 40 años
    ## 152         es mayor a 40 años
    ## 153         es mayor a 40 años
    ## 154         es mayor a 40 años
    ## 155         es mayor a 40 años
    ## 156         es mayor a 40 años
    ## 157         es mayor a 40 años
    ## 158         es mayor a 40 años
    ## 159         es mayor a 40 años
    ## 160         es mayor a 40 años
    ## 161         es mayor a 40 años
    ## 162         es mayor a 40 años
    ## 163         es mayor a 40 años
    ## 164         es mayor a 40 años
    ## 165         es mayor a 40 años
    ## 166         es mayor a 40 años
    ## 167         es mayor a 40 años
    ## 168         es mayor a 40 años
    ## 169 es menor o igual a 40 años
    ## 170         es mayor a 40 años
    ## 171         es mayor a 40 años
    ## 172         es mayor a 40 años
    ## 173         es mayor a 40 años
    ## 174         es mayor a 40 años
    ## 175         es mayor a 40 años
    ## 176         es mayor a 40 años
    ## 177         es mayor a 40 años
    ## 178         es mayor a 40 años
    ## 179         es mayor a 40 años
    ## 180         es mayor a 40 años
    ## 181         es mayor a 40 años
    ## 182         es mayor a 40 años
    ## 183         es mayor a 40 años
    ## 184         es mayor a 40 años
    ## 185         es mayor a 40 años
    ## 186         es mayor a 40 años
    ## 187         es mayor a 40 años
    ## 188         es mayor a 40 años
    ## 189         es mayor a 40 años
    ## 190         es mayor a 40 años
    ## 191         es mayor a 40 años
    ## 192         es mayor a 40 años
    ## 193         es mayor a 40 años
    ## 194         es mayor a 40 años
    ## 195         es mayor a 40 años
    ## 196         es mayor a 40 años
    ## 197         es mayor a 40 años
    ## 198         es mayor a 40 años
    ## 199         es mayor a 40 años
    ## 200         es mayor a 40 años
    ## 201         es mayor a 40 años
    ## 202         es mayor a 40 años
    ## 203         es mayor a 40 años
    ## 204         es mayor a 40 años
    ## 205         es mayor a 40 años
    ## 206         es mayor a 40 años
    ## 207         es mayor a 40 años
    ## 208         es mayor a 40 años
    ## 209         es mayor a 40 años
    ## 210         es mayor a 40 años
    ## 211 es menor o igual a 40 años
    ## 212 es menor o igual a 40 años
    ## 213         es mayor a 40 años
    ## 214         es mayor a 40 años
    ## 215         es mayor a 40 años
    ## 216         es mayor a 40 años
    ## 217         es mayor a 40 años
    ## 218         es mayor a 40 años
    ## 219         es mayor a 40 años
    ## 220         es mayor a 40 años
    ## 221         es mayor a 40 años
    ## 222         es mayor a 40 años
    ## 223 es menor o igual a 40 años
    ## 224         es mayor a 40 años
    ## 225         es mayor a 40 años
    ## 226 es menor o igual a 40 años
    ## 227         es mayor a 40 años
    ## 228         es mayor a 40 años
    ## 229         es mayor a 40 años
    ## 230         es mayor a 40 años
    ## 231         es mayor a 40 años
    ## 232         es mayor a 40 años
    ## 233         es mayor a 40 años
    ## 234         es mayor a 40 años
    ## 235         es mayor a 40 años
    ## 236         es mayor a 40 años
    ## 237         es mayor a 40 años
    ## 238         es mayor a 40 años
    ## 239         es mayor a 40 años
    ## 240         es mayor a 40 años
    ## 241         es mayor a 40 años
    ## 242         es mayor a 40 años
    ## 243         es mayor a 40 años
    ## 244         es mayor a 40 años
    ## 245         es mayor a 40 años
    ## 246         es mayor a 40 años
    ## 247         es mayor a 40 años
    ## 248         es mayor a 40 años
    ## 249         es mayor a 40 años
    ## 250         es mayor a 40 años
    ## 251         es mayor a 40 años
    ## 252         es mayor a 40 años
    ## 253         es mayor a 40 años
    ## 254         es mayor a 40 años
    ## 255         es mayor a 40 años
    ## 256         es mayor a 40 años
    ## 257         es mayor a 40 años
    ## 258         es mayor a 40 años
    ## 259         es mayor a 40 años
    ## 260         es mayor a 40 años
    ## 261         es mayor a 40 años
    ## 262         es mayor a 40 años
    ## 263         es mayor a 40 años
    ## 264         es mayor a 40 años
    ## 265         es mayor a 40 años
    ## 266         es mayor a 40 años
    ## 267         es mayor a 40 años
    ## 268         es mayor a 40 años
    ## 269 es menor o igual a 40 años
    ## 270         es mayor a 40 años
    ## 271         es mayor a 40 años
    ## 272         es mayor a 40 años
    ## 273         es mayor a 40 años
    ## 274         es mayor a 40 años
    ## 275         es mayor a 40 años
    ## 276         es mayor a 40 años
    ## 277         es mayor a 40 años
    ## 278 es menor o igual a 40 años
    ## 279         es mayor a 40 años
    ## 280         es mayor a 40 años
    ## 281         es mayor a 40 años
    ## 282         es mayor a 40 años
    ## 283         es mayor a 40 años
    ## 284 es menor o igual a 40 años
    ## 285         es mayor a 40 años
    ## 286         es mayor a 40 años
    ## 287         es mayor a 40 años
    ## 288         es mayor a 40 años
    ## 289         es mayor a 40 años
    ## 290         es mayor a 40 años
    ## 291         es mayor a 40 años
    ## 292         es mayor a 40 años
    ## 293         es mayor a 40 años
    ## 294         es mayor a 40 años
    ## 295         es mayor a 40 años
    ## 296         es mayor a 40 años
    ## 297         es mayor a 40 años
    ## 298         es mayor a 40 años
    ## 299         es mayor a 40 años
    ## 300         es mayor a 40 años
    ## 301         es mayor a 40 años
    ## 302         es mayor a 40 años
    ## 303 es menor o igual a 40 años

``` r
# crear variable high o low basado en  max_heart_rate > 150
heart_disease3=heart_disease %>% mutate(estado_heart_rate=ifelse(max_heart_rate > 150, "high", "low"))
select(heart_disease3, max_heart_rate, estado_heart_rate)
```

    ##     max_heart_rate estado_heart_rate
    ## 1              150               low
    ## 2              108               low
    ## 3              129               low
    ## 4              187              high
    ## 5              172              high
    ## 6              178              high
    ## 7              160              high
    ## 8              163              high
    ## 9              147               low
    ## 10             155              high
    ## 11             148               low
    ## 12             153              high
    ## 13             142               low
    ## 14             173              high
    ## 15             162              high
    ## 16             174              high
    ## 17             168              high
    ## 18             160              high
    ## 19             139               low
    ## 20             171              high
    ## 21             144               low
    ## 22             162              high
    ## 23             160              high
    ## 24             173              high
    ## 25             132               low
    ## 26             158              high
    ## 27             172              high
    ## 28             114               low
    ## 29             171              high
    ## 30             114               low
    ## 31             151              high
    ## 32             160              high
    ## 33             158              high
    ## 34             161              high
    ## 35             179              high
    ## 36             178              high
    ## 37             120               low
    ## 38             112               low
    ## 39             132               low
    ## 40             137               low
    ## 41             114               low
    ## 42             178              high
    ## 43             162              high
    ## 44             157              high
    ## 45             169              high
    ## 46             165              high
    ## 47             123               low
    ## 48             128               low
    ## 49             157              high
    ## 50             152              high
    ## 51             168              high
    ## 52             140               low
    ## 53             153              high
    ## 54             188              high
    ## 55             144               low
    ## 56             109               low
    ## 57             163              high
    ## 58             158              high
    ## 59             152              high
    ## 60             125               low
    ## 61             142               low
    ## 62             160              high
    ## 63             131               low
    ## 64             170              high
    ## 65             113               low
    ## 66             142               low
    ## 67             155              high
    ## 68             165              high
    ## 69             140               low
    ## 70             147               low
    ## 71             148               low
    ## 72             163              high
    ## 73              99               low
    ## 74             158              high
    ## 75             177              high
    ## 76             151              high
    ## 77             141               low
    ## 78             142               low
    ## 79             180              high
    ## 80             111               low
    ## 81             148               low
    ## 82             143               low
    ## 83             182              high
    ## 84             150               low
    ## 85             172              high
    ## 86             180              high
    ## 87             156              high
    ## 88             115               low
    ## 89             160              high
    ## 90             149               low
    ## 91             151              high
    ## 92             145               low
    ## 93             146               low
    ## 94             175              high
    ## 95             172              high
    ## 96             161              high
    ## 97             142               low
    ## 98             157              high
    ## 99             158              high
    ## 100            186              high
    ## 101            185              high
    ## 102            174              high
    ## 103            159              high
    ## 104            130               low
    ## 105            139               low
    ## 106            156              high
    ## 107            162              high
    ## 108            150               low
    ## 109            140               low
    ## 110            140               low
    ## 111            146               low
    ## 112            144               low
    ## 113            190              high
    ## 114            136               low
    ## 115             97               low
    ## 116            132               low
    ## 117            165              high
    ## 118            182              high
    ## 119            132               low
    ## 120            127               low
    ## 121            150               low
    ## 122            154              high
    ## 123            143               low
    ## 124            111               low
    ## 125            174              high
    ## 126            175              high
    ## 127            133               low
    ## 128            126               low
    ## 129            170              high
    ## 130            163              high
    ## 131            147               low
    ## 132            154              high
    ## 133            202              high
    ## 134            186              high
    ## 135            165              high
    ## 136            161              high
    ## 137            125               low
    ## 138            103               low
    ## 139            130               low
    ## 140            166              high
    ## 141            164              high
    ## 142            159              high
    ## 143            184              high
    ## 144            131               low
    ## 145            154              high
    ## 146            152              high
    ## 147            124               low
    ## 148            179              high
    ## 149            170              high
    ## 150            160              high
    ## 151            178              high
    ## 152            122               low
    ## 153            160              high
    ## 154            145               low
    ## 155             96               low
    ## 156            109               low
    ## 157            173              high
    ## 158            171              high
    ## 159            170              high
    ## 160            151              high
    ## 161            156              high
    ## 162            162              high
    ## 163            158              high
    ## 164            122               low
    ## 165            175              high
    ## 166            168              high
    ## 167            169              high
    ## 168            159              high
    ## 169            156              high
    ## 170            138               low
    ## 171            112               low
    ## 172            111               low
    ## 173            143               low
    ## 174            157              high
    ## 175            132               low
    ## 176             88               low
    ## 177            147               low
    ## 178            105               low
    ## 179            162              high
    ## 180            173              high
    ## 181            166              high
    ## 182            150               low
    ## 183            178              high
    ## 184            145               low
    ## 185            161              high
    ## 186            179              high
    ## 187            194              high
    ## 188            120               low
    ## 189            195              high
    ## 190            146               low
    ## 191            163              high
    ## 192            122               low
    ## 193            143               low
    ## 194            106               low
    ## 195            115               low
    ## 196            125               low
    ## 197            131               low
    ## 198            152              high
    ## 199            162              high
    ## 200            125               low
    ## 201            159              high
    ## 202            154              high
    ## 203            173              high
    ## 204            133               low
    ## 205            161              high
    ## 206            147               low
    ## 207            130               low
    ## 208            126               low
    ## 209            155              high
    ## 210            154              high
    ## 211            170              high
    ## 212            182              high
    ## 213            168              high
    ## 214            165              high
    ## 215            160              high
    ## 216            162              high
    ## 217            172              high
    ## 218            152              high
    ## 219            122               low
    ## 220            182              high
    ## 221            172              high
    ## 222            167              high
    ## 223            179              high
    ## 224             95               low
    ## 225            169              high
    ## 226            192              high
    ## 227            143               low
    ## 228            172              high
    ## 229            108               low
    ## 230            132               low
    ## 231            169              high
    ## 232            117               low
    ## 233            126               low
    ## 234            121               low
    ## 235            163              high
    ## 236            116               low
    ## 237            103               low
    ## 238            144               low
    ## 239            162              high
    ## 240            162              high
    ## 241            153              high
    ## 242            163              high
    ## 243            163              high
    ## 244            145               low
    ## 245             96               low
    ## 246             71               low
    ## 247            156              high
    ## 248            118               low
    ## 249            168              high
    ## 250            140               low
    ## 251            126               low
    ## 252            105               low
    ## 253            105               low
    ## 254            157              high
    ## 255            181              high
    ## 256            173              high
    ## 257            142               low
    ## 258            116               low
    ## 259            143               low
    ## 260            141               low
    ## 261            149               low
    ## 262            152              high
    ## 263            171              high
    ## 264            169              high
    ## 265            125               low
    ## 266            125               low
    ## 267            156              high
    ## 268            134               low
    ## 269            181              high
    ## 270            150               low
    ## 271            138               low
    ## 272            138               low
    ## 273            120               low
    ## 274            125               low
    ## 275            162              high
    ## 276            155              high
    ## 277            152              high
    ## 278            152              high
    ## 279            164              high
    ## 280            131               low
    ## 281            143               low
    ## 282            179              high
    ## 283            130               low
    ## 284            174              high
    ## 285            161              high
    ## 286            140               low
    ## 287            146               low
    ## 288            144               low
    ## 289            163              high
    ## 290            169              high
    ## 291            150               low
    ## 292            166              high
    ## 293            144               low
    ## 294            144               low
    ## 295            136               low
    ## 296            182              high
    ## 297             90               low
    ## 298            123               low
    ## 299            132               low
    ## 300            141               low
    ## 301            115               low
    ## 302            174              high
    ## 303            173              high

### Missing values with R base vs. Tidyverse syntax

``` r
# Remplazo de nulos
df_status(heart_disease)
```

    ##                  variable q_zeros p_zeros q_na p_na q_inf p_inf      type
    ## 1                     age       0    0.00    0 0.00     0     0   integer
    ## 2                  gender       0    0.00    0 0.00     0     0 character
    ## 3              chest_pain       0    0.00    0 0.00     0     0    factor
    ## 4  resting_blood_pressure       0    0.00    0 0.00     0     0   integer
    ## 5       serum_cholestoral       0    0.00    0 0.00     0     0   integer
    ## 6     fasting_blood_sugar     258   85.15    0 0.00     0     0    factor
    ## 7         resting_electro     151   49.83    0 0.00     0     0    factor
    ## 8          max_heart_rate       0    0.00    0 0.00     0     0   integer
    ## 9             exer_angina     204   67.33    0 0.00     0     0   integer
    ## 10                oldpeak      99   32.67    0 0.00     0     0   numeric
    ## 11                  slope       0    0.00    0 0.00     0     0   integer
    ## 12      num_vessels_flour     176   58.09    4 1.32     0     0   integer
    ## 13                   thal       0    0.00    2 0.66     0     0    factor
    ## 14 heart_disease_severity     164   54.13    0 0.00     0     0   integer
    ## 15           exter_angina     204   67.33    0 0.00     0     0    factor
    ## 16      has_heart_disease       0    0.00    0 0.00     0     0    factor
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
v_na_1=is.na(heart_disease$num_vessels_flour)
heart_disease$num_vessels_flour[v_na_1]=999
```

``` r
## with dplyr
data_clean=heart_disease3 %>% mutate(num_vessels_flour2=replace_na(num_vessels_flour, 999),
                                     thal2=replace_na(as.character(thal), "missing")) %>% select(num_vessels_flour2, thal2)
df_status(data_clean)
```

    ##             variable q_zeros p_zeros q_na p_na q_inf p_inf      type
    ## 1 num_vessels_flour2     176   58.09    0    0     0     0   numeric
    ## 2              thal2       0    0.00    0    0     0     0 character
    ##   unique
    ## 1      5
    ## 2      4

``` r
# remove missing values
data_clean2=na.omit(heart_disease3)
```

### Group\_by and summarise functions

``` r
# obtener promedio de max_heart_rate por has_heart_disease
group_by(heart_disease, has_heart_disease) %>% summarise(prom_hr=mean(max_heart_rate))
```

    ## # A tibble: 2 x 2
    ##   has_heart_disease prom_hr
    ##   <fct>               <dbl>
    ## 1 no                   158.
    ## 2 yes                  139.

``` r
# obtener promedio de num_vessels_flour por has_heart_disease
group_by(heart_disease, has_heart_disease) %>% summarise(prom_vess=mean(num_vessels_flour, na.rm = T),
                                                         sd_vess=sd(num_vessels_flour, na.rm = T),
                                                         prom_hr=mean(max_heart_rate)
                                                         )
```

    ## # A tibble: 2 x 4
    ##   has_heart_disease prom_vess sd_vess prom_hr
    ##   <fct>                 <dbl>   <dbl>   <dbl>
    ## 1 no                    18.5    134.     158.
    ## 2 yes                    8.32    84.6    139.

``` r
# agrupar solo en variables numéricas
res=group_by(heart_disease, has_heart_disease) %>% summarise_if(is.numeric, mean, na.rm=T)
```

``` r
# agrupar solo determinadas variables

v_vars=c("age", "max_heart_rate")
group_by(heart_disease, has_heart_disease) %>% summarise_at(v_vars, mean, na.rm=T)
```

    ## # A tibble: 2 x 3
    ##   has_heart_disease   age max_heart_rate
    ##   <fct>             <dbl>          <dbl>
    ## 1 no                 52.6           158.
    ## 2 yes                56.6           139.

``` r
group_by(heart_disease, has_heart_disease) %>% summarise_at(vars(age, max_heart_rate), mean, na.rm=T)
```

    ## # A tibble: 2 x 3
    ##   has_heart_disease   age max_heart_rate
    ##   <fct>             <dbl>          <dbl>
    ## 1 no                 52.6           158.
    ## 2 yes                56.6           139.

Resources
---------

dplyr official page: <https://dplyr.tidyverse.org/>
===================================================

Introduction to dplyr: <https://dplyr.tidyverse.org/articles/dplyr.html>
========================================================================

\`\`\`
