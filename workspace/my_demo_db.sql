/* Database Schema :  my_demo_db */

DROP DATABASE IF EXISTS  my_demo_db;
CREATE DATABASE IF NOT EXISTS my_demo_db;
CREATE USER IF NOT EXISTS 'dbuser'@'localhost' IDENTIFIED with mysql_native_password by 'aabb1234';
GRANT ALL PRIVILEGES ON my_demo_db.* TO 'dbuser'@'localhost';

USE my_demo_db;

CREATE TABLE  product
(  pid        	INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
   name      	VARCHAR(60) NOT NULL,
   price      	INT NOT NULL  DEFAULT 0
) ENGINE = INNODB;

INSERT INTO product (name,price) VALUES ('ASUS ZenFone M2',7490);
INSERT INTO product (name,price) VALUES ('ASUS ZenFone 6',17900);
INSERT INTO product (name,price) VALUES ('Samsung Galaxy A7',6990);
INSERT INTO product (name,price) VALUES ('HTC Desire 12',2990);
INSERT INTO product (name,price) VALUES ('HTC Desire 19',9490);
INSERT INTO product (name,price) VALUES ('Apple iPhone 8 64G',15900);




