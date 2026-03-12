USE SQL_EMPLOYEE_PROJECT;

-- 1. How many different job roles exist in each department?
-- ========================================================
select jobdept, COUNT(name) AS no_of_job_roles
from jobdepartment 
group by jobdept
order by no_of_job_roles desc;


-- 2. What is the average salary range per department?
-- ==================================================
select jd.jobdept,avg(sb.amount) as average_salary
from jobdepartment jd
join salarybonus sb on 
jd.job_id = sb.job_id
group by jd.jobdept
order by average_salary desc;

-- 3. Which Job roles offer the highest salary?
-- ===========================================
select jd.name as job_role, 
sb.amount as salary
from JobDepartment jd
join SalaryBonus sb
on jd.job_id = sb.job_id
order by sb.amount desc;


-- 4. Which departments have the highest total salary allocation?
-- =============================================================
SELECT jobdept, total_salary
FROM (
    SELECT jd.jobdept, SUM(sb.amount) AS total_salary,
	RANK() OVER (ORDER BY SUM(sb.amount) DESC) AS dept_rank
    FROM jobdepartment jd
    JOIN salarybonus sb ON jd.job_id = sb.job_id
    GROUP BY jd.jobdept
    ) ranked_dept
WHERE dept_rank = 1;