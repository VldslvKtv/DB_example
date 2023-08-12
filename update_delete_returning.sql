SELECT *
FROM author;

UPDATE author
SET f_name = 'vladicks', rating = 5
WHERE author_id = 1;

DELETE FROM author
WHERE rating <= 4;

-- если удалить все, то лучше TRUCATE TABLE ...


----
-- если хотим увидеть, что удалили или обновили
-- используем RETURNING * ИЛИ указать конкретные поля
