#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
RObject set_attr(RObject object_, RObject attr_) {
    object_.attr("meta") = attr_;
    return object_;
}

// [[Rcpp::export]]
List set_attr_list(List object_, RObject attr_) {
    object_.attr("meta") = attr_;
    return object_;
}

// [[Rcpp::export]]
S4 set_attr_s4(S4 object_, RObject attr_) {
    object_.attr("meta") = attr_;
    return object_;
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

/*** R
attr <- list("char" = "abcd", "num" = 1234)

lis <- list(1:10)
mat <- Matrix::rsparsematrix(10, 10, density = 0.1)

set_attr(lis, attr)
set_attr(mat, attr)

set_attr_list(lis, attr)
set_attr_s4(mat, attr)
*/
