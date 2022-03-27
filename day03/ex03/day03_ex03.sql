WITH males AS ( SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits AS vis ON vis.pizzeria_id = pizzeria.id
	JOIN person ON vis.person_id = person.id
	WHERE gender = 'male'
	EXCEPT ALL
		SELECT pizzeria.name AS pizzeria_name FROM pizzeria
		JOIN person_visits AS vis ON vis.pizzeria_id = pizzeria.id
		JOIN person ON vis.person_id = person.id
		WHERE gender = 'female' ) ,
	females AS ( SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits AS vis ON vis.pizzeria_id = pizzeria.id
	JOIN person ON vis.person_id = person.id
	WHERE gender = 'female'
	EXCEPT ALL
		SELECT pizzeria.name AS pizzeria_name FROM pizzeria
		JOIN person_visits AS vis ON vis.pizzeria_id = pizzeria.id
		JOIN person ON vis.person_id = person.id
		WHERE gender = 'male' )
SELECT * FROM males UNION ALL SELECT * FROM females
ORDER BY pizzeria_name;
