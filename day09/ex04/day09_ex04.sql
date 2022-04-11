DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE FUNCTION fnc_persons_female() RETURNS SETOF person AS $$
    SELECT * FROM v_persons_female;
$$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male() RETURNS SETOF person AS $$
    SELECT * FROM v_persons_male;
$$ LANGUAGE sql;
