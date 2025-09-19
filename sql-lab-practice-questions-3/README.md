## Views Practice questions:  
1. Write a view to compute the employee age of the organization  
2. Write a view to compute the employee experience with the organization  
3. Write a view that computes the employee pay for the current month for all the  
employees. Hint: Compute the employee pay as the Basic+Allowance-Deduction  
4. List the employees who are older than their supervisors. Hint: Use views to  
implement employee age  
5. Write a view to display the total number of employees in each department  
6. Write a view to display the total number of employees in the organization  
7. Use the views in Qn No 5 & Qn No 6, to display the percentage of employees in  
each department
---
## Trigger Assignment
 1. Create a trigger after insert statement for emp table to insert the value into table only if join 
date is not older than 40 . 
2. Insert a value to activate the trigger check 
3. Create a table average_age, Insert the average age of the employee into this table. 
4. Create an AFTER INSERT trigger on the emp  table to update the average_age table after 
insert 
5. Insert a value to activates the trigger check: 
6. Add a BEFORE UPDATE trigger to the emp  table to check the age value (age should be more 
than 18) before inserting data into the emp  table 
7. Updating an existing value activates the trigger check 
8. Create a table called emp_archive with same columns as emp table. 
9. Insert a new (which is does not exist in emp table) record into emp table 
10. Create a BEFORE DELETE trigger on the table emp and insert the values into the 
emp_archive table 
11. Delete the record inserted at step no 9 
12. Display emp_archive table to check the trigger before delete  
13. Create an AFTER DELETE trigger on the table emp to update the average_age table with 
the new information (i.e whenever you delete a record from emp table, average_age should 
get updated) 
14. Delete a value to check the above trigger
---
## Assignment - TCL commands 
1. Create course table with the following fields 
a. course_id , type integer, Primary key 
b. course_name type varchar(20) 
2. Insert the following records in course table  
(1, DBT) 
(2,OS) 
(3,JAVA) 
(4, Data structure) 
3. Create a savepoint insertion 
4. delete the record - DBT and OS  
5. Create savepoint deletion 
6.Roll back to deletion 
7. Insert the following record  
(5, Algorithms) 
8.Rollback to insertion 
9. complete Rollback
