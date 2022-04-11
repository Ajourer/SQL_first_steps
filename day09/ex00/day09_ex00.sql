DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP TABLE IF EXISTS person_audit;

CREATE TABLE IF NOT EXISTS person_audit (
    id bigserial PRIMARY KEY,
    created timestamp NOT NULL DEFAULT current_timestamp,
    type_event char(1) NOT NULL CONSTRAINT ch_type_event CHECK (type_event in ('I', 'D', 'U')) DEFAULT 'I',
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
AS $$
BEGIN
    INSERT INTO person_audit VALUES(
        DEFAULT,
        DEFAULT,
        DEFAULT,
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
