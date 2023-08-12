DROP TABLE IF EXISTS last_orders_on_discontinued;
BEGIN;

WITH product_update AS
(
	UPDATE products
	SET discontinued = 1
	WHERE units_in_stock < 10
	RETURNING product_id
)
SELECT * INTO last_orders_on_discontinued
FROM order_details
WHERE product_id IN (SELECT product_id FROM product_update);

DELETE FROM order_details 
WHERE product_id IN (SELECT product_id FROM last_orders_on_discontinued);

ROLLBACK; --ЕСЛИ УДАЛИЛИ НЕ ТО

SELECT COUNT(*) FROM order_details ;

COMMIT;

SELECT * FROM last_orders_on_discontinued;
------ чтобы сделать ROLLBACK, нужно просто выполнить COMMIT(ROLLBACK)
---------------------------------------------------------
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

WITH product_update AS
(
	UPDATE products
	SET discontinued = 1
	WHERE units_in_stock < 10
	RETURNING product_id
)
SELECT * INTO last_orders_on_discontinued
FROM order_details
WHERE product_id IN (SELECT product_id FROM product_update);

SAVEPOINT backup;

DELETE FROM order_details 
WHERE product_id IN (SELECT product_id FROM last_orders_on_discontinued);

ROLLBACK TO backup; 

SELECT COUNT(*) FROM order_details ;

UPDATE order_details
SET quantity = 0
WHERE product_id IN (SELECT product_id FROM last_orders_on_discontinued);

COMMIT;

SELECT * 
FROM order_details
WHERE product_id IN (SELECT product_id FROM last_orders_on_discontinued);




















