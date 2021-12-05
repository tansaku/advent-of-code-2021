library('testthat')

setup({
  sys.source("binary_diagnostic.R", envir = parent.frame())
})

context('correct diagnostic calculated')

test_that('for trivial input', {
  result <- binary_diagnostic('test_input.csv')
  expect_equal(result,198)
})