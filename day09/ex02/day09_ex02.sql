DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER
AS $$
BEGIN
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
END $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();
