DELIMITER //
CREATE PROCEDURE P(v_max INT)

BEGIN
    DECLARE v_counter INT DEFAULT 1;
    WHILE v_counter <= v_max DO
        SELECT REPEAT('* ', v_counter);
        SET v_counter = v_counter + 1;
    END WHILE;
END; //

CALL P(20);