-- 顯示employee的index狀況
SHOW INDEX FROM employee;
SHOW INDEX FROM emp1;


-- 建立索引 (為employee的ename欄位建立一個非唯一的索引)
CREATE INDEX ename_idx ON employee (ename);
-- 刪除index
DROP INDEX ename_idx ON employee;
ALTER TABLE employee DROP INDEX ename_idx;
