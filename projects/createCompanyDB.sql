-- Create the database
CREATE DATABASE Company;

-- Use the newly created database
USE Company;

-- Create the Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,              -- Primary key for departments
    department_name VARCHAR(100) NOT NULL       -- Department name, can't be null
);

-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,                -- Primary key for employees
    employee_name VARCHAR(100) NOT NULL,        -- Employee name, can't be null
    position VARCHAR(50),                       -- Employee position
    salary DECIMAL(10, 2),                      -- Employee salary, up to 10 digits, 2 decimal places
    department_id INT,                          -- Foreign key referencing department_id in Departments table
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create the Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,                 -- Primary key for projects
    project_name VARCHAR(100) NOT NULL,         -- Project name, can't be null
    start_date DATE,                            -- Project start date
    end_date DATE                               -- Project end date
);

-- Create the Employee_project table (many-to-many relationship)
CREATE TABLE Employee_project (
    employee_id INT,                            -- Foreign key referencing employee_id in Employees table
    project_id INT,                             -- Foreign key referencing project_id in Projects table
    hours_worked INT,                           -- Hours worked by the employee on the project
    PRIMARY KEY (employee_id, project_id),      -- Composite primary key
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);


