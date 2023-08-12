CREATE SEQUENCE seq1;
SELECT nextval('seq1');
SELECT currval('seq1');
SELECT lastval();
-----
SELECT setval('seq1', 16, true); --
SELECT currval('seq1');
SELECT nextval('seq1');

SELECT setval('seq1', 16, false); -- curr хранит старое, а в next то, что задано изнач
SELECT currval('seq1');
SELECT nextval('seq1');
-----
CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 16;
SELECT nextval('seq2');
-----
CREATE SEQUENCE IF NOT EXISTS seq4
INCREMENT 16
MINVALUE 0
MAXVALUE 128
START with 0;

SELECT nextval('seq4');
---
ALTER SEQUENCE seq4 RESTART with 16;


