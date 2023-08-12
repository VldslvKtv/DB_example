CREATE OR REPLACE FUNCTION get_season(month_num int) RETURNS varchar AS $$
BEGIN
    IF month_num NOT BETWEEN 1 and 12 THEN
	    RAISE EXCEPTION 'Invalid month' USING HINT = '1 ... 12',ERRCODE = 12882;
	END IF;
	
    IF month_num IN (1,2,12) THEN
	    return 'winter';
	ELSIF month_num IN (3,4,5) THEN
	    return 'spring';
	ELSIF month_num IN (6,7,8) THEN
	    return 'summer';
	ELSE 
	    return 'authum';
	END IF;
END;
$$ LANGUAGE plpgsql;
----------
SELECT get_season(15);

CREATE OR REPLACE FUNCTION get_season_caller(month_num int) RETURNS varchar AS $$
BEGIN
    RETURN  get_season(month_num);
	EXCEPTION WHEN SQLSTATE '12882' THEN
	    RAISE INFO 'А problem with month...';
		RETURN NULL;
    WHEN OTHERS THEN
	    RAISE INFO 'Unknow problem...';
		RETURN NULL;
END;
$$ LANGUAGE plpgsql;

SELECT get_season_caller(17);

--- подробнее в видосе
