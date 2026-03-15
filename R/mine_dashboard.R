#' Mine Performance Dashboard
#'
#' Generate a mine performance dashboard from operational data
#'
#' @param production actual production (tonnes)
#' @param plan planned production (tonnes)
#' @param energy energy consumed (kWh)
#' @param water water consumption (m3)
#' @param co2 CO2 emissions (tCO2)
#' @param hours_worked total labour hours
#' @param lost_time_injuries number of LTIs
#'
#' @return list containing mine KPI dashboard
#' @export

mine_dashboard <- function(production,
                           plan,
                           energy,
                           water,
                           co2,
                           hours_worked,
                           lost_time_injuries){
  
  # ----------------------------
  # Production KPIs
  # ----------------------------
  
  production_attainment <- production / plan
  
  # ----------------------------
  # Energy KPIs
  # ----------------------------
  
  energy_intensity <- energy / production
  
  # ----------------------------
  # Water KPIs
  # ----------------------------
  
  water_intensity <- water / production
  
  # ----------------------------
  # Environmental KPIs
  # ----------------------------
  
  carbon_intensity <- co2 / production
  
  # ----------------------------
  # Safety KPIs
  # ----------------------------
  
  ltifr <- (lost_time_injuries * 1000000) / hours_worked
  
  # ----------------------------
  # ESG Score
  # ----------------------------
  
  environmental_score <- 1 / (energy_intensity + carbon_intensity + water_intensity)
  
  social_score <- 1 / (ltifr + 1)
  
  governance_score <- production_attainment
  
  esg_score <- mine_esg_score(environmental_score,
                              social_score,
                              governance_score)
  
  # ----------------------------
  # Build dashboard output
  # ----------------------------
  
  dashboard <- list(
    
    Production = list(
      Production = production,
      Plan = plan,
      Attainment = production_attainment
    ),
    
    Energy = list(
      EnergyConsumed = energy,
      EnergyIntensity = energy_intensity
    ),
    
    Water = list(
      WaterUsed = water,
      WaterIntensity = water_intensity
    ),
    
    Environment = list(
      CO2 = co2,
      CarbonIntensity = carbon_intensity
    ),
    
    Safety = list(
      LTIs = lost_time_injuries,
      LTIFR = ltifr
    ),
    
    ESG = list(
      Environmental = environmental_score,
      Social = social_score,
      Governance = governance_score,
      ESG_Score = esg_score
    )
    
  )
  
  return(dashboard)
  
}
