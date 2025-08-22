-- ===========================================
-- SQL SCRIPTS FOR USER BEHAVIOR ANALYSIS
-- ===========================================
-- Author: Muh Rifky Parahian Sopian
-- Project: Technical Test - Data Analyst
-- ===========================================

-- ===========================================
-- 1. KPI VIEWS
-- ===========================================

-- Total Users
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.kpi_total_users` AS
SELECT COUNT(id) AS total_users
FROM `user-behavior-analysis-469715.user_behavior.Users_Data`;

-- Total Transactions
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.kpi_total_transactions` AS
SELECT COUNT(id) AS total_transactions
FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data`;

-- Total Spending
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.kpi_total_spending` AS
SELECT SUM(amount) AS total_spending
FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data`;

-- Average Spending per User
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.kpi_avg_spending_per_user` AS
SELECT AVG(total_spent) AS avg_spending_per_user
FROM (
  SELECT u.id, SUM(t.amount) AS total_spent
  FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data` t
  JOIN `user-behavior-analysis-469715.user_behavior.Cards_Data` c ON t.card_id = c.id
  JOIN `user-behavior-analysis-469715.user_behavior.Users_Data` u ON c.client_id = u.id
  GROUP BY u.id
);

-- Average Credit Score
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.kpi_avg_credit_score` AS
SELECT AVG(credit_score) AS avg_credit_score
FROM `user-behavior-analysis-469715.user_behavior.Users_Data`;


-- ===========================================
-- 2. ANALYSIS VIEWS
-- ===========================================

-- Top Users by Spending
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.top_users_view` AS
SELECT u.id AS user_id,
       COUNT(t.id) AS total_transactions,
       SUM(t.amount) AS total_spent,
       AVG(t.amount) AS avg_spent
FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data` t
JOIN `user-behavior-analysis-469715.user_behavior.Cards_Data` c ON t.card_id = c.id
JOIN `user-behavior-analysis-469715.user_behavior.Users_Data` u ON c.client_id = u.id
GROUP BY u.id
ORDER BY total_spent DESC
LIMIT 10;

-- Gender Distribution
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.gender_distribution_view` AS
SELECT gender,
       COUNT(id) AS user_count
FROM `user-behavior-analysis-469715.user_behavior.Users_Data`
GROUP BY gender;

-- Monthly Transaction Trend
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.monthly_transaction_trend_view` AS
SELECT FORMAT_DATE('%Y-%m', DATE(t.date)) AS month,
       COUNT(t.id) AS total_transactions,
       SUM(t.amount) AS total_spent
FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data` t
GROUP BY month
ORDER BY month;

-- Top Merchants by Transaction Volume
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.top_merchants_view` AS
SELECT merchant_id,
       merchant_city,
       merchant_state,
       COUNT(id) AS total_transactions,
       SUM(amount) AS total_spent
FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data`
GROUP BY merchant_id, merchant_city, merchant_state
ORDER BY total_transactions DESC
LIMIT 10;

-- Card Type Usage
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.card_type_usage_view` AS
SELECT card_brand,
       card_type,
       COUNT(id) AS total_cards,
       SUM(credit_limit) AS total_credit_limit
FROM `user-behavior-analysis-469715.user_behavior.Cards_Data`
GROUP BY card_brand, card_type
ORDER BY total_cards DESC;

-- Credit Score vs Spending
CREATE OR REPLACE VIEW `user-behavior-analysis-469715.user_behavior.credit_score_vs_spending_view` AS
SELECT u.id AS user_id,
       u.credit_score,
       SUM(t.amount) AS total_spent
FROM `user-behavior-analysis-469715.user_behavior.Transactions_Data` t
JOIN `user-behavior-analysis-469715.user_behavior.Cards_Data` c ON t.card_id = c.id
JOIN `user-behavior-analysis-469715.user_behavior.Users_Data` u ON c.client_id = u.id
GROUP BY u.id, u.credit_score;
