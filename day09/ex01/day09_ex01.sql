DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;

CREATE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER
AS $$
BEGIN
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
END $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit AFTER UPDATE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();
