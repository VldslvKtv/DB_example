CREATE TABLE publisher
(
	publisher_id int NOT NULL,
	publisher_name varchar(128) NOT NULL,
	adress text,
	
	CONSTRAINT pk_publisher_publisher_id PRIMARY KEY (publisher_id)
	--CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id);
);     -- если хотим сразу внешний ключ

CREATE TABLE book
(
	book_id int,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int,
	
	CONSTRAINT pk_book_book_id PRIMARY KEY(book_id)
);

ALTER TABLE book
ADD CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id);