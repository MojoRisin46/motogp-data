/*
1. GENERAL VALIDATIONS
- duplicates checking (and NULL) checking key_id columns

-- events table

--- SELECT event_id, season_id, circuit_id from events
GROUP BY event_id, season_id, circuit_id
HAVING COUNT(*) > 1;

-- results table

--- SELECT session_result_id_key, rider_id, session_id, team_id from results
GROUP BY session_result_id_key, rider_id, session_id, team_id
HAVING COUNT(*) > 1;

-- riders table

--- SELECT rider_id, season_id, team_id from riders
GROUP BY rider_id, season_id, team_id
HAVING COUNT(*) > 1;

--- select rider_legacy_id from riders
GROUP BY rider_legacy_id
HAVING COUNT(*) > 1;

-- seasons table

--- SELECT season_id from seasons
GROUP BY season_id
HAVING count(*) > 1;

- check if number of chars in ID columns is always 36

-- constructors table

--- SELECT event_id, season_id, circuit_id, LENGTH(season_id), length(event_id), length(circuit_id)
FROM events
WHERE LENGTH(event_id) <> 36 OR LENGTH(season_id) <> 36 OR length(circuit_id) <> 36;

-- results table

--- SELECT session_result_id_key, rider_id, session_id, team_id, LENGTH(session_result_id_key), length(rider_id), length(session_id), length(team_id)
FROM results
WHERE LENGTH(session_result_id_key) <> 36 OR length(rider_id) <> 36 OR length(session_id) <> 36 OR length(team_id) <> 36;

-- riders table

--- SELECT rider_id, season_id, team_id, LENGTH(rider_id), length(season_id), length(team_id)
FROM riders
WHERE LENGTH(rider_id) <> 36 OR LENGTH(season_id) <> 36 OR length(team_id) <> 36;

- check Boolean columns for incorrect values

-- events table

--- SELECT test_event from events
GROUP BY test_event;

--- select is_current from seasons
Group by is_current;

- check date field errors

-- event table

--- SELECT * FROM events
WHERE str_to_date(event_start, '%Y-%m-%d') IS NULL OR str_to_date(event_end, '%Y-%m-%d') IS NULL;

-- results table

--- 


2. TABLE SPECIFIC VALIDATIONS

- results

-- check for unrealistic positions, speed, laps, time_in_sec, points

-- column specific checks

--- position
---- always .0 ?
--- average_speed
---- 0 values need to be turned into NULL, since speed 0 is incorrect and leads to incorrect calcs
---- empty sets need to be turned into NULLs
--- total_laps
---- if empty needs to be NULL (0 needs to stay 0, this means the riders actually didn't ride any full laps)
--- time_in_sec
---- empties need to be nulled
---- . needs to be transformed into , (europeans version since the spanish and italians use it the most)
--- points
---- if empty null

- seasons

-- column specific checks

--- is_current
---- any empty sets? need to be nulled

- sessions

-- column specific checks

--- session_date
---- is including time...
--- type
---- is always either SPR or RAC

- riders

-- column specific checks

--- rider_birth_date
---- since its a date be careful with emtpy sets and Nulls
--- rider_start_year
---- empty sets need to be nulled (don't know exactly what it means - its not that he's a rookie since, the entry year is not into premier class but the world championship)

- constructors

-- column specific checks

--- constructor_id
---- is beeing imported twice
----- SELECT * FROM motogp_bronze.constructors
GROUP BY constructor_id, constructor_name, constructor_legacy_id
HAVING COUNT(*) >1;







