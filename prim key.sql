CREATE TABLE faculty
(
	faculty_id serial, --PRIMARY KEY -- или UNIQUE NOT NULL
	fac_name varchar,
	
	CONSTRAINT pk_fac_name_id PRIMARY KEY(faculty_id)
);

DROP TABLE faculty;

ALTER TABLE faculty
DROP CONSTRAINT pk_fac_name_id;
