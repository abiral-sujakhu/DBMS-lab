-- 1)create database named college_mgmt
create database COLLEGE_MGMT;
use COLLEGE_MGMT;
-- 2)create table student
create table student(
crn integer(2),
fullname varchar(30),
address varchar(20),
cgpa float(2,1),
dob date,
gender enum('m','f'),
status enum("active","inactive")
);

desc student;

-- 3)write SQL command to insert the records into 'student'
insert into student values(1001,"Laxman Shrestha","Pokhara",3.4,"2052-02-04",'m',"active"),
							(1002,"Gita Sharma","Kathmandu",3.2,"2049-03-07",'f',"active"),
                            (1003,"Sita Baraili","Pokhara",2.5,"2051-10-29",'f',"inactive"),
                            (1004,"Dipendra Shahi","Kailali",3.1,"2053-09-27",'m',"active"),
                            (1005,"Hari Dhakal","Makwanpur",2.2,"2053-07-20",'m',"inactive");
  
  -- 4) display all records from table                          
select * from student;

--  5) display fullname and address of students from pokhara
select fullname,address from student where address="Pokhara";

-- 6)list all male students who are active  
select * from student where gender='m' and status='active';

-- 7) list allthe students who have secured CGPA greater than 3.0
select * from student where cgpa>3.0;

-- 8) update the address to 'bhaktapur' of student with crn 1001
update student set address="bhaktapur" where crn=1001;

-- 9) update the status of student who have secured cgpa greater than 3.0 to active 
update student set status="active" where cgpa>3.0;

-- 10)add column email
alter table student add email varchar(10); 

-- 11) rename address column to district
alter table student 
change column address district varchar(30);

-- 12) rename'student' table into 'student-info'
rename table student to student_info; 

-- 13) remove the district column from above table 
alter table student_info
drop column district ;
select * from student_info;

 -- 14) delete record of student with crn 1005
 delete from student_info where crn=1005;
 
 -- 15)delete records of inactive students
 delete from student_info where status="inactive";
 
-- 16)delete all records from student table 
truncate student_info;

-- 17)delete the student table
drop table student_info; 
 
-- 18) delete the database college_mgmt
drop database COLLEGE_MGMT; 