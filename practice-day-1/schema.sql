mysql> use hospital;
Database changed
mysql> select * from departments;
+----------+--------------------------+
| deptCode | deptName                 |
+----------+--------------------------+
| ADM      | Administration           |
| FIN      | Finance                  |
| HR       | Human Resources          |
| IT       | Information Technology   |
| LOG      | Logistics                |
| MAL      | Maintenance              |
| MKT      | Marketing                |
| PRD      | Production               |
| R&D      | Research and Development |
| SAL      | Sales                    |
+----------+--------------------------+
10 rows in set (0.00 sec)

mysql> select * from staff;
+---------+-----------------+-------------+------------+-------------+----------+----------+-----------+
| staffId | staffName       | staffGender | birthDate  | joiningDate | basicPay | deptcode | workHours |
+---------+-----------------+-------------+------------+-------------+----------+----------+-----------+
|       1 | Arjun Tomar     | M           | 1991-09-12 | 2005-07-15  |    40000 | MAL      |         9 |
|       2 | Priya Nair      | F           | 1989-03-22 | 2007-06-10  |    42000 | HR       |         8 |
|       3 | Ravi Mehta      | M           | 1990-11-05 | 2008-03-15  |    41000 | FIN      |         9 |
|       4 | Sneha Rao       | F           | 1992-08-19 | 2009-06-20  |    43000 | IT       |         8 |
|       5 | Tanmay Das      | M           | 1987-04-30 | 2006-09-25  |    44000 | ADM      |         9 |
|       6 | Meera Joshi     | F           | 1991-12-12 | 2008-02-18  |    45000 | HR       |         8 |
|       7 | Karan Mehta     | M           | 1986-07-07 | 2005-11-11  |    46000 | FIN      |         9 |
|       8 | Divya Nair      | F           | 1993-05-25 | 2010-04-10  |    47000 | IT       |         8 |
|       9 | Arjun Patel     | M           | 1989-09-09 | 2007-12-01  |    48000 | ADM      |         9 |
|      10 | Neha Sharma     | F           | 1994-01-01 | 2011-08-08  |    49000 | HR       |         8 |
|      11 | Ritika Jain     | F           | 1990-10-10 | 2008-03-03  |    50000 | FIN      |         9 |
|      12 | Siddharth Roy   | M           | 1985-02-02 | 2004-05-05  |    51000 | IT       |         8 |
|      13 | Anjali Gupta    | F           | 1992-06-06 | 2009-07-07  |    52000 | ADM      |         9 |
|      14 | Manish Thakur   | M           | 1987-08-08 | 2006-10-10  |    53000 | HR       |         8 |
|      15 | Pooja Iyer      | F           | 1991-03-03 | 2008-06-06  |    54000 | FIN      |         9 |
|      16 | Rahul Sinha     | M           | 1986-12-12 | 2005-04-04  |    55000 | IT       |         8 |
|      17 | Kavita Menon    | F           | 1993-07-07 | 2010-09-09  |    56000 | ADM      |         9 |
|      18 | Nikhil Bhat     | M           | 1988-05-05 | 2007-01-01  |    57000 | HR       |         8 |
|      19 | Shreya Kulkarni | F           | 1990-09-09 | 2008-02-02  |    58000 | FIN      |         9 |
|      20 | Vikram Reddy    | M           | 1989-11-11 | 2007-03-03  |    59000 | IT       |         8 |
|      21 | Tanya Mishra    | F           | 1994-04-04 | 2011-05-05  |    60000 | ADM      |         9 |
|      22 | Harsh Vardhan   | M           | 1985-01-01 | 2004-08-08  |    61000 | HR       |         8 |
|      23 | Ishita Sen      | F           | 1992-02-02 | 2009-03-03  |    62000 | FIN      |         9 |
|      24 | Rohan Kapoor    | M           | 1987-03-03 | 2006-06-06  |    63000 | IT       |         8 |
|      25 | Naina Dey       | F           | 1991-05-05 | 2008-07-07  |    64000 | ADM      |         9 |
|      26 | Abhishek Jain   | M           | 1986-06-06 | 2005-09-09  |    65000 | HR       |         8 |
|      27 | Simran Kaur     | F           | 1993-08-08 | 2010-10-10  |    66000 | FIN      |         9 |
|      28 | Yash Malhotra   | M           | 1988-10-10 | 2007-12-12  |    67000 | IT       |         8 |
|      29 | Ruchi Agarwal   | F           | 1990-12-12 | 2008-01-01  |    68000 | ADM      |         9 |
|      30 | Aditya Chauhan  | M           | 1989-01-01 | 2007-04-04  |    69000 | HR       |         8 |
|      31 | Bhavna Tripathi | F           | 1994-03-03 | 2011-06-06  |    70000 | FIN      |         9 |
|      32 | Suresh Pillai   | M           | 1985-04-04 | 2004-07-07  |    71000 | IT       |         8 |
|      33 | Lavanya Ramesh  | F           | 1992-07-07 | 2009-08-08  |    72000 | ADM      |         9 |
|      34 | Rajeev Nair     | M           | 1987-09-09 | 2006-11-11  |    73000 | HR       |         8 |
|      35 | Ankita Bose     | F           | 1991-11-11 | 2008-01-01  |    74000 | FIN      |         9 |
|      36 | Mohit Agarwal   | M           | 1986-02-02 | 2005-05-05  |    75000 | IT       |         8 |
|      37 | Deepika Rao     | F           | 1993-06-06 | 2010-07-07  |    76000 | ADM      |         9 |
|      38 | Ashwin Joshi    | M           | 1988-08-08 | 2007-10-10  |    77000 | HR       |         8 |
|      39 | Radhika Shah    | F           | 1990-01-01 | 2008-06-06  |    78000 | FIN      |         9 |
|      40 | Kunal Desai     | M           | 1989-03-03 | 2007-07-07  |    79000 | IT       |         8 |
|      41 | Trisha Dutta    | F           | 1994-05-05 | 2011-09-09  |    80000 | ADM      |         9 |
|      42 | Gaurav Singh    | M           | 1985-06-06 | 2004-10-10  |    81000 | HR       |         8 |
|      43 | Ayesha Khan     | F           | 1992-09-09 | 2009-11-11  |    82000 | FIN      |         9 |
|      44 | Devendra Yadav  | M           | 1987-11-11 | 2006-01-01  |    83000 | IT       |         8 |
|      45 | Ritika Rathi    | F           | 1991-01-01 | 2008-04-04  |    84000 | ADM      |         9 |
|      46 | Anurag Mishra   | M           | 1986-03-03 | 2005-06-06  |    85000 | HR       |         8 |
|      47 | Shruti Pandey   | F           | 1993-10-10 | 2010-12-12  |    86000 | FIN      |         9 |
|      48 | Naveen Kumar    | M           | 1988-12-12 | 2007-02-02  |    87000 | IT       |         8 |
|      49 | Pallavi Das     | F           | 1990-02-02 | 2008-03-03  |    88000 | ADM      |         9 |
|      50 | Tarun Bhatt     | M           | 1989-04-04 | 2007-05-05  |    89000 | HR       |         8 |
+---------+-----------------+-------------+------------+-------------+----------+----------+-----------+
50 rows in set (0.00 sec)
