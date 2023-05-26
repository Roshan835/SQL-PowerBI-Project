CREATE DATABASE portfolioProject;
USE portfolioproject;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20)NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

UPDATE hr
SET birthdate = CASE 
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE null
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

DESCRIBE hr;

UPDATE hr
SET hire_date = CASE 
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE null
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !=' ';

SELECT termdate FROM hr; 

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age int;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT 
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT COUNT(*) FROM hr WHERE age < 18;

