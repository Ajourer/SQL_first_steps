SELECT name FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
WHERE gender = 'male' AND address IN ('Moscow', 'Samara')
ORDER BY name DESC;
