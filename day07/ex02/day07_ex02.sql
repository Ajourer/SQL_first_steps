( SELECT name, COUNT(*), 'order' AS action_type FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
LIMIT 3 )
	UNION
( SELECT name, COUNT(*), 'visit' FROM person_visits
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
LIMIT 3 )
ORDER BY action_type, count DESC
