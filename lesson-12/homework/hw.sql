SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;


SELECT
    e.name AS EmployeeName
FROM 
    Employee e
JOIN 
    Employee m ON e.managerid = m.id
WHERE 
    e.salary > m.salary;


SELECT
email 
from Person
group by email
having count(*) > 1;


SELECT DISTINCT ParentName FROM girls
WHERE ParentName NOT IN (SELECT ParentName FROM boys);


SELECT 
    c1.Item AS [Item Cart 1], 
    c2.Item AS [Item Cart 2]
FROM Cart1 c1
LEFT JOIN Cart2 c2 ON c1.Item = c2.Item

UNION

SELECT 
    c1.Item AS [Item Cart 1], 
    c2.Item AS [Item Cart 2]
FROM Cart2 c2
LEFT JOIN Cart1 c1 ON c2.Item = c1.Item
ORDER BY [Item Cart 1], [Item Cart 2];


SELECT
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;


SELECT
s.student_id, 
s.student_name, 
sub.subject_name,
COUNT(e.subject_name) AS Attendance_count
FROM Students s 
CROSS JOIN Subjects sub 
LEFT JOIN Examinations E
 ON e.Student_ID = s.student_id AND e.subject_name = sub.subject_name
 GROUP BY s.Student_id, s.student_name, sub.subject_name
 ORDER BY s.Student_id, sub.subject_name;
