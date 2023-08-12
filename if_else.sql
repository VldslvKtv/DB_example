CREATE FUNCTION get_season(month_num int) RETURNS varchar AS $$
BEGIN
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

SELECT get_season(11) AS season;