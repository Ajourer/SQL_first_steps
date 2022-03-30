SET enable_seqscan = false;
CREATE INDEX idx_person_name ON person (upper(name));
EXPLAIN ANALYZE SELECT name FROM person WHERE upper(name) LIKE 'A%';
