SELECT	COALESCE(person.name, '-') AS person_name,
		visit_date,
		COALESCE(pizzeria.name, '-') AS pizzeria_name FROM person
FULL JOIN person_visits ON person.id = person_visits.person_id
    AND person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
FULL JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    AND person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
WHERE NOT (person.name IS NULL AND pizzeria.name IS NULL)
ORDER BY person_name, visit_date, pizzeria_name;
