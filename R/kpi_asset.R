#' Overall Mining Equipment Effectiveness
#'
#' Calculates mining OMEE.
#'
#' @param availability numeric
#' @param utilization numeric
#' @param speed numeric
#' @param bucket numeric
#'
#' @return numeric
#' @export
calc_omee <- function(availability, utilization, speed, bucket) {
  availability * utilization * speed * bucket
}
