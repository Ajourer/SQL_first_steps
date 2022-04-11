CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar = 'Dmitriy',
    IN pprice numeric = 500,
    IN pdate date = '2022-01-01')
RETURNS varchar AS $$
DECLARE
    t_row varchar;
BEGIN
    SELECT pizzeria.name INTO t_row FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = pperson AND menu.price < pprice AND visit_date = pdate;
    RETURN t_row;
END $$ LANGUAGE plpgsql;
