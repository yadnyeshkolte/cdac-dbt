# MySQL Assignment 2


``` md
Always be cautious when using SELECT ... INTO — it must return exactly one row, or you'll get either:
- Error 1172 (more than one row), or
- Error 1329 (no data found).

Dataype must always to be same in both in and out
```

## Create Database and Table

```sql
CREATE DATABASE school;

USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);
```

## 🔹 Insert Sample Data

```sql
INSERT INTO students (name, age, course, marks) VALUES
('Alice', 20, 'Computer Science', 92),
('Bob', 21, 'Electronics', 78),
('Charlie', 22, 'Mechanical', 65),
('David', 20, 'Electrical', 50),
('Eva', 23, 'Civil', 88),
('Frank', 21, 'Computer Science', 73),
('Grace', 22, 'Electronics', 81),
('Helen', 20, 'Mechanical', 55),
('Ian', 21, 'Civil', 60),
('Jane', 22, 'Computer Science', 95);
```

## 5 Problem Statements using SELECT INTO with **IN Parameter**

1. **Write a procedure that accepts a student name as input and retrieves the marks of that student using SELECT INTO and display the retrieved marks.**

2. **Write a procedure that accepts a course ID as input and retrieves the course name using SELECT INTO and display the retrieved course name.**

3. **Write a procedure that accepts a student name as input and retrieves the student ID using SELECT INTO and display the retrieved student ID.**

4. **Write a procedure that accepts a student ID as input and retrieves the average marks of that student using SELECT INTO and display the retrieved average marks.**

5. **Write a procedure that accepts a student name as input and retrieves the course of that student using SELECT INTO and display the retrieved course.**

## 5 Problem Statements using SELECT INTO with **OUT Parameter**

1. **Write a procedure that retrieves the name of the topper student (highest marks) into an OUT parameter using SELECT INTO and display the retrieved name.**

2. **Write a procedure that retrieves the lowest marks scored by any student into an OUT parameter using SELECT INTO and display the retrieved marks.**

3. **Write a procedure that retrieves the total number of students into an OUT parameter using SELECT INTO and display the retrieved count.**

4. **Write a procedure that retrieves the overall average marks of all students into an OUT parameter using SELECT INTO and display the retrieved average marks.**

5. **Write a procedure that accepts a student ID as input and retrieves the course name of that student into an OUT parameter using SELECT INTO and display the retrieved course name.**

