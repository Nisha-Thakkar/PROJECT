CREATE DATABASE OLA;

USE OLA;

CREATE TABLE DRIVER
(
DRIVER_ID INT PRIMARY KEY,
D_FIRST_NAME VARCHAR(45),
D_LAST_NAME VARCHAR(45),
SALARY INT,
PLACE TEXT,
TRIP_DATE DATETIME
);

INSERT INTO DRIVER
(DRIVER_ID ,D_FIRST_NAME ,D_LAST_NAME ,SALARY ,PLACE ,TRIP_DATE)
 VALUES 
( 234, "NEHA" , "VAJA" , 15000 , "ODHAV" , "2007-12-30") ;

ALTER TABLE DRIVER ADD COLUMN AGE INT AFTER SALARY;

DELETE FROM DRIVER WHERE D_FIRST_NAME = "NEHA" ;

CREATE TABLE DUPLI SELECT *  FROM DRIVER;

TRUNCATE DUPLI;

DROP TABLE DUPLI;

SELECT *  FROM DRIVER;

UPDATE DRIVER SET AGE = 16 WHERE PLACE = "ODHAV" ;

SELECT * FROM DRIVER WHERE D_FIRST_NAME = "BHAUTIK" ;

SELECT DISTINCT AGE FROM DRIVER;

SELECT DISTINCT AGE FROM DRIVER ORDER BY AGE;

ALTER TABLE `ola`.`driver` 
CHANGE COLUMN `SALARY` `SALARYYYY` INT NULL DEFAULT NULL ;

SELECT * FROM DRIVER WHERE PLACE = "SURAT" AND D_LAST_NAME = "JAIN" ;

SELECT * FROM DRIVER WHERE PLACE = "SURAT" OR D_LAST_NAME = "PANCHAL" ;

SELECT * FROM DRIVER LIMIT 2;

SELECT MIN(SALARYYYY) FROM DRIVER;

SELECT MAX(SALARYYYY) AS MAXIMUM FROM DRIVER;

SELECT SUM(SALARYYYY) FROM DRIVER;

SELECT AVG(SALARYYYY) FROM DRIVER;

SELECT * FROM DRIVER WHERE D_FIRST_NAME LIKE "%E_" ;

SELECT * FROM DRIVER WHERE D_FIRST_NAME LIKE "_E%" ;

SELECT D_FIRST_NAME,D_LAST_NAME,AGE,
CASE
WHEN AGE > 18 THEN "ALLOWED FOR WORK"
WHEN AGE = 18 THEN "ALMOST ALLOWED"
ELSE "NOT ALLOWED"
END AS "ALIGIBLE"
FROM DRIVER;

SELECT * FROM DRIVER WHERE AGE IN(23,22,24) ;

SELECT * FROM DRIVER WHERE AGE BETWEEN 27 AND 30;

SELECT * FROM DRIVER WHERE D_FIRST_NAME BETWEEN "A" AND "V" ;

SELECT D_FIRST_NAME , COUNT(AGE) FROM DRIVER 
GROUP BY D_FIRST_NAME HAVING COUNT(AGE) >25;

DESCRIBE DRIVER;

SELECT  SALARYYYY+AGE FROM DRIVER ;

SELECT * , YEAR(TRIP_DATE) FROM DRIVER;

SELECT * , monthname(TRIP_DATE) FROM DRIVER;

SELECT * , date_format(TRIP_DATE, "%W %Y %M %D") FROM DRIVER;

SELECT * , date_format(TRIP_DATE, "%W %Y %M %D") FROM DRIVER;

SELECT * , CONCAT_WS("-", TRIP_DATE, "D_FIRST_NAME") FROM DRIVER;

CREATE TABLE PASSENGERS
(
P_ID INT PRIMARY KEY,
P_PLACE VARCHAR(45),
P_D INT,
FOREIGN KEY (P_D) REFERENCES DRIVER (DRIVER_ID) 
);

SELECT * FROM DRIVER
INNER JOIN PASSENGERS
ON DRIVER.DRIVER_ID = PASSENGERS.P_D  ;

SELECT * FROM PASSENGERS
LEFT JOIN DRIVER
ON DRIVER.DRIVER_ID = PASSENGERS.P_D  ;

SELECT * FROM DRIVER CROSS JOIN PASSENGERS ;

 
