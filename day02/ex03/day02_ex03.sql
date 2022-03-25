WITH days AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date AS day
)
SELECT day FROM days LEFT OUTER JOIN person_visits ON person_visits.visit_date = day
AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.visit_date IS NULL
ORDER BY DAY
