-- create database
create database practice;

-- add comment to the database
comment on database practice is 'This database is created for practice data analytics related query';

-- rename database name 
alter database practice rename to practice_data_analytics; -- it works only on disconnected database

--delete database
drop database if exists practice;