SET enable_seqscan = false;
EXPLAIN ANALYZE SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
