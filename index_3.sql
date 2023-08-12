EXPLAIN ANALYZE
SELECT *
FROM perf_test
WHERE reason LIKE '%bc%'; -- ИНДЕКС уже не работает 
                          -- тк усложнили условие

CREATE EXTENSION pg_trgm; -- модуля для GIN, GIST

CREATE INDEX trgm_reason ON perf_test USING gin (reason gin_trgm_ops);

EXPLAIN ANALYZE
SELECT COUNT(*)
FROM perf_test
WHERE reason LIKE '%abc%'; -- ИНДЕКС уже работает, но гарантий нет!!