#' KPI Trend
#'
#' Calculate KPI trend over time
#'
#' @param values numeric vector
#'
#' @return trend statistics
#' @export

kpi_trend <- function(values){
  
  slope <- coef(lm(values ~ seq_along(values)))[2]
  
  list(
    mean = mean(values),
    sd = sd(values),
    trend = slope
  )
}
