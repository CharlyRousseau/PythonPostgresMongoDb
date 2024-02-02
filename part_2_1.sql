-- Active: 1706536086604@@127.0.0.1@5432@app_auth
CREATE TABLE subscription_table (
    subscription_id SERIAL PRIMARY KEY,
    subscribed_at DATE CHECK (subscribed_at BETWEEN '2023-01-01' AND '2023-06-30'),
    user_id INTEGER REFERENCES user_table(user_id),
    paid INTEGER CHECK (paid IN (10, 100, 1000)),
    subscription_plan VARCHAR(10),
    CONSTRAINT check_plan_paid_match CHECK (
        (paid = 10 AND subscription_plan = 'monthly') OR
        (paid = 100 AND subscription_plan = 'yearly') OR
        (paid = 1000 AND subscription_plan = 'lifetime')
    )
);

-- Generate 60 insert queries with random values for subscription_table

-- Temporary table to store user_ids from 1 to 100
CREATE TEMP TABLE temp_user_ids (user_id INTEGER);
INSERT INTO temp_user_ids
SELECT generate_series(1, 100);

-- Insert 60 rows into subscription_table
INSERT INTO subscription_table (subscribed_at, user_id, subscription_plan, paid)
SELECT 
    '2023-01-01'::date + (random() * interval '181 days') AS subscribed_at,
    user_id,
    CASE 
        WHEN random_plan = 0 THEN 'monthly'
        WHEN random_plan = 1 THEN 'yearly'
        ELSE 'lifetime'
    END AS subscription_plan,
    CASE 
        WHEN random_plan = 0 THEN 10
        WHEN random_plan = 1 THEN 100
        ELSE 1000
    END AS paid
FROM (
    SELECT 
        user_id,
        floor(random() * 3) AS random_plan
    FROM temp_user_ids
) AS sub_temp
ORDER BY random()
LIMIT 60;



-- Drop temporary table
DROP TABLE temp_user_ids;

