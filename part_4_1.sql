-- Active: 1706539774613@@127.0.0.1@32768@app_auth
CREATE TABLE session_count (
    session_count_id SERIAL PRIMARY KEY, 
    user_id INTEGER UNIQUE, 
    session_count_value INTEGER
);

CREATE OR REPLACE FUNCTION update_session_count() RETURNS 
TRIGGER AS 
$$
BEGIN
	INSERT INTO
	    session_count (user_id, session_count_value)
	VALUES (
	        NEW.user_id, (
	            SELECT COUNT(session_id)
	            FROM session_table
	            WHERE
	                user_id = NEW.user_id
	        )
	    )
	ON CONFLICT (user_id) DO
	UPDATE
	SET
	    session_count_value = EXCLUDED.session_count_value;
	RETURN NEW;
END;
$$
LANGUAGE
plpgsql; 

CREATE TRIGGER trigger_update_session_count
AFTER INSERT
OR
UPDATE
OR DELETE ON session_table FOR EACH ROW
EXECUTE FUNCTION update_session_count ();