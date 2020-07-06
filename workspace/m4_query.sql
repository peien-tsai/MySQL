select * from employee;
select ename, title from employee;
select 17/4, 17 div 4, 17%4, 17*null;
select 2+3, 5*4;

SELECT ename as '員工姓名',salary*12 as '年薪' FROM employee;
SELECT ename as 員工姓名,salary*12 as 年薪 FROM employee;
SELECT ename  '員工姓名',salary*12  '年薪' FROM employee;
SELECT ename 'Employee Name',salary*12 'Annual Salary' FROM employee;


SELECT SUBSTRING(ename,1,1) '姓氏' FROM employee; -- 截取部分字串 (string,position,length)
SELECT SUBSTRING(ename,2) '姓氏' FROM employee; -- 截取部分字串 (string,position)以後
SELECT SUBSTRING('David Wang',1,5) 'name' FROM employee; 
SELECT SUBSTRING('David Wang',7) 'name' FROM employee;
SELECT SUBSTRING('David Wang',-4) 'name' FROM employee; -- 負值，從右邊數之
SELECT SUBSTRING('David Wang',-4,2) 'name' FROM employee; 

SELECT CONCAT(ename,' is a ', title)'員工' FROM employee; -- 串接字串
SELECT LENGTH('我是一個student')'length'; -- 字串長度佔多少個bytes(表示UTF8一個中文占3bytes)
SELECT CHAR_LENGTH('我是一個student')'length'; -- 總共幾個字元，中英文都算一個字


SELECT SYSDATE(); -- 傳回正在執行的日期和時間
SELECT SYSDATE()+interval 5 day; -- +-interval 數字 單位 (year,quarter,month,day,hour,minute,second)
SELECT SYSDATE()+interval 5 month;
SELECT SYSDATE()+interval 5 hour;

SELECT SYSDATE(),SLEEP(2),SYSDATE();
SELECT NOW(),SLEEP(2),NOW();
select curdate(); -- 傳回現在的日期
select curtime(); -- 傳回現在的時間

SELECT ADDDATE(CURDATE(),5); -- adddate(date,days)  加日期
SELECT ADDDATE(CURDATE(),interval 5 day); 
SELECT ADDDATE(CURDATE(),interval 5 year);
SELECT SUBDATE(CURDATE(),5);  -- 減日期
SELECT SUBDATE(CURDATE(),interval 5 year);

SELECT SYSDATE(),year(SYSDATE()) 'year', -- 傳回int,取得年分
				month(SYSDATE()) 'month', -- 傳回int,取得月分
                day(SYSDATE()) 'day' ; -- 傳回int,取得日期

SELECT ename,hiredate,
                year(hiredate) 'year',
				month(hiredate) 'month',
                day(hiredate) 'day' from employee;

SELECT ename,hiredate,DATEDIFF(NOW(),hiredate)/365 'year', -- 前減後
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

sELECT empno,ename,salary,
	salary *IF(salary>=50000,2,1.5) 'bonus'                 
From employee;

SELECT empno,ename,salary, -- case...when...else 多種條件判斷
	case  
		WHEN salary>100000 THEN 'A'
        WHEN salary BETWEEN 70000 AND 100000 THEN 'B'   -- 有包含邊界值(<= <=)
        WHEN salary BETWEEN 50000 AND 69999 THEN 'C'
        WHEN salary BETWEEN 30000 AND 49999 THEN 'D'
    END 'Grade'  -- 欄位名稱
From employee;

SELECT deptno FROM employee;
SELECT distinct deptno FROM employee;  -- 去除重複資料
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

SELECT * from employee where ename LIKE '林%'; -- %表示0至多個字元
SELECT * from employee where ename LIKE '%生';
SELECT * from employee where ename LIKE '%麗%';
SELECT * from employee where ename LIKE '_麗%'; -- _表示一個字元
SELECT * from employee where title LIKE '%SA\_%';
SELECT * from employee where title LIKE '%SA#_%' ESCAPE'#';  -- 脫離字元
SELECT * FROM employee WHERE ename LIKE '林%' OR ename LIKE '王%';
SELECT * FROM employee WHERE salary >=45000 OR ename LIKE '林%';
SELECT * FROM employee WHERE salary >=45000 AND ename LIKE '林%';
SELECT * FROM employee WHERE title in ('manager','engineer');
SELECT * FROM department WHERE mgrno is NOT NULL ;
SELECT * FROM employee WHERE title in ('manager','engineer');

SELECT ename, deptno,salary FROM employee ORDER BY deptno,salary DESC; -- 降冪 由大排到小
SELECT ename, deptno,salary FROM employee ORDER BY deptno DESC,salary ; -- 預設由小排到大ASC
SELECT ename, deptno,salary*12 'Annual' from employee ORDER BY Annual ; -- 依欄位別名排序
SELECT ename, deptno,salary*12 'Annual' from employee ORDER BY salary*12 ; -- 依欄位運算式排序
SELECT * from employee Limit 3; -- 指定回傳記錄的數量
SELECT * from employee Limit 4,3; -- 跳過前四筆之後取三筆資料
SELECT * from employee ORDER BY  hiredate Limit 3; -- 先排序完，再取數量
SELECT * from employee ORDER BY  salary DESC Limit 3; 

SELECT SUM(salary),AVG(salary),Max(salary),MIN(salary) FROM employee; -- 集合函數 aggregate function 會忽略NULL
SELECT COUNT(salary) FROM employee; -- 傳回欄位的總筆數
SELECT COUNT(deptno) FROM employee;
SELECT COUNT(distinct deptno) FROM employee;
SELECT COUNT(mgrno) 'Count' FROM department; -- 計算出有主管的部門數(不包含NULL)
select count(ename),sum(salary),avg(salary),max(salary),min(salary) from employee;  -- 計算出員工人數、總新資、平均薪資、最高薪資和最低薪資

SELECT deptno, AVG(salary) 'Average' FROM employee GROUP BY deptno; -- 某欄位為集合透過集合函數計算
SELECT AVG(salary) 'Average' FROM employee GROUP BY deptno; -- 算出不同部門的平均薪資
SELECT deptno, AVG(salary) 'Average' FROM employee GROUP BY deptno ORDER BY AVG(salary); -- 算出不同部門的平均薪資，並以平均薪資排序
SELECT deptno, AVG(salary) 'Average' FROM employee GROUP BY deptno ORDER BY Average; -- 欄位別名排序

SELECT deptno,title,SUM(salary) 'Total' FROM employee group by deptno,title; -- 算出不同部門不同職稱員工的總新資

SELECT title,sum(salary) 'Total'
FROM employee
where title not like '%SA%'
Group by title
Having sum(salary)>100000
Order by sum(salary) desc;  -- 找出不同職稱的總新資，但不包含有"SA"這些字的職稱，且總新資必須超過100000最後以總薪資排序
