-- drop table employees cascade; 
create table if not exists employees
	(emp_no int not null,
	 birth_date date not null,
	 first_name varchar not null,
	 last_name varchar not null,
	 gender varchar not null,
	 hire_date date not null,
	 primary key (emp_no)
	 )
;
select * from employees;

-- drop table dept_manager cascade;
create table if not exists dept_manager
	(dept_no varchar(4) not null,
	emp_no int not null,
	 from_date date not null,
	 to_date date not null,
	foreign key(emp_no) references employees(emp_no),
	foreign key(dept_no) references departments(dept_no),
	 primary key(emp_no)
	)
;
select * from dept_manager;

create table if not exists salaries
	(emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key(emp_no) references employees(emp_no),
	primary key (emp_no)
	)
;
select * from salaries;

-- drop table dept_emp cascade;
create table if not exists dept_emp
	(emp_no int not null,
	dept_no varchar not null,
	from_date date,
	to_date date,
	foreign key(emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
	)
;
select * from dept_emp;

-- drop table titles;
create table if not exists titles
	(emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	 foreign key(emp_no) references employees(emp_no)
	)
;
select * from titles;


