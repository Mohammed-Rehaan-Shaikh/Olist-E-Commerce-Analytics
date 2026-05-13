--Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

--Total Revenue
SELECT ROUND(SUM(payment_value), 2) AS total_revenue
FROM order_payments;

--Top 10 Product Categories
SELECT
    ct.product_category_name_english,
    COUNT(oi.order_id) AS total_orders
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY total_orders DESC
LIMIT 10;

--Average Delivery Time
SELECT
    AVG(order_delivered_customer_date - order_purchase_timestamp)
        AS avg_delivery_time
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

--Delayed Deliveries
SELECT
    COUNT(*) AS delayed_orders
FROM orders
WHERE order_delivered_customer_date >
      order_estimated_delivery_date;