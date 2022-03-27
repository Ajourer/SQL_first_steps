SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN person_visits AS pv ON pizzeria.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id AND p.name = 'Andrey'
	EXCEPT 
SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order AS po ON menu.id = po.menu_id
JOIN person AS p ON po.person_id = p.id WHERE p.name = 'Andrey'
ORDER BY pizzeria_name;
