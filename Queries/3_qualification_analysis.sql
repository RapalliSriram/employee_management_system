USE SQL_EMPLOYEE_PROJECT;

-- 1. How many employees have at least one qualification listed?
-- ============================================================
SELECT COUNT(DISTINCT emp_ID) AS employees_with_qualification
FROM Qualification;

-- 2 Which positions require the most qualifications?
-- =================================================
SELECT Position, COUNT(*) AS total_qualifications
FROM Qualification
GROUP BY Position
ORDER BY total_qualifications DESC;


-- 3. Which employees have the highest number of qualifications?
-- ============================================================
SELECT emp_ID, firstname, lastname, total_qualifications
FROM (
		SELECT e.emp_ID, e.firstname, e.lastname,
			COUNT(q.QualID) AS total_qualifications,
			RANK() OVER (ORDER BY COUNT(q.QualID) DESC) AS qual_rank
        FROM Employee e
        JOIN Qualification q ON e.emp_ID = q.Emp_ID
        GROUP BY e.emp_ID
     ) ranked_emp
WHERE qual_rank = 1;