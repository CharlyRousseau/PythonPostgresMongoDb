CREATE OR REPLACE VIEW very_active_users_may AS
SELECT u.username,average_session_threshold,may_sessions.session_count
FROM
    user_table u
    JOIN (
        SELECT user_id, COUNT(session_id) AS session_count
        FROM session_table
        WHERE
            EXTRACT(
                MONTH
                FROM connected_at
            ) = 5
        GROUP BY
            user_id
    ) AS may_sessions ON u.user_id = may_sessions.user_id
    JOIN (
        SELECT AVG(session_count) * 0.6 AS average_session_threshold
        FROM (
                SELECT user_id, COUNT(session_id) AS session_count
                FROM session_table
                WHERE
                    EXTRACT(
                        MONTH
                        FROM connected_at
                    ) = 5
                GROUP BY
                    user_id
            ) AS subquery
    ) AS avg_sessions ON may_sessions.session_count > avg_sessions.average_session_threshold;