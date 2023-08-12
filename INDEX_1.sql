--CREATE INDEX id_perf_test ON perf_test(id);
EXPLAIN
SELECT *
FROM perf_test
WHERE id = 12345;  -- полсе создания индекса
                     -- запросы быстрее обрабатываются
SELECT *
FROM perf_test
LIMIT 50;
-----------

EXPLAIN ANALYZE
SELECT *
FROM perf_test
WHERE reason LIKE 'bc%' AND annotation LIKE 'AB%';

CREATE INDEX reason_and_annotation ON perf_test(reason, annotation); 
-- также будет работать и при поиске по одному столбцу (только по 1ому или сразу по 2ум)
EXPLAIN 
SELECT *
FROM perf_test
WHERE reason LIKE 'bc%' AND annotation LIKE 'AB%';