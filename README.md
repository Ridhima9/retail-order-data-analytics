# 🛍️ Retail Order Data Analytics
### End-to-End ETL Pipeline & Business Intelligence using Python, SQL and MySQL

An end-to-end retail analytics project that transforms raw transactional data into a structured SQL database and answers key business questions through SQL-based analysis.

> **Business Question**
>
> *Which products, regions, and categories are driving revenue, and how has their performance changed over time?*

---

# 📌 Overview

Retail businesses generate thousands of transactions every day, but raw CSV files are difficult to analyze directly.

This project builds a complete ETL pipeline that:

- Extracts retail order data
- Cleans and validates the dataset
- Engineers business metrics
- Loads the data into MySQL
- Performs SQL-based business analysis

The final output enables decision-making through revenue trends, regional performance, and product-level insights.

---

# 🚀 Project Architecture

```
Raw CSV
    │
    ▼
Data Ingestion (Kaggle API)
    │
    ▼
Data Cleaning (Pandas)
    │
    ▼
Feature Engineering
    │
    ▼
Data Validation
    │
    ▼
MySQL Database
    │
    ▼
SQL Business Analysis
```

---

# 📂 Project Structure

```
retail-order-data-analytics/
│
├── notebooks/
│   └── 01_data_preprocessing.ipynb
│
├── sql/
│   └── analysis_queries.sql
│
├── README.md
└── .gitignore
```

---

# 📊 Dataset

**Source:** Kaggle Retail Orders Dataset

- **Orders:** 9,994
- **Years:** 2022–2023
- **Categories:** Furniture, Office Supplies, Technology
- **Regions:** East, West, South, Central
- **Raw Features:** 16

---

# ⚙️ ETL Pipeline

## 1️⃣ Data Ingestion

- Downloaded dataset using Kaggle API
- Imported into Python
- Parsed CSV into Pandas DataFrame

---

## 2️⃣ Data Cleaning

Performed preprocessing including:

- Standardized column names
- Parsed date columns
- Removed inconsistencies
- Filled missing values
- Corrected invalid entries

---

## 3️⃣ Feature Engineering

Created new business metrics including:

| Feature | Formula |
|----------|----------|
| Discount Amount | List Price × Discount % |
| Sale Price | List Price − Discount |
| Profit | Sale Price − Cost Price |

---

## 4️⃣ Data Validation

Validated the processed dataset before database loading.

Checks performed:

- ✅ Unique Order IDs
- ✅ No null values
- ✅ Non-negative prices
- ✅ Non-negative discounts

---

## 5️⃣ Database Loading

Loaded the cleaned dataset into **MySQL** using SQLAlchemy.

Database credentials are managed securely using environment variables.

---

# 📈 Business Analysis

The project answers five business questions.

### Q1

Top 10 revenue-generating products.

### Q2

Top 5 selling products in each region.

### Q3

Monthly sales comparison between 2022 and 2023.

### Q4

Highest sales month for every product category.

### Q5

Fastest-growing product sub-categories year-over-year.

---

# 🛠 Tech Stack

| Category | Tools |
|----------|-------|
| Programming | Python |
| Data Processing | Pandas |
| Database | MySQL |
| ORM | SQLAlchemy |
| SQL | MySQL |
| Environment | Jupyter Notebook |
| Dataset | Kaggle API |

---

# 📊 Key Outcomes

- Built an end-to-end ETL pipeline
- Processed nearly **10,000 retail orders**
- Engineered profitability metrics
- Designed a structured MySQL database
- Solved five real-world business analytics problems using SQL
- Improved data quality through automated validation

---

# ▶️ How to Run

## Clone Repository

```bash
git clone https://github.com/Ridhima9/retail-order-data-analytics.git
cd retail-order-data-analytics
```

---

## Install Dependencies

```bash
pip install pandas sqlalchemy pymysql kaggle notebook
```

---

## Configure Environment Variables

### Windows

```cmd
set DB_USER=your_username
set DB_PASSWORD=your_password
```

### Linux / macOS

```bash
export DB_USER=your_username
export DB_PASSWORD=your_password
```

---

## Run Notebook

```
notebooks/01_data_preprocessing.ipynb
```

---

## Execute SQL Queries

```sql
USE retail_sales;
```

Run

```
sql/analysis_queries.sql
```

---

# 🔒 Security

- Database credentials stored using environment variables
- No secrets committed to the repository
- `.gitignore` excludes sensitive files

---

# 📌 Future Improvements

- Interactive Power BI Dashboard
- Automated ETL Scheduling
- Dockerized Deployment
- Data Quality Reports
- Sales Forecasting using Machine Learning

---

# 👩‍💻 Author

**Ridhima Singh**

Integrated M.Sc. Mathematics & Computing  
Birla Institute of Technology, Mesra

📧 ridhima5430@gmail.com

🔗 LinkedIn: https://linkedin.com/in/ridhima-singh-42bb39303

