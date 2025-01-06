create table PLAYER (
 Pid int, 
Lname varchar(10), 
Fname varchar(10), 
Country varchar(10), 
Yborn date, 
Bplace varchar(10),
 primary key (Pid)
 );
 create table MATCHING (
 MatchID int, 
Team1 varchar(10),
 Team2 varchar(10), 
Ground varchar(10), 
Date date, 
Winner varchar(10),
 primary key(MatchID)
 );
 create table BATTING (
 MatchID int, 
Pid int, 
Nruns int, 
Fours int, 
Sixes int,
 primary key(MatchID,Pid),foreign key(MatchID) references MATCHING(MatchID),foreign 
key(Pid) references PLAYER(Pid)
 );
 create table BOWLING (
 MatchID int, 
Pid int, 
Novers int, 
Maidens varchar(10), 
Nruns int, 
Nwickets int,
 primary key(MatchID,Pid),foreign key(MatchID) references MATCHING(MatchID),foreign 
key(Pid) references PLAYER(Pid)
 );
 
 
 insert into PLAYER values("1","aa","Dhoni","india","1988-01-01","chennai");
 insert into MATCHING values("12","Australia","D2","china","2012-01-01","india");
 insert into BATTING values("12",1,20,4,4);
 insert into BOWLING values("12",1,12,"cc",20,2);
 
 -- 1)
 SELECT Ground 
FROM MATCHING
 WHERE Team1='Australia' 
ORDER BY Ground;

-- 2)
sELECT *
 FROM (PLAYER natural join MATCHING) natural join BATTING 
WHERE Fname='Dhoni';

-- 3)

 SELECT Fname,Lname 
FROM (PLAYER natural join MATCHING) natural join BATTING 
WHERE MatchID=2689;

-- china

-- 1	12	aa	Dhoni	india	1988-01-01	chennai	Australia

-- 