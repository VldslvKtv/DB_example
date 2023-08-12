CREATE TABLE customer
(
	customer_id serial,
	fio text NOT NULL,
	status char DEFAULT 'r',
	
	CONSTRAINT chk_stat CHECK (status = 'r' OR status = 'p')
);

INSERT INTO customer VALUEs (1,'rrgrgrg');
INSERT INTO customer VALUEs (2,'thtsgd','p');
INSERT INTO customer VALUEs (3,'thtsgd','r');

SELECT *
FROM customer;

--ALTER TABLE customer
--ALTER COLUMN status DROP DEFAULT
-- ALTER COLUMN status SET DEFAULT