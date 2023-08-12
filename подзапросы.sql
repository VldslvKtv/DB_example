SELECT company_name
FROM suppliers
WHERE country IN (SELECT DISTINCT country FROM customers); -- подзапрос

SELECT DISTINCT suppliers.company_name  -- аналог с JOIN
FROM suppliers
JOIN customers USING (country);

SELECT category_name, SUM(units_in_stock)
FROM products
JOIN categories USING (category_id)
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT (SELECT MIN (product_id) + 4 FROM products)
