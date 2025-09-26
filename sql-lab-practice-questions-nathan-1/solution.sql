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
delimiter //
create procedure makeUpperCase(in inputString varchar(20))
begin
declare c varchar(20) default '';
select concat('Upper case is ',upper(inputString)) as UpperCase;
end //

call makeUpperCase('yadnyeshkolte');

delimiter //
drop procedure makeUpperCase;

-- 4
delimiter //
create procedure factorial(in number int)
begin
declare fac int default 1;
while(number>0)
do
set fac = fac * number;
set number = number - 1;
select concat('Its facorial is ',fac) as Factorial;
end while;
end //

set @number = 4;
call factorial(@number);

delimiter //
drop procedure factorial;

-- 5
delimiter //
create procedure printTable(in number1 int, in number2 int)
begin
declare upto10 int default 10;
declare its1 int default 1;
create temporary table if not exists temp_table(
Number1 varchar(50),
Number2 varchar(20)
);
while(its1<=upto10)
do
insert into temp_table value
(concat(number1,' x ',its1,' = ',number1*its1) ,concat(number2,' x ',its1,' = ',number2*its1));
set its1 = its1+1;
end while; 
select * from temp_table;
drop table if exists temp_table;
end//

set @number1 = 7;
set @number2 = 9;
call printTable(@number1, @number2);

delimiter //
drop procedure printTable;
/*
+-------------+-------------+
| Number1     | Number2     |
+-------------+-------------+
| 5 x 1 = 5   | 7 x 1 = 7   |
| 5 x 2 = 10  | 7 x 2 = 14  |
| 5 x 3 = 15  | 7 x 3 = 21  |
| 5 x 4 = 20  | 7 x 4 = 28  |
| 5 x 5 = 25  | 7 x 5 = 35  |
| 5 x 6 = 30  | 7 x 6 = 42  |
| 5 x 7 = 35  | 7 x 7 = 49  |
| 5 x 8 = 40  | 7 x 8 = 56  |
| 5 x 9 = 45  | 7 x 9 = 63  |
| 5 x 10 = 50 | 7 x 10 = 70 |
+-------------+-------------+
*/


-- Next five Questions

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Insert the sample data
INSERT INTO products (product_id, product_name, price, stock) VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Mouse', 500.00, 200),
(3, 'Keyboard', 1200.00, 150),
(4, 'Monitor', 8000.00, 50),
(5, 'Printer', 6500.00, 30);




