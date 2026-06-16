create view emp as select name,department,company from employee;
 show full tables;
 alter view emp as select * from employee;
 select department,count(*) from employee group by department;
 create view second_highest_salary as select salary from employee order by salary desc limit 1 offset 1;
  select * from second_highest_salary;
  create view avg_salary as select salary from employee group by salary;
  select * from avg_salary;
  drop view avg_salary;
  create view avg_salary as select avg(salary) from employee group by salary;
  select * from avg_salary;
  show full tables;
  create view sales_data as select s.*,b.price from sales s inner join bills b on s.sale_id=b.sale_id where b.price>=1000;
  select * from sales_data;
  
