#===============================================================================
# nucband.R
#===============================================================================

# Calculate a FFT-based nucleosome banding score

# Functions ====================================================================

#' @title Compute a probability density of insert sizes
#'
#' @param insert_size Integer. Vector of insert sizes.
#' @return The insert size density.
#' @export
#' @seealso \code{\link{nucleosome_binding_score}}
insert_size_density <- function(insert_size) {
  hist(
    insert_size[insert_size <= 1e3],
    breaks = seq(0.5, 1000.5, 1),
    plot = FALSE
  )[["density"]]
}

#' @title Compute the nucleosome banding score for an insert size density
#'
#' @param insert_size_density Numeric. Vector of density at each insert size.
#' @return The banding score
#' @export
#' @seealso \code{\link{insert_size_density}}
nucleosome_banding_score <- function(insert_size_density) {
  periodogram <- spec.pgram(
    insert_size_density,
    pad = 0.3,
    tap = 0.5,
    span = 2,
    plot = FALSE,
    fast = TRUE
  )
  period <- 1 / periodogram[["freq"]]
  sum(periodogram[["spec"]][period >= 100 & period <= 300])
}
