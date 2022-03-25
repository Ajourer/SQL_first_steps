SELECT object_name FROM (
	(SELECT name AS object_name FROM person ORDER BY object_name)
	UNION ALL (SELECT pizza_name AS object_name FROM menu ORDER BY object_name)
	) AS ass;

-- SELECT pizza_name AS obj_name FROM menu
-- UNION ALL SELECT name FROM person
-- ORDER BY obj_name;
