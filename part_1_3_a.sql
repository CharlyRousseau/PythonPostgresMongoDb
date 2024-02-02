CREATE VIEW session_and_user AS
SELECT
   session_table.session_id,
    user_table.user_id,
    user_table.firstname,
    user_table.lastname,
    user_table.email,
    user_table.username,
    user_table.password,
    user_table.created_at AS user_created_at,
    session_table.connected_at
FROM session_table 
    JOIN user_table ON session_table.user_id=user_table.user_id;