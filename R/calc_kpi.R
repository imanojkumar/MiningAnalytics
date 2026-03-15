#' Calculate KPI Value
#'
#' Generic KPI calculation engine for MiningAnalytics
#'
#' @param kpi_id KPI identifier
#' @param data named list containing required variables
#'
#' @return numeric KPI value
#' @export

calc_kpi <- function(kpi_id, data){
  
  if(!is.list(data)){
    stop("Data must be a named list")
  }
  
  result <- switch(kpi_id,
                   
                   # -----------------------------
                   # Asset KPIs
                   # -----------------------------
                   
                   "KPI_A_001" = data$Availability *
                     data$Utilization *
                     data$Speed *
                     data$BucketFill,
                   
                   "KPI_A_002" = data$OperatingTime /
                     data$PlannedTime,
                   
                   # -----------------------------
                   # Production KPIs
                   # -----------------------------
                   
                   "KPI_P_001" = data$ActualProduction /
                     data$PlannedProduction,
                   
                   "KPI_P_002" = data$ActualProduction -
                     data$PlannedProduction,
                   
                   # -----------------------------
                   # Overburden KPIs
                   # -----------------------------
                   
                   "KPI_OB_001" = data$OverburdenVolume /
                     data$CoalProduction,
                   
                   # -----------------------------
                   # Water KPIs
                   # -----------------------------
                   
                   "KPI_W_001" = data$WaterUse /
                     data$Production,
                   
                   # -----------------------------
                   # Energy KPIs
                   # -----------------------------
                   
                   "KPI_E_001" = data$EnergyConsumed /
                     data$Production,
                   
                   # -----------------------------
                   # Environmental KPIs
                   # -----------------------------
                   
                   "KPI_ENV_001" = data$CO2Emissions /
                     data$Production,
                   
                   # -----------------------------
                   # Safety KPIs
                   # -----------------------------
                   
                   "KPI_S_001" = (data$LostTimeInjuries * 1000000) /
                     data$HoursWorked,
                   
                   stop("KPI not implemented")
  )
  
  return(result)
  
}
