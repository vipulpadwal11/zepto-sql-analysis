/* =============================================================================== 

 ddl-zepto.sql script
 
 Description: Creates the Zepto database and product table structure used 
 for inventory, pricing, and stock availability analysis. 

Dataset: csv file was directed imported

=============================================================================== */


CREATE DATABASE Zepto_DB;

USE Zepto_DB;

DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto(
sku_id INT IDENTITY(1,1) PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp DECIMAL (8, 2),
discountPercent DECIMAL (5, 2),
availableQuantity INT,
discountedSellingPrice DECIMAL(8, 2),
weightInGms INT,
outOfStock BIT,
quantity INT
);
