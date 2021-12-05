library('testthat')

setup({
  sys.source("sub_controller.R", envir = parent.frame())
})

context('correct location calculated')

test_that('for trivial input', {
  result <- sub_controller('test_input.csv')
  expect_equal(result,150)
})
test_that('for longer input', {
  result <- sub_controller()
  expect_equal(result,1580000)
})

context('correct location calculated part 2')

test_that('for trivial input', {
  result <- sub_controller2('test_input.csv')
  expect_equal(result,900)
})

test_that('for longer input', {
  result <- sub_controller2()
  expect_equal(result,1251263225)
})