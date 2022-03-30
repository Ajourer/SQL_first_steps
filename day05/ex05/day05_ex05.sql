SET enable_seqscan = false;
CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';
EXPLAIN ANALYZE SELECT order_date FROM person_order
	WHERE person_id = 2 AND menu_id = 3 AND order_date = '2022-01-01';
INSERT INTO person_order VALUES (22, 2, 9, '2022-01-01');

