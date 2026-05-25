-- ============================================================
-- Real Estate Analysis in Paris
-- Step 2: Database Schema (3NF Snowflake)
--
-- Datasets: DVF (Property Transactions) + Risk Sectors
-- Author: Ahmed Maala
-- Date: May 2026
-- Status: DRAFT - pending Yaniv's approval
-- ============================================================


-- ============================================================
-- SECTION 1: DIMENSION TABLES
-- ============================================================

-- ------------------------------------------------------------
-- Time Dimension
-- Based on: date_mutation column (DVF)
-- ------------------------------------------------------------
CREATE TABLE dim_time (
    date_id         NUMBER AUTOINCREMENT,
    full_date       DATE NOT NULL,
    year            NUMBER(4),
    month           NUMBER(2),
    quarter         NUMBER(1),

    PRIMARY KEY (date_id)
);


-- ------------------------------------------------------------
-- Location Dimension
-- Shared by both DVF and Risk Sectors datasets
-- Based on: code_postal, nom_commune, latitude, longitude
-- ------------------------------------------------------------
CREATE TABLE dim_location (
    location_id         NUMBER AUTOINCREMENT,
    code_postal         VARCHAR(5),
    code_commune        VARCHAR(10),
    nom_commune         VARCHAR(100),
    code_departement    VARCHAR(3),
    arrondissement      NUMBER(2),
    latitude            FLOAT,
    longitude           FLOAT,

    PRIMARY KEY (location_id)
);


-- ------------------------------------------------------------
-- Property Type Dimension
-- Based on: type_local column (DVF)
-- ------------------------------------------------------------
CREATE TABLE dim_property_type (
    property_type_id    NUMBER AUTOINCREMENT,
    type_local          VARCHAR(50),

    PRIMARY KEY (property_type_id)
);


-- ------------------------------------------------------------
-- Mutation Type Dimension
-- Based on: nature_mutation column (DVF)
-- ------------------------------------------------------------
CREATE TABLE dim_mutation_type (
    mutation_type_id    NUMBER AUTOINCREMENT,
    nature_mutation     VARCHAR(50),

    PRIMARY KEY (mutation_type_id)
);


-- ------------------------------------------------------------
-- Risk Type Sub-Dimension (Snowflake element!)
-- Based on: type_risque column (Risk Sectors)
-- Examples: Flood risk, Quarry, Stormwater
-- ------------------------------------------------------------
CREATE TABLE dim_risk_type (
    risk_type_id    NUMBER AUTOINCREMENT,
    type_risque     VARCHAR(100),

    PRIMARY KEY (risk_type_id)
);


-- ============================================================
-- SECTION 2: SNOWFLAKE DIMENSION
-- ============================================================

-- ------------------------------------------------------------
-- Risk Zone Dimension
-- Links to risk_type (sub-dimension) = Snowflake structure
-- Based on: Risk Sectors dataset (plub_pprizone)
-- Columns: gid, zone, libelle, surface, arrondissement
-- ------------------------------------------------------------
CREATE TABLE dim_risk_zone (
    risk_zone_id    NUMBER AUTOINCREMENT,
    risk_type_id    NUMBER,
    location_id     NUMBER,
    gid             VARCHAR(50),
    zone            VARCHAR(100),
    libelle         VARCHAR(200),
    surface         FLOAT,

    PRIMARY KEY (risk_zone_id),
    FOREIGN KEY (risk_type_id)
        REFERENCES dim_risk_type(risk_type_id),
    FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id)
);


-- ============================================================
-- SECTION 3: FACT TABLE
-- ============================================================

-- ------------------------------------------------------------
-- Property Transaction Fact Table
-- Central table - stores all DVF property sales
-- Based on: DVF cleaned dataset (45,207 rows, 21 columns)
-- ------------------------------------------------------------
CREATE TABLE fact_property_transaction (
    transaction_id      NUMBER AUTOINCREMENT,
    id_mutation         VARCHAR(20),
    date_id             NUMBER,
    location_id         NUMBER,
    property_type_id    NUMBER,
    mutation_type_id    NUMBER,

    valeur_fonciere     NUMBER(15,2),
    surface_reelle_bati FLOAT,
    nombre_pieces       NUMBER(3),
    nombre_lots         NUMBER(3),

    PRIMARY KEY (transaction_id),
    FOREIGN KEY (date_id)
        REFERENCES dim_time(date_id),
    FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id),
    FOREIGN KEY (property_type_id)
        REFERENCES dim_property_type(property_type_id),
    FOREIGN KEY (mutation_type_id)
        REFERENCES dim_mutation_type(mutation_type_id)
);


-- ============================================================
-- SCHEMA NOTES
-- ============================================================
--
-- DESIGN: 3NF Snowflake Schema
--
-- SNOWFLAKE ELEMENT:
--   dim_risk_zone → dim_risk_type (sub-dimension)
--   This separates risk categories for better normalization
--
-- HOW DATASETS CONNECT:
--   fact_property_transaction → dim_location ← dim_risk_zone
--   Both datasets share location via code_postal/arrondissement
--   This allows analysis like:
--   "Do properties in flood-risk zones have lower prices?"
--
-- DATA SOURCES:
--   DVF 2022: 45,207 clean transactions, 0 missing values
--   Risk Sectors: 1,653 risk zones (plub_pprizone)
--
-- PENDING: Yaniv's review and approval
-- ============================================================