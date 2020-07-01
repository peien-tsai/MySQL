-- P139
INSERT INTO department (deptno,dname,mgrno)
VALUE (400,'Research',1001);
INSERT INTO department 
VALUE (500,'Research',1001);

-- P140
INSERT INTO department (deptno,dname)
VALUE (601,'IT');
INSERT INTO department 
VALUE (602,'IT',NULL);

-- P141
INSERT INTO department 
VALUE (603,'HRD',1003),(604,'STK',NULL);

-- P142
INSERT INTO employee
VALUE (1009,'孫悟空','2013/11/10',56000,100,'senior engineer');

INSERT INTO employee
VALUE (1010,'李大文',curdate(),89000,200,'manager');

-- P143
CREATE TABLE emp_copy like employee;
INSERT INTO emp_copy SELECT * FROM employee;

-- P144
CREATE TABLE emp_copy1 like employee;
ALTER TABLE emp_copy1 drop title;
ALTER TABLE emp_copy1 change empno empid decimal(4);
INSERT INTO emp_copy1 (empid,ename,deptno,hiredate,salary)
    SELECT empno,ename, deptno,hiredate,salary 
    FROM  employee
    WHERE  title NOT LIKE '%SA%';

-- Error Code: 1048. Column 'title' cannot be null   
INSERT INTO employee
VALUE (1011,'李大文', CURDATE(),89000,200,NULL);
-- Error Code: 1366. Incorrect decimal value: 'a011' for column 'empno' at row 1
INSERT INTO employee
VALUE ('a011','李大文', CURDATE(),89000,200,'manager');
-- Error Code: 1264. Out of range value for column 'empno' at row 1
INSERT INTO employee
VALUE ('10110','李大文', CURDATE(),89000,200,'manager');
-- Error Code: 1406. Data too long for column 'ename' at row 1
INSERT INTO employee
VALUE ('1011','李大文aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CURDATE(),89000,200,'manager');
-- Error Code: 1062. Duplicate entry '1010' for key 'PRIMARY'
INSERT INTO employee
VALUE ('1010','李大文', CURDATE(),89000,200,'manager');-------------

-- P146
UPDATE emp_copy
SET    salary=45000
WHERE empno =1008;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
UPDATE   emp_copy1
   SET   hiredate = CURDATE();

SET SQL_SAFE_UPDATES = 0 ; -- safe mode 關掉
SET SQL_SAFE_UPDATES = 1 ; -- safe mode 開啟

-- P147  Error Code: 1093. You can't specify target table 'emp_copy' for update in FROM clause
UPDATE   emp_copy
   SET   salary=(SELECT   salary
                 FROM     (SELECT * FROM emp_copy) e
                 WHERE    empno = 1006)
WHERE   empno =1007;

-- P148 Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
UPDATE  emp_copy
SET     deptno = (SELECT deptno
                  FROM   employee
				  WHERE  empno = 1003)
WHERE   salary = (SELECT salary
                  FROM   employee
				  WHERE  empno = 1001);

DELETE FROM emp_copy WHERE empno = 1007 ;
DELETE FROM emp_copy1 ;
DELETE FROM emp_copy WHERE deptno Between 601 and 604 ;

-- p150
DELETE FROM emp_copy
WHERE deptno = (SELECT deptno
                FROM   department
                WHERE dname = 'Accounting');

TRUNCATE  emp_copy;


               
                  