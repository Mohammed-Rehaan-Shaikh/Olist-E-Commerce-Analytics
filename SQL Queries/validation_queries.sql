--Count Rows
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM order_payments;
SELECT COUNT(*) FROM order_reviews;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM geolocation;
SELECT COUNT(*) FROM category_translation;

--Check NULLs
SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_unique_id) AS non_null_customers
FROM customers;

SELECT
    COUNT(*) AS total_rows,
    COUNT(product_category_name) AS non_null_categories
FROM products;

SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_id) AS non_null_customers
FROM orders;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS non_null_orders
FROM order_items;

SELECT
    COUNT(*) AS total_rows,
    COUNT(payment_type) AS non_null_payments
FROM order_payments;

SELECT
    COUNT(*) AS total_rows,
    COUNT(review_score) AS non_null_reviews
FROM order_reviews;

SELECT
    COUNT(*) AS total_rows,
    COUNT(seller_id) AS non_null_sellers
FROM sellers;

SELECT
    COUNT(*) AS total_rows,
    COUNT(geolocation_zip_code_prefix) AS non_null_geolocations
FROM geolocation;

SELECT
    COUNT(*) AS total_rows,
    COUNT(product_category_name_english) AS non_null_category_translations
FROM category_translation;