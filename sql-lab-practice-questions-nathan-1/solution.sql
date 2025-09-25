-- 1
delimiter //
create procedure addTwoNumber(in a int, in b int)
begin
declare c int default 0;
set c = a + b;
select concat('Addition of ',a,' and ',b,' is ',c) as Addition;
end //

call addTwoNumber(2,7);

delimiter //
drop procedure addTwoNumber;

-- 2
delimiter //
create procedure oddOREven(in number int)
begin
declare c varchar(20) default '';
if(number%2 = 0) then
select concat(number,' is an even number') as Number;
else
select concat(number, ' is an odd number') as Number;
end if;
end //

set @setNumber = 9;
call oddOREven(@setNumber);

delimiter //
drop procedure oddOREven;

-- 3
