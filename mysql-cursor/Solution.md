### Q 1
```sql
delimiter //
-- drop procedure printEmp;
create procedure printEmp()
begin
declare ename varchar(20);
declare done int default 0;

declare c1 cursor for select emp_name from employees;
declare continue handler for not found set done = 1;
create temporary table if not exists temp_name(name varchar(20));
open c1;
readName : loop
fetch c1 into ename;
if(done = 1) then
leave readName;
end if;
insert into temp_name value(ename);
end loop;
close c1;
select * from temp_name;
drop table if exists temp_name;
end //

call printEmp();
```
### Q 2 
```sql
delimiter //
create procedure totalSalary()
begin
declare totalSalary float default 0;
declare esalary float;
declare done int default 0;

declare c2 cursor for select salary from employees;
declare continue handler for not found set done = 1;

open c2;
readSalary : loop
fetch c2 into esalary;
if(done = 1) then
leave readSalary;
end if;
set totalSalary = totalSalary+esalary;
end loop;
close c2;
select totalSalary as Total;
end //

call totalSalary();
```

### Q 3
```sql
drop procedure increaseSalary;
delimiter //
create procedure increaseSalary()
begin
declare esalary float;
declare ename varchar(33);
declare done int default 0;

declare c1 cursor for select emp_name,salary from employees;
declare continue handler for not found set done = 1;

open c1;
reademp : loop
fetch c1 into ename, esalary;
if (done = 1) then 
leave reademp;
end if;
if (esalary < 4000) then 
set esalary = esalary + esalary*0.2; 
end if;
select ename,esalary;
end loop;
close c1;
end//

call increaseSalary();
```
