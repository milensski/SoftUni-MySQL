#2 Addresses with Towns - exercise

SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text`
FROM employees as e
JOIN addresses as a ON e.`address_id` = a.`address_id`
JOIN towns as t ON a.`town_id` = t.`town_id`
ORDER BY e.`first_name`, e.`last_name`
LIMIT 5;

#3 Sales Employee - exercise 

SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name`
FROM employees as e
JOIN departments as d ON e.`department_id` = d.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY e.`employee_id` DESC;

#4 Employee Departments - exercise 

SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name`
FROM employees as e
JOIN departments as d ON e.`department_id` = d.`department_id`
WHERE `salary` > 15000.00
ORDER BY d.`department_id` DESC
LIMIT 5;


#5 Employees Without Project - exercise

SELECT e.`employee_id`, e.`first_name`
FROM employees as e
LEFT JOIN employees_projects as ep ON e.`employee_id` = ep.`employee_id`
WHERE ep.`project_id` IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;

#6 Employees Hired After - exercise

SELECT e.`first_name`, e.`last_name`, e.`hire_date`, d.`name` as dept_name
FROM employees as e
JOIN departments as d ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01 00:00:00' and d.`name` IN ('Sales','Finance')
ORDER BY e.`hire_date`;

#7	Employees with Project - exercise

SELECT e.`employee_id`, e.`first_name`, p.`name` as project_name
FROM employees as e
JOIN employees_projects as ep ON e.`employee_id` = ep.`employee_id`
LEFT JOIN projects as p ON ep.`project_id` = p.`project_id`
WHERE p.`end_date` IS NULL and DATE(p.`start_date`) > '2002-08-13'
ORDER BY e.`first_name`, p.`name`
LIMIT 5;


#8 Employee 24

SELECT e.`employee_id`, e.`first_name`, IF (DATE(p.`start_date`) >= '2005-01-01', NULL, p.`name`) as project_name
FROM employees as e
JOIN employees_projects as ep ON ep.`employee_id` = e.`employee_id`
LEFT JOIN projects as p ON ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24 
ORDER BY project_name;


