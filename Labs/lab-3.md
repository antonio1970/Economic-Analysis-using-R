Lab 3: Introduction to tidyverse. Economic analysis with R
================

Tidyverse vs. base R (cont.)
----------------------------

One point of convenience is that there is often a direct correspondence between a tidyverse command and its base R equivalent.

These invariably follow a `tidyverse::snake_case` vs `base::period.case` rule. E.g. see: - `?readr::read_csv` vs `?utils::read.csv` - `?tibble::data_frame`vs `?base::data.frame` - `?dplyr::if_else` vs `?base::ifelse` - etc.

If you call up the above examples, you'll see that the tidyverse alternative typically offers some enhancements or other useful options (and sometimes restrictions) over its base counterpart. - Remember: There are always many ways to achieve a single goal in R.
