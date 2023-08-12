CREATE OR REPLACE FUNCTION get_square(ac real, ab real, bc real) RETURNS real AS $$
DECLARE
    pol_perimetr real;
BEGIN
    pol_perimetr := (ab+ac+bc)/2;
	return sqrt(pol_perimetr*(pol_perimetr-ab)*(pol_perimetr-ac)*(pol_perimetr-bc));
END;
$$ LANGUAGE plpgsql;

SELECT get_square(3,4,5);