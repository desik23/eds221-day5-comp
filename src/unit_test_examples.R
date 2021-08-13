# Testing testthat
library(testthat)
library(roxygen2)


# Requires packages:

#' minmaxrange
#'
#' @param df - data frame which you would like to calculate
#'
#' @return minimum mean value and maximum mean value among all the columns of the data frame
#' @export
#'
#' @examples
minmaxrange <- function(df) {
    col_means <- apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)
    min_mean_val <- min(col_means)
    max_mean_val <- max(col_means)
    return(c(min_mean_val, max_mean_val))
}

minmaxrange(mtcars)

expect_length(minmaxrange(df = mtcars), 2)

expect_true(minmaxrange(mtcars)[1] < minmaxrange(mtcars)[2])

expect_type(minmaxrange(mtcars), "double")
