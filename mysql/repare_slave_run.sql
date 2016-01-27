DROP PROCEDURE IF EXISTS repare_slave_run;

DELIMITER //


-- ref http://stackoverflow.com/questions/7009021/mysql-replication-status-using-a-select-query

CREATE PROCEDURE repare_slave_run(IN check_times INT)
BEGIN
	DECLARE slave_running VARCHAR(31);
	DECLARE i INT DEFAULT 0;
	DECLARE skip_count INT DEFAULT 0;
	
	SET GLOBAL show_compatibility_56=ON;

	WHILE i<check_times DO
		SELECT VARIABLE_VALUE INTO slave_running FROM information_schema.GLOBAL_STATUS sta WHERE sta.VARIABLE_NAME='SLAVE_RUNNING';
		IF slave_running<>'ON' THEN
			STOP SLAVE;
			SET GLOBAL SQL_SLAVE_SKIP_COUNTER=1;
			START SLAVE;

			SET skip_count=skip_count+1;
		END IF;

		SET i=i+1;
	END WHILE;

	SELECT * FROM information_schema.GLOBAL_STATUS sta WHERE sta.VARIABLE_NAME='SLAVE_RUNNING';
	SHOW SLAVE STATUS;

	SELECT skip_count;
END//

DELIMITER ;
