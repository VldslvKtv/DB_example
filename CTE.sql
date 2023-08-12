SELECT company_name
FROM suppliers
WHERE country IN (SELECT country FROM customers);
-------------------------------------------------
WITH cust_country AS 
(
    SELECT country FROM customers   --используем CTE
)

SELECT company_name        
FROM suppliers
WHERE country IN (SELECT * FROM cust_country);
----------------------------------
--все suppliers, которые не поставляли продукты с в определенном промежутке
SELECT company_name
FROM suppliers
WHERE NOT EXISTS
(
	SELECT product_id
	FROM products
	JOIN order_details USING(product_id)
	JOIN orders USING(order_id)
	WHERE suppliers.supplier_id = products.product_id AND
	    order_date BETWEEN '1998-02-01' AND '1998-02-04'
);
--используем CTE
WITH filtered AS
(
	SELECT suppliers.supplier_id
	FROM products
	JOIN order_details USING(product_id)
	JOIN orders USING(order_id)
	JOIN suppliers ON products.product_id = suppliers.supplier_id
	WHERE order_date BETWEEN '1998-02-01' AND '1998-02-04'
)--------- через запятую можно несколько CTE

SELECT company_name
FROM suppliers
WHERE supplier_id NOT IN (SELECT supplier_id FROM filtered );










