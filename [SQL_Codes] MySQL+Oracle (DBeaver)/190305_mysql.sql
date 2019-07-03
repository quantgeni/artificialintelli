-- 1.
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;

select lastName, firstName from employees where officeCode 
in (select officeCode from offices where country='USA');

select lastName, firstName from employees e where
exists (select officeCode from offices o where country='USA' and e.officeCode=o.officeCode);

-- 2.

select * from payments where amount = (select max(amount) from payments);

-- 3.

select count(distinct customerName) from customers
where customerNumber not in ( 
select customerNumber from orders);

select count(distinct customerName) from customers c
left join orders o using (customerNumber)
where o.orderNumber is null;

select count(customerName) from customers
where customerNumber not in ( 
select customerNumber from orders);

select count(customerName) from customers c
left join orders o using (customerNumber)
where o.orderNumber is null;


select count(customerName) from customers c
where not exists ( 
select customerNumber from orders o where c.customerNumber=o.customerNumber);


select count(customerName) from customers c
where not exists ( 
select customerNumber from orders o);


select * from customers c
where not exists ( 
select customerNumber from orders o where c.customerNumber=o.customerNumber);



select * from orders;

-- 4.

-- 5.

-- 6.
select 
	employee_id, 
	salary, 
	(select round(avg(salary)) from Employees) comparison, 
	round((salary-(select round(avg(salary)) 
	from Employees))) gap 
from Employees
where salary > (select round(avg(salary)) from Employees) 
order by gap desc;


select round(avg(salary)) from Employees; 

-- 7.

-- 8.
select last_name, salary, manager_id from Employees
where manager_id in (select employee_id from Employees
where last_name='King') order by manager_id desc;

-- 9.

-- 10.

select employee_id, last_name, salary
from Employees
where salary>(select round(avg(salary)) from Employees)
and department_id in (select distinct department_id from Employees
where last_name like ('%u%'));


select employee_id, last_name, salary
from (select * from Employees where salary > (select round(avg(salary)) from Employees))x
where department_id in (select distinct department_id from Employees
where last_name like ('%u%'))
order by salary desc;

select count(*)
from (select * from Employees where salary > (select round(avg(salary)) from Employees))x
where department_id in (select distinct department_id from Employees
where last_name like ('%u%'))
order by salary desc;



select max_salary from Jobs where job_id = 'SA_MAN';

;


select count(*)
from Employees
where salary>(select round(avg(salary)) from Employees)
and department_id in (select distinct department_id from Employees
where last_name like ('%u%'));



select round(avg(salary) from Employees







-- 11, 12.

select LAST_NAME, JOB_ID, salary,
(select max(salary) from Employees where job_id='SA_MAN') comparison,
round(salary-(select max(salary) from Employees where job_id='SA_MAN')) gap
from Employees
where salary > round((select max(salary) from Employees where job_id='SA_MAN'));

select LAST_NAME, JOB_ID, salary,
(select max(salary) from Employees where job_id='SA_MAN') comparison,
round(salary-(select max(salary) from Employees where job_id='SA_MAN')) gap
from Employees
where salary > (select max(salary) from Employees where job_id='SA_MAN');

select * from Employees;

select round(max(salary)) from Employees where job_id='SA_MAN';


select LAST_NAME, JOB_ID, salary,
(select max(salary) from Employees where job_id='SA_MAN') as comparison
from Employees;

select LAST_NAME, JOB_ID, salary,
(select max(salary) from Employees where job_id='SA_MAN') comparison,
round(salary-(select max(salary) from Employees where job_id='SA_MAN')) gap
from Employees
where salary > 14000;

-- 13.
select * from Departments
where location_id in (
select location_id from Locations where city like 'T%');





--------------------
select * from Products;
select * from Orders;

select prdname, maker from Products p 
where exists (select * from Orders o
where cuid = 'banana' and p.prdno = o.prdno);

select prdname, maker from Products p 
where exists (select * from Orders o
where cuid = 'banana');


select * from Orders o
where cuid = 'banana';

select * from Orders o
where p.prdno = o.prdno and cuid = 'banana';


