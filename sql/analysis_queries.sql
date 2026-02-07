/* ============================================================
   Retail Order Data Analytics – Business SQL Queries
   ============================================================ */

/* 1. Top 10 highest revenue-generating products */
SELECT
    product_id,
    SUM(sale_price) AS total_revenue
FROM orders
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;


/* 2. Top 5 highest selling products in each region */
WITH regional_sales AS (
    SELECT
        region,
        product_id,
        SUM(sale_price) AS revenue
    FROM orders
    GROUP BY region, product_id
)
SELECT
    region,
    product_id,
    revenue
FROM (
    SELECT
        region,
        product_id,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY revenue DESC
        ) AS rn
    FROM regional_sales
) ranked
WHERE rn <= 5;


/* 3. Month-over-month sales comparison for 2022 vs 2023 */
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(sale_price) AS revenue
    FROM orders
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT
    order_month,
    SUM(CASE WHEN order_year = 2022 THEN revenue ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN revenue ELSE 0 END) AS sales_2023
FROM monthly_sales
GROUP BY order_month
ORDER BY order_month;


/* 4. Month with highest sales for each category */
WITH category_month_sales AS (
    SELECT
        category,
        DATE_FORMAT(order_date, '%Y-%m') AS year_month,
        SUM(sale_price) AS revenue
    FROM orders
    GROUP BY category, DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    category,
    year_month,
    revenue
FROM (
    SELECT
        category,
        year_month,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS rn
    FROM category_month_sales
) ranked
WHERE rn = 1;


/* 5. Sub-category with highest revenue growth from 2022 to 2023 */
WITH yearly_sales AS (
    SELECT
        sub_category,
        YEAR(order_date) AS order_year,
        SUM(sale_price) AS revenue
    FROM orders
    GROUP BY sub_category, YEAR(order_date)
),
pivoted_sales AS (
    SELECT
        sub_category,
        SUM(CASE WHEN order_year = 2022 THEN revenue ELSE 0 END) AS revenue_2022,
        SUM(CASE WHEN order_year = 2023 THEN revenue ELSE 0 END) AS revenue_2023
    FROM yearly_sales
    GROUP BY sub_category
)
SELECT
    sub_category,
    revenue_2022,
    revenue_2023,
    (revenue_2023 - revenue_2022) AS revenue_growth
FROM pivoted_sales
ORDER BY revenue_growth DESC
LIMIT 1;
