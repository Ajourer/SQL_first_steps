CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    WITH favs AS (
        SELECT menu.pizza_name AS fav_name, menu.pizzeria_id AS fav_place FROM person_order
        JOIN person ON person_order.person_id = person.id AND person.name = 'Dmitriy'
        JOIN menu ON person_order.menu_id = menu.id
    ), places AS (
        SELECT pizzeria.id AS place_id, pizzeria.name AS place_name FROM person_visits
        JOIN person ON person_visits.person_id = person.id AND person.name = 'Dmitriy'
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        WHERE person_visits.visit_date = '2022-01-08'
    )
    SELECT place_name AS name FROM favs
    JOIN menu ON favs.fav_name = menu.pizza_name AND price < 800
    JOIN places ON menu.pizzeria_id = places.place_id
