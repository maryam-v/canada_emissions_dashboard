/* ============================================================
   Canada Emissions Dashboard - Queries
   Dataset: Environment and Climate Change Canada (ECCC)
   Purpose: SQL queries for Databricks dashboard visualizations
   ============================================================ */

/* ------------------------------------------------------------
   1. National Emissions Trend (Canada, 1990–2023)
   ------------------------------------------------------------ */
SELECT 
    CAST(Year AS BIGINT) AS Year,
    CAST(TRY_CAST(CO2eq AS DOUBLE) AS BIGINT) AS CO2eq
FROM `canada_emissions`.`default`.`en_ghg_econ_can_prov_terr`
WHERE 
    Sector IS NULL 
    AND `Sub-sector` IS NULL 
    AND `Sub-sub-sector` IS NULL 
    AND Region = 'Canada' 
    AND Source = 'National Inventory Total'
ORDER BY Year;


/* ------------------------------------------------------------
   2. National Emissions by Source (Canada, 2023)
   ------------------------------------------------------------ */
SELECT 
    Source,
    CAST(TRY_CAST(CO2eq AS DOUBLE) AS BIGINT) AS CO2eq
FROM `canada_emissions`.`default`.`en_ghg_econ_can_prov_terr`
WHERE 
    Sector IS NULL 
    AND `Sub-sector` IS NULL 
    AND `Sub-sub-sector` IS NULL 
    AND Year = '2023'
    AND Region = 'Canada' 
    AND Source <> 'National Inventory Total'
ORDER BY CO2eq DESC;


/* ------------------------------------------------------------
   3. National Emissions by Source Trend (Canada, 1990–2023)
   ------------------------------------------------------------ */
SELECT 
    CAST(Year AS BIGINT) AS Year,
    Source,
    CAST(TRY_CAST(CO2eq AS DOUBLE) AS BIGINT) AS CO2eq
FROM `canada_emissions`.`default`.`en_ghg_econ_can_prov_terr`
WHERE 
    Sector IS NULL 
    AND `Sub-sector` IS NULL 
    AND `Sub-sub-sector` IS NULL 
    AND Region = 'Canada' 
    AND Source <> 'National Inventory Total'
ORDER BY Year, Source;


/* ------------------------------------------------------------
   4. Total Emissions by Province (1990–2023)
   ------------------------------------------------------------ */
SELECT 
    Region,
    CAST(SUM(CAST(TRY_CAST(CO2eq AS DOUBLE) AS BIGINT)) AS BIGINT) AS CO2eq
FROM `canada_emissions`.`default`.`en_ghg_econ_can_prov_terr`
WHERE 
    Sector IS NULL 
    AND `Sub-sector` IS NULL 
    AND `Sub-sub-sector` IS NULL 
    AND Region <> 'Canada' 
    AND Source = 'Provincial Inventory Total'
GROUP BY Region
ORDER BY CO2eq DESC;


/* ------------------------------------------------------------
   5. Alberta vs Ontario Emissions Trend (1990–2023)
   ------------------------------------------------------------ */
SELECT 
    CAST(Year AS BIGINT) AS Year,
    Region,
    SUM(CAST(TRY_CAST(CO2eq AS DOUBLE) AS BIGINT)) AS CO2eq
FROM `canada_emissions`.`default`.`en_ghg_econ_can_prov_terr`
WHERE 
    Sector IS NULL 
    AND `Sub-sector` IS NULL 
    AND `Sub-sub-sector` IS NULL 
    AND Region IN ('Alberta','Ontario')
GROUP BY Year, Region
ORDER BY Year, Region;


/* ------------------------------------------------------------
   6. Alberta Emissions by Source Trend (1990–2023)
   ------------------------------------------------------------ */
SELECT 
    CAST(Year AS BIGINT) AS Year,
    Source,
    SUM(CAST(TRY_CAST(CO2eq AS DOUBLE) AS BIGINT)) AS CO2eq
FROM `canada_emissions`.`default`.`en_ghg_econ_can_prov_terr`
WHERE 
    Region = 'Alberta'
    AND Sector IS NULL 
    AND `Sub-sector` IS NULL 
    AND `Sub-sub-sector` IS NULL
    AND Source <> 'Provincial Inventory Total'
GROUP BY Year, Source
ORDER BY Year, Source;
