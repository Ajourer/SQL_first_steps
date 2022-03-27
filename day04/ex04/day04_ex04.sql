CREATE VIEW v_symmetric_union AS 
    WITH second AS (
        SELECT person_id FROM person_visits
            WHERE visit_date = '2022-01-02'
    ), sixth AS (
        SELECT person_id FROM person_visits
            WHERE visit_date = '2022-01-06'
    )
    (SELECT * FROM second EXCEPT SELECT * FROM sixth)
    UNION
    (SELECT * FROM sixth EXCEPT SELECT * FROM second)
    ORDER BY person_id;
