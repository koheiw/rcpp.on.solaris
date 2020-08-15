require(testthat)

meta <- list("char" = "abcd", "num" = 1234)
lis <- list(1:10)
mat <- Matrix::rsparsematrix(10, 10, density = 0.1)

lis_out <- lis
attr(lis_out, "meta") <- meta

mat_out <- mat
attr(mat_out, "meta") <- meta

test_that("works general method", {
    expect_identical(
        rcpp.on.solaris:::set_attr(lis, meta), lis_out
    )
    expect_identical(
        attr(lis, "meta"), meta
    )
    attr(lis, "meta") <- NULL

    expect_identical(
        rcpp.on.solaris:::set_attr(mat, meta), mat_out
    )
    expect_identical(
        attr(mat, "meta"), meta
    )
    attr(mat, "meta") <- NULL
})

test_that("works S3 method", {
    expect_identical(
        rcpp.on.solaris:::set_attr_list(lis, meta), lis_out
    )
    expect_identical(
        attr(lis, "meta"), meta
    )
    attr(lis, "meta") <- NULL
})

test_that("works S4 method", {
    expect_identical(
        rcpp.on.solaris:::set_attr_s4(mat, meta), mat_out
    )
    expect_identical(
        attr(mat, "meta"), meta
    )
    attr(mat, "meta") <- NULL
})


test_that("works always", {
    for (i in 1:100) {
        expect_silent(rcpp.on.solaris:::set_attr(lis, meta))
        expect_silent(rcpp.on.solaris:::set_attr(mat, meta))
        expect_silent(rcpp.on.solaris:::set_attr_list(lis, meta))
        expect_silent(rcpp.on.solaris:::set_attr_s4(mat, meta))
    }
})
