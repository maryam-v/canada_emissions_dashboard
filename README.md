# Canada Emissions Dashboard

## Overview
This project is an end-to-end **Databricks dashboard** analyzing greenhouse gas (GHG) emissions in Canada from 1990–2023. It is to test and showcase advanced SQL, visualization, and analytics skills.

## Data Source
- Environment and Climate Change Canada (ECCC) – National Inventory Report datasets
- Covers emissions by **region** and **sector** from 1990–2023

## Features
- **Regional Analysis**: Compare provinces such as Alberta, Ontario, Quebec, Saskatchewan, British Columbia, Manitoba, Nova Scotia, New Brunswick, Newfoundland and Labrador, Prince Edward Island
- **Sectoral Breakdown**: Oil & Gas, Transport, Buildings, Electricity, Agriculture, Heavy Industry, Waste, Light Manufacturing, Construction and Forest Resources, and Coal Production
- **Trend Visualizations**: Line charts, bar charts, pie charts, heatmaps, histograms, and choropleth maps
- **Key Insights**:
  - Alberta and Ontario contribute nearly 60% of Canada’s total emissions
  - Oil & Gas and Transport together account for more than half of emissions
  - Alberta’s emissions rose by ~170K units since 1990, driven by oil & gas (+82K units)
  - Ontario’s emissions declined sharply after its coal phase-out
  - National emissions peaked around 2008, dropped in 2009 (financial crisis), and again in 2020 (COVID-19)

## Repository Structure

```
queries/ # SQL queries used in Databricks 
visuals/ # PNG charts and maps 
schema.md # Dataset schema 
documentation data_description.md # Data dictionary and notes 
README.md # Project overview

```

## Visuals
### Alberta vs Ontario Emissions Trend
![Alberta vs Ontario Trend](visuals/alberta_vs_ontario_trend.png)

### Emissions by Source
![Emissions by Source](visuals/emissions_by_source.png)

### Emissions by Region
![Emissions by Region](visuals/emissions_by_region.png)

*(More visuals available in the `visuals/` folder)*

## How to Reproduce
1. Clone the repository:
   ```bash
   git clone [https://github.com/yourusername/canada-emissions-dashboard.git](https://github.com/maryam-v/canada_emissions_dashboard.git)
   
2. Import SQL queries into Databricks.

3. Connect to the ECCC dataset.

4. Run queries and generate dashboards.

5. Explore visualizations in the visuals/ folder.

## Related Project
US Emissions Dashboard 

## License
This project is licensed under the MIT License. See LICENSE for details.
