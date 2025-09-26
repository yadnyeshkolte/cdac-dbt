### SQL Notes

| DATATYPE | DESCRIPTION | USAGE |
|----------|-------------|-------|
| CHAR | string(0-255), can store characters of fixed length | CHAR(50) |
| VARCHAR | string(0-255), can store characters up to given length | VARCHAR(50) |
| BLOB | string(0-65535), can store binary large object | BLOB(1000) |
| INT | integer(-2,147,483,648 to 2,147,483,647) | INT |
| TINYINT | integer(-128 to 127) | TINYINT |
| BIGINT | integer(-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807) | BIGINT |
| BIT | can store x-bit values. x can range from 1 to 64 | BIT(2) |
| FLOAT | Decimal number - with precision to 23 digits | FLOAT |
| DOUBLE | Decimal number - with 24 to 53 digits | DOUBLE |
| BOOLEAN | Boolean values 0 or 1 | BOOLEAN |
| DATE | date in format of YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31 | DATE |
| YEAR | year in 4 digits format ranging from 1901 to 2155 | YEAR |
---
**Selecting Employee whose joindate is max (using all) where supcode is null**
```sql
 select * from emp e where e.joindate <= all(select joindate from emp where supcode is Null); -- 6
```
- `all()` - selecting max from all
- supcode `is` null - use if we have to check null value
- `-- 6` - Its the comment **Remember to give -- and comment**
---
```sql
select *, timestampdiff(year, e.birthdate, curdate()) as age from emp e 
where timestampdiff(year, e.birthdate, curdate()) between 55 and 60; -- 7
```
- `timestampdiff(year, e.birthdate, curdate())` -  to get the date difference
- `year` - We want value in years
- `curdate()` - It will give reference to the current date
- `as age` -  Giving aliasing to the *timestampdiff(year, e.birthdate, curdate())* table
- `between` `and` - It will give values only between value1 and value2
- **We can't call aliasing coloumn (like age) in the `where` clause**
---

