


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
