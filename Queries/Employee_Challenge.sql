select
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from employees e
	join titles t
		on e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
-- and exists --112049
-- 	(select null 
-- 	 from dept_emp de 
-- 	 where e.emp_no = de.emp_no 
-- 	 and de.to_date = '9999-01-01')
order by 1
;

select distinct 
on (emp_no) emp_no,
	first_name,
	last_name,
	title,
	to_date
into unique_titles
from retirement_titles
where to_date = '9999-01-01'
order by 
	emp_no,
	to_date desc
;

select
	title,
	count(emp_no)
into retiring_titles
from unique_titles
group by title
order by 2 desc
;
