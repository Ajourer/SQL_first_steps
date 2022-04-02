SELECT person_id, COUNT(*) AS count_of_visits FROM person_visits
GROUP BY person_id, visit_date
ORDER BY count_of_visits DESC;
