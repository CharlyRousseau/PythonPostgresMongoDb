CREATE VIEW subscription_per_plan_per_month AS
SELECT 
    EXTRACT(MONTH FROM subscribed_at) AS month,
    subscription_plan,
    COUNT(*) AS total_paid_users,
    SUM(paid) AS total_revenue
FROM subscription_table
GROUP BY 
    EXTRACT(MONTH FROM subscribed_at),
    subscription_plan
ORDER BY 
    EXTRACT(MONTH FROM subscribed_at),
    subscription_plan;
