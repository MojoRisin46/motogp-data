# Query Gallery

## 🏁 Race Wins per Season
```sql
SELECT rider_name, season, COUNT(*) AS wins
FROM silver_layer.results
WHERE position = 1 AND event_type = 'RACE'
GROUP BY rider_name, season
ORDER BY season, wins DESC;
```

| Rider      | Season | Wins |
|------------|--------|------|
| Bagnaia    | 2022   | 7    |
| Marquez    | 2019   | 9    |
