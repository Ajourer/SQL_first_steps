SELECT order_date, FORMAT('%s (age:%s)', name, age) AS person_information
    FROM person_order AS person_order (order_id, id)
NATURAL JOIN person
ORDER BY order_date, person_information;
