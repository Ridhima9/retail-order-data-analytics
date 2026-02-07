\# Retail Order Data Analytics Pipeline



This project implements an \*\*end-to-end data analytics pipeline\*\* using Python, Pandas, and MySQL.  

The objective is to clean raw retail order data, engineer features, validate data quality, and load it into a relational database for analytical querying.



\## Tech Stack

\- Python (Pandas, SQLAlchemy)

\- MySQL

\- Jupyter Notebook

\- Git \& GitHub



\## Project Structure

retail-order-data-analytics/

│

├── notebooks/

│   └── 01\_data\_preprocessing.ipynb

│

├── sql/

│   └── analysis\_queries.sql

│

├── .gitignore

└── README.md



\## 🔄 ETL Pipeline



\### 1. Data Ingestion

\- Loaded retail order data from CSV

\- Treated non-standard missing values (`Not Available`, `unknown`) as nulls



\### 2. Data Cleaning \& Standardization

\- Standardized column names (lowercase, snake\_case)

\- Handled missing categorical values

\- Converted date columns to datetime format



\### 3. Feature Engineering

\- Derived discount amount

\- Calculated final sale price

\- Computed profit per order



\### 4. Data Validation

\- Checked for negative values

\- Ensured no nulls after cleaning

\- Performed sanity checks before database load



\### 5. Database Load

\- Loaded cleaned data into MySQL using SQLAlchemy

\- Managed database credentials securely using environment variables



\## Analytics Use Cases

\- Top revenue-generating products

\- Regional sales performance

\- Month-over-month sales growth

\- Category-level sales trends



SQL queries supporting these analyses are available in the `sql/` folder.



\## Security

\- Database credentials are not hardcoded

\- Environment variables are used for sensitive information

\- Raw data files are excluded using `.gitignore`



\## Dataset Source

Retail Orders Dataset – Kaggle











