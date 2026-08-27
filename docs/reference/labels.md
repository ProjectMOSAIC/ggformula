# Set and extract labels from a labeled object

Some packages like expss provide mechanisms for providing longer labels
to R objects. These labels can be used when labeling plots and tables,
for example, without requiring long or awkward variable names. This is
an experimental feature and currently only supports expss or any other
system that stores a label in the `label` attribute of a vector.

## Usage

``` r
get_variable_labels(...)
```

## Arguments

- ...:

  passed to
  [`labelled::var_label()`](https://larmarange.github.io/labelled/reference/var_label.html)

## Details

`get_variable_labels()` is a synonym of
[`labelled::var_label()`](https://larmarange.github.io/labelled/reference/var_label.html).

## See also

[`labelled::var_label()`](https://larmarange.github.io/labelled/reference/var_label.html),
[`labelled::set_variable_labels()`](https://larmarange.github.io/labelled/reference/var_label.html)

## Examples

``` r
KF <-
  mosaicData::KidsFeet |>
  set_variable_labels(
      length      = 'foot length (cm)',
      width       = 'foot width (cm)',
      birthmonth  = 'birth month',
      birthyear   = 'birth year',
      biggerfoot  = 'bigger foot',
      domhand     = 'dominant hand'
  )
KF |>
  gf_point(length ~ width, color = ~ domhand)

get_variable_labels(KF)
#> $name
#> NULL
#> 
#> $birthmonth
#> [1] "birth month"
#> 
#> $birthyear
#> [1] "birth year"
#> 
#> $length
#> [1] "foot length (cm)"
#> 
#> $width
#> [1] "foot width (cm)"
#> 
#> $sex
#> NULL
#> 
#> $biggerfoot
#> [1] "bigger foot"
#> 
#> $domhand
#> [1] "dominant hand"
#> 
```
