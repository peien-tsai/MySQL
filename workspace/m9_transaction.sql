ALTER  TABLE department 

-- P.171
START TRANSACTION;
INSERT INTO department VALUES(601,'RD',1001);
INSERT INTO department VALUES(602,'IT',null);
SELECT * FROM department;
ROLLBACK;
SELECT * FROM department;
-- P.172
START TRANSACTION;
INSERT INTO department VALUES(601,'RD',1001);
INSERT INTO department VALUES(602,'IT',null);
SELECT * FROM department;
COMMIT;
SELECT * FROM department;

-- P.173
SET AutoCommit = 0;
INSERT INTO department VALUES(605,'RD',1001);
INSERT INTO department VALUES(606,'IT',null);
SELECT * FROM department; -- (a)
ROLLBACK;
SELECT * FROM department; -- (b)
INSERT INTO department VALUES(607,'RD',1001);
INSERT INTO department VALUES(608,'IT',null);
SELECT * FROM department; -- (c)
COMMIT;
SELECT * FROM department; -- (d)
SET AutoCommit = 1;

-- P.177
BEGIN;
SELECT empno,ename,salary
FROM employee
	WHERE empno IN (1001,1002,1003);
	UPDATE employee SET salary = 60000 
	WHERE empno =1001;
	SAVEPOINT A;
	UPDATE employee SET salary = 40000 
	WHERE empno =1002;
	SAVEPOINT B;
	UPDATE employee SET salary = 80000 
WHERE empno =1003;
ROLLBACK TO A;
COMMIT;
SELECT empno,ename,salary
FROM employee
WHERE empno IN (1001,1002,1003);


-- Session 1
BEGIN;
SELECT salary
FROM employee
WHERE empno = 1001;

UPDATE employee
SET salary=60001
WHERE empno = 1001;

COMMIT;
