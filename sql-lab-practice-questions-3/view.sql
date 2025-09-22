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
