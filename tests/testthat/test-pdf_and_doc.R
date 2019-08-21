test_that("pdf works", {
  # check if warning coming
  # https://github.com/ropensci/tabulizer/issues/106
  x <- tabulizer::extract_tables("td/pdf.pdf")
  expect_equal(list(structure(c("Kid Name", "Nakshatra", "Titas", "Weight",
                                "", "", "", "12", "16", "Age", "", "", "", "1.5", "6"), .Dim = c(3L,
                                                                                                 5L))), x)
})


test_that("doc works", {
  x <- docxtractr::read_docx("td/doc.doc")
  expect_equal(list(structure(list(V1 = c("Kid Name", "Nakshatra", "Titas"),
                                   V2 = c("Weight", "12", "16"), V3 = c("Age", "1.5", "6")), row.names = c(NA,
                                                                                                           -3L), class = c("tbl_df", "tbl", "data.frame"))), docxtractr::docx_extract_all_tbls(x))
})
