DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

DROP TRIGGER IF EXISTS trg_person_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_audit;

CREATE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER
AS $$
BEGIN
    CASE TG_OP
    WHEN 'INSERT' THEN
        INSERT INTO person_audit VALUES(
            DEFAULT,
            DEFAULT,
            'I',
            NEW.id,
            NEW.name,
            NEW.age,
            NEW.gender,
            NEW.address
        );
        RETURN NEW;
    WHEN 'UPDATE' THEN
        INSERT INTO person_audit VALUES(
            DEFAULT,
            DEFAULT,
            'U',
            OLD.id,
            OLD.name,
            OLD.age,
            OLD.gender,
            OLD.address
        );
        RETURN OLD;
    WHEN 'DELETE' THEN
        INSERT INTO person_audit VALUES(
            DEFAULT,
            DEFAULT,
            'D',
            OLD.id,
            OLD.name,
            OLD.age,
            OLD.gender,
            OLD.address
        );
        RETURN OLD;
    END CASE;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();
