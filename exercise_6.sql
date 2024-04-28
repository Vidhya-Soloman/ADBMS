#TRIGGERS
create database trigg;
use trigg;
create table product(pdtid int primary key,price int,qtyinstock int);
create table sale(saleid int primary key,deliveryaddress varchar(50));
create table saleitem(saleid int,pdtid int,qty int,foreign key(saleid) references product(pdtid),foreign key(saleid) references sale(saleid),primary key(pdtid,saleid));
drop table saleitem;
create table saleitem(saleid int,pdtid int,primary key(saleid,pdtid));
alter table saleitem add qty int;
desc product;
desc sale;
desc saleitem;

insert into product values(1,10,100);
select * from product;
insert into sale values(101,"home123");
insert into sale values(102,"home123");
select * from sale;

create trigger updateQuantity
after insert on Saleitem
for each row
update product set qtyinstock=product.qtyinstock-new.qty where
pdtid=new.pdtid;


insert into saleitem values(101,1,4);
insert into saleitem values(102,1,5);
select * from saleitem;
select * from product;

