/*

=====================================================================
Creating the Gold Layer
=====================================================================

Script Purpose:
	This script will create the new silver tables (if they don't already exist)

Notes:
    - reordering columns based on this logic: id in the start, add. info to the id next (descending from big to small), and in the end foreign key columns
    - tech columns from the silver layer are excluded (f.e. dwh load date)
    - surrogate keys are entered in the gold layer if necc.

*/


USE motogp_gold;

-- constructors
CREATE OR REPLACE VIEW dim_constructors AS
SELECT

    constructor_id,
    constructor_name,
    constructor_legacy_id

FROM motogp_silver.constructors;


-- events
CREATE OR REPLACE VIEW dim_events AS
SELECT

    event_id,
    event_status,
    country,
    circuit_id,    
    event_name,
    event_sponsored_name,
    event_start,
    event_end,   
    test AS test_event,
    season_id

FROM motogp_silver.events;


CREATE OR REPLACE VIEW fact_results AS
SELECT

    classification_entry_id AS session_result_id,
    status AS result_status,
    position,
    points,
    average_speed AS avg_speed,
    total_laps AS laps,
    time_in_sec,
    team_id,
    rider_riders_api_uuid AS rider_id,
    session_id

FROM motogp_silver.results;


CREATE OR REPLACE VIEW dim_riders AS
SELECT
    rider_id,
    rider_name,
    rider_surname,
    rider_legacy_id,
    birth_date AS rider_birth_date,
    season_year,    
    team_id,
    country_name AS rider_country
FROM motogp_silver.riders;



-- seasons
CREATE OR REPLACE VIEW dim_seasons AS
SELECT

    season_id,
    season_year,
    is_current

FROM motogp_silver.seasons;


-- sessions
CREATE OR REPLACE VIEW dim_sessions AS
SELECT

    session_id,
    type AS session_type,
    session_date,
    track AS track_condition,
    weather,
    air AS air_temp,
    ground AS ground_temp,
    humidity,
    event_id

FROM motogp_silver.sessions;


-- teams
CREATE OR REPLACE VIEW dim_teams AS
SELECT

    team_id,
    team_name,
    team_legacy_id,
    season_id,
    constructor_id

FROM motogp_silver.teams;
