CREATE DATABASE library_bd;
USE library_bd;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(5),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch VALUES
(1, 101, 'Kozhikode', '9876543210'),
(2, 102, 'Malappuram', '9876543211'),
(3, 103, 'Ernakulam', '9876543212');

SELECT * FROM Branch;

INSERT INTO Employee VALUES
(101, 'Rahul', 'Manager', 60000, 1),
(102, 'Anjali', 'Manager', 65000, 2),
(103, 'Suresh', 'Manager', 70000, 3),
(104, 'Akhil', 'Clerk', 30000, 1),
(105, 'Meena', 'Assistant', 40000, 1),
(106, 'John', 'Clerk', 28000, 2),
(107, 'Priya', 'Assistant', 35000, 2),
(108, 'Arun', 'Clerk', 32000, 3);

SELECT * FROM Employee;

INSERT INTO Books VALUES
('B101', 'World History', 'History', 30, 'yes', 'Arun Kumar', 'National Books'),
('B102', 'Math Basics', 'Education', 20, 'yes', 'Ravi Sharma', 'Student Press'),
('B103', 'Science Today', 'Science', 25, 'no', 'Anil Verma', 'Knowledge India'),
('B104', 'Indian History', 'History', 35, 'yes', 'Meera Nair', 'Heritage Books'),
('B105', 'English Grammar', 'Education', 15, 'yes', 'Sita Menon', 'Academic Press'),
('B106', 'Physics Guide', 'Science', 40, 'no', 'Rajesh Gupta', 'Tech Books');

SELECT * FROM Books;

INSERT INTO Customer VALUES
(1, 'Aman', 'Kozhikode', '2021-05-10'),
(2, 'Nisha', 'Malappuram', '2023-03-15'),
(3, 'Ravi', 'Ernakulam', '2020-07-20'),
(4, 'Sneha', 'Kozhikode', '2022-01-10'),
(5, 'Fathima', 'Malappuram', '2021-12-01');

SELECT * FROM Customer;

INSERT INTO IssueStatus VALUES
(1, 1, 'World History', '2023-06-10', 'B101'),
(2, 2, 'Math Basics', '2023-06-15', 'B102'),
(3, 3, 'Indian History', '2023-05-20', 'B104'),
(4, 5, 'Physics Guide', '2023-06-18', 'B106');

SELECT * FROM IssueStatus;

INSERT INTO ReturnStatus VALUES
(1, 1, 'World History', '2023-06-20', 'B101'),
(2, 2, 'Math Basics', '2023-06-25', 'B102');

SELECT * FROM ReturnStatus;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

SELECT Category, COUNT(*) AS total_books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(*) AS total_employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS total_employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;



