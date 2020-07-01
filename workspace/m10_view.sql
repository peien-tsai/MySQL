-- P187
CREATE VIEW empvu100
AS SELECT empno,ename,salary
	FROM employee
    WHERE deptno = 100 ;
SELECT * FROM empvu100;

 -- P.188  
CREATE VIEW salvu100
AS SELECT empno id, ename name , salary*12 'annual_salary'
	FROM employee
    WHERE deptno = 100;
SELECT * FROM salvu100;

-- P.189
CREATE VIEW salvu100_1(id,name,salary)
AS SELECT empno , ename  , salary*12 
	FROM employee
    WHERE deptno = 100;
SELECT * FROM salvu100;

-- P.190
CREATE VIEW dept_sum_vw (name,minsal,maxsal,avgsal)
AS SELECT d.dname,MIN(salary),Max(salary),AVG(salary)
	FROM employee e,department d
	WHERE e.deptno=d.deptno
	GROUP BY d.dname;
SELECT * FROM dept_sum_vw;

-- p.193
UPDATE empvu100
SET ename = '孫悟淨' WHERE empno = 1009;
UPDATE empvu100
SET ename = '孫大為' WHERE empno = 1003; -- 0 row(s) affected Rows matched: 0  Changed: 0  Warnings: 0
-- p.194
UPDATE empvu100
SET title ='SA' WHERE empno=1009; -- Error Code: 1054. Unknown column 'title' in 'field list'

DELETE FROM empvu100 WHERE empno = 1009;


-- P.195
CREATE VIEW emp_sal_vw
AS SELECT empno, ename,salary 
	FROM employee
    WHERE salary <= 40000
    WITH CHECK OPTION;
UPDATE emp_sal_vw
SET salary = 40001 WHERE empno = 1002; -- Error Code: 1146. Table 'db01.emp_sal_vw' doesn't exist





