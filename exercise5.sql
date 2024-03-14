create database store;
use store;
create table product(PdtId varchar(50) primary key,PName varchar(50),Price int,Quantity int);
desc product;
call insertion('1','pencil',5,10);
call insertion('2','pen',0,10);
select * from product;
