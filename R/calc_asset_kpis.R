#' Asset KPI Engine
#'
#' Calculate key asset performance KPIs
#'
#' @param availability equipment availability
#' @param utilization equipment utilization
#' @param speed operating speed
#' @param bucket_fill bucket fill factor
#'
#' @return asset efficiency
#' @export

calc_asset_kpis <- function(availability,
                            utilization,
                            speed,
                            bucket_fill){
  
  omee <- availability *
    utilization *
    speed *
    bucket_fill
  
  return(omee)
  
}
