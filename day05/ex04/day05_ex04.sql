SET enable_seqscan = false;
CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
EXPLAIN ANALYZE SELECT price FROM menu WHERE pizzeria_id = 5 AND pizza_name = 'supreme pizza';
EXPLAIN ANALYZE INSERT INTO menu VALUES (19, 5, 'supreme pizza', 3547);
