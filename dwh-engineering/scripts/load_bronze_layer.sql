-- =====================================================================
-- Bronze Layer Loader
-- Structured loading of raw data into the Bronze Layer
-- Date: 2025-05-29
-- Note: All data is stored as VARCHAR; keys & typing follow in Silver Layer
-- =====================================================================

/*======================================================================
Script Purpose:
	This script will fill the created tables with the data (locally).

Notes:
    - The data will be loaded into the bronze layer as-in meaning all as varchars
    - even if the data is knowingly not needed (here f.e. in results table the constructor ID --> Its up to other layers to do that job)
    - No keys are entered
    - names of the columns are NOT changed unless they violate the naming conventions (f.e. suffix _key not entered) or their name is illegal (f.e. "rider.id" is not possible in SQL --> changed to "rider_id")
    - dim and fact are also not yet added in the bronze layer tables
========================================================================*/

-- ===============================
-- Load data (MySQL-compatible, defined paths)
-- ===============================

USE motogp_bronze;

TRUNCATE TABLE sessions;
-- LOAD: sessions
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/sessions_season_2025_ae6c6f0d-c652-44f8-94aa-420fc5b3dab4.csv'
INTO TABLE sessions
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(session_id, type, session_date, track, ground, air, humidity, weather, event_id);

TRUNCATE TABLE results;

-- LOAD: results
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/session_results_season_2025_ae6c6f0d-c652-44f8-94aa-420fc5b3dab4.csv'
INTO TABLE results
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(classification_entry_id, position, average_speed, total_laps, points, status, rider_id, rider_riders_api_uuid, team_id, constructor_id, session_id, time_in_sec);

TRUNCATE TABLE events;

-- LOAD: events
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/events_season_2025_ae6c6f0d-c652-44f8-94aa-420fc5b3dab4.csv'
INTO TABLE events
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(event_id, event_name, event_status, country, circuit_id, test, event_sponsored_name, event_start, event_end, season_id, short_name, toad_api_uuid);

TRUNCATE TABLE riders;

-- LOAD: riders
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/riders_season_2025_ae6c6f0d-c652-44f8-94aa-420fc5b3dab4.csv'
INTO TABLE riders
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(rider_id, rider_name, rider_surname, birth_date, country_name, country_iso, rider_legacy_id, retired, in_grid, season_year, team_id, category_id);

TRUNCATE TABLE teams;

-- LOAD: teams
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/teams_season_2025_ae6c6f0d-c652-44f8-94aa-420fc5b3dab4.csv'
INTO TABLE teams
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(team_id, team_name, constructor_id, season_id, team_legacy_id);

TRUNCATE TABLE constructors;

-- LOAD: constructors
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/constructors_season_2025_ae6c6f0d-c652-44f8-94aa-420fc5b3dab4.csv'
INTO TABLE constructors
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(constructor_id, constructor_name, constructor_legacy_id);

TRUNCATE TABLE seasons;

-- LOAD: seasons
LOAD DATA LOCAL INFILE '/home/mojo/MEGA/Humankapital/Datenbanken/SQL/SQL Projekt 1 - MotoGP Database/data/seasons_all_years_from_2025_file.csv'
INTO TABLE seasons
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(season_id, season_year, is_current);

-- ===============================
-- END OF BRONZE LOADER
-- ===============================

