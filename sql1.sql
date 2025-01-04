use dbs_lab;

create table sailors(sid int primary key,sname varchar(20),rating decimal(10,2),age int);
create table boats(bid int primary key,bname varchar(20),colour varchar(20));
create table reserves(sid int,bid int,day varchar(20),foreign key(sid) references sailors(sid),foreign key(bid) references boats(bid));

insert into sailors (sid,sname,rating,age) values(111,"s1",3.0,23),(112,"s2",4.0,25),(113,"s3",5.0,26),(114,"s4",6.0,27),(115,"s5",7.0,28);
insert into boats (bid,bname,colour) values(121,"baa","black"),(122,"caa","green"),(123,"daa","red");
insert into reserves values(111,121,"monday"),(111,122,"tuesday");

-- 1)
select distinct(sname) from sailors s , reserves r where s.sid=r.sid ;
-- 2)
select s.sid from sailors s,reserves r,boats b where s.sid=r.sid and r.bid=b.bid and b.colour in ("green","red"); 
-- 3)
select distinct s.sid from sailors s, reserves r where s.sid not in (select r.sid from reserves r);