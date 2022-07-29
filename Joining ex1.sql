/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT *
 FROM products p
 LEFT JOIN categories c
 ON p.CategoryID = c.CategoryID
 where c.Name = "computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.price, r.Rating
 FROM products p
 LEFT JOIN reviews r
 ON p.ProductID = r.ProductID
 where r.Rating = 5; 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) as Sum
FROM sales s
INNER JOIN employees e
on e.EmployeeID = s.EmployeeID
group by e.firstname, e.LastName
Order By  sum Desc
limit 2;

SELECT CONCAT(employees.FirstName, ' ', employees.LastName) AS "Full Name", Sum(sales.Quantity) AS "Quantity Sold"
FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
GROUP BY employees.FirstName, employees.LastName
ORDER BY SUM(sales.Quantity) DESC
LIMIT 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name, c.Name
from departments d
inner join categories c
on d.DepartmentID = c.DepartmentID
where c.name = "Appliances" or c.name = "games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, sum(s.quantity) as quantity, (p.price * sum(s.Quantity)) as total
from products p
inner join sales s
on p.ProductID = s.ProductID
where p.name = "Eagles: Hotel California"
group by p.name, p.price;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, r.Rating, r.Comment
from products p
inner join reviews r
on p.ProductID = r.ProductID
where p.name = "Visio TV";
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.employeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) as totalQ
from employees e
inner join sales s
on e.EmployeeID = s.EmployeeID
inner join products p
on s.ProductID = p.ProductID
group by e.EmployeeID , p.ProductID;