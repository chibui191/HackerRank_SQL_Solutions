DELIMITER //
CREATE PROCEDURE P(v_counter INT)
BEGIN
    WHILE v_counter > 0 DO
        SELECT REPEAT('* ', v_counter);
        SET v_counter = v_counter - 1;
    END WHILE;
END; //

CALL P(20);