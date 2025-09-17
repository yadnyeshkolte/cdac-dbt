mysql> select staff.staffId, staff.staffName, staff.staffGender, timestampdiff(year, staff.birthDate, curdate()) as age,staff.basicPay, departments.deptName, staff.workHours from staff, departments where staff.staffGender='F' and staff.joiningDate between '2006-11-11' and '2012-05-05' and staff.basicPay > 30000 and staff.workHours > 7 and staff.deptcode not in ('FIN','ADM') and staff.deptcode = departments.deptCode order by departments.deptName asc;
+---------+-------------+-------------+------+----------+------------------------+-----------+
| staffId | staffName   | staffGender | age  | basicPay | deptName               | workHours |
+---------+-------------+-------------+------+----------+------------------------+-----------+
|       2 | Priya Nair  | F           |   36 |    42000 | Human Resources        |         8 |
|       6 | Meera Joshi | F           |   33 |    45000 | Human Resources        |         8 |
|      10 | Neha Sharma | F           |   31 |    49000 | Human Resources        |         8 |
|       4 | Sneha Rao   | F           |   33 |    43000 | Information Technology |         8 |
|       8 | Divya Nair  | F           |   32 |    47000 | Information Technology |         8 |
+---------+-------------+-------------+------+----------+------------------------+-----------+
5 rows in set (0.01 sec)

---

mysql> select staff.staffId,staff.staffName,staff.staffGender,timestampdiff(year,staff.birthDate,curDate()) as age,staff.joiningDate,departments.deptName from staff,departments where staff.staffGender = 'F' and staff.joiningDate between '2004-10-10' and '2011-09-09' and staff.basicPay >45000 and staff.deptcode not in ('HR','IT') and staff.deptcode = departments.deptCode order by timestampdiff(year,staff.birthDate,curDate()) asc;
+---------+-----------------+-------------+------+-------------+----------------+
| staffId | staffName       | staffGender | age  | joiningDate | deptName       |
+---------+-----------------+-------------+------+-------------+----------------+
|      21 | Tanya Mishra    | F           |   31 | 2011-05-05  | Administration |
|      31 | Bhavna Tripathi | F           |   31 | 2011-06-06  | Finance        |
|      41 | Trisha Dutta    | F           |   31 | 2011-09-09  | Administration |
|      47 | Shruti Pandey   | F           |   31 | 2010-12-12  | Finance        |
|      17 | Kavita Menon    | F           |   32 | 2010-09-09  | Administration |
|      27 | Simran Kaur     | F           |   32 | 2010-10-10  | Finance        |
|      37 | Deepika Rao     | F           |   32 | 2010-07-07  | Administration |
|      13 | Anjali Gupta    | F           |   33 | 2009-07-07  | Administration |
|      23 | Ishita Sen      | F           |   33 | 2009-03-03  | Finance        |
|      33 | Lavanya Ramesh  | F           |   33 | 2009-08-08  | Administration |
|      35 | Ankita Bose     | F           |   33 | 2008-01-01  | Finance        |
|      43 | Ayesha Khan     | F           |   33 | 2009-11-11  | Finance        |
|      11 | Ritika Jain     | F           |   34 | 2008-03-03  | Finance        |
|      15 | Pooja Iyer      | F           |   34 | 2008-06-06  | Finance        |
|      25 | Naina Dey       | F           |   34 | 2008-07-07  | Administration |
|      29 | Ruchi Agarwal   | F           |   34 | 2008-01-01  | Administration |
|      45 | Ritika Rathi    | F           |   34 | 2008-04-04  | Administration |
|      19 | Shreya Kulkarni | F           |   35 | 2008-02-02  | Finance        |
|      39 | Radhika Shah    | F           |   35 | 2008-06-06  | Finance        |
|      49 | Pallavi Das     | F           |   35 | 2008-03-03  | Administration |
+---------+-----------------+-------------+------+-------------+----------------+
20 rows in set (0.00 sec)

---


mysql> select staff.staffId, staff.staffName, staff.staffGender, staff.joiningDate, departments.deptName, timestampdiff(year,staff.birthDate,curdate()) as age from staff, departments where staff.deptcode not in ('ADM','IT','FIN') and staff.staffGender = 'M' and staff.joiningDate between '2006-11-11' and '2011-06-06' and staff.deptcode = departments.deptCode order by staff.staffId asc;
+---------+----------------+-------------+-------------+-----------------+------+
| staffId | staffName      | staffGender | joiningDate | deptName        | age  |
+---------+----------------+-------------+-------------+-----------------+------+
|      18 | Nikhil Bhat    | M           | 2007-01-01  | Human Resources |   37 |
|      30 | Aditya Chauhan | M           | 2007-04-04  | Human Resources |   36 |
|      34 | Rajeev Nair    | M           | 2006-11-11  | Human Resources |   38 |
|      38 | Ashwin Joshi   | M           | 2007-10-10  | Human Resources |   37 |
|      50 | Tarun Bhatt    | M           | 2007-05-05  | Human Resources |   36 |
+---------+----------------+-------------+-------------+-----------------+------+
5 rows in set (0.01 sec)
