# Retail Order Data Analytics — ETL Pipeline & Business Analysis

> Built to answer one question: *Which products, regions, and categories are actually driving revenue — and how has that changed over time?*

---

## Business Problem

A retail business with **9,994 orders** across Furniture, Office Supplies, and Technology categories had raw transactional data sitting in CSV files with no structure for analysis. There was no way to compare performance across regions, track month-over-month growth, or identify which sub-categories were gaining or losing revenue year over year.

This project built a full pipeline — from raw CSV to a clean MySQL database — and answered five core business questions using SQL.

---

## What Was Built

An end-to-end ETL pipeline that ingests raw retail order data, engineers profitability metrics, validates data quality, and loads it into MySQL for business analysis.

| Stage | Tool | Output |
|---|---|---|
| Data Ingestion | Python (Kaggle API) | Raw orders CSV extracted and loaded |
| Data Cleaning | Python (Pandas) | Standardized columns, handled nulls, parsed dates |
| Feature Engineering | Python | Derived discount amount, sale price, and profit per order |
| Data Validation | Python (assertions) | Rule-based checks before database load |
| Database Load | SQLAlchemy + MySQL | Clean dataset loaded into `orders` table |
| Business Analysis | SQL (MySQL) | 5 analytical queries with revenue and growth insights |

---

## Project Structure

```text
retail-order-data-analytics/
│
├── notebooks/
│   └── 01_data_preprocessing.ipynb     # Full ETL pipeline
│
├── sql/
│   └── analysis_queries.sql            # 5 business SQL queries
│
├── .gitignore
└── README.md
```

---

## Dataset

- **Source:** Retail Orders Dataset — Kaggle (`ankitbansal06/retail-orders`)
- **Size:** 9,994 orders, 16 raw columns
- **Coverage:** US retail orders across 2022–2023
- **Categories:** Furniture, Office Supplies, Technology
- **Regions:** South, West, East, Central

---

## ETL Pipeline

**1. Data Ingestion**
Downloaded directly from Kaggle using the API. Non-standard nulls (`Not Available`, `unknown`) were handled at load time.

**2. Data Cleaning**
Column names standardized to lowercase snake_case. Missing ship mode values filled. Order dates converted to datetime format.

**3. Feature Engineering**
Three profitability columns derived from existing fields:

| Feature | Logic |
|---|---|
| `discount` | `list_price × discount_percent × 0.01` |
| `sale_price` | `list_price − discount` |
| `profit` | `sale_price − cost_price` |

**4. Data Validation**
Four assertion checks before database load:
- Order IDs are unique
- Sale prices are non-negative
- Discounts are non-negative
- No null values remain

All checks passed.

**5. Database Load**
Cleaned dataset loaded into MySQL using SQLAlchemy with environment variables for credentials — no hardcoded passwords.

---

## SQL Business Queries

| Query | Business Question |
|---|---|
| Q1 | Which 10 products generate the highest total revenue? |
| Q2 | Which 5 products sell the most in each region? |
| Q3 | How do monthly sales in 2022 compare to 2023? |
| Q4 | Which month had the highest sales for each product category? |
| Q5 | Which sub-category grew the most from 2022 to 2023? |

All queries are in `sql/analysis_queries.sql`.

---

## Tech Stack

- Python — Pandas, SQLAlchemy, PyMySQL
- MySQL
- Jupyter Notebook
- Kaggle API

---

## How to Run

**Python — ETL Pipeline**
```bash
pip install pandas sqlalchemy pymysql kaggle
jupyter notebook notebooks/01_data_preprocessing.ipynb
```

**Environment Variables (required before running)**
```bash
# Windows
set DB_USER=your_username
set DB_PASSWORD=your_password

# Mac/Linux
export DB_USER=your_username
export DB_PASSWORD=your_password
```

**SQL Queries**
```sql
USE retail_sales;
-- Run sql/analysis_queries.sql
```

---

## Security

Database credentials are managed through environment variables — nothing sensitive is hardcoded in the notebook or committed to the repository.
