--1. KPI Queries
--Total Revenues
SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM order_payments;

--Total Orders
SELECT
    COUNT(*) AS total_orders
FROM orders;

--Total Customers
SELECT
    COUNT(DISTINCT customer_unique_id)
    AS total_customers
FROM customers;

--Average Review Score
SELECT
    ROUND(AVG(review_score), 2)
    AS avg_review_score
FROM order_reviews;

--Average Delivery Days
SELECT
    ROUND(
        AVG(
            DATE_PART(
                'day',
                order_delivered_customer_date -
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

--2. Visualization Queries
--Monthly Revenue Trend
SELECT
    DATE_TRUNC(
        'month',
        o.order_purchase_timestamp
    ) AS month,
    ROUND(
        SUM(op.payment_value),
        2
    ) AS revenue
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;

--Top Product Categories
SELECT
    ct.product_category_name_english
    AS category,
    ROUND(
        SUM(oi.price),
        2
    ) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name =
   ct.product_category_name
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;

--Payment Method Usage
SELECT
    payment_type,
    COUNT(*) AS usage_count
FROM order_payments
GROUP BY payment_type
ORDER BY usage_count DESC;

--Review Score Distribution
SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;