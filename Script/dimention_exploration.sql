/*
===============================================================================
DIMENSIONS EXPLORATION
===============================================================================
PURPOSE:
    - TO EXPLORE THE STRUCTURE OF DIMENSION TABLES.

SQL FUNCTIONS USED:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- RETRIEVE A LIST OF UNIQUE COUNTRIES FROM WHICH CUSTOMERS ORIGINATE
SELECT DISTINCT 
    COUNTRY
FROM GOLD_DIM_CUSTOMERS
ORDER BY COUNTRY;

-- RETRIEVE A LIST OF UNIQUE CATEGORIES, SUBCATEGORIES, AND PRODUCTS
SELECT DISTINCT 
    CATEGORY, 
    SUBCATEGORY, 
    PRODUCT_NAME
FROM GOLD_DIM_PRODUCTS
ORDER BY CATEGORY, SUBCATEGORY, PRODUCT_NAME;
