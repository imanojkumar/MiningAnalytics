library(tidyverse)

kpis <- tribble(
  ~KPI_ID, ~KPI_NAME, ~CATEGORY, ~SUBCATEGORY, ~MINING_METHOD, ~COMMODITY, ~REGION,
  ~FORMULA, ~UNIT, ~ESG_DIMENSION, ~SDG_LINK, ~R_FUNCTION, ~DESCRIPTION, ~SOURCE,
  ~BENCHMARK_GLOBAL, ~BENCHMARK_INDIA, ~DATA_SOURCE, ~FREQUENCY,
  
  "KPI_A_001","Overall Mining Equipment Effectiveness","Asset","Equipment","Both","All","Global",
  "A × U × S × B","%","E|S","8|9|13","calc_omee",
  "Mining specific equipment efficiency KPI","ICMM/TPM",
  80,55,"Fleet Monitoring Systems","Daily",
  
  "KPI_A_002","Equipment Availability","Asset","Equipment","Both","All","Global",
  "Operating Time / Planned Time","%","E","9|12","calc_availability",
  "Measures equipment uptime","ICMM",
  90,75,"Maintenance Logs","Daily",
  
  "KPI_P_001","Production Plan Attainment","Production","Operations","Both","All","Global",
  "Actual Production / Planned Production","%","G","9","calc_plan_attainment",
  "Measures production adherence to plan","Mining Ops Research",
  95,85,"Mine ERP","Daily",
  
  "KPI_OB_001","Stripping Ratio","Overburden","Waste","OpenPit","Coal","Global",
  "Overburden Volume / Coal Production","m3/t","E","12|13","calc_stripping_ratio",
  "Measures waste removal intensity","Mining Engineering",
  4,3,"Mine Dispatch System","Daily",
  
  "KPI_W_001","Water Intensity","Water","Consumption","Both","All","Global",
  "Total Water Use / Production","m3/t","E","6","calc_water_intensity",
  "Measures water consumption per tonne","GRI Water Standard",
  1.2,1.8,"Water Monitoring","Monthly"
)

write_csv(kpis, "data-raw/kpi_dictionary.csv")



library(dplyr)

generate_kpis <- function(prefix, category, subcategory, start, n) {
  
  tibble(
    KPI_ID = sprintf("%s_%03d", prefix, start:(start+n-1)),
    KPI_NAME = paste(category, "Metric", start:(start+n-1)),
    CATEGORY = category,
    SUBCATEGORY = subcategory,
    MINING_METHOD = "Both",
    COMMODITY = "All",
    REGION = "Global",
    FORMULA = NA,
    UNIT = NA,
    ESG_DIMENSION = NA,
    SDG_LINK = NA,
    R_FUNCTION = NA,
    DESCRIPTION = paste("Generated KPI for", category),
    SOURCE = "MiningAnalytics Framework",
    BENCHMARK_GLOBAL = NA,
    BENCHMARK_INDIA = NA,
    DATA_SOURCE = NA,
    FREQUENCY = NA
  )
}


asset_kpis <- generate_kpis("KPI_A", "Asset", "Equipment", 3, 33)
production_kpis <- generate_kpis("KPI_P", "Production", "Operations", 2, 39)
ob_kpis <- generate_kpis("KPI_OB", "Overburden", "Waste", 2, 24)
water_kpis <- generate_kpis("KPI_W", "Water", "Consumption", 2, 19)
stockyard_kpis <- generate_kpis("KPI_S", "Stockyard", "Handling", 1, 20)
logistics_kpis <- generate_kpis("KPI_L", "Logistics", "Transport", 1, 35)
energy_kpis <- generate_kpis("KPI_E", "Energy", "Fuel", 1, 25)
environment_kpis <- generate_kpis("KPI_ENV", "Environment", "Emissions", 1, 35)
safety_kpis <- generate_kpis("KPI_SAF", "Safety", "Health", 1, 30)
land_kpis <- generate_kpis("KPI_LAND", "Land", "Rehabilitation", 1, 20)
quality_kpis <- generate_kpis("KPI_Q", "Quality", "Processing", 1, 20)
governance_kpis <- generate_kpis("KPI_G", "Governance", "Compliance", 1, 25)
supplychain_kpis <- generate_kpis("KPI_SC", "SupplyChain", "Integration", 1, 20)


all_kpis <- bind_rows(
  kpis,
  asset_kpis,
  production_kpis,
  ob_kpis,
  water_kpis,
  stockyard_kpis,
  logistics_kpis,
  energy_kpis,
  environment_kpis,
  safety_kpis,
  land_kpis,
  quality_kpis,
  governance_kpis,
  supplychain_kpis
)


write_csv(all_kpis, "data-raw/kpi_dictionary.csv")
usethis::use_data(all_kpis, overwrite = TRUE)

