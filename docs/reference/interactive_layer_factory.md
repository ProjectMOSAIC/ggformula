# Create an interactive ggformula layer function

Primarily intended for package developers, this function factory is used
to create layer functions in the ggformula package.

## Usage

``` r
interactive_layer_factory(geom_fun)
```

## Arguments

- geom_fun:

  A character string naming an interactive geom (example:
  "geom_point_interactive")

## Details

Given `"geom_point_interactive"`, this looks up the corresponding
non-interactive function ([`gf_point()`](gf_point.md)) and reads its
[`ggformula_spec()`](ggformula_spec.md) to determine the `geom`, `stat`,
`position`, `aes_form`, `extras`, `aesthetics`, `inherit.aes`, and
`check.aes` to reuse when building the interactive counterpart, rather
than introspecting [`gf_point()`](gf_point.md)'s internals directly.
This makes it robust to `gf_*` functions built by other packages, as
long as they were created with [`layer_factory()`](layer_factory.md)
(and therefore carry a `"ggformula_spec"` attribute).
