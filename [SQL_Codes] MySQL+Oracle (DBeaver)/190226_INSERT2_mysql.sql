-- COP (Customers & Orders & Products) -----------------------------------------------------
고객 테이블
CREATE TABLE Customers (
	cuid	char(10)	primary key,
	cname	varchar(10)	not null,
	age		int			not null,
	grade	varchar(6)	not null,
	job		varchar(6),
	mileage	int			default 0
);

-- 제품 테이블
CREATE TABLE Products (
	prdno	char(5)		primary key,
	prdname	varchar(10)	not null,
	stock	int			default 0,
	price	int			default 0,
	maker	char(10)	not null
);

-- 주문 테이블
CREATE TABLE Orders (
	ordno	char(3)		primary key,
	cuid	char(10)	not null,
	prdno	char(3)		not null,
	amount	int			not null,
	addr	varchar(20)	not null,
	orddate	datetime	not null,
	foreign key (cuid) 
		references Customers (cuid),
	foreign key (prdno)
		references Products (prdno)
);

-- 학사관리 -----------------------------------------------------------------------------
CREATE TABLE Students (
	stdno		int			 	primary key,
	name		varchar(10)		not null,
	addr		varchar(20)	 	not null,
	age			int			 	not null,
	birth		varchar(10)	 	not null,
	mjname	 	varchar(20) 	not null,
	prof		int		 		not null,
	mttime		char(10)		not null,
	foreign key (mjname)
		references Majors (mjname),
	foreign key (prof)
		references Professors (prof)
);

CREATE TABLE Majors (
	mjname	 	varchar(20)	primary key,
	tel			char(13)	not null,
	office		char(10)	not null,
	prof		int			not null,
	mkdate		char(10)	not null,
	foreign key (prof)
		references Professors (prof)
);

CREATE TABLE Subjects (
	subjno			char(4)		primary key,
	subjname 		varchar(20) not null,	
	summary			varchar(45) not null,
	prof			int			not null,
	foreign key (prof)
		references Professors (prof)
);

CREATE TABLE Professors (
	prof		int			primary key,
	name		char(10)	not null,
	major		varchar(20)	not null
);

CREATE TABLE Sections (
	prof	int,
	sec		int,
	primary key (prof, sec)
	/* foreign key (subjno)
		references Subjects (subjno) 이건 원 테이블이 삐꾸라 생략하자 */ 
);

-- 등록
-- 학번, 과목번호를 합쳐서 그룹 자체를 주키로 설정
-- 따라서, 학번, 과목번호 각각에 대해서는 외래키 설정 가능
-- *주키는 외래키가 될 수 없음에 유의
CREATE TABLE Registers (
	stdno	int,
	subjno	char(4),
	primary key (stdno, subjno),
	foreign key (stdno)
		references Students (stdno),
	foreign key (subjno)
		references Subjects (subjno)
);

CREATE TABLE Techs (
	prof	int,
	tech	varchar(45),
	primary key (prof, tech),
	foreign key (prof)
		references Professors (prof)
);

-- HR -------------------------------------------------------------------------------------------
-- 직업이력정보 
-- 주의할 점은, employee_id가 foreign key로 설정이 되어야 하기 때문에
-- 단독으로 primary key 설정하면 안됨
CREATE TABLE Job_history (
	employee_id		int,			-- primary key,
	start_date		date,
	end_date		date,
	job_id			varchar(15),
	department_id	int,
	primary key (employee_id, job_id),
	foreign key (job_id)
		references Jobs (job_id),
	foreign key (department_id)
		references Departments (department_id),
	foreign key (employee_id)
		references Employees (employee_id)
);

-- 직업정보
CREATE TABLE  Jobs (
	job_id		varchar(15)		primary key,
	job_title	varchar(50),
	min_salary	int,
	max_salary	int
);

-- 부서정보
CREATE TABLE  Departments (
	department_id		int		primary key,
	department_name		varchar(25),
	manager_id			int,
	location_id			int,
	foreign key (location_id)
		references Locations (location_id)
);

-- 사원정보
CREATE TABLE Employees (
	employee_id		int			primary key,
	first_name		varchar(20),
	last_name		varchar(20),
	email			varchar(20),
	phone_number	varchar(20),
	hire_date		date,
	job_id			varchar(15),
	salary			int,
	commission_pct	decimal(5,2),
	manager_id		int,
	department_id	int,
	foreign key (job_id)
		references Jobs (job_id),
	foreign key (manager_id)
		references Employees (employee_id),
	foreign key (department_id)
		references Departments (department_id)
);

-- 위치정보
CREATE TABLE Locations (
	location_id		int		primary key,
	street_address	varchar(50),
	postal_code		varchar(30),
	city			varchar(50),
	state_province	varchar(25),
	country_id		char(2),
	foreign key (country_id)
		references Countries (country_id)
);

-- 국가정보
CREATE TABLE Countries (
	country_id		char(2)			primary key,
	country_name	varchar(50),
	region_id		int,
	foreign key (region_id)
		references Regions (region_id)
);

-- 지역정보
CREATE TABLE Regions (
	region_id		int			primary key,
	region_name		varchar(50)	
);


-- 







