-- Contributor: @example
-- Top riders by total points
SELECT rider_name, SUM(points) AS total_points
FROM silver_layer.results
GROUP BY rider_name
ORDER BY total_points DESC
LIMIT 10;