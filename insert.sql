SELECT *
FROM author;

SELECT *
INTO best_authors
FROM author
WHERE rating >= 4.5;

SELECT *
FROM best_authors;
--- а если уже существует

INSERT INTO best_authors
SELECT *
FROM author
WHERE rating >= 4.5;