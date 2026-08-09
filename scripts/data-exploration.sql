/* =============================================================================== 

data-exploration.sql script

Description: Explores the dataset structure, validates data quality, and performs descriptive 
analysis on product, category, pricing, and inventory fields. 

=============================================================================== */





-- CHECK table & explore table
SELECT * FROM zepto

SELECT DISTINCT Category FROM zepto
SELECT DISTINCT name FROM zepto

--Check null values
SELECT * FROM zepto 
WHERE category is NULL OR
name is NULL OR
mrp is NULL OR
discountPercent is NULL OR
availableQuantity is NULL OR
discountedSellingPrice is NULL OR
weightInGms is NULL OR
outOfStock is NULL OR
quantity is NULL;


-- Check text length and identify leading/trailing spaces
SELECT
    name,
    LEN(name) AS name_length,
    category,
    LEN(category) AS category_length
FROM zepto;


--product in stock and out of stock --> 0: False, 1:True
SELECT
	outOfStock,
	COUNT(*)
FROM zepto
GROUP BY outOfStock



--product name present multiple time
SELECT 
	name,
	COUNT(*)
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC


--check if product price <=  0
SELECT 
*
FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0
