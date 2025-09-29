
-- Second Problem statements
-- 1
 delimiter //
 create procedure getHigestMarks(out highM int)
 begin
select max(marks) into highM from students; 
 end//
 
 call getHigestMarks(@high);
 select @high as topperStudent;
 -- 2
delimiter //
create procedure lowestMarks(out lowM int)
begin
select min(marks) into lowM from students;
end //

call lowestMarks(@lowMarks);

select @lowMarks as LOW;

--  3
delimiter //
create procedure totalNo(out nStudent int )
begin
select count(*) into nStudent from students ;
end//

call totalNo(@totalM);

select @totalM as totalStudents;

-- 4
create procedure avgMarks(out avgM int )
begin
select avg(marks) into avgM from students;
end//

call avgMarks(@avgM);

select @avgM as averageMarks;

-- 5
delimiter //
 create procedure getCourseName(inout varS varchar(33))
 begin
 declare sid varchar(33) default '';
 set sid = varS;
 select s.course into varS from students s where s.id = sid;
 end //
 
 set @studentid = '1';
 call getCourseName(@studentid);
 
 select @studentid as studentCourseName;

-- (optional) in and out in same function
 delimiter //
 create procedure getInfoStudent(in sid int, out nameS varchar(20), out cname varchar(20))
 begin
 select s.name,s.course into nameS, cname from students s where s.id = sid;
 end //

 call getInfoStudent(2, @nameS, @cname);
 
 select @nameS as name, @cname as courseName;

-- Third problem statements
-- 2
delimiter //
create function getExp(empid int) returns int deterministic
begin 
declare eexp int default 0;
select timestampdiff(year, joindate, curdate()) into eexp from emp where empcode = empid;
-- select concat(eexp) as Experiance;
return eexp;
end // 
select getExp(7900);
drop getExp;

-- 3
delimiter //
create function getDeptName(empid int) returns varchar(20) deterministic
begin
declare deptname varchar(20) default '';
select d.deptname into deptname from emp e 
join dept d on e.deptcode = d.deptcode where e.empcode = empid;
return deptname;
end //
select getDeptName(7839 ) as DeptName;
drop function getDeptName;

-- 5
delimiter //
create function getBonue(empid int) returns int deterministic
begin
declare esal int default 0;
select basicpay into esal from emp where empcode = empid;
if(esal>14000) then
set esal = (esal + esal * 0.1);
else 
set esal = (esal+esal*0.05);
end if;
return esal;
end //
select getBonue(7566);
drop function getBonue;

-- Forth Problem statement
delimiter //
create procedure getGrade()
begin
declare sid int default 0;

declare grade varchar(5) default '';
declare done int default 0;
declare sname varchar(20);
declare smarks int;
declare sgrade varchar(5);

declare c4 cursor for select s.StudentID, s.Name, s.Marks from Students s;
declare continue handler for not found set done = 1;
open c4;
runloop: loop
fetch c4 into  sid, sname, smarks;
if(done=1) then 
leave runloop;
end if;
if(smarks>=80) then
set sgrade = 'A';
elseif(smarks>=60) then
set sgrade = 'B';
elseif(smarks>=40) then
set sgrade = 'C';
else
set sgrade = 'Fail';
end if;
select concat(sid,sname,smarks,sgrade) as Result;
end loop;
close c4;
end //
call getGrade();
drop procedure getGrade;
