-- =====================================================================
-- Bronze Layer Loader
-- Structured definition of raw data for the Bronze Layer
-- Date: 2025-05-29
-- Note: All data is stored as VARCHAR; keys & typing follow in later layers
-- =====================================================================

/*======================================================================
Script Purpose:
	This script will create the new tables (if they don't already exist)

Notes:
    - The data will be loaded into the bronze layer as-in meaning all as varchars
    - even if the data is knowingly not needed (here f.e. in results table the constructor ID --> Its up to other layers to do that job)
    - No keys are entered
    - names of the columns are NOT changed unless they violate the naming conventions (f.e. suffix _key not entered) or their name is illegal (f.e. "rider.id" is not possible in SQL --> changed to "rider_id")
    - dim and fact are also not yet added in the bronze layer tables
	
WARNINGS:
	 If the tables already exist, you will receive an error message and the script will fail
========================================================================*/

-- ===============================
-- BEGIN: CREATE TABLE Definitions
-- ===============================

USE motogp_bronze;

-- Table: sessions
DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
    session_id VARCHAR(50),
    type VARCHAR(50),
    session_date VARCHAR(50),
    track VARCHAR(50),
    ground VARCHAR(50),
    air VARCHAR(50),
    humidity VARCHAR(50),
    weather VARCHAR(50),
    event_id VARCHAR(50)
);

-- Table: results
DROP TABLE IF EXISTS results;
CREATE TABLE results (
    classification_entry_id VARCHAR(50),
    position VARCHAR(50),
    average_speed VARCHAR(50),
    total_laps VARCHAR(50),
    points VARCHAR(50),
    status VARCHAR(50),
    rider_id VARCHAR(50),
    rider_riders_api_uuid VARCHAR(50),
    team_id VARCHAR(50),
    constructor_id VARCHAR(50),
    session_id VARCHAR(50),
    time_in_sec VARCHAR(50)
);

-- Table: events
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    event_id VARCHAR(100),
    event_name VARCHAR(100),
    event_status VARCHAR(100),
    country VARCHAR(100),
    circuit_id VARCHAR(100),
    test VARCHAR(100),
    event_sponsored_name VARCHAR(100),
    event_start VARCHAR(100),
    event_end VARCHAR(100),
    season_id VARCHAR(100),
    short_name VARCHAR(100),
    toad_api_uuid VARCHAR(100)
);

-- Table: riders
DROP TABLE IF EXISTS riders;
CREATE TABLE riders (
    rider_id VARCHAR(50),
    rider_name VARCHAR(50),
    rider_surname VARCHAR(50),
    birth_date VARCHAR(50),
    country_name VARCHAR(50),
    country_iso VARCHAR(10),
    rider_legacy_id VARCHAR(50),
    retired VARCHAR(10),
    in_grid VARCHAR(10),
    season_year VARCHAR(10),
    team_id VARCHAR(50),
    category_id VARCHAR(50)
);

-- Table: seasons
DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons (
    season_id VARCHAR(50),
    season_year VARCHAR(50),
    is_current VARCHAR(50)
);

-- Table: teams
DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
    team_id VARCHAR(50),
    team_name VARCHAR(50),
    constructor_id VARCHAR(50),
    season_id VARCHAR(50),
    team_legacy_id VARCHAR(50)
);

-- Table: constructors
DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
    constructor_id VARCHAR(50),
    constructor_name VARCHAR(50),
    constructor_legacy_id VARCHAR(50)
);
