-- ============================================
-- Retail Sales Analytics - SQL Queries
-- ============================================

-- --------------------------------------------
-- 1. Total Revenue
-- --------------------------------------------
SELECT 
    SUM(totalprice) AS total_revenue
FROM cleaned_retail_data;


-- --------------------------------------------
-- 2. Total Customers
-- --------------------------------------------
SELECT 
    COUNT(DISTINCT customerid) AS total_customers
FROM cleaned_retail_data;


-- --------------------------------------------
-- 3. Total Orders
-- --------------------------------------------
SELECT 
    COUNT(DISTINCT invoiceno) AS total_orders
FROM cleaned_retail_data;


-- --------------------------------------------
-- 4. Top 10 Customers by Revenue
-- --------------------------------------------
SELECT 
    customerid,
    SUM(totalprice) AS revenue
FROM cleaned_retail_data
GROUP BY customerid
ORDER BY revenue DESC
LIMIT 10;


-- --------------------------------------------
-- 5. Revenue by Country
-- --------------------------------------------
SELECT 
    country,
    SUM(totalprice) AS revenue
FROM cleaned_retail_data
GROUP BY country
ORDER BY revenue DESC;


-- --------------------------------------------
-- 6. Monthly Revenue Trend
-- --------------------------------------------
SELECT 
    DATE_FORMAT(invoicedate, '%Y-%m') AS month,
    SUM(totalprice) AS revenue
FROM cleaned_retail_data
GROUP BY month
ORDER BY month;


-- --------------------------------------------
-- 7. Top 10 Most Sold Products
-- --------------------------------------------
SELECT 
    description,
    SUM(quantity) AS total_sold
FROM cleaned_retail_data
GROUP BY description
ORDER BY total_sold DESC
LIMIT 10;


-- --------------------------------------------
-- 8. Customer Purchase Frequency
-- --------------------------------------------
SELECT 
    customerid,
    COUNT(DISTINCT invoiceno) AS frequency
FROM cleaned_retail_data
GROUP BY customerid
ORDER BY frequency DESC;


-- --------------------------------------------
-- 9. Average Order Value
-- --------------------------------------------
SELECT 
    SUM(totalprice) / COUNT(DISTINCT invoiceno) AS avg_order_value
FROM cleaned_retail_data;


-- --------------------------------------------
-- 10. High Value Customers
-- --------------------------------------------
SELECT 
    customerid,
    SUM(totalprice) AS revenue,
    COUNT(DISTINCT invoiceno) AS frequency
FROM cleaned_retail_data
GROUP BY customerid
HAVING revenue > 3000 
   AND frequency >= 5
ORDER BY revenue DESC;
