-- ALTER  TABLE department 

-- P.171 Explicit Transaction:rollback 外顯式交易(回復方式結束交易)
START TRANSACTION;
INSERT INTO department VALUES(601,'RD',1001);
INSERT INTO department VALUES(602,'IT',null);
SELECT * FROM department;
ROLLBACK;
SELECT * FROM department;

-- P.172 Explicit Transaction:rollback 外顯式交易之commit(確認方式結束交易)
START TRANSACTION;
INSERT INTO department VALUES(601,'RD',1001);
INSERT INTO department VALUES(602,'IT',null);
SELECT * FROM department;
COMMIT;
SELECT * FROM department;

-- P.173 Implicit Transaction 隱含式交易 (SET AutoCommit=0啟動;SET AutoCommit=1結束)
SET AutoCommit = 0; -- 啟動隱含式交易
INSERT INTO department VALUES(605,'RD',1001);
INSERT INTO department VALUES(606,'IT',null);
SELECT * FROM department; -- (a)
ROLLBACK; -- ROLLBACK/COMMIT結束目前交易，會自動再起動新的交易
SELECT * FROM department; -- (b)
INSERT INTO department VALUES(607,'RD',1001);
INSERT INTO department VALUES(608,'IT',null);
SELECT * FROM department; -- (c)
COMMIT;
SELECT * FROM department; -- (d)
SET AutoCommit = 1;-- 結束隱含式交易

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
ROLLBACK TO A; -- 若省略A不寫，會rollback整個交易
COMMIT;
SELECT empno,ename,salary
FROM employee
WHERE empno IN (1001,1002,1003);



-- ●Lock範例 (要開兩個連線)

-- Session 1 (原來的連線)
BEGIN;
SELECT salary
FROM employee
WHERE empno = 1001;  -- (1)

UPDATE employee
SET salary=60001
WHERE empno = 1001; -- (3)

COMMIT;  -- (5)

SELECT salary
FROM employee
WHERE empno = 1001;


-- Session 2 (新的連線)
BEGIN;
SELECT salary
FROM employee
WHERE empno = 1001;  -- (2)

UPDATE employee
SET salary=60002
WHERE empno = 1001;  -- (4)

 -- (6) 結束waiting，執行上述update

COMMIT;
SELECT salary
FROM employee
WHERE empno = 1001; -- (7)
