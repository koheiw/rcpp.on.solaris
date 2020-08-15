require(testthat)
require(quanteda)

context("test basic C++ function")

meta <- list("char" = "abcd", "num" = 1234,
             "df" = data.frame(rnorm(100), sample(letters, 100, TRUE)))

char <- stringi::stri_rand_lipsum(1000)
lis <- stringi::stri_split_fixed(char, " ")
mat <- Matrix::rsparsematrix(1000, 10000, density = 0.1)

set_attr <- function(x, y) {
    rcpp.on.solaris:::set_attr(x, y)
}

set_attr_s4 <- function(x, y) {
    rcpp.on.solaris:::set_attr_s4(x, y)
}

set_attr_list <- function(x, y) {
    rcpp.on.solaris:::set_attr_list(x, y)
}

hash_object <- function(x, ...) {
    attr(x, "meta") <- NULL
    digest::digest(list(x, utils::packageVersion("quanteda.core"), ...),
                   algo = "sha256")
}

test_that("works with quanteda objects", {

    corp <- corpus(char)
    toks <- tokens(corp)
    dfmt <- dfm(toks)

    temp <-attr(corp, "meta")
    attr(corp, "meta") <- NULL
    set_attr(corp, temp)
    expect_identical(
        attr(corp, "meta"), temp
    )

    temp <-attr(toks, "meta")
    attr(toks, "meta") <- NULL
    set_attr(toks, temp)
    expect_identical(
        attr(toks, "meta"), temp
    )

    temp <-attr(dfmt, "meta")
    attr(dfmt, "meta") <- NULL
    set_attr(dfmt, temp)
    expect_identical(
        attr(dfmt, "meta"), temp
    )

})

test_that("works general method", {
    # expect_identical(
    #     set_attr(char, meta), char_out
    # )
    set_attr(char, meta)
    expect_identical(
        attr(char, "meta"), meta
    )
    # expect_identical(
    #     set_attr(lis, meta), lis_out
    # )
    set_attr(lis, meta)
    expect_identical(
        attr(lis, "meta"), meta
    )
    attr(lis, "meta") <- NULL

    # expect_identical(
    #     set_attr(mat, meta), mat_out
    # )
    set_attr(mat, meta)
    expect_identical(
        attr(mat, "meta"), meta
    )
    attr(mat, "meta") <- NULL
})

test_that("works S3 method", {
    # expect_identical(
    #     set_attr_list(lis, meta), lis_out
    # )
    set_attr_list(lis, meta)
    expect_identical(
        attr(lis, "meta"), meta
    )
    attr(lis, "meta") <- NULL
})

test_that("works S4 method", {
    # expect_identical(
    #     set_attr_s4(mat, meta), mat_out
    # )
    set_attr_s4(mat, meta)
    expect_identical(
        attr(mat, "meta"), meta
    )
    attr(mat, "meta") <- NULL
})


test_that("works always", {
    for (i in 1:100) {
        expect_silent(set_attr(lis, meta))
        expect_silent(set_attr(mat, meta))
        expect_silent(set_attr_list(lis, meta))
        expect_silent(set_attr_s4(mat, meta))
    }
})
