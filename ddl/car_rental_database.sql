-- DriveEase Rentals Database

CREATE DATABASE IF NOT EXISTS driveease_rentals;

USE driveease_rentals;

create table Branches(
branch_id int primary key
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    job_title VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    branch_id INT NOT NULL,
    
    CONSTRAINT fk_employee_branch FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
    ON UPDATE CASCADE 
    ON DELETE RESTRICT 
);

