CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	lasst_name varchar,
	birthday date,
	phone varchar
);
CREATE TABLE cathedra
(
	cathedra_id serial,
	cathedra_name varchar,
	decan varchar
);

ALTER TABLE student
ADD COLUMN middle_name varchar;

ALTER TABLE student
ADD COLUMN rating float;

ALTER TABLE student
DROP COLUMN middle_name;

ALTER TABLE cathedra
RENAME TO chair

ALTER TABLE chair
RENAME cathedra_id TO chair_id;
ALTER TABLE chair
RENAME cathedra_name TO chair_name;

ALTER TABLE student
ALTER COLUMN first_name SET DATA TYPE varchar(64);
ALTER TABLE student
ALTER COLUMN lasst_name SET DATA TYPE varchar(64);

CREATE TABLE faculty
(
	faculty_id serial,
	faculty_name varchar
);
INSERT INTO faculty(faculty_name) -- если не все поля, их нужно указать
VALUES
('fac 1'),
('fac 2');

SELECT * 
FROM faculty;

TRUNCATE TABLE faculty RESTART IDENTITY;

DROP TABLE faculty



