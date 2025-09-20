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
-- Given by Claude
SELECT 
    s.empcode AS supervisor_code,
    s.empname AS supervisor_name,
    COUNT(e.empcode) AS number_of_subordinates
FROM emp s
INNER JOIN emp e ON s.empcode = e.supcode
GROUP BY s.empcode, s.empname
Having number_of_subordinates > 1
ORDER BY number_of_subordinates DESC;  -- 27

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

-- 41
create view maxOne as(
select e.empcode, e.empname, max(s.basic+s.allow-s.deduct) as TotalPay
from emp e inner join salary s on e.empcode = s.empcode
where (s.basic+s.allow-s.deduct) >= all(select (s2.basic+s2.allow-s2.deduct) from salary s2)
group by e.empcode, s.empcode);

select e.empcode, e.empname, max(s.basic+s.allow-s.deduct) as TotalPay
from emp e inner join salary s on e.empcode = s.empcode
inner join maxOne m
where e.empcode != m.empcode
group by s.empcode; -- 41

-- 42 
create view empActualSalary(empcode, empname, totalSalary, deptcode) as
(select e.empcode, e.empname, max(s.basic+s.allow-s.deduct), e.deptcode from emp e
inner join salary s on e.empcode = s.empcode
group by s.empcode);

create view deptMax(deptcode, deptname, employeeSalary) as 
(select d.deptcode, d.deptname, max(a.totalsalary) as employeeSalary
from dept d inner join empActualSalary a on d.deptcode = a.deptcode
group by d.deptcode); 

select a.empcode, a.empname, a.totalSalary, d.deptcode, d.deptname from 
empActualSalary a, deptMax d where a.deptcode = d.deptcode 
and a.totalSalary = d.employeeSalary;

drop view empActualSalary;
drop view deptMax; --42

-- 43
create view maxSalaries as (
select e.empcode, e.empname, e.deptcode, max(s.basic+s.allow-s.deduct) as totalPay
from emp e inner join salary s on e.empcode = s.empcode
group by s.empcode
);

with nd2High as (
	select empcode, empname, deptcode, totalPay,
    row_number() over(order by totalpay desc) as indexedTotalPay
    from maxSalaries
)
select a.empcode, a.empname, a.deptcode, a.totalPay 
from nd2High a
where indexedTotalPay = 2; 

drop view maxSalaries; -- 43

-- 44
create view maxSalaries as (
select e.empcode, e.empname, e.deptcode, max(s.basic+s.allow-s.deduct) as totalPay
from emp e inner join salary s on e.empcode = s.empcode
group by s.empcode
);

with th5High as(
	select empcode, empname, deptcode, totalPay,
    row_number() over(order by totalPay desc) as indexedPay
    from maxSalaries
)
select m.empcode, m.empname, m.deptcode, m.totalPay
from th5High m
where indexedPay = 5;

drop view maxSalaries; -- 44





