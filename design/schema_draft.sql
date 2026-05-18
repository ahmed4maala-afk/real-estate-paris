-- ============================================================
-- Real Estate Analysis in Paris
-- Step 2: Database Schema (3NF Snowflake)
--
-- Datasets: DVF (Property Transactions) + Open Spaces
-- Author: Ahmed Maala
-- Date: May 2026
-- Status: DRAFT - pending UML diagram review & Yaniv's approval
-- ============================================================


-- ============================================================
-- SECTION 1: DIMENSION TABLES
-- ============================================================

-- ------------------------------------------------------------
-- Time Dimension
-- Stores date information for transactions
-- Based on: date_mutation column
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
-- Stores geographic information
-- Based on: code_postal, code_commune, nom_commune,
--           code_departement, latitude, longitude
-- ------------------------------------------------------------
CREATE TABLE dim_location (
    location_id         NUMBER AUTOINCREMENT,
    code_postal         VARCHAR(5),
    code_commune        VARCHAR(10),
    nom_commune         VARCHAR(100),
    code_departement    VARCHAR(3),
    latitude            FLOAT,
    longitude           FLOAT,

    PRIMARY KEY (location_id)
);


-- ------------------------------------------------------------
-- Property Type Dimension
-- Stores property categories
-- Based on: type_local column
-- ------------------------------------------------------------
CREATE TABLE dim_property_type (
    property_type_id    NUMBER AUTOINCREMENT,
    type_local          VARCHAR(50),

    PRIMARY KEY (property_type_id)
);


-- ------------------------------------------------------------
-- Mutation Type Dimension
-- Stores transaction types (Vente, etc.)
-- Based on: nature_mutation column
-- ------------------------------------------------------------
CREATE TABLE dim_mutation_type (
    mutation_type_id    NUMBER AUTOINCREMENT,
    nature_mutation     VARCHAR(50),

    PRIMARY KEY (mutation_type_id)
);


-- ------------------------------------------------------------
-- Green Space Category Dimension (Sub-dimension)
-- Snowflake style: separated for normalization (3NF)
-- ------------------------------------------------------------
CREATE TABLE dim_green_space_category (
    category_id     NUMBER AUTOINCREMENT,
    category_name   VARCHAR(50),

    PRIMARY KEY (category_id)
);


-- ============================================================
-- SECTION 2: SNOWFLAKE DIMENSION (links to sub-dimension)
-- ============================================================

-- ------------------------------------------------------------
-- Green Space Dimension
-- Links to category (sub-dimension) and location
-- This demonstrates the "Snowflake" structure
-- ------------------------------------------------------------
CREATE TABLE dim_green_space (
    green_space_id      NUMBER AUTOINCREMENT,
    category_id         NUMBER,
    location_id         NUMBER,
    name                VARCHAR(200),
    surface             FLOAT,
    year_opened         NUMBER(4),
    year_renovated      NUMBER(4),

    PRIMARY KEY (green_space_id),
    FOREIGN KEY (category_id)
        REFERENCES dim_green_space_category(category_id),
    FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id)
);


-- ============================================================
-- SECTION 3: FACT TABLE
-- ============================================================

-- ------------------------------------------------------------
-- Property Transaction Fact Table
-- The central table - stores all property sales (DVF)
-- Based on: id_mutation, valeur_fonciere, surface_reelle_bati,
--           nombre_pieces_principales, nombre_lots
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
-- DESIGN APPROACH (3NF Snowflake):
-- - Fact table: fact_property_transaction (DVF data)
-- - Dimensions: time, location, property_type, mutation_type
-- - Snowflake element: dim_green_space links to
--   dim_green_space_category (sub-dimension)
--
-- WHY SNOWFLAKE:
-- - Green space categories are normalized into a separate
--   table to avoid repetition (3NF principle)
-- - Reduces data redundancy
--
-- DATA SOURCE NOTES:
-- - DVF cleaned dataset: 45,207 rows, 21 columns, 0 missing
-- - All key columns (id_mutation, nature_mutation, etc.)
--   have 0% missing values
--
-- PENDING:
-- - Align with Natalja's UML diagram
-- - Yaniv's review and approval before implementation
--
-- ============================================================