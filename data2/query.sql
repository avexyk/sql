-- Entrar MySQL
mysql -u root -p

show databases;

CREATE DATABASE people DEFAULT CHARACTER SET utf8;

USE people;

CREATE TABLE users (
  names VARCHAR(128),
  email VARCHAR(128)
);

DESCRIBE users;

INSERT INTO users (names, email) VALUES ('Francisco', 'avexyk@gmail.com');

DELETE FROM users WHERE email='avexyk@gmail.com';

UPDATE users SET names='Javier' WHERE email='avexyk@gmail.com';

SELECT * FROM users WHERE email='avexyk@gmail.com';

SELECT * FROM users ORDER BY email;
SELECT * FROM users WHERE names LIKE '%e%'
SELECT * FROM users ORDER BY email DESC LIMIT 2;
SELECT * FROM users ORDER BY email LIMIT 1,2;

--- Counting
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM users WHERE email='avexyk@gmail.com'

--* DataTypes *--
-- Text fields
-- Binary fields
-- Numeric fields
-- AUTO_INCREMENT fields

-- CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT

-- BYTE, VARBINARY, TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB

-- TINYINT, SMALLINT, INT, BIGINT, FLOAT, DOUBLE

-- Dates
-- TIMESTAMP, DATETIME, DATE, TIME

-- Databases

DROP TABLE users;

CREATE TABLE users (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(128),
  email VARCHAR(128),
  PRIMARY KEY(user_id),
  INDEX(email)
)

-- PRIMARY KEY, INDEX

ALTER TABLE users ADD INDEX (email) USING BTREE;

------------------------------

-- First, create a MySql database or use an existing database (make sure to use a UTF8 character set) and then create a table in the database called "Ages":

CREATE TABLE Ages ( 
  name VARCHAR(128), 
  age INTEGER
)


-- Then make sure the table is empty by deleting any rows that you previously inserted, and insert these rows and only these rows with the following commands:

DELETE FROM Ages;
INSERT INTO Ages (name, age) VALUES ('Marysia', 35);
INSERT INTO Ages (name, age) VALUES ('Cadon', 21);
INSERT INTO Ages (name, age) VALUES ('Zahira', 29);
INSERT INTO Ages (name, age) VALUES ('Anita', 14);

-- Once the inserts are done, run the following SQL command:

SELECT sha1(CONCAT(name,age)) AS X FROM Ages ORDER BY X

