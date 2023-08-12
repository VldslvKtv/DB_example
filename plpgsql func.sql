CREATE OR REPLACE FUNCTION max_price (IN category int) RETURNS real AS $$
BEGIN
    RETURN MAX(unit_price)
	FROM products
	WHERE category_id = category;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM max_price (1);

SELECT category_id, MAX(unit_price) -- проверка функции
FROM products
GROUP BY category_id
ORDER BY category_id;

CREATE OR REPLACE FUNCTION max_and_min(OUT max_price real, OUT min_price real ) AS $$
BEGIN
   SELECT MAX(unit_price),MIN(unit_price)
   INTO max_price, min_price
   FROM products;
   -- или так max_price := MAX(unit_price) FROM products;
   -- ...
END;
$$ LANGUAGE plpgsql;

SELECT * FROM max_and_min();

CREATE OR REPLACE FUNCTION kol_many (units_kol int) RETURNS SETOF products AS $$
BEGIN
    RETURN QUERY
	SELECT *
	FROM products
	WHERE units_in_stock > units_kol;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM kol_many(20);