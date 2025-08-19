MIpop <- readxl::read_excel("MIpop.xlsx")
names(MIpop) <- tolower(names(MIpop))
MIpop <-
  MIpop |>
  mutate(
    county = gsub(" County", "", county)
  )
devtools::use_data(MIpop, overwrite = TRUE)
