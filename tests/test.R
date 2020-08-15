require(testthat)

meta <- list("char" = "abcd", "num" = 1234,
             "df" = data.frame(rnorm(100), sample(letters, 100, TRUE)))

char <- stringi::stri_rand_lipsum(1000)
lis <- stringi::stri_split_fixed(char, " ")
mat <- Matrix::rsparsematrix(1000, 10000, density = 0.1)

char_out <- char
attr(char_out, "meta") <- meta

lis_out <- lis
attr(lis_out, "meta") <- meta

mat_out <- mat
attr(mat_out, "meta") <- meta

test_that("works general method", {
    # expect_identical(
    #     rcpp.on.solaris:::set_attr(char, meta), char_out
    # )
    rcpp.on.solaris:::set_attr(char, meta)
    expect_identical(
        attr(char, "meta"), meta
    )
    # expect_identical(
    #     rcpp.on.solaris:::set_attr(lis, meta), lis_out
    # )
    rcpp.on.solaris:::set_attr(lis, meta)
    expect_identical(
        attr(lis, "meta"), meta
    )
    attr(lis, "meta") <- NULL

    # expect_identical(
    #     rcpp.on.solaris:::set_attr(mat, meta), mat_out
    # )
    rcpp.on.solaris:::set_attr(mat, meta)
    expect_identical(
        attr(mat, "meta"), meta
    )
    attr(mat, "meta") <- NULL
})

test_that("works S3 method", {
    # expect_identical(
    #     rcpp.on.solaris:::set_attr_list(lis, meta), lis_out
    # )
    rcpp.on.solaris:::set_attr_list(lis, meta)
    expect_identical(
        attr(lis, "meta"), meta
    )
    attr(lis, "meta") <- NULL
})

test_that("works S4 method", {
    # expect_identical(
    #     rcpp.on.solaris:::set_attr_s4(mat, meta), mat_out
    # )
    rcpp.on.solaris:::set_attr_s4(mat, meta)
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
