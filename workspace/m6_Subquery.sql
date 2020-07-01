-- P120 找出所有比潘麗珍薪水高的員工
SELECT ename,salary
FROM employee
WHERE salary>(SELECT salary
              FROM employee
              WHERE ename = '潘麗珍');

-- P121 找出所有職稱和員工編號為1002相同且薪資比員工編號為1005高的員工
SELECT ename,title,salary
FROM employee
WHERE title=(SELECT title
             FROM employee
             WHERE empno = 1002)
		AND (SELECT salary
			 FROM employee
             WHERE empno = 1005);

-- P122 找出所有最低薪資比部門代號200最低薪資最高的部門alter
SELECT deptno,Min(salary) 'Minimue Salary'
FROM employee
GROUP BY deptno
HAVING MIN(salary)>(SELECT MIN(salary)
                   FROM employee
                   WHERE deptno = 200);
select * from employee;
-- P123
SELECT ename,title,salary,
		ROUND((salary*100/(SELECT SUM(salary)
         FROM employee
		 WHERE deptno =100 )),1) 'Percentage'
FROM employee
WHERE deptno = 100 ;

-- P124
SELECT ename,title,salary,
	   ROUND((salary*100/t.total),1)
FROM employee,(SELECT SUM(salary) 'total'
               FROM employee
		       WHERE deptno =100 )  t
WHERE deptno = 100 ;

-- 
SELECT round(123456.789) num;
SELECT round(123456.789,1) num;
SELECT round(123456.789,-1) num;
SELECT round(123456.789,-2) num;

-- Error Code: 1242. Subquery returns more than 1 row
SELECT empno,ename
FROM employee
WHERE salary =(SELECT MIN(salary)
               FROM employee
               GROUP BY deptno) ;

-- P128
SELECT ename,title,salary
FROM employee
WHERE salary < ANY
              (SELECT salary
               FROM employee
               WHERE title ='senior engineer') 
AND title<>'senior engineer';
          
SELECT ename,title,salary
FROM employee
WHERE salary < (SELECT MAX(salary)
               FROM employee
               WHERE title ='senior engineer')                    
AND title<>'senior engineer';

SELECT ename,title,salary
FROM employee
WHERE salary > ANY
              (SELECT salary
               FROM employee
               WHERE title ='senior engineer') 
AND title<>'senior engineer';

SELECT ename,title,salary
FROM employee
WHERE salary < (SELECT MIN(salary)
               FROM employee
               WHERE title ='senior engineer')                    
AND title<>'senior engineer';

SELECT ename,title,salary
FROM employee
WHERE salary > ALL
              (SELECT salary
               FROM employee
               WHERE title ='senior engineer') 
AND title<>'senior engineer';


-- 找出是主管的員工
SELECT ename
FROM emp
WHERE empno IN (SELECT DISTINCT mgrno
				FROM emp);
-- 找出所有不是主管的員工             
SELECT ename
FROM emp
WHERE empno NOT IN (SELECT DISTINCT mgrno
				    FROM emp
                    WHERE mgrno IS NOT NULL); 
                    
-- Correlated Subquery
SELECT e.ename,e.title,e.salary,
         ROUND((salary*100/(SELECT SUM(salary)
         FROM employee
		 WHERE deptno =e.deptno )),1) 'Percentage'
FROM employee e
WHERE deptno = 100 ;

-- P133 找出每個部門薪資最低的員工
SELECT e.ename,e.salary,e.deptno
FROM employee e
WHERE salary =(SELECT MIN(salary)
               FROM employee
               GROUP BY deptno
               HAVING deptno=e.deptno) ;

SELECT e.ename,e.salary,e.deptno
FROM employee e
WHERE salary =(SELECT MIN(salary)
               FROM employee
               GROUP BY deptno) ; -- 不對的
               
SELECT e.ename,e.salary,e.deptno
FROM employee e
WHERE salary =(SELECT MIN(salary)
               FROM employee
               WHERE deptno=e.deptno) ; -- P134
               
-- P136
CREATE TABLE emp100
SELECT empno,ename,salary*12 'annualSalary',hiredate
FROM employee
WHERE deptno =100;

desc emp100;


