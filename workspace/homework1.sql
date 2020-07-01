CREATE TABLE food(
	id	char(5)	PRIMARY KEY,
    name	varchar(30)	NOT NULL,
    expiredate	datetime	NOT NULL,
    placeid	char(2)	NOT NULL,
    price	int unsigned	NOT NULL,
    catalog	varchar(20)	NOT NULL);
    
CREATE TABLE place(
	id	char(5)	PRIMARY KEY,
    name	varchar(30)	NOT NULL);
   
CREATE TABLE food1 LIKE food;
desc food1;
alter table food1 add place char(10);
alter table food1 modify price char(10);
alter table food1 change catalog catalog1 decimal(5);
alter table food1 drop place ;

alter table food1 rename food2;

drop table food2 -- 刪除food2資料表; 
    
    