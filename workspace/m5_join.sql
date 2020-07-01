-- Cross join
SELECT employee.ename,department.dname
from employee, department;
SELECT employee.ename,department.dname
from employee cross join department;

-- Inner join -Equal join 
SELECT employee.ename,department.dname   -- 方法1
FROM employee,department
where employee.deptno = department.deptno;

SELECT employee.ename,department.dname  -- 方法2 ANSI Join type
FROM employee JOIN department
ON employee.deptno = department.deptno;

SELECT employee.ename,department.dname  -- 方法3 ANSI Join type
FROM employee JOIN department
using (deptno) ;

SELECT employee.ename,department.dname  -- 方法4 ANSI Join type
FROM employee natural join department ;

SELECT employee.ename,department.dname  --  P.105 方法1.ANSI Join type
FROM employee JOIN department
ON employee.deptno = department.deptno
and title='engineer';

SELECT employee.ename,department.dname  --  P.105 方法2.ANSI Join type
FROM employee JOIN department
ON employee.deptno = department.deptno
where title='engineer';

SELECT e.ename,d.dname   -- 簡化表格命名
FROM employee e,department d
where e.deptno = d.deptno;

SELECT  e.empno, d.dname, c.cname -- P107方法1找出所有員工部門名稱和城市名稱
FROM emp e, dept d,city c
Where e.deptno=d.deptno
and d.cityno=c.cityno;

SELECT  e.empno, d.dname, c.cname -- P108方法2找出所有員工部門名稱和城市名稱
FROM emp e join dept d
ON e.deptno=d.deptno
join city c
on d.cityno=c.cityno;

-- NOn equal join
SELECT e.ename,e.salary,g.level  -- P109
FROM emp e,grade g
where e.salary BETWEEN g.lowest AND g.highest;

sELECT e.ename,d.dname,e.salary,g.level  -- P110
FROM emp e,grade g,dept d
WHERE e.deptno=d.deptno
AND e.salary BETWEEN g.lowest AND g.highest;

SELECT e.ename,d.dname,e.salary,g.level  -- P110 ANSI
FROM emp e join dept d
on e.deptno=d.deptno
join grade g
on e.salary BETWEEN g.lowest AND g.highest;

-- Outer join
SELECT e.ename,e.deptno,d.dname  -- left outer join
FROM emp e LEFT JOIN dept d
	ON e.deptno = d.deptno;
    
SELECT e.ename,d.deptno,d.dname  -- Right outer join
FROM emp e Right JOIN dept d
	ON e.deptno = d.deptno;

SELECT e.ename,e.deptno,d.dname  -- UNION
FROM emp e LEFT JOIN dept d
	ON e.deptno = d.deptno
UNION
SELECT e.ename,d.deptno,d.dname  
FROM emp e Right JOIN dept d
	ON e.deptno = d.deptno;

-- SELF join
SELECT worker.ename 'worker name',manager.ename 'manager name'
	FROM emp worker, emp manager
	where worker.mgrno = manager.empno;
