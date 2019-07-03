-- A4용지 앞뒷면 한장짜리 문제 24개 (HRDB의 HR) + 12개 (HRDB의 북스)

select * from Countries;
select * from Departments;
select * from Employees;
select * from EMP;
select * from Job_history;
select * from Job;
select * from Locations;
select * from Regions;

-- 1.
select last_name, employee_id, salary 
from Employees
where salary >= 12000;

-- 2.
select last_name, employee_id, department_id 
from Employees
where employee_id = 176;

-- 3.
select last_name, salary 
from Employees
where salary not between 5000 and 12000;

select last_name, salary 
from Employees
where salary < 5000 or salary > 12000;

-- 4. EMP 테이블 참조
select last_name, hire_date, employee_id
from Employees
where hire_date between '2005-02-20' and '2005-05-01';

select ENAME, EMPNO, HIREDATE
from EMP
where HIREDATE between '1998-02-20' and '1998-05-01';


-- ---------------------------------------------------------
select * from Countries;
select * from Departments;
select * from Employees;
select * from EMP;
select * from Job_history;
select * from Job;
select * from Locations;
select * from Regions;
-- ---------------------------------------------------------


-- 5.
select last_name, department_id
from Employees
where department_id in (20, 50)
order by last_name
;

-- 6.
select last_name, department_id, salary
from Employees
where department_id in (20, 50)
and salary between 5000 and 12000
order by 3,2,1
;
-- 성과 부서번호의 정렬 방식으로 인해 연봉이 제대로 정렬되지 않음.
-- 연봉 정렬을 우선시 하려면 3,2,1 형태로 순서 바꿈

-- ---------------------------------------------------------
select * from Countries;
select * from Departments;
select * from Employees;
select * from EMP;
select * from Job_history;
select * from Job;
select * from Locations;
select * from Regions;
-- ---------------------------------------------------------


-- 7. EMP 테이블 참조
select last_name, hire_date 
from Employees
where hire_date between '2005-01-01' and '2005-12-31'
order by hire_date;

select ENAME, HIREDATE
from EMP
where HIREDATE like ('1994%');

-- 8. null이 먹통이라 대체
select last_name, job_id 
from Employees
where manager_id = '';

select last_name, job_id 
from Employees
where manager_id is null;

-- 9. null이 먹통이라 대체
select last_name, salary, commission_pct
from Employees
where commission_pct <> ''
order by salary desc, commission_pct desc; 

-- 10.
select last_name
from Employees
where last_name like ('___a%');

-- 11.
select distinct last_name
from Employees
where last_name like ('%a%e%') or ('%e%a%') or ('%a%') or ('%e%');

select distinct last_name
from (
select last_name
from Employees
where last_name like ('%a%e%')
union
select last_name
from Employees
where last_name like ('%e%a%')
union
select last_name
from Employees
where last_name like ('%a%')
union
select last_name
from Employees
where last_name like ('%e%')
) a
;

-- ---------------------------------------------------------
select * from Countries;
select * from Departments;
select * from Employees;
select * from EMP;
select * from Job_history;
select * from Job;
select * from Locations;
select * from Regions;
-- ---------------------------------------------------------

-- 12.
select *
from Employees
where salary not in ('2500', '3500','7000')
and job_id in ('SA_REP', 'ST_CLERK');

-- 14. (13번 없음)
select a.last_name, a.department_id, b.department_name
from Employees a 
left join (select * from Departments) b
on a.department_id = b.department_id;

-- 15.
select distinct job_id 
from Employees
where department_id = '30' or '90';

-- 16. 미완결
select a.last_name, b.department_name, b.location_id, c.city
from Employees a
left join Departments b on a.department_id = b.department_id
left join Locations c on b.location_id = c.location_id
where a.commission_pct <> '';

select * from Employees;
select * from Departments;
select * from Locations;

-- 17. 미완결
select a.last_name, b.department_name, b.location_id, c.city
from Employees a
left join Departments b on a.department_id = b.department_id
left join Locations c on b.location_id = c.location_id
where a.commission_pct <> '' and c.city = 'Seattle';

-- 18. 완결
select a.last_name, b.hire_date
from Employees a left join Employees b 
on a.manager_id = b.employee_id
where a.hire_date < b.hire_date;



-- 19.


-- 20.

-- 21.
select job_id, count(job_id) 사원수
from Employees
group by 1;

-- 22.
select count(distinct manager_id)
from Employees;









-- 23. 쿼리는 맞는데 max, min 제대로 못 잡아냄
select employee_id, max(salary), min(salary), max(salary)-min(salary) salary_gap, round(avg(salary),1)
from Employees group by 1;


-- round(avg(salary)) vs. round(avg(salary),1) vs. round(avg(salary),2)
-- 컴마 뒤 숫자는 소수점 이하 n자리 의미


-- 각 부서 별 사원수

select * from Employees;
select * from Departments;

select department_id, count(*) 
from Employees
group by 1 order by 1, 2 desc;


-- 24. 미완성
select manager_id, min(salary)
from Employees
where manager_id <> ''
group by manager_id;

-- -----------------------------------------------------------------
select * from Books;
select * from Customers;
select * from Orders;

-- 1.
select bookname, price from Books;
-- 1b.
select price, bookname from Books;
-- 2.
select bookid, bookname, publisher, price from Books;
-- 2b.
select * from Books;
-- 3.
select publisher from Books;
-- 3b.
select distinct publisher from Books;
-- 4.
select name 이름, phone 전화번호 from Customers;
-- 4b.
select count(distinct name) 고객수 from Customers;




-- 5. concat!!
#select name, phone, name&' 고객의 전화번호는 '&phone&'입니다' sentence from Customers;
select name, phone, concat(name,' 고객의 전화번호는 ',phone,'입니다') sentence from Customers;




select * from Customers;
select name&address from Customers;

-- 6.
select * from Books where price < 20000;
-- 7.
select * from Books where price between 15000 and 25000;
-- 8.
select * from Books where bookname in ('축구의 역사', '피겨 교본');
-- 9.
select * from Books where bookname like ('축구%');
-- 9b.
select * from Books where bookname like ('%축구');
-- 9c.
select * from Books where bookname like ('%축구%');
-- 10.
select * from Books where bookname like ('%골프%') and price >= 30000;
-- 11.
select name, address from Customers
order by 1, address desc;
-- 11b.
select price, bookname from Books
order by 1 desc, 2;
-- 12.
select sum(price), avg(price), sum(price)/count(*), max(price), min(price) from Books;

-- -------------------------------------- test의 productlines 관련
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;



-- 1.
select * from employees;
-- 1.2
select * from customers;
-- 1.3
select * from products;
-- 2.
select lastName, firstName, jobTitle from employees;
-- 3.
select distinct lastName from employees;
-- 4.
select distinct city, state from customers
where city is not null and state is not null
order by 1,2;
-- distinct 앞에 걸면 뒤에 다 걸림 (뒤에다 별도로 못 검 <- 에러남)
-- distinct 걸려 있는 놈만 적용되고 나머진 첫번째 제외하고 짤리는거 아님

select city, state from customers
where city is not null and state is not null
order by 1,2;


-- 5.
select count(distinct state) from customers;

select count(distinct state) from customers
where country = 'USA';
-- 5-2. 
select count(*) from customers
where country = 'Australia';
-- 6.
select * from customers
order by creditLimit desc limit 5;

/* pgsql> select * from table order by idx desc limit 10 
offset 11 
포스트 그레스에선 이렇게 해주는데요... 
mysql 에선 limit 11,10 으로 줘야 할겁니다. */

-- limit x,y : 상위 x개 이후, y개 출력

-- 6-2.
select * from customers
order by creditLimit desc limit 5,5; -- 앞에 숫자 유의

select customerNumber from customers
order by creditLimit desc;

select customerNumber from customers
order by creditLimit desc limit 5,5; -- 앞에 숫자 유의

-- 6-3.
select * from customers
order by creditLimit desc limit 10,10;

-- 7.
select * from employees
where jobTitle = 'Sales Rep' and officeCode = 1;

-- 8.
select * from employees
where jobTitle <> 'Sales Rep' and officeCode >= 5;

-- 9.
select contactLastName, contactFirstName from customers
order by contactFirstName, contactLastName;

-- 10.
select orderNumber, quantityOrdered, priceEach, quantityOrdered*priceEach subtotal  
from orderdetails
order by subtotal /*quantityOrdered*priceEach*/ 
desc;

-- 11.
select * from customers
where country='USA' and state='CA' and creditLimit>=100000
order by creditLimit desc;

-- 12.
select * from customers
where country in ('USA','France');

-- 13. 주문테이블에서 주문번호가 10165, 10287, 10310인 주문의 주문번호 고객번호 상태 선적일자를 조회하세요.


-- 14.
select * from products
where buyPrice ;

-- 15.
select * 
from orders 
where requiredDate like '2003-01%';

select * 
from orders;


-- 16.
select lastName, firstName from employees
where firstName like ('A%') or lastName like ('A%');

-- 17.
select lastName, firstName from employees
where firstName like ('%on') or lastName like ('%on');

-- 18.
select lastName, firstName from employees
where firstName like ('T_m');

-- 18.2.
select lastName, firstName from employees
where firstName like ('J___e');

-- 19.
select * from customers 
where salesRepEmployeeNumber is null;

















