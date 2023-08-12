SELECT country
FROM customers
UNION           -- обьединение двух таблиц без повторений (с повтор ALL)
SELECT country
FROM employees;

SELECT country
FROM customers
INTERSECT      -- Пересечение         
SELECT country
FROM suppliers;

SELECT country
FROM customers
EXCEPT      -- Исключение (есть в 1, но нет во 2)    
SELECT country
FROM suppliers;

SELECT country
FROM customers
EXCEPT  ALL    -- Исключение, но особое (есть в 1, но нет во 2 и    
SELECT country   -- есть и там,и там, но в 1 больше по кол-ву
FROM suppliers



