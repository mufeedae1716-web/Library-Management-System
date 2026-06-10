# Library-Management-System

Project Description

The Library Management System is a database project designed to manage and organize information about a library. It stores details about books, customers, employees, branches, and book transactions (issue and return).


Database Name

Library_bd

Tables Created

1. Branch

* Branch_no (Primary Key)
* Manager_Id
* Branch_address
* Contact_no

2. Employee

* Emp_Id (Primary Key)
* Emp_name
* Position
* Salary
* Branch_no (Foreign Key)

3. Books

* ISBN (Primary Key)
* Book_title
* Category
* Rental_Price
* Status
* Author
* Publisher

4. Customer

* Customer_Id (Primary Key)
* Customer_name
* Customer_address
* Reg_date

5. IssueStatus

* Issue_Id (Primary Key)
* Issued_cust (Foreign Key)
* Issued_book_name
* Issue_date
* Isbn_book (Foreign Key)

6. ReturnStatus

* Return_Id (Primary Key)
* Return_cust
* Return_book_name
* Return_date
* Isbn_book2 (Foreign Key)

SQL Queries Implemented

1. Retrieve available books
2. List employees by salary (descending)
3. Get issued books with customer names
4. Count books by category
5. Employees with salary > 50000
6. Customers registered before 2022 with no issued books
7. Employee count per branch
8. Customers who issued books in June 2023
9. Books containing “history”
10. Branches with more than 5 employees
11. Managers with branch addresses
12. Customers who issued books with rental price > 25

Tools Used

* MySQL
* MySQL Workbench

Conclusion 

The Library Management System helps to manage books and records efficiently using SQL. It makes storing, retrieving, and organizing data simple and effective.
