-- DriveEase Rentals Database

CREATE DATABASE IF NOT EXISTS driveease_rentals;

USE driveease_rentals;

CREATE TABLE Customers ( 
    customer_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE, 
    phone VARCHAR(20) NOT NULL UNIQUE, 
    national_id VARCHAR(20) NOT NULL UNIQUE, 
    drivers_license_no VARCHAR(50) NOT NULL UNIQUE, 
    address VARCHAR(255), 
    date_registered DATE DEFAULT (CURRENT_DATE) 
);

CREATE TABLE Branches ( 
    branch_id INT AUTO_INCREMENT PRIMARY KEY, 
    branch_name VARCHAR(100) NOT NULL UNIQUE, 
    city VARCHAR(50) NOT NULL, 
    address VARCHAR(255) NOT NULL, 
    phone VARCHAR(20) NOT NULL UNIQUE 

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
    
    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id) 
        REFERENCES Branches(branch_id)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT 
);
CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL,
    manufacture_year YEAR NOT NULL,
    mileage INT NOT NULL, 
    seats INT NOT NULL,
    fuel_type ENUM('Petrol', 'Diesel', 'Hybrid', 'Electric') NOT NULL,
    transmission ENUM('Manual', 'Automatic') NOT NULL,
    status ENUM('Available', 'Rented', 'Maintenance', 'Retired') NOT NULL DEFAULT 'Available',

    category_id INT NOT NULL, 
    branch_id INT NOT NULL, 

    CONSTRAINT fk_car_category 
        FOREIGN KEY (category_id) 
        REFERENCES CarCategories(category_id) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT, 
 
    CONSTRAINT fk_car_branch 
        FOREIGN KEY (branch_id) 
        REFERENCES Branches(branch_id) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT     
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    service_date DATE NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    mechanic_name VARCHAR(100) NOT NULL,

    CONSTRAINT fk_maintenance_car 
        FOREIGN KEY (car_id) 
        REFERENCES Cars(car_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method TEXT NOT NULL CHECK (payment_method IN ('Cash', 'Card', 'M-Pesa')),
    payment_status TEXT NOT NULL CHECK (payment_status IN ('Paid', 'Pending', 'Refunded')),
    CONSTRAINT fk_payment_rental 
        FOREIGN KEY (rental_id) 
        REFERENCES Rentals(rental_id)
        ON UPDATE CASCADE 
        ON DELETE CASCADE 
);

CREATE TABLE RentalServices ( 
    service_id INT AUTO_INCREMENT PRIMARY KEY, 
    service_name VARCHAR(100) NOT NULL UNIQUE, 
    daily_price DECIMAL(10,2) NOT NULL 
); 

CREATE TABLE RentalServiceDetails ( 
    rental_id INT NOT NULL, 
    service_id INT NOT NULL, 
    quantity INT NOT NULL DEFAULT 1, 

    PRIMARY KEY (rental_id, service_id), 

    CONSTRAINT fk_service_rental 
        FOREIGN KEY (rental_id) 
        REFERENCES Rentals(rental_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE, 

    CONSTRAINT fk_service 
        FOREIGN KEY (service_id) 
        REFERENCES RentalServices(service_id) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT 

); 

