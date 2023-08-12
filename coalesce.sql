SELECT *
FROM orders
LIMIT 10;

SELECT order_id, COALESCE (ship_region,'uncknow') AS ship_region
FROM orders
LIMIT 10;

