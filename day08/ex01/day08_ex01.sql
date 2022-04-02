SHOW TRANSACTION ISOLATION LEVEL;
-- Session 1
BEGIN;
-- Session 2
BEGIN;
-- Session 1
select * from pizzeria where name = 'Pizza Hut';
-- Session 2
select * from pizzeria where name = 'Pizza Hut';
-- Session 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Session 2
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Видим, что запрос со второй сессии подвис. Он не может сейчас внести изменения
-- Session 1
COMMIT; -- Фиксируем изменения первой сессии, после чего апдейт второй сессии срабатывает
--Session 2
COMMIT; -- Фиксируем изменения второй сессии. В первую сессию они также внесены
-- Session 1
select * from pizzeria where name = 'Pizza Hut';
-- Session 2
select * from pizzeria where name = 'Pizza Hut';
