# 🛒 Zepto SQL Data Analysis

SQL-based analysis of Zepto's product, pricing, discount, and inventory data using **Microsoft SQL Server**.

The project goes beyond querying the data — it explores the dataset, cleans it, identifies business patterns, and turns the findings into practical recommendations around inventory, pricing, and operations.

[zepto image](https://github.com/vipulpadwal11/zepto-sql-analysis/blob/main/scripts/zepto-image.png)

## 🎯 What I Analyzed

- Product pricing and discount patterns
- Inventory value by category
- Stock availability and stockout rates
- Premium product exposure
- Price-per-gram and product value
- Product weight and inventory distribution
- Category-level inventory and pricing patterns

## 💡 Key Findings

- The top four categories account for **54.22% of total inventory value**.
- **Biscuits** has the highest stockout rate at **28.57%**, compared with **6.45%** for Fruits & Vegetables.
- Low-weight products make up **86.3% of products** and **86.2% of inventory units**.
- The highest observed product discounts are **50–51%**.
- Munchies and Cooking Essentials each account for **15.04% of inventory value**.

The findings were then translated into recommendations around **replenishment planning, inventory allocation, pricing strategy, stockout reduction, and warehouse efficiency**.

## 🗂️ Project Structure

Zepto-SQL-Analytics/
│
├── README.md
├── dataset/
│   └── zepto_ds.csv
├── scripts/
│   ├── 01_ddl.sql
│   ├── 02_data_exploration.sql
│   ├── 03_data_cleaning.sql
│   └── 04_business_insights.sql
└── Report/
    └── Zepto_Business_Report.pdf

## 🛠️ Tools & Skills
- Microsoft SQL Server
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Business Analysis
- Reporting


## 📄 Business Report
The detailed findings, business implications, and recommendations are documented here:
[Link Text](https://drive.google.com/file/d/1UY0PwxrxXK2K0yek-uPTL3vZNlGmpBst/view?usp=sharing)
