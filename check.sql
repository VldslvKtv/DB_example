CREATE TABLE book
(
	book_id int,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int,
	
	CONSTRAINT pk_book_book_id PRIMARY KEY(book_id)
);

ALTER TABLE book
ADD COLUMN price float CONSTRAINT chk_book_price CHECK (price >= 0);
-- нельхя вставить отрицательные значение в price