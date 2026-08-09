/* =============================================================================== 

insights-zepto.sql script

Description: Generates business insights related to inventory value, discount strategy, 
stockout risk, premium product exposure, and category performance. 

=============================================================================== */



--1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT TOP 10
	name,
	mrp,
	discountPercent
FROM zepto
ORDER BY discountPercent DESC;


--2. What are the Products with High MRP but Out of Stock
SELECT 
	DISTINCT name,
	mrp
FROM zepto
WHERE outOfStock = 1 AND mrp > 300
ORDER BY mrp DESC;


--3. Calculate inventory value for each category
SELECT
	Category,
	SUM(discountedSellingPrice * availableQuantity) AS potential_inventory_value
FROM zepto
GROUP BY Category
ORDER BY potential_inventory_value;


--4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT
	DISTINCT name,
	mrp,
	discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;


--5. Identify the top 5 categories offering the highest average discount percentage.
SELECT
	TOP 5 Category,
	AVG(discountPercent) AS avg_discount
FROM zepto
GROUP BY Category
ORDER BY avg_discount DESC;


--6. Find the price per gram for products above 100g and sort by best value.
SELECT 
	DISTINCT name,
	weightInGms,
	discountedSellingPrice,
	ROUND(CAST(discountedSellingPrice AS DECIMAL(10,4)) / weightInGms, 3) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;


--7. Group the products into categories like Low, Medium, Bulk.
SELECT
    CASE
        WHEN weightInGms <= 500 THEN 'Low'
        WHEN weightInGms <= 1000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category,
    COUNT(*) AS products,
    SUM(availableQuantity) AS inventory_units
FROM zepto
GROUP BY
    CASE
        WHEN weightInGms <= 500 THEN 'Low'
        WHEN weightInGms <= 1000 THEN 'Medium'
        ELSE 'Bulk'
    END;


--8. What is the Total Inventory Weight Per Category
SELECT 
	Category,
	SUM(CAST(weightInGms AS BIGINT) * availableQuantity) AS Inventory_wgt
FROM zepto
GROUP BY Category
ORDER BY Inventory_wgt DESC;


--9. Stockout rate by category
SELECT
    Category,
    COUNT(*) AS products,
    SUM(CASE WHEN outOfStock = 1 THEN 1 ELSE 0 END) AS stockouts,
    ROUND(
        100.0 * SUM(CASE WHEN outOfStock = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS stockout_rate
FROM zepto
GROUP BY Category
ORDER BY stockout_rate DESC;


--10. Premium stock exposure
SELECT
    Category,
    COUNT(*) AS premium_products,
    AVG(mrp) AS avg_mrp
FROM zepto
WHERE mrp > 500
GROUP BY Category
ORDER BY premium_products DESC;


--11. Inventory concentration- Calculate what percentage of total inventory value each category holds
SELECT
    Category,
    SUM(discountedSellingPrice * availableQuantity) AS total_inventory_value,
    CAST(
        ROUND(
            100.0 * SUM(discountedSellingPrice * availableQuantity)
            / SUM(SUM(discountedSellingPrice * availableQuantity)) OVER (),
            2
        ) AS DECIMAL(5,2)
    ) AS inventory_percentage
FROM zepto
GROUP BY Category
ORDER BY inventory_percentage DESC;
