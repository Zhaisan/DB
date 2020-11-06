CREATE DATABASE lab3;

SELECT lastname from employees;

SELECT DISTINCT lastname FROM employees;

SELECT * FROM employees where lastname = 'Smith';

SELECT * FROM employees where lastname = 'Smith' or lastname = 'Doe';

SELECT * FROM employees where department = 14;

SELECT * FROM employees where department = 37 or department = 77;

SELECT sum(budget) from departments; --9

SELECT count(ssn), department FROM employees GROUP BY department; --10

SELECT department from employees GROUP BY  department having count(ssn) > 2; --11

SELECT name FROM departments GROUP BY name, budget
HAVING max(budget) < (SELECT max(budget) FROM departments) ORDER BY budget DESC LIMIT 1;  --12

SELECT name, lastname FROM employees  --13
WHERE department = (SELECT code FROM departments GROUP BY code HAVING budget = min(budget)
ORDER BY budget ASC LIMIT 1);

SELECT name FROM customers where city = 'Almaty' union SELECT name FROM employees where city = 'Almaty';  --14

SELECT name FROM customers where city = 'Almaty' union all SELECT name FROM employees where city = 'Almaty';

SELECT name FROM departments WHERE budget > 60000 ORDER BY budget ASC, code DESC;  --15

UPDATE departments SET budget = budget - (budget*0.1) WHERE   --16
budget = (SELECT budget FROM departments GROUP BY budget HAVING budget = min(budget)
ORDER BY budget ASC LIMIT 1);

UPDATE employees SET department = 14 where department = 77;     --17

DELETE FROM employees where department = 14;   --18

DELETE FROM employees RETURNING *;   --19

