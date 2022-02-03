-- SELECT count(ret.*)
-- from
-- (select distinct first_name, last_name
-- FROM employees
-- WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
-- ) ret
;
-- select first_name, last_name, birth_date
-- from employees 
-- WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- select *
-- from employees
-- where 
-- 	(birth_date between '1952-01-01' AND '1955-12-31')
-- 	and (hire_date between '1985-01-01' AND '1988-12-31')
-- ;

-- SELECT COUNT(first_name)
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- SELECT first_name, last_name
-- INTO retirement_info
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- select * from retirement_info;

-- SELECT 
-- 	e.emp_no, 
-- 	e.first_name, 
-- 	e.last_name,
-- 	e.gender,
-- 	s.salary,
-- 	de.to_date
-- INTO emp_info
-- FROM employees e
-- 	join salaries s
-- 		on e.emp_no = s.emp_no
-- 	join dept_emp de
-- 		on e.emp_no = de.emp_no
-- WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- 	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
-- 	and de.to_date = '9999-01-01'
-- ;


-- select  
-- 	dm.dept_no,
-- 	d.dept_name,
-- 	dm.emp_no,
-- 	ce.last_name,
-- 	ce.first_name,
-- 	dm.from_date,
-- 	dm.to_date
-- into manager_info
-- from dept_manager dm
-- 	join departments d
-- 		on dm.dept_no = d.dept_no
-- 	join current_emp ce
-- 		on dm.emp_no = ce.emp_no 
;

-- select
-- 	ce.emp_no,
-- 	ce.first_name,
-- 	ce.last_name,
-- 	d.dept_name/*,
-- 	de.from_date,
-- 	de.to_date*/
-- into dept_info
-- from current_emp ce
-- 	join dept_emp de
-- 		on ce.emp_no = de.emp_no
-- 	join departments d
-- 		on de.dept_no = d.dept_no

-- select *
-- from departments d
-- where lower(d.dept_name) like '%sales%'
-- ;
-- select count(t.*) from(
select
	ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
from departments d
	join dept_emp de
		on d.dept_no = de.dept_no
		and d.dept_name = 'Sales'
	join current_emp ce
		on de.emp_no = ce.emp_no
-- ) t
;

select
	ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
from departments d
	join dept_emp de
		on d.dept_no = de.dept_no
		and d.dept_name in ('Sales', 'Development')
	join current_emp ce
		on de.emp_no = ce.emp_no 