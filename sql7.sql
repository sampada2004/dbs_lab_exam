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
 Foreign key(Odid) references PERSON(Did) on delete cascade,
 Foreign key(Oregno) references CAR(Regno) on delete cascade);
 create table PARTICIPATED (
 Pdid VARCHAR(10),
 Pregno VARCHAR(10),
 Prepno INT,
 Damage INT,
 Primary key(Pdid, Pregno, Prepno),
 Foreign key (Pdid) references PERSON(Did) on delete cascade, 
Foreign key (Pregno) references CAR(Regno) on delete cascade,
 Foreign key(Prepno) references ACCIDENT(Repno) on delete cascade);

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
 
 insert into ACCIDENT values(12,'2001-06-01','Frankfurt');
insert into ACCIDENT values(25,'2002-07-02','Brooklyn');
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
 
 
 -- 1)
Select distinct (Pregno) 
from PARTICIPATED; 
 -- 2)
 Select  Pregno,Model 
from CAR, PARTICIPATED 
where Pregno=Regno and Damage in (select max(Damage) from PARTICIPATED);
 
 -- 3)
 
 Select  Odid,count(*) as no_of_cars
 from OWNS
 group by Odid;
 
 -- 
KA02
KA04
KA06
KA05
KA03
 
-- 

KA05	Ford

--

1	2
2	2
3	1
4	1
5	1
6	1
