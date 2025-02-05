create database exam;
use exam;

create table department(dname varchar(30) not null,dnumber int primary key,mgrssn char(9),mgrstartdate date);

create table employee(fname varchar(30) not null,lname varchar(30) not null,ssn char(9) primary key,addrs varchar(100),sex char(1),salary decimal(10,2),superssn char(9),dno int,foreign key(superssn) references employee(ssn),foreign key(dno) references department(dnumber));

alter table department add foreign key(mgrssn) references employee(ssn);

create table project(pno int primary key, pname varchar(30) not null,dnum int,foreign key(dnum) references department(dnumber));

create table works_on(essn char(9),pno int,hours decimal(5,2),primary key(essn,pno),foreign key(essn) references employee(ssn),foreign key(pno) references project(pno));

insert into department (dname,dnumber,mgrstartdate) values ('HR', 1, '2020-01-01'),
('IT', 2, '2020-02-01'),
('Finance', 3, '2020-03-01'),
('Sales', 4, '2020-04-01'),
('R&D', 5, '2020-05-01');

insert into employee values ('John', 'Doe', '111111111', 'Address1', 'M', 95000, NULL, 1),  
('Jane', 'Smith', '222222222', 'Address2', 'F', 60000, '111111111', 1),
('Bob', 'Brown', '333333333', 'Address3', 'M', 70000, '111111111', 2),
('Alice', 'Johnson', '444444444', 'Address4', 'F', 80000, '222222222', 3),
('Charlie', 'Lee', '555555555', 'Address5', 'M', 90000, '333333333', 5);

update department set mgrssn='111111111' where dnumber=1;
UPDATE DEPARTMENT SET MgrSSN = '333333333' WHERE Dnumber = 2;
UPDATE DEPARTMENT SET MgrSSN = '444444444' WHERE Dnumber = 3;
UPDATE DEPARTMENT SET MgrSSN = '555555555' WHERE Dnumber = 5;

INSERT INTO PROJECT (Pno, Pname, Dnum) VALUES
(1, 'ProjectA', 1),
(2, 'ProjectB', 2),
(3, 'ProjectC', 3),
(4, 'ProjectD', 4),
(5, 'ProjectE', 5);

INSERT INTO WORKS_ON (ESSN, Pno, Hours) VALUES
('111111111', 1, 20),
('222222222', 1, 30),
('333333333', 2, 25),
('444444444', 3, 35),
('555555555', 4, 40),
('111111111', 2, 10),
('222222222', 3, 15);

select fname,lname from employee where salary>(select max(salary) from employee where dno=5);

select distinct essn from works_on where pno in(1,2,3);

select pno,sum(hours) as total_hours from works_on group by pno;


-- 6
use exam;

create table employee1(fname varchar(30),lname varchar(30),ssn varchar(9) primary key,addrs varchar(30),sex char(1),salary decimal(10,2),superssn char(9),dno int,foreign key(superssn) references employee1(ssn));

create table department1(dname varchar(30), dnumber int primary key,mgrssn char(9),mgrstartdate date,foreign key(mgrssn) references employee1(ssn));

create table dependent(dname varchar(30),essn char(9),primary key(dname,essn),foreign key(essn) references employee1(ssn));

alter table employee1 add foreign key(dno) references department1(dnumber);

INSERT INTO EMPLOYEE1 (fname, lname, ssn, addrs, sex, salary, superssn,dno)
VALUES 
('John', 'Doe', '111223333', '123 Main St', 'M', 75000.00, NULL,NULL),
('Jane', 'Smith', '222334444', '456 Oak St', 'F', 80000.00, '111223333',NULL),
('Alice', 'Johnson', '333445555', '789 Pine St', 'F', 90000.00, '111223333',NULL),
('Bob', 'Brown', '444556666', '321 Elm St', 'M', 65000.00, '222334444',NULL),
('Charlie', 'Wilson', '555667777', '654 Maple St', 'M', 70000.00, '222334444',NULL);

INSERT INTO DEPARTMENT1 (Dname, Dnumber, MgrSSN, MgrStartDate)
VALUES 
('HR', 1, NULL, '2020-01-01'),
('Tech', 2, NULL, '2021-05-15'),
('Finance', 3, NULL, '2019-03-10'),
('Marketing', 4, NULL, '2022-07-20'),
('R&D', 5, NULL, '2023-02-05');

UPDATE EMPLOYEE1
SET Dno = 1 WHERE SSN = '111223333';
UPDATE EMPLOYEE1
SET Dno = 2 WHERE SSN = '222334444';
UPDATE EMPLOYEE1
SET Dno = 2 WHERE SSN = '333445555';
UPDATE EMPLOYEE1
SET Dno = 3 WHERE SSN = '444556666';
UPDATE EMPLOYEE1
SET Dno = 5 WHERE SSN = '555667777';

UPDATE DEPARTMENT1 SET MgrSSN = '111223333' WHERE Dnumber = 1;
UPDATE DEPARTMENT1 SET MgrSSN = '222334444' WHERE Dnumber = 2;
UPDATE DEPARTMENT1 SET MgrSSN = '444556666' WHERE Dnumber = 3;
UPDATE DEPARTMENT1 SET MgrSSN = '555667777' WHERE Dnumber = 5;

INSERT INTO DEPENDENT (Dname, ESSN)
VALUES 
('Mary', '111223333'),
('Tom', '222334444'),
('Lucy', '222334444'),
('Sam', '444556666'),
('Eva', '555667777');

select d.dname,round(avg(e.salary)) from department1 d join employee1 e on d.dnumber=e.dno group by d.dname;

SELECT DISTINCT E.Fname, E.Lname
FROM EMPLOYEE1 E
JOIN DEPARTMENT1 D ON E.SSN = D.MgrSSN
JOIN DEPENDENT Dep ON D.MgrSSN = Dep.ESSN;

select * from department1 where dname like '%tech%';

-- 1

create table sailors(sid int primary key,sname varchar(30),rating int,age int);
create table boats(bid int primary key,bname varchar(20),colour varchar(20));
create table reserves(sid int ,bid int, day date,primary key(sid,bid,day),foreign key(sid) references sailors(sid),foreign key(bid) references boats(bid));

INSERT INTO SAILORS (Sid, Sname, Rating, Age) VALUES
(1, 'John', 7, 25),
(2, 'Alice', 8, 30),
(3, 'Bob', 5, 22),
(4, 'Charlie', 9, 35),
(5, 'David', 6, 28);
INSERT INTO SAILORS (Sid, Sname, Rating, Age) VALUES(7, 'John', 7, 25);


INSERT INTO BOATS (Bid, Bname, Colour) VALUES
(101, 'Boat1', 'Red'),
(102, 'Boat2', 'Green'),
(103, 'Boat3', 'Blue'),
(104, 'Boat4', 'Red'),
(105, 'Boat5', 'Green');

INSERT INTO RESERVES (Sid, Bid, day) VALUES
(1, 101, '2023-10-01'),
(2, 102, '2023-10-02'),
(3, 103, '2023-10-03'),
(4, 104, '2023-10-04'),
(5, 105, '2023-10-05'),
(1, 102, '2023-10-06'),
(2, 103, '2023-10-07');

select distinct sname from sailors  join reserves on sailors.sid=reserves.sid;

select distinct sid from reserves join boats on reserves.bid=boats.bid where boats.colour='red' or boats.colour='green';

SELECT s.sid
FROM sailors s
LEFT JOIN reserves r ON s.sid = r.sid
WHERE r.sid IS NULL;

-- OR;

select s.sid from sailors s where s.sid not in(select r.sid from reserves r);

-- 3
create table aircraft(aid int primary key,aname varchar(20),crange int);
create table employee2(eid int primary key,ename varchar(30),salary int);
create table certified(empid int,aid int,foreign key(empid) references employee2(eid),foreign key(aid) references aircraft(aid));

insert into aircraft values(1,'Boeing',4000);
 insert into aircraft values(2,'Boeing',2500);
insert into aircraft values(3,'Blackbeard',6000);
 insert into aircraft values(4,'Supermarine',8000);
 insert into aircraft values(5,'Lockheed',2100);
 
  insert into employee2 values(1,'Johnny',40000);
 insert into employee2 values(2,'Timmy',60000);
 insert into employee2 values(3,'Lawrence',70000);
 insert into employee2 values(4,'Zuzu',90000);
 insert into employee2 values(5,'Matt',80000);
 
  insert into certified values(1,1);
 insert into certified values(1,2);
 insert into certified values(3,4);
 insert into certified values(4,4);
 insert into certified values(5,5);
 insert into certified values(2,2);
 insert into certified values(4,3);
 insert into certified values(3,3);
 insert into certified values(4,5);

select eid from employee2 where salary=(select max(salary) from employee2);

SELECT a.aname
FROM aircraft a
WHERE NOT EXISTS (
    SELECT *
    FROM certified c
    JOIN employee2 e ON c.empid = e.eid
    WHERE c.aid = a.aid AND e.salary <= 50000
);

select ename from employee2 left join certified on employee2.eid=certified.empid where certified.empid is null;

-- 4

 CREATE TABLE SUPPLIER
 (
 Sid int PRIMARY KEY,
 Sname varchar(16) ,
 Address varchar(20) 
 );
 
 CREATE TABLE PART
 (
 Pid int PRIMARY KEY,
 Pname varchar(18),
 Color varchar(10)
 );
 
  CREATE TABLE SHIPMENT
 (
 Sid int,
 Pid int,
 Cost int,
 primary key(Sid,Pid),
 foreign key(Sid) references SUPPLIER(Sid),
 foreign key(Pid) references PART(Pid));
 
  INSERT INTO SUPPLIER VALUES (1, 'Smith', 'London');
 INSERT INTO SUPPLIER VALUES (2, 'Jones', 'Paris');
 INSERT INTO SUPPLIER VALUES (3, 'Blake', 'Paris');
 INSERT INTO SUPPLIER VALUES (4, 'Clark', 'London');
 INSERT INTO SUPPLIER VALUES (5, 'Adams', 'Athens');
 
  INSERT INTO PART VALUES (1, 'Nut', 'Red');
 INSERT INTO PART VALUES (2, 'Bolt', 'Green');
 INSERT INTO PART VALUES (3, 'Screw', 'Blue');
 INSERT INTO PART VALUES (4, 'Screw', 'Red');
 INSERT INTO PART VALUES (5, 'Cam', 'Blue');
 INSERT INTO PART VALUES (6, 'Cog', 'Red');
 
  INSERT INTO SHIPMENT VALUES (1, 1, 300);
 INSERT INTO SHIPMENT VALUES (1, 2, 200);
 INSERT INTO SHIPMENT VALUES (1, 3, 400);
 INSERT INTO SHIPMENT VALUES (1, 4, 200);
 INSERT INTO SHIPMENT VALUES (1, 5, 100);
 INSERT INTO SHIPMENT VALUES (1, 6, 100);
 INSERT INTO SHIPMENT VALUES (2, 1, 300);
 INSERT INTO SHIPMENT VALUES (2, 2, 400);
 INSERT INTO SHIPMENT VALUES (3, 2, 200);
 INSERT INTO SHIPMENT VALUES (4, 2, 200);
 INSERT INTO SHIPMENT VALUES (4, 4, 300);
 INSERT INTO SHIPMENT VALUES (4, 5, 400);
 
 select s.sid from supplier s ,shipment s1,part p where s.sid=s1.sid and s1.pid=p.pid and p.color='green';

select s.sname,count(*) as total_parts from supplier s,part p,shipment s1 where s.sid=s1.sid and p.pid=s1.pid group by s.sname;

update part set color='yello' where pid in (select s1.pid from supplier s,shipment s1 where s.sid=s1.sid  and s1.sid=3);

-- 5

select distinct ename from employee2,certified,aircraft where employee2.eid=certified.empid and certified.aid=aircraft.aid and aircraft.aname='boeing';

select aid from aircraft order by crange asc;

select distinct(ename) from employee2 E,certified C, aircraft A where A.crange > 3000 and C.aid 
NOT in(select aid from aircraft A where A.aname='Boeing') and E.eid = C.empid ;

-- 7

 create table PERSON (
 Did VARCHAR(10) PRIMARY KEY,
 Pname VARCHAR(10),
 Address VARCHAR(60));
 
  create table CAR (
 Regno VARCHAR(10) PRIMARY KEY,
 Model VARCHAR(20),
 Year INT);
 
  create table ACCIDENT (
 Repno INT PRIMARY KEY,
 Date DATE,
 Loc VARCHAR(20));
 
  create table OWNS (
 Odid  VARCHAR(10),
 Oregno VARCHAR(10),
 Primary Key(Odid,Oregno),
 Foreign key(Odid) references PERSON(Did) ,
 Foreign key(Oregno) references CAR(Regno) );
 
 create table PARTICIPATED (
 Pdid VARCHAR(10),
 Pregno VARCHAR(10),
 Prepno INT,
 Damage INT,
 Primary key(Pdid, Pregno, Prepno),
 Foreign key (Pdid) references PERSON(Did) , 
Foreign key (Pregno) references CAR(Regno),
 Foreign key(Prepno) references ACCIDENT(Repno) );
 
  insert into PERSON values('1','Steve','Frankfurt');
 insert into PERSON values('2','Dustin','Perryridge');
 insert into PERSON values('3','Mike','Brooklyn');
 insert into PERSON values('4','Lucas','Perryridge ');
 insert into PERSON values('5','John',' Brooklyn ');
 insert into PERSON values('6','Antony','Hellington');
 insert into CAR values('KA04','BMW',2000);
 insert into CAR values('KA05','Ford',2002);
 insert into CAR values('KA03','Maruthi',1999);
 insert into CAR values('KA02','Tata',2002);
 insert into CAR values('KA01', 'Audi',2003);
 insert into CAR values('KA08', 'Maruthi',2003);
 insert into CAR values('KA06', 'Maruthi',2003);
 insert into CAR values('KA07', 'BMW',2003);
 insert into ACCIDENT values(12,'2001-05-01','Frankfurt');
insert into ACCIDENT values(25,'2002-06-02','Brooklyn');
 insert into ACCIDENT values(512,'2000-03-08',' Brooklyn');
 insert into ACCIDENT values(1024,'2002-10-25','AvenueRoad');
 insert into ACCIDENT values(1000,'2003-12-23','RichmondCircle');
 insert into ACCIDENT values(1,'2004-12-25','ParkStreet');
 insert into OWNS values('1', 'KA04');
 insert into OWNS values('1', 'KA06');
 insert into OWNS values('2', 'KA07');
 insert into OWNS values('2', 'KA05');
 insert into OWNS values('3', 'KA03');
 insert into OWNS values('4', 'KA02');
 insert into OWNS values('5', 'KA01');
 insert into OWNS values('6', 'KA08');
 insert  into PARTICIPATED values('1', 'KA04',12,1000);
 insert  into PARTICIPATED values('1', 'KA06',25,1500);
 insert  into PARTICIPATED values('2', 'KA05',512,1500);
 insert  into PARTICIPATED values('2', 'KA05',1024,2500);
 insert  into PARTICIPATED values('3', 'KA03',1000,1700);
 insert  into PARTICIPATED values('4', 'KA02',1,100);
 
Select distinct (Pregno) 
from PARTICIPATED;

Select  Pregno,Model 
from CAR, PARTICIPATED 
where Pregno=Regno and Damage in (select max(Damage) from PARTICIPATED);

Select  Odid,count(*) as no_of_cars
 from OWNS
 group by Odid;
 
 -- check 8,9,10 and mongodb and vivassss
