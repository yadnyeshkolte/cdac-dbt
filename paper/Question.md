## RDBMS

1.  Create following tables and insert sample data as shown. Identify and Provide constraints wherever required. Please provide create statement and insert statement queries. (4 marks)

    **BOOK**
    | BOOK_ID | TITLE | MRP | PUBLISHER |
    | :--- | :--- | :--- | :--- |
    | B10 | SECRET | 399 | SCROLL |
    | B20 | LANDMARK | 799 | PAPERPOST |
    | B30 | VISION | 750 | INDIAINK |
    | B40 | 2 STATES | NULL | PAPERPOST |
    | B50 | CODE | 550 | INDIAINK |

    **AUTHOR**
    | A_ID | NAME | GENDER | NATIONALITY | bookid |
    | :--- | :--- | :--- | :--- | :--- |
    | A10 | CHETAN | Male | INDIAN | b50 |
    | A20 | DANNY | Male | AMERICAN | b10 |
    | A30 | ROBIN | Male | CANADIAN | b10 |
    | A40 | ARUNDHATI | Female | INDIAN | b30 |

2.  Write a query to list book details in desc order of MRP.
3.  Write a query to find book titles Starting with 'V'.
4.  Write a query to find total number of books.
5.  Write a query to list unique publisher.
6.  Write a query to find total books belonging to publisher INDIAINK, SCROLL. (2 marks)
7.  Display only the id and name of authors whose name contains "an" or ends with "in". (2 marks each)
8.  List all the details of INDIAN and AMERICAN authors who are MALES. (2 marks)
9.  Write a query to find max pricing of each publisher. (2 marks)
10. Write a query to list publisher no of books published. (2 marks)
11. Find each publisher's name, along with the rounded average price and the number of books published, only for publishers whose average price is greater than 500. (3marks)
12. Find the total no of authors of each nationality where total number is greater than or equal to 2. (3marks)
13. To find the maximum of the average prices of publishers that is the highest average book price among all publishers. (3marks)
14. Display the details of authors and books written by them. (3marks)
15. Find the details of books having MRP more than the book "CODE". (2marks)
16. Find authors who have not written any book. (3marks)

***

## MongoDB (5 marks)

17. Using MongoDB, Create a collection called ‘Company’ and populate(insert) with the data listed in tabular format.

    | Name | Company | Type |
    | :--- | :--- | :--- |
    | Andrew | qcash | Client |
    | David | newage | Potential |
    | Jason | tetra | Customer |
    | Mark | | Client |
    | Marwin | qcash | Potential |
    | Daniel | newage | |

18. Write a mongodb query to display the documents in company collection.
19. Write a query to display documents from 2 to 4.
20. Write a query to remove document.
