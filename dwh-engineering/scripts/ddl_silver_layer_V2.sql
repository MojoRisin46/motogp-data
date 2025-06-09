/*

=====================================================================
Creating the Silver Layer
=====================================================================

Script Purpose:
	This script will create the new silver tables (if they don't already exist)

Notes:
    - constructor ID will be excluded here, be careful to not load it in later
    - no foreign keys, in dwh projects usually not used, only primary keys
    - no naming adjustments or scrambling of column order yet in the silver layer, only later in the gold layer
	
WARNINGS:
	 If the tables already exist, you will receive an error message and the script will fail

*/

-- Creating the silver layer tables

USE motogp_silver;

-- Table: sessions
DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
    session_id CHAR(36) PRIMARY KEY,
    type VARCHAR(20),
    session_date DATE,                      
    track VARCHAR(10),              -- should be track condition, its not the track, will be changed in gold lyer though
    ground VARCHAR(10),
    air VARCHAR(10),
    humidity VARCHAR(10),
    weather VARCHAR(50),
    event_id CHAR(36),
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: results
DROP TABLE IF EXISTS results;
CREATE TABLE results (
    classification_entry_id CHAR(36) PRIMARY KEY,
    position TINYINT,
    average_speed DECIMAL(4,1),
    total_laps TINYINT,
    points TINYINT,
    status VARCHAR(30),             -- kept original name "status"
    rider_id CHAR(36),
    rider_riders_api_uuid CHAR(36),
    team_id CHAR(36),
    constructor_id CHAR(36),
    session_id CHAR(36),
    time_in_sec DECIMAL(20,3),
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: events
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    event_id CHAR(36) PRIMARY KEY,
    event_name VARCHAR(100),
    event_status VARCHAR(50),
    country VARCHAR(100),
    circuit_id CHAR(36),
    test BOOLEAN,                  -- converted from VARCHAR to BOOLEAN
    event_sponsored_name VARCHAR(100),
    event_start DATE,              -- converted from VARCHAR to DATE
    event_end DATE,
    season_id CHAR(36),
    short_name VARCHAR(100),
    toad_api_uuid CHAR(36),
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: riders
DROP TABLE IF EXISTS riders;
CREATE TABLE riders (
    rider_id CHAR(36) PRIMARY KEY,
    rider_name VARCHAR(50),
    rider_surname VARCHAR(50),
    birth_date DATE,
    country_name VARCHAR(100),
    country_iso VARCHAR(10),
    rider_legacy_id INT,
    retired BOOLEAN,
    in_grid BOOLEAN,
    season_year INT,
    team_id CHAR(36),
    category_id CHAR(36),
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: seasons
DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons (
    season_id CHAR(36) PRIMARY KEY,
    season_year SMALLINT,
    is_current BOOLEAN,
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: teams
DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
    team_id CHAR(36) PRIMARY KEY,
    team_name VARCHAR(50),
    constructor_id CHAR(36),
    season_id CHAR(36),
    team_legacy_id INT,
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: constructors
DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
    constructor_id CHAR(36) PRIMARY KEY,
    constructor_name VARCHAR(50),
    constructor_legacy_id INT,
    dwh_load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

