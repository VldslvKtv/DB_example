SELECT company_name, contact_name 
FROM customers
WHERE EXISTS (SELECT customer_id FROM orders 
			  WHERE customer_id = customers.customer_id AND
			 freight BETWEEN 50 AND 100)
