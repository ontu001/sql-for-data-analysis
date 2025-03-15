select * from student

--to rename any column
alter table student rename column gap to gpa

 --To change data type just use : or cast after the coloumn name and set the new type
 select '123' :: integer;
 select cast('123' as integer);
 select '2025-03-14' :: date;


--change data type of gpa column from student table

select
  first_name
 ,last_name
 ,gpa :: decimal(5,2) ----change tyope from numeric to decimal
 ,gpa :: integer --change type from numeric to integer
 ,gpa :: text -- change type from numeric to text
from
 student;



---------ORDER BY ----- It use to sort data
select 
	*
from
	student
order by
	student_id asc, -- to sort the data in decendinbg order based on the student_id column
	first_name desc; -- to sort the data in acendinbg order based on the first_name column



--To find the character legth of ny string -- LENGTH()
select
	first_name
	,length(first_name) as first_name_len --here 'AS' is aliases that are used to give a table, or a column in a table, a temporary name.
from 
	student
order by
	first_name_len  asc;



-------DISTINCT----- To find the uniqie value
select 
	distinct first_name
from
	student;




--To find highest gpa and the gpa holder
select
	first_name,
	last_name,
	gpa
from
	student
order by
	gpa desc
limit
	1;




--- OFFSET --- To filter limit / to skip any row from limit
--here limit is 3 but top one is skipped, data shows from the 2nd row

select
	first_name,
	last_name,
	gpa
from
	student
order by
	gpa desc
limit
	3
offset
	1;





--- WHERE ---- To filter data
select
	*
from
	student
where
	status = 'Inactive' and gpa>3.2;







--- IN , NOT IN --- to filter data from your specified condition
select * from student where gender in ('Male','Others');
select * from student where gender not in ('Male','Others');




--BETWEEN-- To filter data between a range/condition

select * from student where gpa between 3 and 3.5;



--LIKE -- to filter data based on similarities/guess
select * from student where first_name like 'R%'; -- '%' means anything after R
select * from student where first_name like '_o%'; -- '_' means single character before o



---- COALESCE ---- To handle null value
select first_name, last_name , coalesce(gpa,3.3) from student; -- it replace the null value into 3.3




-- AGGERAGATED FUNCTION ---
select
	avg(coalesce(gpa,3.5)) -- find avegrage with null handle
from
	student;



select
	avg(gpa) 
from
	student
where
	gpa is not null; -- find avegrage without null



select
	max(coalesce(gpa,3.5))-- find max with null handle
from
	student;



select
	min(coalesce(gpa,3.5))-- find min with null handle
from
	student;



-- GROUP BY -- To perform aggregated function based on category
select
	gender,
	count(*) as count_person,
	round(avg(gpa),2) as avg_gpa,
	round(max(gpa),2) as max_gpa,
	round(min(gpa),2) as min_gpa
from
	student
group by
	gender
order by
	count_person desc;


