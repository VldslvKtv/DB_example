SELECT product_name, unit_price, units_in_stock,
    CASE WHEN units_in_stock >= 100 THEN 'lots of'
	     WHEN units_in_stock >=50 AND units_in_stock < 100 THEN 'average'
		 ELSE 'low'
    END AS amont
FROM products
ORDER BY units_in_stock;

SELECT order_id, order_date,
    CASE WHEN date_part('month', order_date) BETWEEN 3 AND 5 THEN 'spring'
	     WHEN date_part('month', order_date) BETWEEN 6 AND 8 THEN 'summer'
	     WHEN date_part('month', order_date) BETWEEN 9 AND 11 THEN 'authum'
	     ELSE 'winter'
	END AS season
FROM orders;
	