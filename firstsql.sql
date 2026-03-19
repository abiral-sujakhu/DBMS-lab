show databases;


use my_database;



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

insert into student values(101,"ram","bkt",3.6,"2056-01-12",'m',"active");
insert into student values(102,"sita","ktm",3.8,"2062-01-02",'f',"active");

select * from student;

delete from student where fullname='shyam';

select * from student where cgpa>3.7;

update student set fullname="shova" where fullname="sita";

show tables;
drop tables student;

drop database my_database;