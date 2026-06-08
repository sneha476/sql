-- # query within query
select * from employee where salary=(select max(salary) from employee);
select * from employee where salary>=(select max(salary) from employee);
select * from employee where salary<=(select max(salary) from employee);

select * from employee where salary=(select min(salary) from employee);
select * from employee where salary<=(select min(salary) from employee);
select * from employee where salary>=(select min(salary) from employee);

select * from employee where salary=(select avg(salary) from employee);
select * from employee where salary>=(select avg(salary) from employee);
select * from employee where salary<=(select avg(salary) from employee);

select * from employee where salary=(select count(salary) from employee);
select * from employee where salary>=(select count(salary) from employee);
select * from employee where salary<=(select count(salary) from employee);

select * from employee where salary=(select sum(salary) from employee);
select * from employee where salary>=(select sum(salary) from employee);
select * from employee where salary<=(select count(salary) from employee);


