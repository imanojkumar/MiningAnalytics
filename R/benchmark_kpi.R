#' Benchmark KPI
#'
#' Compare KPI with global and India benchmark
#'
#' @param kpi_id KPI identifier
#' @param value calculated KPI value
#'
#' @return benchmark comparison
#' @export

benchmark_kpi <- function(kpi_id, value){
  
  kpis <- get_kpis()
  
  row <- kpis[kpis$KPI_ID == kpi_id,]
  
  global <- row$BENCHMARK_GLOBAL
  india <- row$BENCHMARK_INDIA
  
  result <- list(
    KPI = kpi_id,
    value = value,
    global_benchmark = global,
    india_benchmark = india
  )
  
  return(result)
  
}
