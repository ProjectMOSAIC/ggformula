# Modify plot labeling

Some packages like expss provide mechanisms for providing longer labels
to R objects. These labels can be used when labeling plots and tables,
for example, without requiring long or awkward variable names. This is
an experimental feature and currently only supports expss or any other
system that stores a label in the `label` attribute of a vector.

## Usage

``` r
gf_relabel(plot, labels = get_variable_labels(plot$data), ...)

# S3 method for class 'gf_ggplot'
print(x, labels = get_variable_labels(x$data), ...)
```

## Arguments

- plot:

  A ggplot.

- labels:

  A named list of labels.

- ...:

  Additional named labels. See examples.

- x:

  A ggplot.

## Value

A plot with potentially modified labels.

## Examples

``` r

# labeling using a list
labels <- list(width = "width of foot (cm)", length = "length of foot (cm)",
  domhand = "dominant hand")
gf_point(length ~ width, color = ~domhand, data = mosaicData::KidsFeet) |>
  gf_relabel(labels)


# labeling using ...
gf_point(length ~ width, color = ~domhand, data = mosaicData::KidsFeet) |>
  gf_relabel(
    width = "width of foot (cm)",
   length = "length of foot (cm)",
   domhand = "dominant hand")


# Alternatively, we can store labels with data.
KF <- mosaicData::KidsFeet |>
  set_variable_labels(
    length = 'foot length (cm)',
    width = 'foot width (cm)'
  )
gf_point(length ~ width, data = KF)

gf_density2d(length ~ width, data = KF)

get_variable_labels(KF)
#> $name
#> NULL
#> 
#> $birthmonth
#> NULL
#> 
#> $birthyear
#> NULL
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
#> NULL
#> 
#> $domhand
#> NULL
#> 

```
