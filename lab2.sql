create database employee_mgmt;
use employee_mgmt;
create table employee(
empno int(2) ,
empname varchar(30),
designation varchar(20),
departid int(2),
licenseno varchar(20),
gender enum('m','f'),
salary int(2)
);
desc employee;

insert into employee values(5004,"Sameer Sharma","Officer",301,"323-525",'m',38000),
							(5010,"Rakshya Acharya","Manager",303,"987-321",'f',45000),
                            (5005,"Krishna Devkota","Officer",301,"547-685",'m',38000),
                            (5009,"Ram Yadav","Salesperson",304,"342-154",'m',35000),
                            (5003,"Sunita Chaudhary","Salesperson",305,"241-654",'f',35000);
                            

select * from employee;

create table department(
did int(2) ,
departname varchar(30),
departcode varchar(20),
email varchar(20)
);
insert into department values(301,"Information Technology","IT","it@ourmail.com"),
							(302,"Human Resource","HR","hr@ourmail.com"),
                            (303,"Finance","FI","fi@ourmail.com"),
                            (304,"Marketing","MK","mk@ourmail.com"),
                            (305,"Sales","SL","sl@ourmail.com");
select * from department;
-- (2) 
alter table employee add primary key(empno);
alter table department add primary key(did);

alter table employee add constraint depart_FK foreign key (departid) references department(did) on delete cascade on update cascade; 
alter table employee drop foreign key depart_FK;

ALTER TABLE employee MODIFY licenseno varchar(20) NOT NULL;
alter table employee add constraint unq_license unique (licenseno);

ALTER TABLE department MODIFY departcode varchar(20) NOT NULL;
alter table department add constraint unq_departcode unique  (departcode);

-- (3)
alter table employee add constraint emp_salary check(salary>15000); 

-- (4)
alter table employee alter departid set default 302;

-- (5)
insert into department values(306,"Account","AC","ac@ourmail.com");
select * from department;
-- (6)
insert into employee values(5011,"Abiral Sujakhu","Accountant",306,"123-522",'m',30000);
select * from employee;

-- (7)
update employee set departid = 306 where empno=5010;

-- (8)
 alter table employee add constraint depart_FK foreign key (departid) references department(did) on delete cascade on update cascade; 
 update department set did=308 where did=306;
 select * from department;
 select * from employee;
  
  -- (9)
  select empno,empname,departid,salary from employee;
  
-- (10)
delete from department where departname="Account";
select * from employee; 

-- (11)
-- a) Create SALESMAN table
CREATE TABLE salesman(
    s_id INT(3),
    name VARCHAR(30),
    city VARCHAR(30),
    email VARCHAR(40)
);

-- b) Create CUSTOMER table
CREATE TABLE customer(
    c_id INT(3),
    name VARCHAR(30),
    city VARCHAR(30),
    contact VARCHAR(15)
);

-- c) Create ORDERS table
CREATE TABLE orders(
    ord_no INT(4),
    prch_amt DECIMAL(10,2),
    ord_date DATE,
    c_id INT(3),
    s_id INT(3)
);

-- Add PRIMARY KEY constraints (like you did for employee/department)
ALTER TABLE salesman ADD PRIMARY KEY (s_id);
ALTER TABLE customer ADD PRIMARY KEY (c_id);
ALTER TABLE orders   ADD PRIMARY KEY (ord_no);

-- Add extra constraints (optional but good practice)
ALTER TABLE salesman MODIFY email VARCHAR(40) UNIQUE;
ALTER TABLE customer MODIFY contact VARCHAR(15) UNIQUE;
ALTER TABLE orders ADD CONSTRAINT chk_prch_amt CHECK (prch_amt > 0);

-- Now, correlate the 3 tables using FOREIGN KEYS (same style as depart_FK)

-- Orders.c_id → Customer.c_id
ALTER TABLE orders
ADD CONSTRAINT orders_cust_FK
FOREIGN KEY (c_id) REFERENCES customer(c_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Orders.s_id → Salesman.s_id
ALTER TABLE orders
ADD CONSTRAINT orders_sales_FK
FOREIGN KEY (s_id) REFERENCES salesman(s_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

 