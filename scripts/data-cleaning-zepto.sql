/* =============================================================================== 

data-cleaning-zepto.sql script

Description: Performs data cleaning and preprocessing, including handling invalid records, 
standardizing text fields, and preparing the dataset for analysis. 

=============================================================================== */



-- Check for invalid pricing records
-- Rule: MRP and discounted selling price should be greater than 0
-- Removing invalid pricing records
DELETE FROM zepto
WHERE mrp <= 0 or discountedSellingPrice <= 0;


-- Convert price values from paise to rupees
UPDATE zepto
SET
    mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;


--trim unnecesary spaces from name and Category columns
SELECT 
	TRIM(name),
    TRIM(Category)
FROM zepto