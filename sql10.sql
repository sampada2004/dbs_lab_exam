use dbs_lab;
create table customer(custid int primary key,cname varchar(30),city varchar(30));
create table order1(oid int primary key,custid int,ord_amt int,foreign key(custid) references customer(custid));
create table items(itemid int primary key,unit_price int );
create table order_item(oid int,itemid int,primary key(oid,itemid),qty int,foreign key(itemid) references items(itemid),foreign key(oid) references order1(oid));
create table shipment(oid int primary key,ship_date date);

alter table order1 add column odate date;

Insert into CUSTOMER values (1,'Archie','Bangalore');
 Insert into CUSTOMER values (2,'Veronica','Bangalore');
 Insert into CUSTOMER values (3,'Betty','Mysore');
 Insert into CUSTOMER values (4,'Jughead','Bangalore');
 Insert into CUSTOMER values (5,'Cheryl','Mysore');
 Insert into CUSTOMER values (6,'Jason','Mangalore');
 
 Insert into ORDER1 values (1, 1,1000,'2016-06-01');
 Insert into ORDER1 values (2,1,2000, '2016-06-03');
 Insert into ORDER1 values (3, 3,3000,'2016-06-03');
 Insert into ORDER1 values (4,4,4000, '2016-06-05');
 Insert into ORDER1 values (5, 5,5000,'2017-06-05');
 
  Insert into ITEMs values(1,100);
 Insert into ITEMs values(2,200);
 Insert into ITEMs values(3,300);
 Insert into ITEMs values(4,400);
Insert into ITEMs values(10,500);

Insert into ORDER_ITEM values(1,1,2);
 Insert into ORDER_ITEM values(1,2,1);
 Insert into ORDER_ITEM values(2,3,2);
 Insert into ORDER_ITEM values(3,4,3);
 Insert into ORDER_ITEM values(4,3,1);
 Insert into ORDER_ITEM values(5,2,1);
 
  Insert into SHIPMENT values(1,'2016-06-03');
 Insert into SHIPMENT values(2,'2016-06-03');
 Insert into SHIPMENT values(3,'2016-06-05');
 Insert into SHIPMENT values(4,'2016-06-05');
 Insert into SHIPMENT values(5,'2016-06-06');
 
 -- 1)
 select c.cname,count(o.custid) from customer c,order1 o where c.custid=o.custid and c.city="Bangalore" group by c.cname;
 
 -- 2)
 select c.cname,count(*) from customer c,order1 o where c.custid=o.custid group by c.cname having count(*)>=2;
 
 -- 3)
Select distinct(Cname) 
from ORDER1 o,CUSTOMER c,ORDER_ITEM oi
where  o.Oid=oi.oid and c.custid=o.custid and oi.oid!=10;

-- 1)Archie	2
-- Jughead	1

-- 2)Archie	2

-- 3)Archie
 --   Betty
  --  Jughead
  --  Cheryl


-- 4)
select c.cname from customer c where(select count(o.oid) from order1 o where o.custid=c.custid )>=2;

-- 5)
select odate,sum(ord_amt) from order1 group by odate;

-- 6)
Select * 
from CUSTOMER c,ORDER1 o 
where c.custid=o.custid and ord_amt in(select max(ord_amt) from ORDER1);

-- Archie

-- 2016-06-01	1000
--2016-06-03	5000
--2016-06-05	4000
--2017-06-05	5000

-- 5	Cheryl	Mysore	5	5	5000	2017-06-05
