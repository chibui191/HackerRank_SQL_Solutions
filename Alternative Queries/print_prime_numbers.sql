DELIMITER //
CREATE PROCEDURE FIND_PRIME(num INT)
BEGIN
    DECLARE output VARCHAR(1000) DEFAULT '2';
    DECLARE n, i, is_prime INT;

    IF (num >= 3) THEN
        SET n := 3;
        WHILE (n <= num) DO
            SET i := 2;
            SET is_prime := 1;
            
             WHILE i <= CEIL(SQRT(n)) DO
                IF n % i = 0 THEN 
                    SET is_prime := 0; 
                END IF; 
                SET i := i + 1;
            END WHILE; 

            IF (is_prime = 1) THEN
                SET output := CONCAT_WS('&', output, n);
            END IF;

            SET n := n + 1;
        END WHILE;
    END IF;
    SELECT output;
END; //

CALL FIND_PRIME(1000);