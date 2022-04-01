SET enable_seqscan = false;
CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
EXPLAIN ANALYZE SELECT * FROM person_discounts
	WHERE person_id = 3 AND pizzeria_id = 5;
