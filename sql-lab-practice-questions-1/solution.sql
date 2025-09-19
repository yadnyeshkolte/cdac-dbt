use dac_dbt_2025;
select empname, empcode, desigcode from emp; -- 1
select deptname, budget from dept; -- 2

select e.empcode, e.empname, d.deptname from emp e 
inner join dept d on d.deptcode = e.deptcode; -- 3

 select * from emp where supcode is Null; -- 4
 
 select * from emp e where e.empcode < (select en.empcode from emp en where supcode is Null); -- 5
 
 select * from emp e where e.joindate <= all(select joindate from emp); -- 6
 
 select *, timestampdiff(year, e.birthdate, curdate()) as age from emp e 
 where timestampdiff(year, e.birthdate, curdate()) between 55 and 60; -- 7
 
select d.deptname, e.empname from emp e 
inner join dept d on d.deptcode = e.deptcode 
inner join desig c on c.desigcode = e.desigcode 
where c.designame = 'Manager' order by d.deptname asc; -- 8

select count(*) from emp e inner join dept d on e.deptcode = d.deptcode 
where d.deptname in ('Accounts','Personal','Purchase'); -- 9

select * from emp e inner join dept d on e.deptcode = d.deptcode 
where d.deptname in ('Accounts','Personal'); -- 10 


select * from emp e inner join dept d on e.deptcode = d.deptcode 
where d.deptcode = 'Accounts' and 'Personal'; -- 11

select * from emp e inner join dept d on e.deptcode = d.deptcode 
where d.deptname = 'Accounts' and d.deptname != 'Personal'; -- 12

select * from emp e where e.birthdate >= all(select birthdate from emp); -- 13

select * from emp e where basicpay != 12400; -- 14

select * from emp e where e.basicpay between 11000 and 12000; -- 15

select * from emp e where e.basicpay not between 11000 and 12000; -- 16

select * from emp e inner join salary s on e.empcode = s.empcode 
where s.allow between 999 and 1500 and salmonth 
between '2011-12-31' and '2012-01-31'; -- 17

select * from emp e where e.empname like '%y' or e.empname like '%i'; -- 18;


select * from emp e where curdate()-e.joindate >=25; -- 19


select * from emp e inner join desig d on e.desigcode = d.desigcode 
where d.designame = 'Sales Man' and 
timestampdiff(year, e.joindate, curdate()) between 20 and 30; -- 20 emptyset


select e.empcode, e.empname, timestampdiff(year,e.birthdate, curdate()) as age 
from emp e order by e.birthdate asc; -- 24

select * from emp e inner join dept d on e.deptcode = d.deptcode 
where deptname = 'Accounts'; -- 25

select * from emp e where e.supcode = (select en.empcode from emp en where en.empname = 'Reddy'); -- 26

-- 21 22 27

select e.empcode, e.empname, s.salmonth, (s.basic+s.allow-s.deduct) 
as takeHomePay from emp e join (select * from salary where (empcode, salmonth) in (select empcode, max(salmonth) 
from salary group by empcode)) s on e.empcode = s.empcode; -- 23




-- check
select s.empcode as supervisorCode,
s.empname as supervisorName,
(select count(*) as countN from emp en where en.supcode = s.empcode group by s.empcode having countN>=1) as countName
from emp s
where s.empcode in (select supcode from emp where supcode is not null)
order by countName asc; -- 27





select e.empname as EmployeeName, s.empname as SupervisorName 
from emp e inner join emp s where s.empcode = e.supcode; -- 30



select e.empcode, e.empname from emp e where e.empcode not in (select h.empcode from history h); -- 32


select e.empcode, e.empname, count(h.changedate) as noOfPromotions
from emp e join history h
on e.empcode = h.empcode 
group by h.empcode
having noOfPromotions >= all (select count(*) from history group by empcode); -- 33


select e.empcode, e.empname, h.changedate
from emp e join history h
on e.empcode = h.empcode 
where h.changedate between '1991-01-01' and '1991-12-31';
-- where h.changedate like '1991%'; -- 34

select d.deptcode, d.deptname, d.budget, sum(e.basicpay)
from dept d
left outer join emp e
on e.deptcode = d.deptcode
group by d.deptcode; -- 35

select d.deptcode, d.deptname, d.budget, sum(s.basic + s.allow - s.deduct) as TotalPay
from dept d
left outer join emp e
on e.deptcode = d.deptcode
left outer join salary s 
on s.empcode = e.empcode
group by d.deptcode, d.deptname, d.budget; -- 35

select upper(e.empname) from emp e; -- 36
-- select lower(e.empname) from emp e;



select * from emp e  -- 37
 where e.basicpay > (select en.basicpay from emp en where en.empname='Jain');

select * from emp e  -- 38
where e.basicpay between 11000 and 12000; 

select * from emp e  -- 39
where e.basicpay > (select avg(en.basicpay) from emp en)
order by e.basicpay;

select e.empcode, e.empname, max(s.basic+s.allow-s.deduct) as TotalPay
from emp e inner join salary s on e.empcode = s.empcode
where (s.basic+s.allow-s.deduct) >= all(select (s2.basic+s2.allow-s2.deduct) from salary s2)
group by e.empcode, s.empcode;  -- 40

select e.empcode, e.empname, max(s.basic+s.allow-s.deduct) as TotalPay
from emp e inner join salary s on e.empcode = s.empcode
where (s.basic+s.allow-s.deduct) != ((s.basic+s.allow-s.deduct) <= all(select (s2.basic+s2.allow-s2.deduct) from salary s2))
group by e.empcode, s.empcode;  -- 41


select e.empcode, e.empname, d.deptcode, d.deptname, max(s.basic+s.allow-s.deduct) as TotalPay
from dept d 
left outer join emp e on e.deptcode = d.deptcode
inner join salary s on e.empcode = s.empcode
where (s.basic+s.allow-s.deduct) >= all(select (s1.basic+s1.allow-s1.deduct) from salary s1)
group by d.deptcode, s.empcode; -- 42


