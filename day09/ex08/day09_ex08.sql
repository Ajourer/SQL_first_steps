CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop int = 10) RETURNS TABLE(fib int) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE fib AS (
        SELECT 0 AS a, 1 AS b UNION ALL
        SELECT b, a+b FROM fib WHERE b < pstop
    ) SELECT a FROM fib;
END $$ LANGUAGE plpgsql;
