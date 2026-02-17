/*
===============================================================================
Cumulative Analysis 
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- CALCULATE THE TOTAL SALES PER MONTH AND THE RUNNING TOTAL OF SALES OVER TIME.
SELECT
    ORDER_YEAR,
    TOTAL_SALES,
    SUM(TOTAL_SALES) OVER (ORDER BY ORDER_YEAR) AS RUNNING_TOTAL_SALES,
    AVG(AVG_PRICE) OVER (ORDER BY ORDER_YEAR) AS MOVING_AVERAGE_PRICE
FROM
(
    SELECT 
        DATE_FORMAT(ORDER_DATE, '%Y-01-01') AS ORDER_YEAR,
        SUM(SALES_AMOUNT) AS TOTAL_SALES,
        AVG(SLS_PRICE) AS AVG_PRICE
    FROM GOLD_FACT_SALES
    WHERE ORDER_DATE IS NOT NULL
    GROUP BY DATE_FORMAT(ORDER_DATE, '%Y-01-01')
) T
ORDER BY ORDER_YEAR;

