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
select count(emp_no) from unique_titles;

select
	title,
	count(emp_no)
into retiring_titles
from unique_titles
group by title
order by 2 desc
;
select * from retiring_titles;

/*
by department instead of title
*/

select
	d.dept_name,
-- 	ut.title,
	count(ut.emp_no)
from unique_titles ut
	join dept_emp de
		on ut.emp_no = de.emp_no
		and de.to_date = '9999-01-01'
	join departments d
		on de.dept_no = d.dept_no
group by 
	d.dept_name/*,
	ut.title*/
order by 2 desc
;


/*
Deliverable 2
*/
select
distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	t.to_date,
	t.title
into mentorship_eligibility
from employees e
	join dept_emp de
		on e.emp_no = de.emp_no
	join titles t
		on e.emp_no = t.emp_no
where e.birth_date between '1965-01-01' and '1965-12-31'
	and de.to_date = '9999-01-01'
order by 
	e.emp_no,
	t.to_date desc
;
select count(*) from mentorship_eligibility;

--distribution of eligible mentors by department and role
select 
	d.dept_name,
-- 	me.title,
	count(distinct me.emp_no)
from mentorship_eligibility me
	join dept_emp de
		on me.emp_no = de.emp_no
		and de.to_date = '9999-01-01'
	join departments d
		on de.dept_no = d.dept_no
-- where me.title like 'Senior%' or me.title like '%Lead%'-- or me.title like '%Manager%'
group by d.dept_name--, me.title
order by 1--,3 desc
;

--eligible mentors vs non-retiring employees by department
create view mentorship_by_dept_vw as
(
select 
	d.dept_name,
	count(ut.emp_no) non_mentor_retirees,
	count(me.emp_no) mentors,
	count(e.emp_no) mentees
from dept_emp de
	left join mentorship_eligibility me
		on de.emp_no = me.emp_no
	left join unique_titles ut
		on de.emp_no = ut.emp_no
		and ut.emp_no not in (select emp_no from mentorship_eligibility)
	left join employees e
		on de.emp_no = e.emp_no
		and e.birth_date > '1955-12-31'
	join departments d
		on de.dept_no = d.dept_no
where de.to_date = '9999-01-01'
group by dept_name
order by 1
)
;
/*
are there really only january birthdays in this pool?
yes. queries are correct but data is suspect
*/
select distinct birth_date 
from employees e
	join dept_emp de
		on e.emp_no = de.emp_no
where (e.birth_date between '1965-01-01' and '1965-12-31')
	and de.to_date = '9999-01-01'
;

select count(emp_no) from unique_titles; --72458;
select count(emp_no) from dept_emp where to_date = '9999-01-01';--240124

72458/240124