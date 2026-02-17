/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: FORMAT(), EXTRACT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- ANALYSE SALES PERFORMANCE OVER TIME.
-- QUICK DATE FUNCTIONS.
SELECT 
	MONTH(ORDER_DATE) AS ORDER_YEAR,
	SUM(SALES_AMOUNT) AS TOTAL_SALES, 
	COUNT(DISTINCT CUSTOMER_KEY) AS TOTAL_CUSTOMER,
	SUM(QUANTITY) AS TOTAL_QUANTITY 
FROM GOLD_FACT_SALES WHERE ORDER_DATE IS NOT NULL 
GROUP BY MONTH(ORDER_DATE) ORDER BY MONTH(ORDER_DATE);
    
-- FORMAT()
SELECT 
    DATE_FORMAT(ORDER_DATE, '%Y-%m-01') AS ORDER_MONTH,
    SUM(SALES_AMOUNT) AS TOTAL_SALES,
    COUNT(DISTINCT CUSTOMER_KEY) AS TOTAL_CUSTOMER,
    SUM(QUANTITY) AS TOTAL_QUANTITY
FROM GOLD_FACT_SALES
WHERE ORDER_DATE IS NOT NULL
GROUP BY ORDER_MONTH
ORDER BY ORDER_MONTH;

-- EXTRACT()
SELECT 
    EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
    EXTRACT(MONTH FROM ORDER_DATE) AS ORDER_MONTH,
    SUM(SALES_AMOUNT) AS TOTAL_SALES,
    COUNT(DISTINCT CUSTOMER_KEY) AS TOTAL_CUSTOMER,
    SUM(QUANTITY) AS TOTAL_QUANTITY
FROM GOLD_FACT_SALES
WHERE ORDER_DATE IS NOT NULL
GROUP BY ORDER_YEAR, ORDER_MONTH
ORDER BY ORDER_YEAR, ORDER_MONTH; 
