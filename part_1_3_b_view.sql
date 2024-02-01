CREATE VIEW session_per_month AS 
SELECT COUNT(session_id),connected_at_month
FROM session_table
GROUP BY connected_at_month
ORDER BY connected_at_month;