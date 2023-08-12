CREATE OR REPLACE FUNCTION avg_price() RETURNS SETOF double precision AS $$
    SELECT AVG(unit_price)
	FROM products
	GROUP BY categoRy_id
$$ LANGUAGE SQL;

SELECT * FROM avg_price();

CREATE OR REPLACE FUNCTION sum_price_and_avg(OUT sum_price real, OUT avg_price float8)
       RETURNS SETOF RECORD AS $$
	 
	SELECT SUM(unit_price), AVG(unit_price)
	FROM products
	GROUP BY categoRy_id
$$ LANGUAGE SQL;

SELECT * FROM sum_price_and_avg();
SELECT sum_price FROM sum_price_and_avg(); -- можно только одну колонку

--SELECT * FROM sum_price_and_avg() AS (sum_price real, avg_price float8); если нет
                                                            -- OUT параметров

CREATE OR REPLACE FUNCTION cus_by_country(customer_country varchar)
                      RETURNS TABLE(char_code char, company_name varchar) AS $$
			SELECT customer_id, company_name
			FROM customers
			WHERE country = customer_country
					  
$$ LANGUAGE SQL;

SELECT * FROM cus_by_country('USA');



