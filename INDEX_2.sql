--CREATE INDEX id_perf_test ON perf_test(id);

--CREATE INDEX reason_and_annotation ON perf_test(reason, annotation); 
-- также будет работать и при поиске по одному столбцу (только по 1ому или сразу по 2ум)

EXPLAIN
SELECT *
FROM perf_test
WHERE annotation LIKE 'AB%';
--------
CREATE INDEX annot_perf_test ON perf_test(annotation);

EXPLAIN
SELECT *
FROM perf_test
WHERE LOWER(annotation) LIKE 'ab%'; -- это уэе поиск с использыванием выражения 
                                   -- и индекс не сработает

CREATE INDEX annot_perf_test_lower ON perf_test(LOWER(annotation));


