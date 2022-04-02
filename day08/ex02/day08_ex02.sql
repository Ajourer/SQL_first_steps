-- Session 1
BEGIN; -- переходим в режим транзакции в обеих сессиях
-- Session 2
BEGIN;
-- Меняем уровень изоляции с дефолтного на REPEATABLE READ в обеих сессиях
-- Session 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session 1
select * from pizzeria where name = 'Pizza Hut';
-- Session 2
select * from pizzeria where name = 'Pizza Hut';
-- Session 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
 -- Опять видим, что процесс второй сессии подвисает
 -- Session 1
 COMMIT; -- Выход из режима транзакции

-- Во второй сессии выходит ошибка ERROR: could not serialize access due to concurrent update
-- Session 2
COMMIT; -- происходит ROLLBACK. Апдейт не произошел, сессия откатила эту операцию, выйдя из режима транзакции
-- Session 1
select * from pizzeria where name = 'Pizza Hut';
-- Session 2
select * from pizzeria where name = 'Pizza Hut';
