# MiningAnalytics

MiningAnalytics is an R package for **mining industry performance analytics and ESG benchmarking**.

The package provides a structured **KPI ontology (~330 mining KPIs)** together with tools to calculate, benchmark, and analyze mining operational performance.

It is designed for:

* Mining operations analytics
* ESG performance monitoring
* Mine benchmarking
* Academic research in mining systems
* Digital mine analytics

---

# Key Features

## Mining KPI Ontology

MiningAnalytics contains a structured database of approximately **330 mining industry KPIs** organized across operational domains.

Categories include:

* Asset Efficiency
* Production Efficiency
* Overburden & Waste
* Water Management
* Logistics & Material Handling
* Energy Management
* Environmental Sustainability
* Safety & Health
* Land Rehabilitation
* Quality & Processing
* Governance & Compliance
* Supply Chain Integration

Each KPI includes metadata such as:

* formula
* ESG dimension
* SDG alignment
* benchmark references
* data sources
* measurement frequency

---

## KPI Retrieval

Retrieve KPI definitions programmatically.

```r
library(MiningAnalytics)

get_kpis()
```

---

## KPI Calculation Engine

Compute KPI values using the built-in calculation engine.

```r
calc_kpi(
  "KPI_P_001",
  list(
    ActualProduction = 105000,
    PlannedProduction = 100000
  )
)
```

---

## Mine Performance Dashboard

Generate a high-level mine analytics summary.

```r
mine_dashboard(
  production = 105000,
  plan = 100000,
  energy = 450000,
  water = 22000,
  co2 = 18000,
  hours_worked = 250000,
  lost_time_injuries = 2
)
```

The dashboard reports:

* production performance
* energy intensity
* water intensity
* carbon intensity
* safety indicators
* ESG score

---

## Benchmark Comparison

Compare mine performance against benchmark values.

```r
benchmark_kpi("KPI_E_001", value = 12)
```

---

# Installation

Install from GitHub.

```r
remotes::install_github("YOUR_GITHUB_USERNAME/MiningAnalytics")
```

---

# Example Workflow

Typical analytics workflow:

```r
library(MiningAnalytics)

# retrieve KPI definitions
kpis <- get_kpis()

# calculate KPI
value <- calc_kpi("KPI_P_001",
  list(
    ActualProduction = 105000,
    PlannedProduction = 100000
  )
)

# benchmark
benchmark_kpi("KPI_P_001", value)

# generate dashboard
mine_dashboard(
  production = 105000,
  plan = 100000,
  energy = 450000,
  water = 22000,
  co2 = 18000,
  hours_worked = 250000,
  lost_time_injuries = 2
)
```

---

# Project Structure

```
MiningAnalytics
│
├ data/
│   kpis.rda
│
├ R/
│   get_kpis.R
│   calc_kpi.R
│   calc_asset_kpis.R
│   calc_production_kpis.R
│   benchmark_kpi.R
│   mine_esg_score.R
│   mine_dashboard.R
│
├ reports/
│   mine_report.qmd
│
├ docs/
│   Quarto documentation site
│
└ data-raw/
    DATASET.R
```

---

# Use Cases

MiningAnalytics supports multiple use cases:

Mining Operations
• production monitoring
• energy efficiency tracking
• equipment productivity

ESG & Sustainability
• environmental indicators
• water usage monitoring
• carbon intensity metrics

Mining Research
• benchmarking studies
• digital mining analytics
• sustainability evaluation

---

# Development Roadmap

Upcoming improvements:

* extended KPI formulas
* benchmark datasets
* KPI dependency graphs
* mine digital twin analytics
* interactive dashboards (Shiny)
* predictive mining analytics

---

# Author

Manoj Kumar

Mining Analytics | Data Science | ESG in Mining
