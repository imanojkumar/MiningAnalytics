#' Production KPI Engine
#'
#' Calculate production performance metrics
#'
#' @param actual production achieved
#' @param planned planned production
#'
#' @return production attainment
#' @export

calc_production_kpis <- function(actual,
                                 planned){
  
  attainment <- actual / planned
  
  return(attainment)
  
}
