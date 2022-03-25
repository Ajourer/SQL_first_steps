SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id AND person.name IN ('Denis', 'Anna')
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, pizzeria_name;
