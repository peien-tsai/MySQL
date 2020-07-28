-- P139 
INSERT INTO department (deptno,dname,mgrno)
VALUES (400,'Research',1001);
INSERT INTO department -- 若不包含欄位，則要依順序給予值
VALUES (500,'Research',1001);

-- P140
INSERT INTO department (deptno,dname) -- 若欄位的值數量比表格中欄位的數量少，則一定要包含colimn list
VALUES (601,'IT'); 
INSERT INTO department 
VALUES (602,'IT',NULL); -- 未提供值的欄位會給予Default值或NULL值

-- P141 提供可同時新增二筆以上記錄
INSERT INTO department 
VALUES (603,'HRD',1003),(604,'STK',NULL);

-- P142 新增紀錄包含日期(預設時間為午夜00:00:00)
INSERT INTO employee
VALUES (1009,'孫悟空','2013/11/10',56000,100,'senior engineer');

INSERT INTO employee 
VALUES (1010,'李大文',curdate(),89000,200,'manager'); -- 使用日期函數

-- P143 
CREATE TABLE emp_copy like employee;
INSERT INTO emp_copy SELECT * FROM employee; -- 將表格資料複製一份出來

-- P144
CREATE TABLE emp_copy1 like employee;
ALTER TABLE emp_copy1 drop title;
ALTER TABLE emp_copy1 change empno empid decimal(4);
INSERT INTO emp_copy1 (empid,ename,deptno,hiredate,salary) -- 若目標表格的欄位名稱、順序雨來源表格不盡相同，必須寫column list
    SELECT empno,ename, deptno,hiredate,salary 
    FROM  employee
    WHERE  title NOT LIKE '%SA%';
    
-- ●INSERT敘述常發生的錯誤
-- Error Code: 1048. Column 'title' cannot be null   (設定NOT NULL的欄位沒改值)
INSERT INTO employee
VALUE (1011,'李大文', CURDATE(),89000,200,NULL);

-- Error Code: 1366. Incorrect decimal value: 'a011' for column 'empno' at row 1  (資料型態不相容)
INSERT INTO employee
VALUE ('a011','李大文', CURDATE(),89000,200,'manager');

-- Error Code: 1264. Out of range value for column 'empno' at row 1 (給予的值的長度超過設定的範圍)
INSERT INTO employee
VALUE ('10110','李大文', CURDATE(),89000,200,'manager');

-- Error Code: 1406. Data too long for column 'ename' at row 1 
INSERT INTO employee
VALUE ('1011','李大文aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CURDATE(),89000,200,'manager');

-- Error Code: 1062. Duplicate entry '1010' for key 'PRIMARY' (對設定唯一限制條件的欄位給予重複的值)
INSERT INTO employee
VALUE ('1010','李大文', CURDATE(),89000,200,'manager');-------------

-- P146 可修改一筆或多筆記錄
UPDATE emp_copy
SET    salary=45000
WHERE empno =1008;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
UPDATE   emp_copy1
   SET   hiredate = CURDATE(); (不加WHERE子句，所有紀錄皆會被修改)

SET SQL_SAFE_UPDATES = 0 ; -- safe mode 關掉
SET SQL_SAFE_UPDATES = 1 ; -- safe mode 開啟(預設是這個)

-- P147  Error Code: 1093. You can't specify target table 'emp_copy' for update in FROM clause
UPDATE   emp_copy
   SET   salary=(SELECT   salary
                 FROM     (SELECT * FROM emp_copy) e --將FROM子句用一個subquery取代，即可解決Mysql不允許subquery與update表格相同的問題
                 WHERE    empno = 1006)
WHERE   empno =1007;

-- P148 Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- 將所有和員工編號為1001的薪資相同的員工，其部門代號改成員工編號為1003的部門代號
UPDATE  emp_copy
SET     deptno = (SELECT deptno
                  FROM   employee
		  WHERE  empno = 1003)
WHERE   salary = (SELECT salary
                  FROM   employee
		  WHERE  empno = 1001);

-- P149 可刪除一筆或多筆記錄 (記得也要設定 SET SQL_SAFE_UPDATES = 0 ;)
DELETE FROM emp_copy WHERE empno = 1007 ;
DELETE FROM emp_copy1 ;
DELETE FROM emp_copy WHERE deptno Between 601 and 604 ;

-- p150 將子查詢的結果做為刪除資料的條件
-- 刪除所有部門名稱為Accounting的員工
DELETE FROM emp_copy
WHERE deptno = (SELECT deptno
                FROM   department
                WHERE dname = 'Accounting');

TRUNCATE  emp_copy; -- 用來刪除一個表格中所有的紀錄


               
                  
