SELECT name FROM pizzeria AS p
LEFT JOIN person_visits AS vis ON p.id = vis.pizzeria_id
WHERE vis.id IS NULL;
