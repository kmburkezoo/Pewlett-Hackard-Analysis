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

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retirement_info