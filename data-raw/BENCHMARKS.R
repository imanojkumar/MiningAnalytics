benchmarks <- tibble::tribble(
  ~KPI_ID, ~REGION, ~COMMODITY, ~MINING_METHOD, ~BENCHMARK_TYPE, ~VALUE, ~UNIT,
  
  "KPI_P_001","Global","Coal","Open Pit","Average",0.95,"ratio",
  "KPI_P_001","India","Coal","Open Pit","Average",0.90,"ratio",
  
  "KPI_L_002","Global","Coal","Open Pit","Average",0.75,"%",
  "KPI_L_002","India","Coal","Open Pit","Average",0.70,"%",
  
  "KPI_E_001","Global","Coal","Open Pit","Average",14,"kWh/t",
  "KPI_E_001","India","Coal","Open Pit","Average",16,"kWh/t",
  
  "KPI_W_011","Global","Coal","Open Pit","Average",60,"%",
  "KPI_W_011","India","Coal","Open Pit","Average",45,"%"
)

usethis::use_data(benchmarks, overwrite = TRUE)