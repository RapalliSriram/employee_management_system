USE SQL_EMPLOYEE_PROJECT;

-- 1. What is the total monthly payroll processed?
-- ==============================================
select year(date) as year,
month(date) as month,
sum(total_amount) as total_monthly_payroll
from Payroll
group by year(date),month(date)
order by year,month;

-- 2. What is the average bonus given per department?
-- =================================================
select jd.jobdept,avg(sb.bonus) as average_bonus
from  jobdepartment jd
join salarybonus sb on jd.job_id = sb.job_id
group by jd.jobdept
order by average_bonus desc;


-- 3. Which department receives the highest total bonuses?
-- ======================================================
select jobdept, total_bonus
from (select jd.jobdept, sum(sb.bonus) AS total_bonus,
	  rank() over(order by sum(sb.bonus) DESC) AS dept_rank
    from jobdepartment jd
    join salarybonus sb 
        on jd.job_id = sb.job_id
    group by jd.jobdept
) ranked_dept
where dept_rank = 1;

-- 4. What is the average value of total_amount after considering leave deductions?
-- ===============================================================================
SELECT AVG(adjusted_salary) AS avg_adjusted_amount
FROM ( SELECT p.emp_ID,
			p.total_amount - COUNT(l.leave_ID) * 500 AS adjusted_salary
        FROM Payroll p
        LEFT JOIN Leaves l ON p.emp_ID = l.emp_ID
        GROUP BY p.emp_ID, p.total_amount
     ) salary_calc;