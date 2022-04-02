-- Session 1 
BEGIN;
-- Transaction mode is started
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
-- I can see the changes in Session 1

--Session 2
-- I can't see changes fron Session 1


--Session 1
COMMIT;

--Session 2
-- And now we can see changes from Session 1
