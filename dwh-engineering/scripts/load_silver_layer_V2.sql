/*

=====================================================================
Loading the data from the Bronze Layer into the Silver Layer
=====================================================================

Script Purpose:
	This script will load the data from the bronze layer (including the applied transformation and cleaning steps) into the silver layer

Notes:
    - tables will be truncated before each reload

*/

USE motogp_silver;

-- constructors

TRUNCATE TABLE constructors;

INSERT INTO constructors (
    constructor_id,
    constructor_name,
    constructor_legacy_id
)
SELECT constructor_id, constructor_name, constructor_legacy_id
FROM motogp_bronze.constructors;

-- events
TRUNCATE TABLE events;
INSERT INTO motogp_silver.events (
    event_id,
    event_name,
    event_status,
    country,
    circuit_id,
    test,
    event_sponsored_name,
    event_start,
    event_end,
    season_id,
    short_name,
    toad_api_uuid
)
SELECT
    event_id,
    event_name,
    event_status,
    country,
    circuit_id,
    IF(test = 'True', 1, 0),
    event_sponsored_name,
    STR_TO_DATE(event_start, '%Y-%m-%d'),
    STR_TO_DATE(event_end, '%Y-%m-%d'),
    season_id,
    short_name,
    toad_api_uuid
FROM motogp_bronze.events;


-- results
TRUNCATE TABLE results;
INSERT INTO motogp_silver.results (
    classification_entry_id,
    position,
    average_speed,
    total_laps,
    points,
    status,
    rider_id,
    rider_riders_api_uuid,
    team_id,
    constructor_id,
    session_id,
    time_in_sec
)
SELECT
    NULLIF(classification_entry_id, ''),
    NULLIF(position, ''),
    NULLIF(average_speed, ''),
    NULLIF(total_laps, ''),
    COALESCE(NULLIF(points, ''), 0),
    NULLIF(status, ''),
    NULLIF(rider_id, ''),
    NULLIF(rider_riders_api_uuid, ''),
    NULLIF(team_id, ''),
    NULLIF(constructor_id, ''),
    NULLIF(session_id, ''),
    NULLIF(time_in_sec, '')
FROM motogp_bronze.results;



-- riders
TRUNCATE TABLE riders;
INSERT INTO riders (
    rider_id,
    rider_name,
    rider_surname,
    birth_date,
    country_name,
    country_iso,
    rider_legacy_id,
    retired,
    in_grid,
    season_year,
    team_id,
    category_id
)
SELECT
    rider_id,
    rider_name,
    rider_surname,
    STR_TO_DATE(NULLIF(birth_date, ''), '%Y-%m-%d'),
    NULLIF(country_name, ''),
    country_iso,
    NULLIF(rider_legacy_id, ''),
    IF(retired = 'True', 1, 0),
    IF(in_grid = 'True', 1, 0),
    NULLIF(season_year, ''),
    NULLIF(team_id, ''),
    NULLIF(category_id, '')
FROM motogp_bronze.riders;


-- seasons

TRUNCATE TABLE seasons;

INSERT INTO seasons (season_id, season_year, is_current)
SELECT
    seasons.season_id,
    NULLIF(seasons.season_year, ''),
    IF(seasons.is_current = 'True', 1, 0) -- MySQL doesn't have a boolean datatype, which is why we have to transform to Int
FROM motogp_bronze.seasons;


-- sessions
TRUNCATE TABLE sessions;
INSERT INTO motogp_silver.sessions (
    session_id,
    type,
    session_date,
    track,
    ground,
    air,
    humidity,
    weather,
    event_id
)
SELECT
    session_id,
    type,
    NULLIF(STR_TO_DATE(SUBSTR(session_date, 1, 10), '%Y-%m-%d'), NULL), -- extracts only the date not the time
    NULLIF(track, ''),
    REPLACE(ground, 'º', ''), 
    REPLACE(air, 'º', ''), 
    humidity,
    weather,
    event_id
FROM motogp_bronze.sessions;

-- teams

TRUNCATE TABLE teams;

INSERT INTO teams (team_id, team_name, constructor_id, season_id, team_legacy_id)
SELECT
    team_id,
    team_name,
    constructor_id,
    season_id,
    team_legacy_id
FROM motogp_bronze.teams;
















