show databases;
use university;
create table student(ktuid int,name varchar(50),age int,email varchar(50));
alter table student modify ktuid varchar(50);
alter table student modify ktuid varchar(50) primary key;
insert into student values('tve1','vidhya',22,'vid@gmail.com');
select * from student;
drop table student;
desc student;
