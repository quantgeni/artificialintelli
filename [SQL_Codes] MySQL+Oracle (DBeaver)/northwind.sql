select * from Categories;
select * from CustomerCustomerDemo;
select * from CustomerDemographics;
select * from Customers;
select * from EmployeeTerritories;
select * from Employees;
select * from `Order Details`;
select * from Orders;
select * from Products;
select * from Region;
select * from Shippers;
select * from Suppliers;
select * from Territories;

-- 1.
select * from Customers;
-- 2.
select CompanyName, City from Customers;
-- 3.
select distinct City from Customers where City is not null;
-- 4.
select count(distinct City) from Customers;
-- 5.
select distinct CompanyName from Customers where Country='Mexico';
-- 6.
-- 7.
select distinct CompanyName from Customers where Country='Germany' and City='Berlin';
-- 8.
select distinct CompanyName from Customers where City in ('Berlin','Munchen');
-- 9.
select distinct CompanyName from Customers where Country in ('Germany','Spain');
-- 10.
select distinct CompanyName from Customers where Country<>'Germany';
-- 11.
select distinct CompanyName from Customers where Country='Germany' and City in ('Berlin','Munchen');
-- 12.
select distinct CompanyName from Customers where Country not in ('Germany','USA');
select distinct CompanyName from Customers where Country not in ('Germany') and Country not in ('USA');
-- 위 2개가 동일한 의미의 문법. 밑에는 다른 위 2개와 다름.

select distinct CompanyName from Customers where Country not in ('Germany') or Country not in ('USA');
-- 13.
select * from Customers order by Country;
-- 14.
select * from Customers order by Country desc;
-- 15.
select * from Customers order by Country, CompanyName;
-- 16.
select * from Customers order by Country, CompanyName desc;
-- 17.
/*
insert into Customers 
(cuid, cname, age, grade, job, mileage)
values 
('apple', '정소화', 20, 'gold', '학생', 1000),
('banana', '김선우', 25, 'vip', '간호사', 2500),
('carrot', '고명석', 28, 'gold', '교사', 4500),
('orange', '김용욱', 22, 'silver', '학생', 0),
('melon', '성원용', 35, 'gold', '회사원', 5000),
('peach', '오형준', NULL, 'silver', '의사', 300),
('pear', '채광주', 31, 'silver', '회사원', 500)
;*/

insert into Customers 
(CustomerID,CompanyName,ContactName,Address,City,PostalCode,Country)
values 
('', 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- 18.
insert into Customers 
(CustomerID,City,Country)
values 
('','Cardinal','Stavanger','Norway');
-- 19.
select CompanyName,ContactName,Address
from Customers
where Address is null;
-- 20.
select CompanyName,ContactName,Address
from Customers
where Address is not null;
-- 21.
select * from Customers;

update Customers
set CompanyName='Alfred Schmidt',City='Frankfurt'
where CustomerNO=1;
-- 22.
update Customers
set ContactName='Juan' where City='Mexico';
-- 23.
delete from Customers
where ContactName='Alfreds Futterkiste';
-- 24.
select * from Customers
order by CompanyName
limit 2,5;


-- 25.
select * from Customers
where Country='Germany'
limit 2,5;
-- 26.
select 
	max(UnitPrice),
	min(UnitPrice) 
from Products;
-- 27.
select 
	count(distinct ProductName) 제품수, 
	avg(UnitPrice) 평균가격
from Products;
-- 28.
select *
from Products
where UnitPrice>=20;
-- 29.
select 
	count(*), 
	sum(Quantity) 
from `Order Details`;
-- 30.
select * from Customers
where CompanyName like ('A%');
-- 31.
select * from Customers
where CompanyName like ('%a');
-- 32.
select * from Customers
where CompanyName like ('%or%');
-- 33.
select * from Customers
where CompanyName like ('_r%');
-- 34.
select * from Customers
where CompanyName like ('A__%');
-- 35.
select * from Customers
where CompanyName not like ('A%');
-- 36.
select * from Customers
where City like ('ber%');
-- 37.
select * from Customers
where City like ('%es%');
-- 38.
select * from Customers
where City like ('L_n_on');
-- 39.
select * 
from Customers
where City like ('b%') 
or City like ('s%') 
or City like ('p%');




select * 
from Customers
where City regexp '^[bsp]';
-- 정규표현식을 이용한 검색
-- ^	: 문자열의 처음을 의미
-- $	: 문자열의 끝을 의미
-- []	: 중괄호 안의 각 문자를 의미
-- [^]	: 중괄호 안의 각 문자는 제외
select * 
from Customers
where City not regexp '^[bsp]';
select * 
from Customers
where City regexp '^[^bsp]';
-- 위 2개는 같은거


.

-- 40.
select * 
from Customers
where City like ('a%') 
or City like ('b%') 
or City like ('c%');



select * 
from Customers
where City regexp '^[a-c]';
-- a와 c 사이로 시작하는...




-- 41.
select * 
from Customers
where City not like ('b%') 
AND City not like ('s%') 
AND City not like ('p%');
-- 42.
select * 
from Customers
where Country in ('Germany', 'France', 'UK');
-- 43.
select * 
from Customers
where Country not in ('Germany', 'France', 'UK');
-- 44.
select *
from Products
where UnitPrice between 10 and 20;
-- 45.
select *
from Products
where UnitPrice between 10 and 20
and ProductID not in (1,2,3);
-- 46.
select *
from Products
where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';
-- 47.
select *
from Products
where ProductName not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';
-- 48.
select *
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'; 
-- 49.
select 
	CustomerID ID, 
	CompanyName Customer 
from Customers;
-- 50.
select 
	CustomerID, 
	concat(
	Address, 
	PostalCode, 
	City, 
	Country) Address
from Customers;
-- 51.
select Country, count(distinct CompanyName) from Customers
where Country is not null
group by 1;
-- 52.
select Country, count(distinct CompanyName) from Customers
where Country is not null
group by 1
having count(distinct CompanyName) >=5;
-- 53.
select Customers
join 

select 
	OrderID,
	CompanyName,
	OrderDate
from Customers
join Orders using (CustomerID);
-- 54.
select 
	OrderID, 
	c.CompanyName, 
	ShipperID 
from Customers c
join Orders o using (CustomerID)
join Shippers s on o.ShipVia=s.ShipperID;
-- 55.
select s.CompanyName, count(OrderID)
from Orders o 
join Shippers s on o.ShipVia=s.ShipperID
group by 1;
-- 56.
select s.CompanyName, count(OrderID)
from Orders o 
join Shippers s on o.ShipVia=s.ShipperID
group by 1
having count(OrderID)>=10;
-- 57.
select LastName, count(OrderID) from Employees
join Orders using (EmployeeID)
where LastName in ('Davolio','Fuller')
group by 1
having count(OrderID)>=25;
-- 58.
select distinct(CompanyName) from Customers
left join Orders using (CustomerID)
where OrderID is null;
-- 59.
select * from Employees
left join Orders using (CustomerID)
where OrderID is null;
-- 60.
select CompanyName,Country from Customers
order by Country;
-- 61.
-- 62.
-- 63.
-- 64.
select first_name, last_name, salary from Employees
where round(salary) > (select round(salary) from Employees where first_name='Janette' and last_name='King');



select * from Employees where first_name='Janette' and last_name='King';

select department_id, avg(salary)
from Employees
group by 1
;

select e.first_name, e.last_name, d.department_name
from Employees e join Departments d using (department_id)
where department_id=50;


create view emp_dept2
as 

select e.employee_id, e.last_name, e.first_name, d.department_name from Departments d inner join Employees e 
on d.department_id=e.department_id;

select * from emp_dept2;


select * from SALGRADE;
select * from BONUS;
select * from EMP;
select * from DEPT;


오픈북 3/7일 시험

-- 전체적으로, (중요하지 않을 수 있지만) 대소문자 구분은 시험 문제지 데이터를 기준으로 함

-- 1.
select 
	empno 사번, 
	ename 이름, 
	round(comm) 커미션
from EMP
where round(comm) in (300,500,1400);

-- 단, 본 답안에서 round() 함수가 필수는 아님

-- 2.
select
	empno 사번, 
	ename 이름, 
	round(sal) 월급여
from EMP
where round(sal) not between 1200 and 3500;



-- 3.
select 
	deptno 부서번호, 
	avg(round(sal)) 월급여평균
from EMP 
where round(sal)>=1000
group by 1
having 월급여평균>=2000;
	

-- 4.
select 
	e.ename 사원명,
	d.dname 부서명
from EMP e 
join DEPT d using (deptno);
	
-- 5.

select 
	e.ename 사원명,
	e.comm 커미션,
	d.dname 부서이름,
	d.loc 부서위치
from EMP e 
join DEPT d using (deptno)
where e.comm is not null;
	
-- 6.
select 
	ename 사원명,
	deptno 부서번호
from EMP
where deptno=(select deptno from EMP where ename='ALLEN')
and ename<>'ALLEN';









