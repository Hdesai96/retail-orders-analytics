-- Business Analysis Queries for Retail Orders Data
-- Database: MySQL (retail_db)
-- Table: df_orders
-- Author: Harshni Desai
-- Date: February 2026
-- GitHub: https://github.com/Hdesai96/retail-orders-analytics

-- =====================================================
-- SETUP: Verify Data Load
-- =====================================================
-- Check total rows in the table
SELECT COUNT(*) as total_rows FROM df_orders;

-- View sample data
SELECT * FROM df_orders LIMIT 5;


-- =====================================================
-- Query 1: Top 10 Revenue Generating Products
-- =====================================================
-- Purpose: Identify which products generate the most revenue
-- Business Use: Focus marketing and inventory on high-revenue products

SELECT 
    product_id,
    sub_category,
    SUM(sale_price * quantity) AS total_revenue
FROM df_orders
GROUP BY product_id, sub_category
ORDER BY total_revenue DESC
LIMIT 10;


-- =====================================================
-- Query 2: Top 5 Selling Products by Region
-- =====================================================
-- Purpose: Understand regional product preferences
-- Business Use: Tailor inventory and marketing strategies by region

SELECT 
    region,
    product_id,
    total_quantity
FROM (
    SELECT 
        region,
        product_id,
        SUM(quantity) AS total_quantity,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(quantity) DESC) AS rank_num
    FROM df_orders
    GROUP BY region, product_id
) ranked
WHERE rank_num <= 5
ORDER BY region, rank_num;


-- =====================================================
-- Query 3: Month-over-Month Sales Growth
-- =====================================================
-- Purpose: Track sales trends over time
-- Business Use: Identify seasonal patterns and growth trends

WITH monthly_sales AS (
    SELECT 
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(sale_price * quantity) AS monthly_revenue
    FROM df_orders
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT 
    year,
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY year, month) AS previous_month_revenue,
    ROUND(
        ((monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY year, month)) 
        / LAG(monthly_revenue) OVER (ORDER BY year, month)) * 100, 
        2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY year, month;


-- =====================================================
-- Query 4: Highest Profit Margin Products
-- =====================================================
-- Purpose: Identify most profitable product categories
-- Business Use: Prioritize high-margin products for promotion

SELECT 
    sub_category,
    category,
    AVG(profit) AS avg_profit,
    ROUND(AVG((profit / NULLIF(sale_price, 0)) * 100), 2) AS avg_profit_margin_pct
FROM df_orders
WHERE sale_price > 0
GROUP BY sub_category, category
ORDER BY avg_profit_margin_pct DESC
LIMIT 10;


-- =====================================================
-- Query 5: Regional Performance Analysis
-- =====================================================
-- Purpose: Compare performance across different regions
-- Business Use: Allocate resources and target underperforming regions

SELECT 
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(sale_price * quantity), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit / NULLIF(sale_price, 0)) * 100, 2) AS avg_profit_margin_pct
FROM df_orders
GROUP BY region
ORDER BY total_revenue DESC;


-- =====================================================
-- BONUS QUERIES: Additional Analysis
-- =====================================================

-- Category Performance
SELECT 
    category,
    COUNT(*) as order_count,
    SUM(quantity) as total_quantity,
    ROUND(SUM(sale_price * quantity), 2) as revenue,
    ROUND(AVG(profit), 2) as avg_profit
FROM df_orders
GROUP BY category
ORDER BY revenue DESC;

-- Ship Mode Analysis
SELECT 
    ship_mode,
    COUNT(DISTINCT order_id) as orders,
    ROUND(AVG(sale_price * quantity), 2) as avg_order_value
FROM df_orders
WHERE ship_mode IS NOT NULL
GROUP BY ship_mode
ORDER BY orders DESC;

-- Customer Segment Analysis
SELECT 
    segment,
    COUNT(DISTINCT order_id) as total_orders,
    ROUND(SUM(sale_price * quantity), 2) as revenue,
    ROUND(AVG(sale_price * quantity), 2) as avg_order_value
FROM df_orders
GROUP BY segment
ORDER BY revenue DESC;
