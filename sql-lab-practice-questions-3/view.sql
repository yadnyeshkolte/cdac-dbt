-- 1
create view employeeAge as (
select e.empcode, e.empname, timestampdiff(year,birthdate,curdate()) as age 
from emp e
);
select * from employeeAge order by age asc;
drop view employeeAge; -- 1

-- 2

create view employeeExp as (
select e.empcode, e.empname, timestampdiff(year,joindate,curdate()) as experience 
from emp e
);
select * from employeeExp order by experience asc;
drop view employeeExp; -- 2

-- 3
create view employeePay as (
select e.empcode, e.empname, s.basic, (s.basic+s.allow-s.deduct) as currentPay
from emp e inner join salary s on e.empcode = s.empcode
where s.salmonth >= all(select salmonth from salary)
);
select * from employeePay;
drop view employeePay; -- 3

-- 4
create view employeeAge as (
select e.empcode, e.empname, timestampdiff(year, e.birthdate, curdate()) as age, e.supcode
from emp e
);

select * from employeeAge;

select a.empcode, a.empname, a.age from employeeAge a
inner join employeeAge s on a.supcode = s.empcode
where a.age > s.age;

drop view employeeAge; -- 4

-- 5 
create view noOfEmployee as (
select d.deptcode, d.deptname, count(e.empcode) as noOfEmp
from dept d left outer join emp e on d.deptcode = e.deptcode
group by d.deptcode
);
select * from noOfEmployee;
drop view noOfEmployee; -- 5

-- 6
create view noOfEmployeeinOrg as (
select count(e.empcode) as noOfEmp
from emp e
);
select * from noOfEmployeeinOrg;
drop view noOfEmployeeinOrg; -- 6

--7
create view noOfEmployee as (
select d.deptcode, d.deptname, count(e.empcode) as noOfEmp
from dept d left outer join emp e on d.deptcode = e.deptcode
group by d.deptcode
);
-- select * from noOfEmployee;
create view noOfEmployeeinOrg as (
select count(e.empcode) as noOfEmp
from emp e
);
-- select * from noOfEmployeeinOrg;

select n.deptcode, n.deptname, (n.noOfEmp/o.noOfEmp*100) as percentageNoOfEmployee
from noOfEmployee n, noOfEmployeeinOrg o;

drop view noOfEmployee;
drop view noOfEmployeeinOrg; -- 7
