CREATE VIEW products_suppliers_categories AS
SELECT product_name, unit_price, units_in_stock,company_name,
contact_name, phone
FROM products
JOIN categories USING(category_id)
JOIN suppliers USING(supplier_id);

SELECT *
FROM products_suppliers_categories;

SELECT *
FROM products_suppliers_categories
WHERE unit_price > 20;