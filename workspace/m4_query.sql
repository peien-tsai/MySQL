select * from employee;
select ename, title from employee;
select 17/4, 17 div 4, 17%4, 17*null;
select 2+3, 5*4;

SELECT ename as '員工姓名',salary*12 as '年薪' FROM employee;
SELECT ename as 員工姓名,salary*12 as 年薪 FROM employee;
SELECT ename  '員工姓名',salary*12  '年薪' FROM employee;
SELECT ename 'Employee Name',salary*12 'Annual Salary' FROM employee;


SELECT SUBSTRING(ename,1,1) '姓氏' FROM employee;
SELECT SUBSTRING(ename,2) '姓氏' FROM employee;
SELECT SUBSTRING('David Wang',1,5) 'name' FROM employee;
SELECT SUBSTRING('David Wang',7) 'name' FROM employee;
SELECT SUBSTRING('David Wang',-4) 'name' FROM employee;
SELECT SUBSTRING('David Wang',-4,2) 'name' FROM employee;

SELECT CONCAT(ename,' is a ', title)'員工' FROM employee;
SELECT LENGTH('我是一個student')'length';
SELECT CHAR_LENGTH('我是一個student')'length';


SELECT SYSDATE();
SELECT SYSDATE()+interval 5 day;
SELECT SYSDATE()+interval 5 month;
SELECT SYSDATE()+interval 5 hour;

SELECT SYSDATE(),SLEEP(2),SYSDATE();
SELECT NOW(),SLEEP(2),NOW();

SELECT ADDDATE(CURDATE(),5);
SELECT ADDDATE(CURDATE(),interval 5 day);
SELECT ADDDATE(CURDATE(),interval 5 year);
SELECT SUBDATE(CURDATE(),5);
SELECT SUBDATE(CURDATE(),interval 5 year);

SELECT SYSDATE(),year(SYSDATE()) 'year',
				month(SYSDATE()) 'month',
                day(SYSDATE()) 'day' ;

SELECT ename,hiredate,
                year(hiredate) 'year',
				month(hiredate) 'month',
                day(hiredate) 'day' from employee;

SELECT ename,hiredate,DATEDIFF(NOW(),hiredate)/365 'year',
                DATEDIFF(NOW(),hiredate) div 365 'year',
				ROUND(DATEDIFF(NOW(),hiredate) / 365) 'year',
                ROUND(DATEDIFF(NOW(),hiredate) / 365,1) 'year' -- 取小數一位
                FROM employee;
                
SELECT ename,hiredate,DATEDIFF(NOW(),hiredate)%365 'year'FROM employee;


SELECT ename,hiredate,DATEDIFF(NOW(),hiredate) div 365 'year',
   (DATEDIFF(NOW(),hiredate)%365) div 30 'month'
FROM employee;

SELECT ename,hiredate,
DATEDIFF(NOW(),hiredate) div 365 'year',
(DATEDIFF(NOW(),hiredate)%365) div 30 'month',
CONCAT(DATEDIFF(NOW(),hiredate) div 365 ,'年', (DATEDIFF(NOW(),hiredate)%365) div 30 ,'月')'年資' FROM employee;

SELECT empno,ename,salary,
	salary *IF(salary>=50000,2,1.5) 'bonus'                 
From employee;

SELECT empno,ename,salary,
	case
		WHEN salary>100000 THEN 'A'
        WHEN salary BETWEEN 70000 AND 100000 THEN 'B'
        WHEN salary BETWEEN 50000 AND 69999 THEN 'C'
        WHEN salary BETWEEN 30000 AND 49999 THEN 'D'
    END 'Grade'
From employee;

SELECT deptno FROM employee;
SELECT distinct deptno FROM employee;
SELECT deptno,title FROM employee;
SELECT distinct deptno,title FROM employee;
SELECT distinct * FROM employee
WHERE deptno=100;
SELECT distinct * FROM employee
WHERE title='engineer';
SELECT distinct * FROM employee
WHERE hiredate='2007/07/06';

SELECT distinct * FROM employee
WHERE title IN('engineer','manager');

SELECT * from employee where ename LIKE '林%';
SELECT * from employee where ename LIKE '%生';
SELECT * from employee where ename LIKE '%麗%';
SELECT * from employee where ename LIKE '_麗%';
SELECT * from employee where title LIKE '%SA\_%';
SELECT * from employee where title LIKE '%SA#_%' ESCAPE'#';
SELECT * FROM employee WHERE ename LIKE '林%' OR ename LIKE '王%';
SELECT * FROM employee WHERE salary >=45000 OR ename LIKE '林%';
SELECT * FROM employee WHERE salary >=45000 AND ename LIKE '林%';
SELECT * FROM employee WHERE title in ('manager','engineer');
SELECT * FROM department WHERE mgrno is NOT NULL ;
SELECT * FROM employee WHERE title in ('manager','engineer');

SELECT ename, deptno,salary FROM employee ORDER BY deptno,salary DESC;
SELECT ename, deptno,salary FROM employee ORDER BY deptno DESC,salary ;
SELECT ename, deptno,salary*12 'Annual' from employee ORDER BY Annual ;
SELECT ename, deptno,salary*12 'Annual' from employee ORDER BY salary*12 ;
SELECT * from employee Limit 3;
SELECT * from employee Limit 4,3;
SELECT * from employee ORDER BY  hiredate Limit 3;
SELECT * from employee ORDER BY  salary DESC Limit 3;

SELECT SUM(salary),AVG(salary),Max(salary),MIN(salary) FROM employee;
SELECT COUNT(salary) FROM employee;
SELECT COUNT(deptno) FROM employee;
SELECT COUNT(distinct deptno) FROM employee;
SELECT COUNT(mgrno) 'Count' FROM department;

SELECT deptno, AVG(salary) 'Average' FROM employee GROUP BY deptno;
SELECT AVG(salary) 'Average' FROM employee GROUP BY deptno;
SELECT deptno, AVG(salary) 'Average' FROM employee GROUP BY deptno ORDER BY AVG(salary);
SELECT deptno, AVG(salary) 'Average' FROM employee GROUP BY deptno ORDER BY Average;

SELECT deptno,title,SUM(salary) 'Total' FROM employee group by deptno,title;

SELECT title,sum(salary) 'Total'
FROM employee
where title not like '%SA%'
Group by title
Having sum(salary)>100000
Order by sum(salary) desc;
