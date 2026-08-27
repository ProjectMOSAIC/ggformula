# Retrieve the specification used to build a `gf_*` function

Every function created by [`layer_factory()`](layer_factory.md) carries
a `"ggformula_spec"` attribute recording the arguments (`geom`, `stat`,
`position`, `aes_form`, `extras`, `aesthetics`, `inherit.aes`,
`check.aes`, `required_packages`, `installed_packages`) it was built
with. `ggformula_spec()` retrieves this attribute, which is the
recommended way for extension packages (or `ggformula` itself, e.g. when
building `_interactive` counterparts) to introspect a `gf_*` function
without depending on the internals of
[`layer_factory()`](layer_factory.md).

## Usage

``` r
ggformula_spec(gf_fun)
```

## Arguments

- gf_fun:

  A function created by [`layer_factory()`](layer_factory.md) (e.g.
  `gf_point`).

## Value

A list with components `geom`, `stat`, `position`, `aes_form`, `extras`,
`aesthetics`, `inherit.aes`, `check.aes`, `required_packages`, and
`installed_packages`, or `NULL` if `gf_fun` was not created by
[`layer_factory()`](layer_factory.md).
