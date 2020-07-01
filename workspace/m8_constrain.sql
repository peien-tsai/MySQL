CREATE TABLE emp1(
-- column level constraint
empno	DECIMAL(4)	PRIMARY KEY,
ename	VARCHAR(30)	NOT NULL,
hiredate	DATE	NOT NULL,
email	VARCHAR(30)	UNIQUE,
deptno	DECIMAL(3)	NOT NULL,
salary	INT,
title	VARCHAR(20)	NOT NULL DEFAULT 'engineer',
-- table level constraint
CONSTRAINT emp_deptno_fk  FOREIGN KEY(deptno)
	REFERENCES department (deptno));

-- P157
INSERT INTO  dept
VALUES (600,'Public Relations', default);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
UPDATE dept
SET  cityno = default
WHERE deptno = 500;


INSERT INTO emp1
VALUE (1001,'李大文', CURDATE(),'lee@gmail.com',200,89000, DEFAULT );

-- Error Code: 1062. Duplicate entry 'lee@gmail.com' for key 'email'
INSERT INTO emp1
VALUE (1002,'李大文', CURDATE(),'lee@gmail.com',200,89000, DEFAULT );

-- Error Code: 1062. Duplicate entry 'lee@gmail.com' for key 'email'
INSERT INTO emp1
VALUE (1002,'李大三', CURDATE(),'lee@gmail.com',100,89000, DEFAULT );

--
delete from department where deptno = 100 ;
delete from department where deptno = 300 ;

-- altertablen→點FK→改成casecard
ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON UPDATE CASCADE;
  
UPDATE department set deptno = 201 where deptno = 200;

ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

Delete FROM department where deptno = 201;


CREATE TABLE mem(
	memno	int	PRIMARY KEY AUTO_INCREMENT,
    mname	varchar(30)	NOT NULL);  -- 沒有預設初始值

INSERT INTO mem(mname)
VALUES('David Ho'),('Maria Eang'),('Pam Pan'),('Tina Lee'),('Jean Tsao');

Drop  TABLE mem;

CREATE TABLE mem(
	memno	int	PRIMARY KEY AUTO_INCREMENT,
    mname	varchar(30)	NOT NULL)
AUTO_INCREMENT = 100;  -- 預設初始值為100

INSERT INTO mem(mname)
VALUES('David Ho'),('Maria Eang'),('Pam Pan'),('Tina Lee'),('Jean Tsao');
SELECT LAST_INSERT_ID(); -- 新增多筆資料只會告訴你第一筆資料的編號

INSERT INTO mem(mname)
VALUES('David Ho');
SELECT LAST_INSERT_ID(); -- 逐筆新增，編號才會顯示回正確值





