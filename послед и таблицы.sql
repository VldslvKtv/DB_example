DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id int NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT pk_book_book_id PRIMARY KEY(book_id)

);

CREATE SEQUENCE IF NOT EXISTS seq
START with 1 OWNED BY book.book_id;
-- но если не пропускают id нужно еще 
ALTER TABLE book
ALTER COLUMN book_id SET DEFAULT nextval('seq');

INSERT INTO book (title, isbn, publisher_id)
VALUES
('sgsgd','sgsgs',2);

SELECT * FROM book;
--------
CREATE TABLE book
(
	book_id int GENERATED ALWAYS AS IDENTITY NOT NULL, -- АВТОГЕНЕРАЦИЯ
	title text NOT NULL,                        -- И НЕЛЬЗЯ САМИМ ВСТАВЛЯТЬ ЗНАЧЕНИЯ В id
	isbn varchar(32) NOT NULL,                 -- нужно будет пропускать при заполнении
	publisher_id int NOT NULL,
	
	CONSTRAINT pk_book_book_id PRIMARY KEY(book_id)

); -- в GENERATED можно добавить START with ... INCREMENT BY ... (после IDENTITY в скобках)