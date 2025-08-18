context("annotate")

p <- gf_point(mpg ~ wt, data = mtcars)

test_that("single text", {
  wrapped_expect_doppelganger(
    "single text",
    p |> gf_annotate("text", x = 4, y = 25, label = "Some text")
  )
})

test_that("multiple text", {
  wrapped_expect_doppelganger(
    "multiple text",
    p |> gf_annotate("text", x = 2:5, y = 25, label = "Some text")
  )
})

test_that("rect", {
  wrapped_expect_doppelganger(
    "rect",
    p |>
      gf_annotate(
        "rect",
        xmin = 3,
        xmax = 4.2,
        ymin = 12,
        ymax = 21,
        alpha = .2
      )
  )
})

test_that("segment", {
  wrapped_expect_doppelganger(
    "segment",
    p |>
      gf_annotate(
        "segment",
        x = 2.5,
        xend = 4,
        y = 15,
        yend = 25,
        colour = "blue"
      )
  )
})

test_that("pointrange", {
  wrapped_expect_doppelganger(
    "pointrange",
    p |>
      gf_annotate(
        "pointrange",
        x = 3.5,
        y = 20,
        ymin = 12,
        ymax = 28,
        colour = "red",
        size = 2.5,
        linewidth = 1.5
      )
  )
})

test_that("label", {
  wrapped_expect_doppelganger(
    "label",
    p |>
      gf_annotate("text", x = 2:3, y = 20:21, label = c("my label", "label 2"))
  )
})

test_that("label with formatting", {
  wrapped_expect_doppelganger(
    "label with formatting",
    p |>
      gf_annotate(
        "text",
        x = 4,
        y = 25,
        label = "italic(R) ^ 2 == 0.75",
        parse = TRUE
      )
  )
})
