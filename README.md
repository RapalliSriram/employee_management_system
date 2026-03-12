## Project Overview 

This project demonstrates the design and analysis of an **Employee Management System** using SQL. The database stores and manages employee information, job roles, departmental structure, qualifications, payroll data, and leave records.

The goal of this project is to analyze organizational workforce data and extract meaningful business insights using SQL queries.

---

## Database Tables 

The database consists of six interconnected tables:

 * **JobDepartment** – Stores job roles, department names, and salary ranges
* **SalaryBonus** – Contains salary and bonus information for each job role 
* **Employee** – Stores employee personal and job details 
* **Qualification** – Tracks employee qualifications and job requirements 
* **Leaves** – Records employee leave information 
* **Payroll** – Stores payroll details including salary and leave deductions

---

## Key SQL Concepts Used 
* Joins (INNER JOIN, LEFT JOIN) 
* Aggregation Functions (COUNT, SUM, AVG) 
* GROUP BY and ORDER BY 
* Subqueries 
* Derived Tables 
* Primary Key and Foreign Key Constraints 
* Data Modeling with Relational Tables

---

## Business Questions Solved 
### Employee Insights 

* How many unique employees are in the system? 
* Which departments have the highest number of employees? 
* What is the average salary per department? 
* Who are the top 5 highest-paid employees? 
* What is the total salary expenditure across the company?

### Job Role & Department Analysis 

* How many job roles exist in each department? 
* What is the average salary per department? 
* Which job roles offer the highest salary? 
* Which departments have the highest total salary allocation?

### Qualification Analysis 

* How many employees have at least one qualification? 
* Which positions require the most qualifications? 
* Which employees have the highest number of qualifications? 

### Leave Analysis 

* Which year had the most leave records? 
* What is the average number of leave days per department? 
* Which employees have taken the most leaves? 
* What is the total number of leave days company-wide? 
* How do leave days relate to payroll amounts?

### Payroll Analysis 

* What is the total monthly payroll processed? 
* What is the average bonus per department? 
* Which department receives the highest total bonuses? 
* What is the average payroll amount after leave deductions?

--- 

## Key Insights 

### Workforce Distribution 

* The database contains **60 employees** representing the organization's workforce. 
* **Finance and IT departments** have the highest number of employees (9 each).

### Salary Insights 

* The **Legal department has the highest average salary**, followed by Engineering. 
* Director-level roles receive the highest compensation, with the top salary reaching **170K**.

### Payroll Trends
 
* The company spends approximately **4.32 million on salaries**. 
* The total monthly payroll for **April 2024 is 2,778,000**. 

### Leave Patterns 

* Employees collectively recorded **60 leave days**, averaging one leave per employee. 
* Payroll variations are influenced mainly by **salary structure rather than leave deductions**.

### Bonus Distribution 

* The **Legal department has the highest average bonus**. 
* The **Finance department receives the highest total bonus allocation**.

---

## Project Structure

employee-management-sql
│
├── database
│   └── schema.sql
│
├── data
│   ├── Employee.csv
│   ├── JobDepartment.csv
│   ├── Salary_Bonus.csv
│   ├── Leaves.csv
│   ├── Payroll.csv
│   └── Qualification.csv
│
├── queries
│   ├── 01_employee_insights.sql
│   ├── 02_department_analysis.sql
│   ├── 03_qualification_analysis.sql
│   ├── 04_leave_analysis.sql
│   └── 05_payroll_analysis.sql
│
├── docs
│   └── project_presentation.pptx
│
└── README.md

--- 

## How to Run the Project 

1. Open **MySQL Workbench**. 
2. Create a new database.

CREATE DATABASE employee_management;
USE employee_management;

3. Run the **schema.sql** file to create tables. 
4. Import the CSV datasets into their respective tables. 
5. Execute the SQL files inside the **queries folder** to perform analysis.

---

## Tools Used 
* SQL 
* MySQL 
* MySQL Workbench 
* GitHub
