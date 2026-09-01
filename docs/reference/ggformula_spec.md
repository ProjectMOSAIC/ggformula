# Retrieve the specification used to build a `gf_*` function

Every function created by [`layer_factory()`](layer_factory.md) records
the arguments (`geom`, `stat`, `position`, `aes_form`, `extras`, `pre`,
`aesthetics`, `inherit.aes`, `check.aes`, `required_packages`,
`installed_packages`) it was built with. `ggformula_spec()` retrieves
that record, which is the recommended way for extension packages (or
`ggformula` itself, e.g. when building `_interactive` counterparts) to
introspect a `gf_*` function without depending on the internals of
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
`pre`, `aesthetics`, `inherit.aes`, `check.aes`, `required_packages`,
and `installed_packages`, or `NULL` if `gf_fun` was not created by
[`layer_factory()`](layer_factory.md).

## Details

The spec is stored in the function's enclosing environment rather than
as an attribute on the function, so that printing a `gf_*` function at
the console shows just the function. Use `ggformula_spec()` rather than
reaching for the binding directly; its name and location are an
implementation detail.

Note that `pre` is included precisely so that
[`interactive_layer_factory()`](interactive_layer_factory.md) (and
similar tools) can replay it: some `gf_*` functions (e.g.
[`gf_text()`](gf_text.md), whose `nudge_x`/`nudge_y` handling lives in
`pre`, or [`gf_violin()`](gf_violin.md), whose `quantile_gp` default is
only valid after `pre` computes it) depend on `pre` having already run
before any of their `extras` defaults are evaluated. Building a variant
without replaying `pre` can therefore produce broken or even
self-referential defaults.
