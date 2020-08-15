#include "lib.h"
//#include "dev.h"
#include "recompile.h"
using namespace quanteda;

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void set_attr(RObject object_, RObject attr_) {
    object_.attr("meta") = attr_;
    //return object_;
}

// [[Rcpp::export]]
void set_attr_list(List object_, RObject attr_) {
    object_.attr("meta") = attr_;
    //return object_;
}

// [[Rcpp::export]]
void set_attr_s4(S4 object_, RObject attr_) {
    object_.attr("meta") = attr_;
    //return object_;
}

// [[Rcpp::export]]
void qatd_cpp_set_meta(RObject object_, RObject meta_) {
    object_.attr("meta") = meta_;
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
