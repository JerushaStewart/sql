USE shein;

DELIMITER //

CREATE PROCEDURE GetAvg(OUT average DECIMAL(10,2))
BEGIN
    -- Using an aggregate function to calculate average revenue
    SELECT AVG(Revenue) INTO average FROM advertising;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS counter;
DELIMITER //
CREATE FUNCTION counter(averageacc VARCHAR(20))
RETURNS INTEGER
READS SQL DATA
BEGIN
    DECLARE d_count INTEGER;
    
    SELECT COUNT(revenue) INTO d_count
    FROM advertising;

    RETURN d_count;
END//

DELIMITER ;


CALL GetAvg(@average);

SELECT @average AS AverageRevenue;



