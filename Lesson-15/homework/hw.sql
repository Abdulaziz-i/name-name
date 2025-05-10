select id, name, SALARY
from Employees
where salary = (select min(SALARY)from Employees);

SELECT id, product_name, Price 
from products
where price < (select avg(price) from products);

select e.name, d.department_name
from Employees e 
inner join departments d on e.DEPARTMENT_ID=d.id 
where d.department_name='Sales'

SELECT
c.customer_id, c.name
from customers c 
left join orders o on c.customer_id=o.Customer_ID
where o.order_id is null

SELECT
p.id, p.product_name, p.price, p.category_id
from products p
where p.price = (select max(price)from products where category_id=p.category_id)

WITH DeptAvg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department_id
),
MaxDept AS (
    SELECT TOP 1 department_id
    FROM DeptAvg
    ORDER BY avg_salary DESC
)
SELECT 
    e.name, e.salary, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.id
WHERE e.department_id = (SELECT department_id FROM MaxDept);

SELECT 
e.id, e.name, e.salary, e.department_id
FROM Employees e
JOIN
    (Select department_id, avg(salary) as avg_salary
    FROM Employees
    GROUP BY DEPARTMENT_ID)
DeptAvg ON e.DEPARTMENT_ID=DeptAvg.DEPARTMENT_ID
WHERE e.salary>DeptAvg.avg_salary;

SELECT 
    s.student_id,
    s.name,
    g.course_id,
    g.grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE g.grade = (
    SELECT MAX(g2.grade)
    FROM grades g2
    WHERE g2.course_id = g.course_id
);

SELECT MIN(price) AS ThirdHighestPrice
FROM (
    SELECT DISTINCT TOP 3 price
    FROM products
    ORDER BY price DESC
) AS Top3;

SELECT 
    e.id,
    e.name,
    e.salary,
    e.department_id
FROM 
    employees e
WHERE 
    e.salary > (SELECT AVG(salary) FROM employees)
    AND e.salary < (SELECT MAX(salary) 
                    FROM employees 
                    WHERE department_id = e.department_id)
