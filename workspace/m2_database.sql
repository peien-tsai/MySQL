create database db01;
CREATE SCHEMA `db02` ;


use db01; -- set default database 切換資料庫
create database db01;
create database if not exists db01;
show databases;
show charset; -- 查詢字元集
show collation like '%big5%';
alter database db02
character set big5
collate big5_chinese_ci; -- ci:case insensitive大小寫不區分 (cs為區分)
select @@character_set_database, @@collation_database; -- 查詢現在的character跟collate