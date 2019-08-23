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
