create table employee(fname varchar(20),lname varchar(20),ssn int primary key,addrs varchar(20),sex char,salary int,superssn int,dno int);
create table department(dname varchar(20),dnumber int primary key,mgrssn int,mgrstartdate date);
create table project(pno int primary key,pname varchar(20),dnum int);
create table works_on(essn int,pno int ,hours int,foreign key(essn) references employee(ssn),foreign key(pno)references project(pno));

-- Insert data into EMPLOYEE table
INSERT INTO EMPLOYEE (fname, lname, ssn, addrs, sex, salary, superssn, dno)
VALUES ('Jane', 'Smith', 987654320, '5678 Oak St', 'F', 90000, 123456789, 2),
('John', 'Doe', 123456789, '1234 Elm St', 'M', 55000, NULL, 1),
('Jane', 'Smith', 987654321, '5678 Oak St', 'F', 60000, 123456789, 2),
('Alice', 'Brown', 112233445, '2345 Pine St', 'F', 45000, 123456789, 3),
('Bob', 'Johnson', 223344556, '6789 Maple St', 'M', 70000, 987654321, 5),
('Charlie', 'Davis', 334455667, '1357 Birch St', 'M', 80000, 987654321, 5);

-- Insert data into DEPARTMENT table
INSERT INTO DEPARTMENT (dname, dnumber, mgrssn, mgrstartdate)
VALUES
('HR', 1, 123456789, '2010-06-15'),
('IT', 2, 987654321, '2012-03-10'),
('Sales', 3, 112233445, '2014-11-01'),
('Marketing', 4, 223344556, '2015-07-22'),
('Finance', 5, 334455667, '2018-01-30');

-- Insert data into PROJECT table
INSERT INTO PROJECT (pno, pname, dnum)
VALUES
(1, 'CO1', 2),
(2, 'CO2', 3),
(3, 'CO3', 5),
(4, 'CO4', 4),
(5, 'CO5', 1);

-- Insert data into WORKS_ON table
INSERT INTO WORKS_ON (essn, pno, hours)
VALUES(123456789,1,10),
(123456789, 1, 40),
(987654321, 2, 35),
(112233445, 3, 45),
(223344556, 4, 30),
(334455667, 5, 50);

-- 1)
select fname,lname from employee  where salary>all(select salary from employee where  dno=5);
-- 2)
select essn from works_on where pno in (1,2,3);
-- 3)
select sum(hours),pno from works_on group by pno;

#answers
1)Jane	Smith
2)123456789
  123456789
  987654321
  112233445
3)50	1
  35	2
  45	3
  30	4
  50	5
