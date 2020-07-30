-- P187  從表格employee找出部門編號為100的員工，以員工編號、員工姓名和新資建立一個為empvu100的檢視表
CREATE VIEW empvu100
AS SELECT empno,ename,salary
	FROM employee
	WHERE deptno = 100 ;
SELECT * FROM empvu100;

 -- P.188  將檢視表的欄位名稱以別名方式建立
CREATE VIEW salvu100
AS SELECT empno id, ename name , salary*12 'annual_salary' -- 運算式必須要有別名
	FROM employee
    	WHERE deptno = 100;
SELECT * FROM salvu100;

-- P.189 將檢視表欄位名稱以colun list方式建立
CREATE VIEW salvu100_1(id,name,salary)
AS SELECT empno , ename  , salary*12 
	FROM employee
    	WHERE deptno = 100;
SELECT * FROM salvu100;

-- P.190 產生一個包含function或groups of data的檢視表
-- 產生一檢視表包含每個部門的最低薪資、最高薪資和平均薪資
CREATE VIEW dept_sum_vw (name,minsal,maxsal,avgsal)
AS SELECT d.dname,MIN(e.salary),Max(e.salary),AVG(e.salary)
	FROM employee e,department d
	WHERE e.deptno=d.deptno
	GROUP BY d.dname;
SELECT * FROM dept_sum_vw;



-- p.193  透過view修改資料時，其實是修改base table的資料
UPDATE empvu100
SET ename = '孫悟淨' WHERE empno = 1009;
UPDATE empvu100  -- 透過view修改資料時，若不在WHERE子句條件範圍內的資料是無法改的
SET ename = '孫大為' WHERE empno = 1003; -- 0 row(s) affected Rows matched: 0  Changed: 0  Warnings: 0
-- p.194
UPDATE empvu100  -- 不屬於view的欄位，也無法透過view修改base table的資料
SET title ='SA' WHERE empno=1009; -- Error Code: 1054. Unknown column 'title' in 'field list'

DELETE FROM empvu100 WHERE empno = 1009; -- 透過view刪除base table的資料


-- P.195 使用WITH CHECK OPTION檢查是否符合WHERE子句的條件，符合才放行，否則提出錯誤訊息
CREATE VIEW emp_sal_vw
AS SELECT empno, ename,salary 
	FROM employee
    WHERE salary <= 40000
    WITH CHECK OPTION;
UPDATE emp_sal_vw
SET salary = 40001 WHERE empno = 1002; -- Error Code: 1146. Table 'db01.emp_sal_vw' doesn't exist


-- p.196 修改與刪除view
--修改
ALTER VIEW empvu100
AS select empno,ename
FROM employee;
--刪除
DROP VIEW dept_sum_vw1;


