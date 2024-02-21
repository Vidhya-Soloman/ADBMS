#CREATING DATABASE COMPANY

create database company;
use company;
#TABLE 1 JOBS

create table jobs(job_id varchar(50) primary key,job_title varchar(50),
min_salary int,max_salary int);
desc jobs;

#TABLE 2 REGIONS
create table regions(region_id varchar(50) primary key,
region_name varchar(50));
desc regions;

#TABLE 3 COUNTRIES
create table countries(country_id varchar(50) primary key,
country_name varchar(50),region_id varchar(50),
foreign key(region_id)references regions(region_id));
desc countries;

#TABLE 4 LOCATIONS
create table locations(location_id varchar(50) primary key,
street_address varchar(50),postal_code varchar(50),city varchar(50),
state_province varchar(50),country_id varchar(50),
foreign key (country_id)references countries (country_id));
desc locations;

#TABLE 5 DEPARTMENTS
create table departments(department_id varchar(50) primary key,
department_name varchar(50),location_id varchar(50),
foreign key(location_id) references locations(location_id));
desc departments;

#TABLE 6 EMPLOYEES
create table employees(employee_id varchar(50) primary key,
first_name varchar(50),last_name varchar(50),
email varchar(50),phone_number varchar(50),hire_date date,
job_id varchar(50),salary int,
manager_id varchar(50),
department_id varchar(50),
foreign key(job_id)references jobs(job_id),
foreign key(department_id)references departments(department_id));
alter table employees add foreign key(manager_id)references employees(employee_id);
desc employees;

#TABLE 7 DEPENDENTS
create table dependents(dependent_id varchar(50) primary key,
first_name varchar(50),last_name varchar(50),relationship varchar(50),
employee_id varchar(50),foreign key(employee_id) references employees(employee_id));
desc dependents;

#DDL COMMANDS
#QUERY 1
alter table departments rename dept;
desc dept;

#QUERY 2
alter table employees modify salary smallint;
desc employees;

#QUERY 3
alter table employees add commission varchar(50);
desc employees;


#DML COMMANDS
