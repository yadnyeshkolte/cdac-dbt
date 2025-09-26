-- getting the student name by student id
 drop procedure getStudentName;
 delimiter //
 create procedure getStudentName()
 begin 
 declare sid int;
 declare sname varchar(20);
 declare cname varchar(20);
 declare smarks int;
 declare done int default 0;
 
 declare c cursor for select id, name, course, marks from students ;
 declare continue handler for not found set done = 1;
 
 open c;
 readStudent:loop
 fetch c into sid, sname, cname, smarks;
 if done = 1 then 
 leave readStudent;
 end if;
 
 select sid, sname, cname, smarks as cStudents;
 end loop;
 close c;
 end //
 
 call getStudentName();
 
 delimiter //
 drop procedure getStudentName;
