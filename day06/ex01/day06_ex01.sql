INSERT INTO person_discounts SELECT
	ROW_NUMBER() OVER () AS id,
	person_id,
	pizzeria_id,
	CASE COUNT(p_o.id)
		WHEN 1 THEN 10.5
		WHEN 2 THEN 22
		ELSE 30
	END FROM person_order AS p_o
	JOIN menu ON p_o.menu_id = menu.id
	JOIN pizzeria AS piz ON menu.pizzeria_id = piz.id
	JOIN person AS p ON p_o.person_id = p.id
	GROUP BY person_id, pizzeria_id;
