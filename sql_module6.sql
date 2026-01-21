use module_5;
drop database module_5;
create database module_5;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Region VARCHAR(50),
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SaleID, Region, Amount, SaleDate)
VALUES 
(1, 'North', 1000.00, '2025-09-01'),
(2, 'South', 1500.50, '2025-09-02'),
(3, 'East', 900.75, '2025-09-03'),
(4, 'West', 1200.00, '2025-09-04'),
(5, 'North', 1100.25, '2025-09-05');
select * from sales;

select sum(amount) from sales;


SELECT SUM(Amount) AS TotalSales FROM Sales;

sELECT AVG(Amount) AS AverageSale FROM Sales;
SELECT MAX(Amount) AS HighestSale FROM Sales;
SELECT MIN(Amount) AS LowestSale FROM Sales;
SELECT COUNT(*) AS NumberOfSales FROM Sales;
SELECT COUNT(DISTINCT Region) AS UniqueRegions FROM Sales;
select distinct region from sales;

-- i want to get the total slae from south region only

select region,sum(amount) from sales where region = 'west';


-- Total Amount per Region
SELECT saleid,
    Region,
    SUM(Amount) AS TotalAmount
FROM Sales
GROUP BY saleid,Region;


-- Total Sales by Region

SELECT Region, SUM(Amount) AS TotalByRegion
FROM Sales
GROUP BY Region;

SELECT Region
FROM Sales
GROUP BY Region;

-- Count of Sales per Region
SELECT 
    Region,
    COUNT(*) AS NumberOfSales
FROM Sales
GROUP BY Region;


-- Average Sale Amount per Region
SELECT 
    Region,
    AVG(Amount) AS AvgAmount
FROM Sales
GROUP BY Region;

-- Group by Region and Month
SELECT
    Region,
    MONTH(SaleDate) AS SaleMonth,
    SUM(Amount) AS TotalAmount
FROM Sales
GROUP BY Region, MONTH(SaleDate)
ORDER BY Region, SaleMonth;

SELECT Region
FROM Sales;





CREATE TABLE EmployeeSales (
    EmployeeID INT,
    Name VARCHAR(50),
    Region VARCHAR(50),
    Department VARCHAR(50),
    SaleAmount DECIMAL(10,2),
    SaleDate DATE
);
INSERT INTO EmployeeSales (EmployeeID, Name, Region, Department, SaleAmount, SaleDate)
VALUES
(101, 'Amit', 'North', 'Electronics', 1200.50, '2025-09-01'),
(102, 'Priya', 'South', 'Clothing', 950.00, '2025-09-02'),
(103, 'Raj', 'East', 'Electronics', 1100.75, '2025-09-03'),
(104, 'Neha', 'West', 'Clothing', 875.25, '2025-09-04'),
(105, 'Vikram', 'North', 'Furniture', 1320.00, '2025-09-05'),
(106, 'Sneha', 'South', 'Electronics', 1450.00, '2025-09-06'),
(107, 'Arjun', 'East', 'Furniture', 980.00, '2025-09-07'),
(108, 'Meera', 'West', 'Clothing', 1025.50, '2025-09-08'),
(109, 'Karan', 'North', 'Electronics', 1600.00, '2025-09-09'),
(110, 'Divya', 'South', 'Furniture', 890.00, '2025-09-10'),
(111, 'Ravi', 'East', 'Clothing', 940.00, '2025-09-11'),
(112, 'Anjali', 'West', 'Electronics', 1250.00, '2025-09-12'),
(113, 'Manish', 'North', 'Clothing', 970.00, '2025-09-13'),
(114, 'Pooja', 'South', 'Furniture', 1110.00, '2025-09-14'),
(115, 'Suresh', 'East', 'Electronics', 1350.00, '2025-09-15'),
(116, 'Ritika', 'West', 'Furniture', 1200.00, '2025-09-16'),
(117, 'Nikhil', 'North', 'Electronics', 1400.00, '2025-09-17'),
(118, 'Tanya', 'South', 'Clothing', 980.00, '2025-09-18'),
(119, 'Harsh', 'East', 'Furniture', 1050.00, '2025-09-19'),
(120, 'Isha', 'West', 'Electronics', 1150.00, '2025-09-20'),
(121, 'Rohan', 'North', 'Clothing', 990.00, '2025-09-21'),
(122, 'Komal', 'South', 'Electronics', 1250.00, '2025-09-22'),
(123, 'Deepak', 'East', 'Clothing', 870.00, '2025-09-23'),
(124, 'Simran', 'West', 'Furniture', 1300.00, '2025-09-24'),
(125, 'Yash', 'North', 'Electronics', 1500.00, '2025-09-25'),
(126, 'Bhavna', 'South', 'Furniture', 920.00, '2025-09-26'),
(127, 'Aditya', 'East', 'Electronics', 1380.00, '2025-09-27'),
(128, 'Naina', 'West', 'Clothing', 960.00, '2025-09-28'),
(129, 'Kabir', 'North', 'Furniture', 1000.00, '2025-09-29'),
(130, 'Shruti', 'South', 'Clothing', 890.00, '2025-09-30');
select * from employeesales;

select  day(saledate) as day  from employeesales
group by day(saledate);

-- Total Sales by Region


select region,department,count(*),sum(saleamount),max(saleamount) from employeesales
group by region ,department
order by department;

select department,count(*) as count,sum(saleamount) as a,max(saleamount) from employeesales
group by department
 having a>10000;

select department ,count(*),sum(saleamount),
round(sum(saleamount),1)from employeesales
where name like 'a%'
group by department
having count(*)>1;



SELECT Region, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
GROUP BY Region
order by region asc,totalsales desc ;

SELECT Region,department, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
GROUP BY Region,department
order by region asc,totalsales desc ;


-- Average Sale by Department
 SELECT Department,count(*), AVG(SaleAmount) AS AvgSale
FROM EmployeeSales
GROUP BY Department;


-- minimum Sale for every  Department
  I want only those dept whose min(sale) >890
  
  
 SELECT Department, min(SaleAmount) as minsale,count(*) as count,max(saleamount) as maxsale
FROM EmployeeSales
where department ='clothing'
GROUP BY Department
having count>9;


-- Sales Count by Employee
SELECT Name, COUNT(*) AS SalesCount
FROM EmployeeSales
GROUP BY Name
limit 5 offset 5;


-- You can't group by a derived column alias directly unless you use a subquery or CTE.
You can sort by a derived column:
 we can use alias in HAVING Clauses  as well only in mysql
 MySQL allows using alias in HAVING because
SELECT executes before HAVING (in MySQL’s internal execution).



-- EXERCISE 
drop table EmployeeSales;
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    Employee VARCHAR(50),
    Region VARCHAR(50),
    Product VARCHAR(50),
    Amount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO EmployeeSales (SaleID, Employee, Region, Product, Amount, SaleDate)
VALUES
(1, 'Amit', 'North', 'Laptop', 1200.00, '2025-09-01'),
(2, 'Amit', 'North', 'Mobile', 800.00, '2025-09-02'),
(3, 'Riya', 'South', 'Laptop', 1500.00, '2025-09-02'),
(4, 'Riya', 'South', 'Tablet', 900.00, '2025-09-03'),
(5, 'Karan', 'East', 'Laptop', 1100.00, '2025-09-03'),
(6, 'Karan', 'East', 'Mobile', 700.00, '2025-09-04'),
(7, 'Neha', 'West', 'Tablet', 1300.00, '2025-09-04'),
(8, 'Neha', 'West', 'Laptop', 1400.00, '2025-09-05'),
(9, 'Amit', 'North', 'Tablet', 950.00, '2025-09-06'),
(10, 'Riya', 'South', 'Mobile', 750.00, '2025-09-07');

-- Total sales amount per region

Write a query to show each region and total sales amount.
SELECT 
    Region,
    SUM(Amount) AS TotalSales
FROM EmployeeSales
GROUP BY Region;

2️⃣ Total sales per employee

Show employee name and sum of all their sales.
SELECT 
    Employee,
    SUM(Amount) AS TotalSales
FROM EmployeeSales
GROUP BY Employee;

3️⃣ Count of sales per product

Show product name and number of times it was sold.
SELECT 
    Product,
    COUNT(*) AS NumberOfSales
FROM EmployeeSales
GROUP BY Product;

4️⃣ Average amount sold per region

Show region and average sale amount.
SELECT 
    Region,
    AVG(Amount) AS AvgSaleAmount
FROM EmployeeSales
GROUP BY Region;

5️⃣ Sales per employee per product

Group by employee + product and show total amount.
SELECT 
    Employee,
    Product,
    SUM(Amount) AS TotalSales
FROM EmployeeSales
GROUP BY Employee, Product
ORDER BY Employee, Product;

6 Maximum sale amount per region

Show region and highest sale in that region.

SELECT 
    Region,
    MAX(Amount) AS MaxSaleAmount
FROM EmployeeSales
GROUP BY Region;

7️⃣ Number of sales per day

Group by SaleDate and count the sales.

SELECT 
    SaleDate,
    COUNT(*) AS NumberOfSales
FROM EmployeeSales
GROUP BY SaleDate
ORDER BY SaleDate;

8️⃣ Total sales in each region for Laptops only

Filter product = 'Laptop', then group by region.
SELECT 
    Region,
    SUM(Amount) AS LaptopSales
FROM EmployeeSales
WHERE Product = 'Laptop'
GROUP BY Region;

