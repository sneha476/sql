create database task1;
use task1;
 create table employee(emp_id int primary key auto_increment,emp_name varchar(20) not null,email varchar(20) unique,cmp_name varchar(20) default "10k coders");
 desc employee;
 alter table employee add phn_no bigint unique;
 alter table employee rename column phn_no to mobile_no;
 alter table employee modify emp_name varchar(30);
 desc employee;
  insert into employee values(1,"sneha","sneha@gmail.com","wipro",7686987),(2,"neha","neha@gmail.com","tcs",87585),(3,"latha","latha@gmail.com","infosys",9578755),(4,"glory","glory@gmail.com","apple",87598),(5,"lilly","lilly@gmail.com","tata",896267);
  insert into employee values(6,"teju","teju@gmail.com","wipro",721686987),(7,"ooha","ooha@gmail.com","tcs",8798585),(8,"hema","hema@gmail.com","infosys",1478759785),(9,"susan","susan@gmail.com","apple",875987758),(10,"priya","priya@gmail.com","tata",65546267);
   insert into employee values(11,"bhomi","bhomi@gmail.com","wipro",7216869),(12,"prema","prema@gmail.com","tcs",8795),(13,"uma","uma@gmail.com","infosys",1478795),(14,"aruna","aruna@gmail.com","apple",87598778),(15,"riya","riya@gmail.com","tata",6550267);
   drop mobile_no from employee;
alter table employee drop mobile_no;
alter table employee drop mobile_no;
select * from employee;
create  table department(emp_id int primary key,salary bigint,foreign key(emp_id) references employee(emp_id));
desc department;
 insert into department values (1,20000),(2,30000),(3,60000),(4,240000),(5,34000),(6,54000),(7,45000),(8,63000),(9,37000),(10,87000),(11,53000),(12,65000),(13,46000),(14,73000),(15,29000);
  select e.emp_name,d.salary from employee e join department d on e.emp_id=d.emp_id;
  select * from department where salary>50000;
  select * from department where salary between 40000  and 70000;
  alter table department add dept_name varchar(50);
  update department set dept_name='HR' where emp_id=1;
  update department set dept_name='IT' where emp_id=2;
  update department set dept_name='FINANCE' where emp_id=3;
  update department set dept_name='HR' where emp_id=4;
   update department set dept_name='IT' where emp_id=5;
    update department set dept_name='HR' where emp_id=6;
    update department set dept_name='FINANCE' where emp_id=7;
update department set dept_name='IT' where emp_id=8;
UPDATE department SET dept_name='IT' WHERE emp_id=9;

UPDATE department SET dept_name='FINANCE' WHERE emp_id=10;

UPDATE department SET dept_name='HR' WHERE emp_id=11;

UPDATE department SET dept_name='IT' WHERE emp_id=12;

UPDATE department SET dept_name='FINANCE' WHERE emp_id=13;

UPDATE department SET dept_name='HR' WHERE emp_id=14;

UPDATE department SET dept_name='HR' WHERE emp_id=15;

SELECT * FROM department;

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
WHERE d.dept_name='IT';

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
WHERE d.dept_name='HR';

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
WHERE d.dept_name!='HR';

SELECT * FROM employee
WHERE emp_name LIKE 'a%';

SELECT * FROM employee
WHERE emp_name LIKE '%n';

SELECT * FROM employee
WHERE emp_name LIKE '%ra%';

SELECT UPPER(emp_name) FROM employee;

SELECT LOWER(emp_name) FROM employee;

SELECT LENGTH(emp_name) FROM employee;

SELECT SUBSTRING(emp_name,3) FROM employee;

SELECT LEFT(emp_name,3) FROM employee;

SELECT REPLACE(emp_name,'a','*') FROM employee;

SELECT CONCAT(emp_name,' ',email) FROM employee;

SELECT LPAD(emp_name,20,'*') FROM employee;

SELECT RPAD(emp_name,20,'*') FROM employee;

SELECT DATE(NOW());

SELECT TIME(NOW());

SELECT NOW();

ALTER TABLE employee
ADD join_date DATETIME;

UPDATE employee SET join_date='2026-01-01' WHERE emp_id=1;
UPDATE employee SET join_date='2025-12-01' WHERE emp_id=2;
UPDATE employee SET join_date='2025-11-11' WHERE emp_id=3;
UPDATE employee SET join_date='2026-03-11' WHERE emp_id=4;
UPDATE employee SET join_date='2025-03-11' WHERE emp_id=5;
UPDATE employee SET join_date='2025-04-21' WHERE emp_id=6;
UPDATE employee SET join_date='2025-04-27' WHERE emp_id=7;
UPDATE employee SET join_date='2025-10-01' WHERE emp_id=8;
UPDATE employee SET join_date='2025-12-30' WHERE emp_id=9;
UPDATE employee SET join_date='2025-09-30' WHERE emp_id=10;
UPDATE employee SET join_date='2025-02-28' WHERE emp_id=11;
UPDATE employee SET join_date='2025-03-28' WHERE emp_id=12;
UPDATE employee SET join_date='2026-03-28' WHERE emp_id=13;
UPDATE employee SET join_date='2026-02-20' WHERE emp_id=14;
UPDATE employee SET join_date='2026-05-31' WHERE emp_id=15;

SELECT * FROM employee;

SELECT *
FROM employee
WHERE YEAR(join_date)=YEAR(CURDATE());

SELECT *
FROM employee
WHERE MONTH(join_date)=MONTH(CURDATE());

SELECT emp_name, join_date,
DATEDIFF(CURDATE(),join_date)
FROM employee;

SELECT emp_name, join_date,
DATE_ADD(join_date, INTERVAL 30 DAY)
FROM employee;

SELECT *
FROM employee
WHERE join_date='2020-01-01';

SELECT *
FROM department
ORDER BY salary DESC;

SELECT e.emp_name, d.dept_name, d.salary
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
ORDER BY d.dept_name, d.salary;

SELECT e.emp_name, d.salary
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
ORDER BY salary DESC;

SELECT *
FROM department
ORDER BY salary DESC
LIMIT 5;

SELECT COUNT(*) FROM employee;

SELECT d.dept_name, COUNT(e.emp_id)
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
GROUP BY d.dept_name;

SELECT MAX(salary) FROM department;

SELECT MIN(salary) FROM department;

SELECT AVG(salary) FROM department;

SELECT SUM(salary) AS total_salary_expenditure
FROM department;

SELECT dept_name, COUNT(dept_name)
FROM department
GROUP BY dept_name
HAVING COUNT(dept_name)>3;

SELECT SUM(salary)/COUNT(salary)
FROM department;

SELECT dept_name, AVG(salary)
FROM department
GROUP BY dept_name
HAVING AVG(salary)>60000;

SELECT e.emp_name, d.salary
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
WHERE salary=(SELECT MAX(salary) FROM department);

SELECT *
FROM department
ORDER BY salary DESC
LIMIT 2;

SELECT *
FROM department
ORDER BY salary DESC
LIMIT 3;

SELECT emp_name, COUNT(*) AS duplicate_names
FROM employee
GROUP BY emp_name
HAVING COUNT(*)>1;

SELECT e.emp_name, d.salary
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
WHERE d.salary>(SELECT AVG(salary) FROM department);

SELECT e.emp_name, d.salary
FROM employee e
JOIN department d
ON e.emp_id=d.emp_id
WHERE d.salary<(SELECT AVG(salary) FROM department);

UPDATE department
SET salary=salary+(salary*0.10)
WHERE dept_name='IT';

SELECT *
FROM department
WHERE dept_name='IT';

UPDATE employee
SET email='hema12@gmail.com'
WHERE emp_id=5;

SELECT * FROM employee;

DELETE FROM department
WHERE salary<20000;

DELETE FROM employee
WHERE join_date<'2020-01-01';

START TRANSACTION;

INSERT INTO employee (emp_id, emp_name, email, join_date)
VALUES (16,'Ravi','ravi@gmail.com','2024-06-10');

ROLLBACK;

START TRANSACTION;

INSERT INTO employee(emp_id, emp_name, email, join_date)
VALUES (16,'Ravi','ravi@gmail.com','2024-06-10');

COMMIT;
