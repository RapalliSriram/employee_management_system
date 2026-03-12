USE SQL_EMPLOYEE_PROJECT;

-- 1. Which year had the most employees taking leaves?
-- ==================================================
select year(date) as leave_year, 
	count(*) as total_leaves 
from Leaves
group by year(date)
order by total_leaves desc;

-- 2. What is the average number of leave days taken by its employees per department?
-- =================================================================================
select jd.jobdept,
	avg(emp_leave.total_leaves) as avg_leave_days
from (  select emp_ID, COUNT(*) as total_leaves from Leaves
		group by emp_ID)as  emp_leave
join Employee e on emp_leave.emp_ID = e.emp_ID
join JobDepartment jd on e.Job_ID = jd.Job_ID
group by jd.jobdept
order by avg_leave_days desc;

-- 3. Which employees have taken the most leaves?
-- =============================================
SELECT e.emp_ID,e.firstname,e.lastname,
count(l.leave_ID) as total_leaves
from Leaves l
join Employee e on l.emp_ID = e.emp_ID
group by e.emp_ID
order by total_leaves desc;


-- 4. What is the total number of leave days taken company-wide?
-- ============================================================
select count(*) as total_number_of_leaves
from Leaves;

-- 5. How do leave days correlate with payroll amounts?
-- ===================================================
SELECT e.emp_ID,
    COUNT(l.leave_ID) AS total_leaves,
    SUM(p.total_amount) AS total_salary
FROM Employee e
LEFT JOIN Leaves l ON e.emp_ID = l.emp_ID
LEFT JOIN Payroll p ON e.emp_ID = p.emp_ID
GROUP BY e.emp_ID;