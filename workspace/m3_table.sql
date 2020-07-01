CREATE TABLE empolyee(
	empno	decimal(4)	PRIMARY KEY,
    ename	varchar(30)	NOT NULL,
    hiredate	date	NOT NULL,
    salary	int	NOT NULL,
    deptno	decimal(3)	NOT NULL,
    title	varchar(20)	NOT NULL);
 
 
 CREATE TABLE `db01`.`department` (
  `deptno` DECIMAL(3) NOT NULL,
  `dname` VARCHAR(30) NOT NULL,
  `mgrno` DECIMAL(4) NULL,
  PRIMARY KEY (`deptno`));
SHOW TABLE STATUS;
DESC empolyee;

create table t (a decimal(5),b varchar(10),c int);
desc s;
alter table t add d char(10);
alter table t add e int first;
alter table t add f int after C;
alter table t modify c char(10);
alter table t modify c char(10) after a;
alter table t change c z int;
alter table t drop z ;
alter table t rename s;
drop table s;

alter table empolyee rename employee;