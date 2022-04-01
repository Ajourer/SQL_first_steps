SELECT p.name, pizza_name, price, 
(price - price * discount / 100)::int AS discount_price
FROM person_order AS p_o
JOIN person AS p ON p.id = p_o.person_id
JOIN menu ON p_o.menu_id = menu.id
JOIN pizzeria AS piz ON piz.id = menu.pizzeria_id
JOIN person_discounts AS p_d ON p.id = p_d.person_id AND piz.id = p_d.pizzeria_id
ORDER BY p.name, pizza_name;
