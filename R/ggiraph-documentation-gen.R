# Get all created interactive functions from the session output
interactive_functions <- c(
  "gf_abline_interactive",
  "gf_area_interactive",
  "gf_bar_interactive",
  "gf_bin_2d_interactive",
  "gf_bin2d_interactive",
  "gf_boxplot_interactive",
  "gf_col_interactive",
  "gf_contour_filled_interactive",
  "gf_contour_interactive",
  "gf_count_interactive",
  "gf_crossbar_interactive",
  "gf_curve_interactive",
  "gf_density_2d_filled_interactive",
  "gf_density_2d_interactive",
  "gf_density_interactive",
  "gf_density2d_filled_interactive",
  "gf_density2d_interactive",
  "gf_dotplot_interactive",
  "gf_errorbar_interactive",
  "gf_freqpoly_interactive",
  "gf_hex_interactive",
  "gf_histogram_interactive",
  "gf_hline_interactive",
  "gf_jitter_interactive",
  "gf_label_interactive",
  "gf_line_interactive",
  "gf_linerange_interactive",
  "gf_path_interactive",
  "gf_point_interactive",
  "gf_pointrange_interactive",
  "gf_polygon_interactive",
  "gf_quantile_interactive",
  "gf_raster_interactive",
  "gf_rect_interactive",
  "gf_ribbon_interactive",
  "gf_segment_interactive",
  "gf_sf_interactive",
  "gf_smooth_interactive",
  "gf_spoke_interactive",
  "gf_step_interactive",
  "gf_text_interactive",
  "gf_tile_interactive",
  "gf_violin_interactive",
  "gf_vline_interactive"
)

# Function to create roxygen documentation for each interactive function
create_interactive_docs <- function(func_name) {
  # Extract base function name (remove _interactive suffix)
  base_func <- gsub("_interactive$", "", func_name)

  # Create appropriate title based on function type
  title_map <- list(
    "gf_point" = "Interactive scatter plots",
    "gf_line" = "Interactive line plots",
    "gf_histogram" = "Interactive histograms",
    "gf_boxplot" = "Interactive box plots",
    "gf_bar" = "Interactive bar charts",
    "gf_density" = "Interactive density plots",
    "gf_smooth" = "Interactive smoothed conditional means",
    "gf_text" = "Interactive text annotations",
    "gf_label" = "Interactive text labels",
    "gf_abline" = "Interactive reference lines",
    "gf_hline" = "Interactive horizontal lines",
    "gf_vline" = "Interactive vertical lines"
  )

  title <- title_map[[base_func]] %||%
    paste("Interactive", gsub("gf_", "", base_func), "plots")

  # Generate roxygen block
  paste0(
    "#' ",
    title,
    "\n",
    "#'\n",
    "#' Creates an interactive plot using ggiraph. This function extends\n",
    "#' [",
    base_func,
    "()] with interactive features like tooltips and clickable elements.\n",
    "#'\n",
    "#' @param object When chaining, this holds an object produced in the earlier portions\n",
    "#'   of the chain. \n",
    "#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by\n",
    "#'   including `|` in the formula.\n",
    "#' @param data The data to be displayed in this layer.\n",
    "#' @param tooltip A formula specifying a variable for tooltips, or a character vector.\n",
    "#' @param data_id A formula or character vector specifying data identifiers\n",
    "#'   for interactive selection.\n",
    "#' @param ... Additional arguments passed to the underlying geom.\n",
    "#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.\n",
    "#' @param xlab,ylab,title,subtitle,caption Labels for the plot.\n",
    "#' @param show.legend Logical. Should this layer be included in the legends?\n",
    "#' @param show.help Logical. If `TRUE`, display some minimal help.\n",
    "#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.\n",
    "#' @param environment An environment in which to evaluate the formula.\n",
    "#'\n",
    "#' @return A gg object that can be displayed with [gf_girafe()].\n",
    "#'\n",
    "#' @section Additional interactive features:\n",
    "#' * `onclick`: JavaScript code (as character string) executed when clicking elements.\n",
    "#' * Additional ggiraph aesthetics may be available depending on the geom.\n",
    "#'\n",
    "#' @seealso [",
    base_func,
    "()], [gf_girafe()]\n",
    "#' @export\n",
    "#' @name ",
    func_name,
    "\n\n",
    func_name,
    "\n\n"
  )
}

# Generate documentation for all functions

if (FALSE) {
  here::i_am("R/ggiraph-documentation-gen.R")
  doc_file <- here::here("R", "ggiraph-documentation.R")

  cat("# Roxygen generated in ggiraph-documentation-gen.R\n\n", file = doc_file)

  for (func in interactive_functions) {
    cat(create_interactive_docs(func), file = doc_file, append = TRUE)
  }
}

# Function to create roxygen documentation with examples for each interactive function
create_interactive_docs_with_examples <- function(func_name) {
  # Extract base function name (remove _interactive suffix)
  base_func <- gsub("_interactive$", "", func_name)

  # Create appropriate title based on function type
  title_map <- list(
    "gf_point" = "Interactive scatter plots",
    "gf_line" = "Interactive line plots",
    "gf_histogram" = "Interactive histograms",
    "gf_boxplot" = "Interactive box plots",
    "gf_bar" = "Interactive bar charts",
    "gf_col" = "Interactive column charts",
    "gf_density" = "Interactive density plots",
    "gf_smooth" = "Interactive smoothed conditional means",
    "gf_text" = "Interactive text annotations",
    "gf_label" = "Interactive text labels",
    "gf_abline" = "Interactive reference lines",
    "gf_hline" = "Interactive horizontal lines",
    "gf_vline" = "Interactive vertical lines",
    "gf_jitter" = "Interactive jitter plots",
    "gf_violin" = "Interactive violin plots"
  )

  title <- title_map[[base_func]] %||%
    paste("Interactive", gsub("gf_", "", base_func), "plots")

  # Create function-specific examples
  examples <- switch(
    base_func,
    "gf_point" = paste0(
      "#' @examples\n",
      "#' # Basic interactive scatter plot\n",
      "#' gf_point_interactive(mpg ~ wt, data = mtcars,\n",
      "#'                     tooltip = ~ paste(\"Model:\", rownames(mtcars))) |>\n",
      "#'   gf_girafe()\n",
      "#'   \n",
      "#' # With color mapping and data_id for selection\n",
      "#' gf_point_interactive(mpg ~ wt, data = mtcars,\n",
      "#'                     color = ~ factor(cyl),\n",
      "#'                     tooltip = ~ paste(rownames(mtcars), \":\", mpg, \"mpg\"),\n",
      "#'                     data_id = ~ rownames(mtcars)) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_line" = paste0(
      "#' @examples\n",
      "#' # Interactive line plot with tooltips\n",
      "#' economics |>\n",
      "#'   gf_line_interactive(unemploy ~ date,\n",
      "#'                      tooltip = ~ paste(\"Date:\", date, \"Unemployed:\", unemploy)) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_histogram" = paste0(
      "#' @examples\n",
      "#' # Interactive histogram with bin information\n",
      "#' mtcars |> \n",
      "#'   gf_histogram_interactive(\n",
      "#'     ~ mpg, \n",
      "#'     tooltip = ~ paste0('Min: ', round(after_stat(xmin), 1), '; Max: ', round(after_stat(xmax),1), '; Count: ', after_stat(count)),\n",
      "#'     bins = 15) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_boxplot" = paste0(
      "#' @examples\n",
      "#' # Interactive boxplot with group information\n",
      "#' gf_boxplot_interactive(mpg ~ factor(cyl), data = mtcars,\n",
      "#'                       tooltip = ~ paste(\"Cylinders:\", cyl)) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_bar" = paste0(
      "#' @examples\n",
      "#' # Interactive bar chart with counts\n",
      "#' gf_bar_interactive(\n",
      "#'   ~ cyl, data = mtcars,\n",
      "#'   tooltip = ~ paste(\"Cylinders:\", x, \"Count:\", after_stat(count))) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_col" = paste0(
      "#' @examples\n",
      "#' # Interactive column chart with pre-computed values\n",
      "#' if (require(dplyr)) {",
      "#'   mtcars |> \n",
      "#'     group_by(cyl) |>\n",
      "#'     summarise(avg_mpg = mean(mpg)) |>\n",
      "#'     gf_col_interactive(avg_mpg ~ factor(cyl),\n",
      "#'                       tooltip = ~ paste(\"Avg MPG:\", round(avg_mpg, 1))) |>\n",
      "#'     gf_girafe()\n",
      "#' }\n"
    ),
    "gf_density" = "
#' @examples
#' diamonds |>
#'   gf_density_interactive(
#'     ~ carat, 
#'     fill = ~ cut, 
#'     color = ~ cut, 
#'     data_id = ~ cut, 
#'     tooltip = ~ cut) |> 
#'   gf_girafe()
",
    "gf_smooth" = paste0(
      "#' @examples\n",
      "#' # Interactive smooth line with confidence band\n",
      "#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.5, se = TRUE) |>\n",
      "#'   gf_smooth_interactive(tooltip = ~ \"loess line\") |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_text" = paste0(
      "#' @examples\n",
      "#' # Interactive text annotations\n",
      "#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.7) |>\n",
      "#'   gf_text_interactive(mpg ~ wt, data = mtcars[1:5, ],\n",
      "#'                      label = ~ rownames(mtcars)[1:5],\n",
      "#'                      tooltip = ~ paste(\"Car:\", rownames(mtcars)[1:5])) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_jitter" = paste0(
      "#' @examples\n",
      "#' # Interactive jittered points\n",
      "#' gf_jitter_interactive(mpg ~ factor(cyl), data = mtcars,\n",
      "#'                      tooltip = ~ paste0(rownames(mtcars), \": \", mpg, \"mpg\"),\n",
      "#'                      width = 0.2) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_violin" = paste0(
      "#' @examples\n",
      "#' # Interactive violin plot\n",
      "#' gf_violin_interactive(mpg ~ factor(cyl), data = mtcars,\n",
      "#'                      tooltip = ~ paste(\"Cylinders:\", cyl)) |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_hline" = paste0(
      "#' @examples\n",
      "#' # Interactive horizontal reference line\n",
      "#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.7) |>\n",
      "#'   gf_hline_interactive(yintercept = ~ mean(mpg),\n",
      "#'                       tooltip = ~ paste(\"Mean MPG:\", round(mean(mpg), 1)),\n",
      "#'                       color = \"red\", linetype = \"dashed\") |>\n",
      "#'   gf_girafe()\n"
    ),
    "gf_vline" = paste0(
      "#' @examples\n",
      "#' # Interactive vertical reference line\n",
      "#' gf_point_interactive(mpg ~ wt, data = mtcars, alpha = 0.7) |>\n",
      "#'   gf_vline_interactive(xintercept = ~ mean(wt),\n",
      "#'                       tooltip = ~ paste(\"Mean Weight:\", round(mean(wt), 1)),\n",
      "#'                       color = \"blue\", linetype = \"dashed\") |>\n",
      "#'   gf_girafe()\n"
    ),
    # Default example for other functions
    paste0(
      "#' @examples\n",
      "#' # Basic interactive plot\n",
      "#' ",
      func_name,
      "(mpg ~ wt, data = mtcars,\n",
      "#'",
      paste(rep(" ", nchar(func_name) + 1), collapse = ""),
      "tooltip = ~ paste(\"MPG:\", mpg)) |>\n",
      "#'   gf_girafe()\n"
    )
  )

  # Generate roxygen block with examples
  paste0(
    "#' ",
    title,
    "\n",
    "#'\n",
    "#' Creates an interactive plot using ggiraph. This function extends\n",
    "#' [",
    base_func,
    "()] with interactive features like tooltips and clickable elements.\n",
    "#'\n",
    "#' @param object When chaining, this holds an object produced in the earlier portions\n",
    "#'   of the chain. Most users can safely ignore this argument.\n",
    "#' @param gformula A formula with shape `y ~ x`. Faceting can be achieved by\n",
    "#'   including `|` in the formula.\n",
    "#' @param data The data to be displayed in this layer.\n",
    "#' @param tooltip A formula specifying a variable for tooltips, or a character vector.\n",
    "#' @param data_id A formula or character vector specifying data identifiers\n",
    "#'   for interactive selection.\n",
    "#' @param ... Additional arguments passed to the underlying geom.\n",
    "#' @param alpha,color,size,shape,fill,group,stroke Aesthetics passed to the geom.\n",
    "#' @param xlab,ylab,title,subtitle,caption Labels for the plot.\n",
    "#' @param show.legend Logical. Should this layer be included in the legends?\n",
    "#' @param show.help Logical. If `TRUE`, display some minimal help.\n",
    "#' @param inherit Logical. If `TRUE`, inherit aesthetics from previous layers.\n",
    "#' @param environment An environment in which to evaluate the formula.\n",
    "#'\n",
    "#' @return A gg object that can be displayed with [gf_girafe()].\n",
    "#'\n",
    examples,
    "#'\n",
    "#' @section Additional interactive features:\n",
    "#' * `onclick`: JavaScript code (as character string) executed when clicking elements.\n",
    "#' * Additional ggiraph aesthetics may be available depending on the geom.\n",
    "#'\n",
    "#' @seealso [",
    base_func,
    "()], [gf_girafe()]\n",
    "#' @export\n",
    "#' @name ",
    func_name,
    "\n\n",
    func_name,
    "\n\n"
  )
}

# Generate updated documentation for all functions

# Write to file
doc_file_with_examples <- here::here(
  "R",
  "ggiraph-documentation-with-examples.R"
)
cat("# Roxygen generated with examples\n\n", file = doc_file_with_examples)

for (func in interactive_functions) {
  cat(
    create_interactive_docs_with_examples(func),
    file = doc_file_with_examples,
    append = TRUE
  )
}

cli::cli_text("Documentation with examples written to:", doc_file_with_examples)
