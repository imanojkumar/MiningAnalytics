test_that("OMEE calculation works", {
  expect_equal(
    calc_omee(0.8,0.875,0.833,0.895),
    0.8*0.875*0.833*0.895
  )
})