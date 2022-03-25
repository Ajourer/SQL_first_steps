SELECT * FROM person AS person ("person.id", "person.name")
CROSS JOIN pizzeria AS pizzeria ("pizzeria.id", "pizzeria.name")
ORDER BY "person.id", "pizzeria.id";
