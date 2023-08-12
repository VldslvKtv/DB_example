CREATE OR REPLACE FUNCTION ch_fib(n int) RETURNS int AS $$
DECLARE 
    counter int = 1;
	i int  = 1;
	j int = 1;
BEGIN
    IF n < 1 THEN
	    return 0;
	ELSIF n IN (1,2) THEN
	    return 1;
	ELSE
	    WHILE counter < n  -- можно через EXIT WHEN (обратное условие)
		LOOP                           -- LOOP
		    counter = counter + 1;    -- EXIT WHEN 
			SELECT j,i+j INTO i,j;      -- END LOOP;
		END LOOP;
		
	    return i;
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT ch_fib(6);

