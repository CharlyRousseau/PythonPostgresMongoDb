CREATE TABLE user_table (
    user_id SERIAL PRIMARY KEY, 
    firstname VARCHAR(255), 
    lastname VARCHAR(255), 
    email VARCHAR(255) UNIQUE, 
    username VARCHAR(255) UNIQUE CHECK (length(username) > 8), 
    password VARCHAR(255) CHECK (length(password) > 8), 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE user_email_verification_table (
    uev_id SERIAL PRIMARY KEY, 
    user_id INTEGER REFERENCES,
    user_table (user_id), 
    verified_at TIMESTAMP
);

CREATE TABLE session_table (
    session_id SERIAL PRIMARY KEY, 
    user_id INTEGER REFERENCES user_table (user_id), 
    connected_at TIMESTAMP,
);

ALTER TABLE user_table
ADD CONSTRAINT username_length_constraint CHECK (length(username) > 8);

ALTER TABLE user_table
ADD CONSTRAINT email_length_constraint CHECK (length(email) > 8);

ALTER TABLE user_table
ADD CONSTRAINT password_length_constraint CHECK (length(password) > 8);