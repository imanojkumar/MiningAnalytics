#' Retrieve Mining KPIs
#'
#' Returns KPI records from the MiningAnalytics KPI dictionary.
#'
#' @param category Optional KPI category
#' @param commodity Optional commodity type
#' @param region Optional region (Global / India)
#' @param mining_method Optional mining method (OpenPit / Underground / Both)
#'
#' @return Data frame of KPIs
#' @export

get_kpis <- function(category = NULL,
                     commodity = NULL,
                     region = NULL,
                     mining_method = NULL) {
  
  data <- all_kpis
  
  if (!is.null(category)) {
    data <- data[data$CATEGORY == category, ]
  }
  
  if (!is.null(commodity)) {
    data <- data[data$COMMODITY == commodity, ]
  }
  
  if (!is.null(region)) {
    data <- data[data$REGION == region, ]
  }
  
  if (!is.null(mining_method)) {
    data <- data[data$MINING_METHOD == mining_method, ]
  }
  
  return(data)
}


#' List KPI Categories
#'
#' Returns all KPI categories available in MiningAnalytics.
#'
#' @return character vector
#' @export

list_kpi_categories <- function() {
  unique(kpis$CATEGORY)
}


#' List Commodities
#'
#' Returns commodity types available in KPI dataset.
#'
#' @return character vector
#' @export

list_kpi_commodities <- function() {
  unique(kpis$COMMODITY)
}


#' List Regions
#'
#' Returns regions represented in KPI dataset.
#'
#' @return character vector
#' @export

list_kpi_regions <- function() {
  unique(kpis$REGION)
}


