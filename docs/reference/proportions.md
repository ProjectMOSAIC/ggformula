# Compute groupwise proportions and percents

Transform a vector of counts and a vector of groups into a vector of
proportions or percentages within groups.

## Usage

``` r
percs_by_group(x, group)

props_by_group(x, group)
```

## Arguments

- x:

  A vector of counts

- group:

  A vector to determine groups.

## Examples

``` r

x <- c(20, 30, 30, 70)
g1 <- c("A", "A", "B", "B")
g2 <- c("A", "B", "A", "B")
props_by_group(x, g1)
#> [1] 0.4 0.6 0.3 0.7
percs_by_group(x, g1)
#> [1] 40 60 30 70
props_by_group(x, g2)
#> [1] 0.4 0.3 0.6 0.7
```
