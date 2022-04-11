CREATE OR REPLACE FUNCTION fnc_mleast(IN nums numeric[]) RETURNS numeric AS $$
DECLARE
    t_min numeric := nums[1];
    n numeric;
BEGIN
    FOREACH n IN ARRAY nums
    LOOP
        IF n < t_min THEN
            t_min = n;
        END IF;
    END LOOP;
    RETURN t_min;
END $$ LANGUAGE plpgsql;

