CREATE TABLE username_history (
    username_history_id SERIAL PRIMARY KEY, user_id INTEGER, username_new VARCHAR(255), timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION update_username_history(
) RETURNS TRIGGER AS 
$$
BEGIN
	-- Insérer l'historique des valeurs de username
	IF TG_OP = 'INSERT'
	OR TG_OP = 'UPDATE' THEN
	INSERT INTO
	    username_history (user_id, username_new)
	VALUES (NEW.user_id, NEW.username);
END
	IF;
	RETURN NEW;
END;
$$
LANGUAGE
plpgsql; 

CREATE TRIGGER trigger_update_username
AFTER INSERT
OR
UPDATE ON user_table FOR EACH ROW
EXECUTE FUNCTION update_username_history ();