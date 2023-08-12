SELECT DISTINCT company_name
FROM customers
JOIN orders USING (customer_id)
JOIN order_details ON order_details.order_id = orders.order_id
WHERE quantity > 40;

SELECT customer_id
FROM orders
JOIN order_details USING (order_id)
WHERE quantity > 40;

SELECT DISTINCT company_name
FROM customers
WHERE customer_id = ANY ( -- ANY - с каким-либо из
	SELECT customer_id
    FROM orders
    JOIN order_details USING (order_id)
    WHERE quantity > 40);
	




