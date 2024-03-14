create database university;
use university;
create table student(name varchar(50),student_number int primary key,class int,major varchar(50));
desc student;
create table course(course_name varchar(50),course_number varchar(50) primary key,credit_hours int,department varchar(50));
desc course;
create table section(section_identifier int,course_number varchar(50),foreign key(course_number)references course(course_number),semester varchar(50),
year date,instructor varchar(50));
alter table section modify year varchar(50);
desc section;
alter table section add primary key(section_identifier);
create table grade_report(student_number int,foreign key(student_number)references student(student_number),section_identifier
int,foreign key(section_identifier)references section(section_identifier),grade varchar(50),primary key(student_number,section_identifier));
desc grade_report;
create table prequisite(course_number varchar(50),foreign key(course_number) references course(course_number),prerequisite_number varchar(50),primary key(course_number,prerequisite_number));
desc prequisite;

#INSERTING VALUES
#STUDENT TABLE
insert into student values('Smith',17,1,'CS');
insert into student values('Brown',8,2,'CS');
insert into student values('Brown',9,4,'CS');
select * from student;

#COURSE TABLE
insert into course values('Intro to Computer Science','CS1310',4,'CS');
insert into course values('Data Structures','CS3320',4,'CS');
insert into course values('Discrete Mathematics','MATH2410',3,'MATH');
insert into course values('Database','CS3380',3,'CS');
select * from course;

#SECTION TABLE
insert into section values(85,'MATH2410','Fail',07,'King');

insert into section values(92,'CS1310','Fail',07,'Anderson');
insert into section values(102,'CS3320','Spring',08,'Knuth');
insert into section values(112,'MATH2410','Fail',08,'Chang');
insert into section values(119,'CS1310','Fail',08,'Anderson');
insert into section values(135,'CS3380','Fail',08,'Stone');
select * from section;

#GRADE_REPORT TABEL
insert into grade_report values(17,112,'B');

insert into grade_report values(17,119,'C');
insert into grade_report values(8,85,'A');
insert into grade_report values(8,92,'A');
insert into grade_report values(8,102,'B');
insert into grade_report values(8,135,'A');

select * from grade_report;


#PREREQUISITE TABEL
insert into prequisite values('CS3380','CS3320');

insert into prequisite values('CS3380','MATH2410');
insert into prequisite values('CS3320','CS1310');
select * from prequisite;


#Q1
#select name,course_name,grade from grade_report inner join student on grade_report.student_number=student.student_number inner join section on  grade_report.section_identifier=section.section_identifier  inner join course on section.course_number=course.course_number where name='Smith';
#Q2
#select name,grade from student inner join grade_report on student.student_number=grade_report.student_number inner join section on grade_report.section_identifier=section.section_identifier inner join course on section.course_number=course.course_number where semester='Fail' and year='08'and course_name='Database';
#Q3
#select course_name as prerequisite_name,prerequisite_number from prequisite inner join course on prequisite.prerequisite_number=course.course_number where prequisite.course_number=(select course.course_number from course where course.course_name-"Database");
#Q4
#select name from student where major="CS" and class=4;
#select * from student;


#Q3
select g.grade,c.course_name
from student s join grade_report g on s.student_number=g.student_number join section sc on g.section_identifier=sc.section_identifier
join course c on sc.course_number=c.course_number
where s.name="smith";


#Q4
select student.name 
from student join grade_report on student.student_number=grade_report.student_number join section on section.section_identifier=grade_report.section_identifier join course on course.course_number=section.course_number
where course.course_name="Database" and section.semester="Fail" and section.year=08;

#Q5
select course_name from course where course_number in(
select p.prerequisite_number from prequisite p join course c on p.course_number=c.course_number
where c.course_name="Database");

#Q6
create view  names as select * from student where class=2;
select * from names;

#Q7
select c.course_name from course c join section s on s.course_number=c.course_number
where s.instructor="King" and s.year=07 and 08;

#Q8
select course_number,semester,year,count(section_identifier) from section where instructor="King" group by course_number,semester,year;

select course_number,semester,count(course_number) from section group by semester,course_number;

update student set name="Vidhya" where student_number =9;
insert into section values(100,"MATH2410","Fail",07,"King");
insert into grade_report values(9,100,"A");
select * from grade_report;

#Q9
select s.name,c.course_name,c.course_number,c.credit_hours,sc.semester,sc.year,g.grade
from student s join grade_report g on s.student_number=g.student_number  join section sc on g.section_identifier=sc.section_identifier
join course c on c.course_number=sc.course_number
where class=2; 

#10
#A
insert into student values('Johnson',25,1,'MATH');
select * from student;
#B
update student set class=2 where student_number=17;
#C
insert into course values('Knowledge Engineering','CS4390',3,'CS');
select * from course;
#D
delete from student where name="Smith" and student_number=17;



