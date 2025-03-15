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







