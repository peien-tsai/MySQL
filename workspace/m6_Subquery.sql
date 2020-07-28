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
AND salary >(SELECT salary
             FROM employee
             WHERE empno = 1005);

-- P122 找出所有最低薪資比部門代號200最低薪資最高的部門alter
SELECT deptno,Min(salary) 'Minimum Salary'
FROM employee
GROUP BY deptno
HAVING MIN(salary)>(SELECT MIN(salary)
                   FROM employee
                   WHERE deptno = 200);
select * from employee;

-- P123 【SELECT】找出部門代號為100的每位員工，其薪資戰部門代號為100所有員工薪資的比例
SELECT ename,title,salary,
	ROUND((salary*100/(SELECT SUM(salary)
                           FROM employee
		           WHERE deptno =100 )),1) 'Percentage'
FROM employee
WHERE deptno = 100 ;

-- P124 【FROM】找出部門代號為100的每位員工，其薪資戰部門代號號為100所有員工薪資的比例
SELECT ename,title,salary,
	   ROUND((salary*100/t.total),1)
FROM employee,(SELECT SUM(salary) 'total'
               FROM employee
		       WHERE deptno =100 )  t
WHERE deptno = 100 ;

-- 四捨五入
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

-- P128  找出職稱不是senior engineer 且薪資比任何其中一個senior engineer 薪資來得低的員工
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
                    WHERE mgrno IS NOT NULL);  -- (若有NULL值，Distinct 會包含NULL值)  
                    
-- Correlated Subquery(無法用在from子句上) 找出部門代號為100的每位員工，其薪資占部門代號為100所有員工薪資的百分比
SELECT e.ename,e.title,e.salary,
         ROUND((salary*100/(SELECT SUM(salary)
                            FROM employee
		            WHERE deptno =e.deptno )),1) 'Percentage'
FROM employee e
WHERE e.deptno = 100 ;

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
               
-- P136 SELECT敘述中傳回的資料，直接新增到新表格中
CREATE TABLE emp100
SELECT empno,ename,salary*12 'annualSalary',hiredate
FROM employee
WHERE deptno =100;

desc emp100;


