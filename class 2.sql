--Assignment 
create table student(
student_id serial primary key,
first_name text not null,
last_name text not null,
email text unique not null,
date_of_birth date not null,
gender text check(gender IN ('Male', 'Female', 'Other')),
phonr_number integer unique,
enrollment_date timestamp default current_timestamp,
gpa numeric(3,2) check(gpa between 0 and 4),
status text check (status IN ('Active', 'Graduated', 'Dropped Out'))
);


select * from student




-- Creating table
create table employee (
employee_id serial primary key,
first_name text not null,
last_name text not null,
email text unique not null,
age integer check(age>18),
salary numeric(10,2) check(salary>0),
department text default 'General',
hire_date date default current_date

);

select * from employee






--insert data
insert into student(
first_name,
last_name,
email,
date_of_birth,
gender,
phonr_number,
gap,
status
)
values
('Rohanur','Rahman','rohanurrahmanontu@outlook.com','2002-05-25','Male','0190487178',3.5,'Active'),
('Shohnur','Rahman','shohanxyz@gmail.com','2002-03-25','Male','0190487668',3.5,'Active');

select student_id,email from student


--to see current time
select now()

--use double pipe to concatinate the strings.
select first_name || ' ' || last_name  as full_name from student;
