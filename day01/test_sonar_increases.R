
library('testthat')

setup({
  sys.source("sonar_increases.R", envir = parent.frame())
})

context('correct number of individual increases detected')

test_that('for trivial input', {
  result <- sonar_increases('test_input.csv')
  expect_equal(result,7)
})

test_that('for longer input', {
  result <- sonar_increases()
  expect_equal(result,1665)
})

context('correct number of 3-window increases detected')

test_that('for trivial input', {
  result <- sonar_window_increases('test_input.csv')
  expect_equal(result,5)
})

test_that('for longer input', {
  result <- sonar_window_increases()
  expect_equal(result,1702)
})