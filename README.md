# cdac-dbt
Database Technologies

### Group by will be applied by grouping entities with reference (dept d) to entity description (emp e)
```SQL
mysql> select * from emp;
+---------+---------+----------+------------+------------+------+-----------+---------+-----------+------------+----------+
| empcode | empname | deptcode | birthdate  | joindate   | sex  | desigcode | supcode | gradecode | gradelevel | basicpay |
+---------+---------+----------+------------+------------+------+-----------+---------+-----------+------------+----------+
| 6569    | Tiwari  | STOR     | 1989-08-19 | 2010-08-21 | M    | MNGR      | 7782    | GC6       | GL2        |    12400 |
| 7192    | John    | ACCT     | 1968-11-05 | 1994-12-03 | M    | CLRK      | 7902    | GC6       | GL2        |    12300 |
| 7369    | Shah    | PRCH     | 1960-05-25 | 1983-12-17 | M    | CLRK      | 7902    | GC6       | GL2        |    12200 |
| 7499    | Roy     | SALE     | 1957-09-27 | 1981-02-20 | M    | SLMN      | 7698    | GC6       | GL1        |    14200 |
| 7521    | Wilson  | STOR     | 1956-03-18 | 1981-02-22 | M    | MNGR      | 7698    | GC6       | GL2        |    12200 |
| 7566    | Jain    | PRCH     | 1955-01-24 | 1981-04-02 | F    | MNGR      | 7839    | GC6       | GL2        |    12400 |
| 7654    | Gupta   | SALE     | 1957-01-22 | 1981-09-28 | M    | SLMN      | 7698    | GC6       | GL2        |    12600 |
| 7698    | Murthy  | SALE     | 1960-09-16 | 1981-05-01 | F    | MNGR      | 7839    | GC6       | GL1        |    14700 |
| 7782    | Menon   | ACCT     | 1967-08-30 | 1981-06-09 | M    | MNGR      | 7839    | GC6       | GL2        |    12400 |
| 7788    | Khan    | PRCH     | 1957-02-03 | 1982-12-09 | M    | SPRV      | 7566    | GC6       | GL2        |    11900 |
| 7802    | Sanghvi | STOR     | 1980-05-06 | 1993-01-01 | M    | MNGR      | 7566    | GC6       | GL2        |    12400 |
| 7839    | Reddy   | ACCT     | 1959-12-12 | 1981-07-17 | M    | PRES      | NULL    | GC1       | GL1        |    32000 |
| 7844    | Singh   | SALE     | 1956-09-09 | 1981-09-08 | F    | SLMN      | 7698    | GC6       | GL1        |    14300 |
| 7876    | Patil   | PRCH     | 1965-09-02 | 1990-12-17 | M    | CLRK      | 7788    | GC6       | GL2        |    12300 |
| 7900    | Shroff  | SALE     | 1956-06-28 | 1981-12-03 | M    | CLRK      | 7698    | GC6       | GL2        |    12000 |
| 7902    | Naik    | PRCH     | 1958-02-20 | 1981-12-03 | M    | MNGR      | 7839    | GC6       | GL2        |    11800 |
| 7934    | Kaul    | ACCT     | 1957-05-02 | 1982-01-23 | M    | CLRK      | 7782    | GC6       | GL2        |    11950 |
| 7939    | Rai     | PRCH     | 1988-08-10 | 2012-12-06 | M    | CLRK      | 7782    | GC6       | GL2        |    11800 |
| 7999    | Sinha   | SALE     | 1970-04-11 | 1992-02-20 | M    | SLMN      | 7782    | GC6       | GL1        |    14600 |
| 9902    | Ahmad   | SALE     | 1970-02-16 | 1992-04-17 | M    | SLMN      | 7698    | GC6       | GL1        |    14200 |
+---------+---------+----------+------------+------------+------+-----------+---------+-----------+------------+----------+
20 rows in set (0.00 sec)

mysql> select * from dept;
+----------+------------+--------+
| deptcode | deptname   | budget |
+----------+------------+--------+
| ACCT     | Accounts   |     19 |
| FACL     | Facilities |     42 |
| PERS     | Personal   |     12 |
| PRCH     | Purchase   |     25 |
| SALE     | Sales      |     39 |
| STOR     | Stores     |     33 |
+----------+------------+--------+
6 rows in set (0.00 sec)
```
```SQL
select d.deptcode, d.deptname, count(e.empcode) 
from dept d left outer join emp e on d.deptcode = e.deptcode
group by d.deptcode
```
