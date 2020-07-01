SHOW INDEX FROM employee;
SHOW INDEX FROM emp1;

CREATE INDEX ename_idx ON employee (ename);
DROP INDEX ename_idx ON employee;