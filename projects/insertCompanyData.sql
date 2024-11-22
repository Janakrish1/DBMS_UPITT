INSERT INTO Departments (department_id, department_name) 
VALUES 
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Human Resources'),
(4, 'Finance');

INSERT INTO Employees (employee_id, employee_name, position, salary, department_id) 
VALUES 
(101, 'Alice Johnson', 'Software Engineer', 80000.00, 1),
(102, 'Bob Smith', 'Marketing Manager', 60000.00, 2),
(103, 'Charlie Brown', 'HR Specialist', 50000.00, 3),
(104, 'Diana Prince', 'Financial Analyst', 70000.00, 4),
(105, 'Eve Davis', 'DevOps Engineer', 85000.00, 1);

INSERT INTO Projects (project_id, project_name, start_date, end_date) 
VALUES 
(201, 'Website Redesign', '2024-01-15', '2024-06-15'),
(202, 'Marketing Campaign', '2024-02-01', '2024-04-30'),
(203, 'HR System Upgrade', '2024-03-01', '2024-08-01'),
(204, 'Financial Forecasting Tool', '2024-04-01', '2024-09-01'),
(205, 'Cloud Infrastructure Setup', '2024-01-10', '2024-12-31');

INSERT INTO Employee_project (employee_id, project_id, hours_worked) 
VALUES 
(101, 201, 120),  -- Alice worked 120 hours on Website Redesign
(102, 202, 150),  -- Bob worked 150 hours on Marketing Campaign
(103, 203, 100),  -- Charlie worked 100 hours on HR System Upgrade
(104, 204, 130),  -- Diana worked 130 hours on Financial Forecasting Tool
(105, 205, 200),  -- Eve worked 200 hours on Cloud Infrastructure Setup
(101, 205, 80);   -- Alice also worked 80 hours on Cloud Infrastructure Setup

INSERT INTO Employee_project (employee_id, project_id, hours_worked) 
VALUES 
(101, '', '');

