USE SQL_EMPLOYEE_PROJECT;

-- 1. How many unique employees are currently in the system?
-- =========================================================
select count(*) as total_employees from Employee;


-- 2. Which departments have the highest number of employees?
-- ==========================================================
SELECT jd.jobdept,
       COUNT(e.emp_ID) AS employee_count
FROM Employee e
JOIN JobDepartment jd ON e.Job_ID = jd.Job_ID
GROUP BY jd.jobdept
ORDER BY employee_count DESC;


-- 3. What is the average salary per department?
-- ============================================
select jd.jobdept,avg(sb.amount) as avg_salary
from employee e
join JobDepartment jd on e.job_id = jd.job_id
join SalaryBonus sb on jd.job_id = sb.job_id
group by jd.jobdept
order by avg_salary desc; 


-- 4. Who are the top 5 highest-paid employees?
-- ===========================================
select e.firstname, e.lastname, sb.amount
from employee e
join salarybonus as sb on e.job_id = sb.job_id
order by sb.amount desc
limit 5;


-- 5. What is the total salary expenditure across the company?
-- ==========================================================
select sum(sb.amount) as Total_Salary_Expenditure
from  employee e
join salarybonus sb on e.job_id = sb.job_id;