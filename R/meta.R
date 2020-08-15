meta <- function(x, field = NULL, type = c("user", "object", "system", "all"))
    UseMethod("meta")

meta.corpus <- function(x, field = NULL, type = c("user", "object", "system", "all")) {
    select_meta(attr(x, "meta"), field, type)
}

meta.tokens <- function(x, field = NULL, type = c("user", "object", "system", "all")) {
    select_meta(attr(x, "meta"), field, type)
}

meta.dfm <- function(x, field = NULL, type = c("user", "object", "system", "all")) {
    select_meta(x@meta, field, type)
}

meta.dictionary2 <- function(x, field = NULL, type = c("user", "object", "system", "all")) {
    select_meta(x@meta, field, type)
}

select_meta <- function(x, field = NULL, type = c("user", "object", "system", "all")) {
    type <- match.arg(type)
    if (type == "all")
        return(x)
    if (is.null(field)) {
        return(x[[type]])
    } else {
        return(x[[type]][[field]])
    }
}
