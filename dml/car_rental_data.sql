USE driveease_rentals;

-- Clear existing data before seeding
SET
    FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE RentalServiceDetails;

TRUNCATE TABLE RentalServices;

TRUNCATE TABLE Payments;

TRUNCATE TABLE Maintenance;

TRUNCATE TABLE Rentals;

TRUNCATE TABLE Cars;

TRUNCATE TABLE Employees;

TRUNCATE TABLE Car_Categories;

TRUNCATE TABLE Branches;

TRUNCATE TABLE Customers;

SET
    FOREIGN_KEY_CHECKS = 1;

-- Populate Cars
INSERT INTO
    Cars (
        registration_number,
        make,
        model,
        manufacture_year,
        color,
        mileage,
        seats,
        fuel_type,
        transmission,
        status,
        category_id,
        branch_id
    )
VALUES
    -- Nairobi CBD Branch
    (
        'KDA 101A',
        'Toyota',
        'Corolla',
        2022,
        'White',
        28500,
        5,
        'Petrol',
        'Automatic',
        'Available',
        2,
        1
    ),
    (
        'KDB 102B',
        'Toyota',
        'Prado',
        2021,
        'Black',
        47000,
        7,
        'Diesel',
        'Automatic',
        'Rented',
        3,
        1
    ),
    (
        'KDC 103C',
        'Mazda',
        'Demio',
        2023,
        'Silver',
        18000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        1,
        1
    ),
    (
        'KDD 104D',
        'Subaru',
        'Forester',
        2020,
        'Blue',
        65000,
        5,
        'Petrol',
        'Automatic',
        'Maintenance',
        3,
        1
    ),
    (
        'KDE 105E',
        'Mercedes-Benz',
        'C200',
        2022,
        'Black',
        22000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        5,
        1
    ),
    (
        'KDF 106F',
        'Isuzu',
        'D-Max',
        2021,
        'White',
        54000,
        5,
        'Diesel',
        'Manual',
        'Available',
        4,
        1
    ),
    (
        'KDG 107G',
        'Nissan',
        'Note',
        2023,
        'Red',
        12000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        1,
        1
    ),
    (
        'KDH 108H',
        'BMW',
        'X5',
        2022,
        'Grey',
        26000,
        5,
        'Diesel',
        'Automatic',
        'Rented',
        5,
        1
    ),
    -- Westlands Branch
    (
        'KDJ 109J',
        'Toyota',
        'Hilux',
        2021,
        'White',
        51000,
        5,
        'Diesel',
        'Manual',
        'Available',
        4,
        2
    ),
    (
        'KDK 110K',
        'Honda',
        'Fit',
        2022,
        'Silver',
        24000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        1,
        2
    ),
    (
        'KDL 111L',
        'Toyota',
        'RAV4',
        2021,
        'Blue',
        46000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        3,
        2
    ),
    (
        'KDM 112M',
        'Toyota',
        'Premio',
        2020,
        'Black',
        62000,
        5,
        'Petrol',
        'Automatic',
        'Rented',
        2,
        2
    ),
    (
        'KDN 113N',
        'Mercedes-Benz',
        'GLE',
        2023,
        'White',
        15000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        5,
        2
    ),
    (
        'KDP 114P',
        'Mazda',
        'CX-5',
        2022,
        'Grey',
        28000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        3,
        2
    ),
    (
        'KDQ 115Q',
        'Suzuki',
        'Alto',
        2024,
        'White',
        6000,
        4,
        'Petrol',
        'Manual',
        'Available',
        6,
        2
    ),
    (
        'KDR 116R',
        'Ford',
        'Ranger',
        2021,
        'Orange',
        45000,
        5,
        'Diesel',
        'Manual',
        'Maintenance',
        4,
        2
    ),
    -- Mombasa Branch
    (
        'KDS 117S',
        'Toyota',
        'Axio',
        2022,
        'Silver',
        26000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        2,
        3
    ),
    (
        'KDT 118T',
        'Nissan',
        'X-Trail',
        2021,
        'White',
        42000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        3,
        3
    ),
    (
        'KDU 119U',
        'Honda',
        'Vezel',
        2022,
        'Blue',
        30000,
        5,
        'Hybrid',
        'Automatic',
        'Rented',
        3,
        3
    ),
    (
        'KDV 120V',
        'Toyota',
        'Land Cruiser',
        2020,
        'Black',
        75000,
        7,
        'Diesel',
        'Automatic',
        'Available',
        5,
        3
    ),
    (
        'KDW 121W',
        'Isuzu',
        'MU-X',
        2023,
        'Grey',
        18000,
        7,
        'Diesel',
        'Automatic',
        'Available',
        3,
        3
    ),
    (
        'KDX 122X',
        'Mazda',
        'Axela',
        2021,
        'Red',
        39000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        2,
        3
    ),
    (
        'KDY 123Y',
        'Suzuki',
        'Swift',
        2024,
        'White',
        8500,
        5,
        'Petrol',
        'Manual',
        'Available',
        1,
        3
    ),
    (
        'KDZ 124Z',
        'Toyota',
        'Hilux',
        2022,
        'Black',
        33000,
        5,
        'Diesel',
        'Manual',
        'Available',
        4,
        3
    ),
    -- Kisumu Branch
    (
        'KEA 125A',
        'Toyota',
        'Fielder',
        2021,
        'White',
        34000,
        5,
        'Hybrid',
        'Automatic',
        'Available',
        2,
        4
    ),
    (
        'KEB 126B',
        'Nissan',
        'March',
        2023,
        'Silver',
        11000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        1,
        4
    ),
    (
        'KEC 127C',
        'Subaru',
        'XV',
        2022,
        'Blue',
        25000,
        5,
        'Petrol',
        'Automatic',
        'Rented',
        3,
        4
    ),
    (
        'KED 128D',
        'Toyota',
        'Fortuner',
        2021,
        'Black',
        47000,
        7,
        'Diesel',
        'Automatic',
        'Available',
        5,
        4
    ),
    (
        'KEE 129E',
        'Ford',
        'Everest',
        2020,
        'Grey',
        68000,
        7,
        'Diesel',
        'Automatic',
        'Maintenance',
        5,
        4
    ),
    (
        'KEF 130F',
        'Isuzu',
        'D-Max',
        2022,
        'White',
        22000,
        5,
        'Diesel',
        'Manual',
        'Available',
        4,
        4
    ),
    (
        'KEG 131G',
        'Honda',
        'Civic',
        2023,
        'Red',
        15000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        2,
        4
    ),
    (
        'KEH 132H',
        'Mazda',
        'CX-30',
        2024,
        'Blue',
        5000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        3,
        4
    ),
    -- Nakuru Branch
    (
        'KEJ 133J',
        'Toyota',
        'Corolla',
        2022,
        'White',
        27000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        2,
        5
    ),
    (
        'KEK 134K',
        'Toyota',
        'Prado',
        2021,
        'Black',
        51000,
        7,
        'Diesel',
        'Automatic',
        'Rented',
        5,
        5
    ),
    (
        'KEL 135L',
        'Nissan',
        'Note',
        2024,
        'Silver',
        7000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        1,
        5
    ),
    (
        'KEM 136M',
        'Honda',
        'CR-V',
        2022,
        'Grey',
        29000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        3,
        5
    ),
    (
        'KEN 137N',
        'Mercedes-Benz',
        'E200',
        2023,
        'Black',
        13000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        5,
        5
    ),
    (
        'KEP 138P',
        'Toyota',
        'Hilux',
        2021,
        'White',
        48000,
        5,
        'Diesel',
        'Manual',
        'Available',
        4,
        5
    ),
    (
        'KEQ 139Q',
        'Suzuki',
        'Alto',
        2023,
        'Blue',
        10000,
        4,
        'Petrol',
        'Manual',
        'Available',
        6,
        5
    ),
    (
        'KER 140R',
        'BMW',
        '320i',
        2022,
        'White',
        21000,
        5,
        'Petrol',
        'Automatic',
        'Available',
        5,
        5
    );

SAVEPOINT cars_loaded;

-- Populate Rental Services
INSERT INTO
    RentalServices (service_name, daily_price)
VALUES
    ('GPS Navigation', 500.00),
    ('Wi-Fi Hotspot', 700.00),
    ('Child Seat', 350.00),
    ('Extra Driver', 1000.00),
    ('Premium Insurance', 2500.00),
    ('Roadside Assistance', 800.00),
    ('Unlimited Mileage', 1500.00),
    ('Phone Charger', 150.00),
    ('Roof Rack', 600.00),
    ('Camping Equipment', 1800.00);

SAVEPOINT rentalservices_loaded;

-- Rentals
INSERT INTO
    Rentals (
        customer_id,
        car_id,
        employee_id,
        rental_date,
        expected_return_date,
        actual_return_date,
        rental_status
    )
VALUES
    -- COMPLETED
    (
        1,
        1,
        2,
        '2025-01-05',
        '2025-01-08',
        '2025-01-08',
        'Completed'
    ),
    (
        2,
        3,
        2,
        '2025-01-07',
        '2025-01-10',
        '2025-01-10',
        'Completed'
    ),
    (
        3,
        5,
        3,
        '2025-01-09',
        '2025-01-13',
        '2025-01-14',
        'Completed'
    ),
    (
        4,
        7,
        4,
        '2025-01-11',
        '2025-01-15',
        '2025-01-15',
        'Completed'
    ),
    (
        5,
        9,
        8,
        '2025-01-15',
        '2025-01-20',
        '2025-01-19',
        'Completed'
    ),
    (
        6,
        11,
        9,
        '2025-01-18',
        '2025-01-22',
        '2025-01-22',
        'Completed'
    ),
    (
        7,
        13,
        11,
        '2025-01-22',
        '2025-01-27',
        '2025-01-28',
        'Completed'
    ),
    (
        8,
        15,
        12,
        '2025-01-25',
        '2025-01-30',
        '2025-01-30',
        'Completed'
    ),
    (
        9,
        17,
        16,
        '2025-02-01',
        '2025-02-05',
        '2025-02-05',
        'Completed'
    ),
    (
        10,
        19,
        18,
        '2025-02-04',
        '2025-02-09',
        '2025-02-08',
        'Completed'
    ),
    (
        11,
        21,
        5,
        '2025-02-08',
        '2025-02-12',
        '2025-02-12',
        'Completed'
    ),
    (
        12,
        23,
        6,
        '2025-02-10',
        '2025-02-15',
        '2025-02-16',
        'Completed'
    ),
    (
        13,
        25,
        7,
        '2025-02-14',
        '2025-02-18',
        '2025-02-18',
        'Completed'
    ),
    (
        14,
        27,
        8,
        '2025-02-18',
        '2025-02-22',
        '2025-02-22',
        'Completed'
    ),
    (
        15,
        29,
        10,
        '2025-02-20',
        '2025-02-25',
        '2025-02-24',
        'Completed'
    ),
    (
        16,
        31,
        12,
        '2025-02-24',
        '2025-03-01',
        '2025-03-01',
        'Completed'
    ),
    (
        17,
        33,
        13,
        '2025-03-01',
        '2025-03-05',
        '2025-03-05',
        'Completed'
    ),
    (
        18,
        35,
        14,
        '2025-03-04',
        '2025-03-08',
        '2025-03-08',
        'Completed'
    ),
    (
        19,
        37,
        17,
        '2025-03-07',
        '2025-03-12',
        '2025-03-12',
        'Completed'
    ),
    (
        20,
        39,
        20,
        '2025-03-10',
        '2025-03-15',
        '2025-03-16',
        'Completed'
    ),
    (
        21,
        2,
        1,
        '2025-03-14',
        '2025-03-18',
        '2025-03-18',
        'Completed'
    ),
    (
        22,
        4,
        3,
        '2025-03-18',
        '2025-03-22',
        '2025-03-22',
        'Completed'
    ),
    (
        23,
        6,
        5,
        '2025-03-21',
        '2025-03-26',
        '2025-03-27',
        'Completed'
    ),
    (
        24,
        8,
        7,
        '2025-03-25',
        '2025-03-30',
        '2025-03-30',
        'Completed'
    ),
    (
        25,
        10,
        9,
        '2025-03-28',
        '2025-04-02',
        '2025-04-01',
        'Completed'
    ),
    (
        26,
        12,
        11,
        '2025-04-01',
        '2025-04-06',
        '2025-04-06',
        'Completed'
    ),
    (
        27,
        14,
        13,
        '2025-04-05',
        '2025-04-09',
        '2025-04-09',
        'Completed'
    ),
    (
        28,
        16,
        15,
        '2025-04-08',
        '2025-04-13',
        '2025-04-13',
        'Completed'
    ),
    (
        29,
        18,
        17,
        '2025-04-12',
        '2025-04-16',
        '2025-04-17',
        'Completed'
    ),
    (
        30,
        20,
        19,
        '2025-04-15',
        '2025-04-20',
        '2025-04-20',
        'Completed'
    ),
    (
        31,
        22,
        2,
        '2025-04-18',
        '2025-04-23',
        '2025-04-23',
        'Completed'
    ),
    (
        32,
        24,
        4,
        '2025-04-22',
        '2025-04-27',
        '2025-04-27',
        'Completed'
    ),
    (
        33,
        26,
        6,
        '2025-04-26',
        '2025-05-01',
        '2025-05-02',
        'Completed'
    ),
    (
        34,
        28,
        8,
        '2025-05-01',
        '2025-05-05',
        '2025-05-05',
        'Completed'
    ),
    (
        35,
        30,
        10,
        '2025-05-04',
        '2025-05-09',
        '2025-05-08',
        'Completed'
    ),
    (
        36,
        32,
        12,
        '2025-05-08',
        '2025-05-13',
        '2025-05-13',
        'Completed'
    ),
    (
        37,
        34,
        14,
        '2025-05-12',
        '2025-05-16',
        '2025-05-16',
        'Completed'
    ),
    (
        38,
        36,
        16,
        '2025-05-15',
        '2025-05-20',
        '2025-05-21',
        'Completed'
    ),
    (
        39,
        38,
        18,
        '2025-05-18',
        '2025-05-23',
        '2025-05-23',
        'Completed'
    ),
    (
        40,
        40,
        20,
        '2025-05-22',
        '2025-05-27',
        '2025-05-27',
        'Completed'
    ),
    -- ACTIVE
    (
        41,
        2,
        1,
        '2025-08-01',
        '2025-08-06',
        NULL,
        'Active'
    ),
    (
        42,
        8,
        3,
        '2025-08-02',
        '2025-08-07',
        NULL,
        'Active'
    ),
    (
        43,
        12,
        5,
        '2025-08-03',
        '2025-08-08',
        NULL,
        'Active'
    ),
    (
        44,
        19,
        7,
        '2025-08-04',
        '2025-08-09',
        NULL,
        'Active'
    ),
    (
        45,
        27,
        9,
        '2025-08-05',
        '2025-08-10',
        NULL,
        'Active'
    ),
    (
        46,
        34,
        11,
        '2025-08-06',
        '2025-08-11',
        NULL,
        'Active'
    ),
    (
        47,
        39,
        13,
        '2025-08-07',
        '2025-08-12',
        NULL,
        'Active'
    ),
    (
        48,
        5,
        15,
        '2025-08-08',
        '2025-08-13',
        NULL,
        'Active'
    ),
    (
        49,
        10,
        17,
        '2025-08-09',
        '2025-08-14',
        NULL,
        'Active'
    ),
    (
        50,
        14,
        19,
        '2025-08-10',
        '2025-08-15',
        NULL,
        'Active'
    ),
    (
        5,
        22,
        4,
        '2025-08-11',
        '2025-08-16',
        NULL,
        'Active'
    ),
    (
        9,
        30,
        6,
        '2025-08-12',
        '2025-08-17',
        NULL,
        'Active'
    ),
    (
        14,
        33,
        8,
        '2025-08-13',
        '2025-08-18',
        NULL,
        'Active'
    ),
    (
        18,
        37,
        10,
        '2025-08-14',
        '2025-08-19',
        NULL,
        'Active'
    ),
    (
        24,
        40,
        12,
        '2025-08-15',
        '2025-08-20',
        NULL,
        'Active'
    ),
    -- CANCELLED
    (
        6,
        3,
        2,
        '2025-06-01',
        '2025-06-05',
        NULL,
        'Cancelled'
    ),
    (
        12,
        15,
        9,
        '2025-06-04',
        '2025-06-08',
        NULL,
        'Cancelled'
    ),
    (
        21,
        25,
        13,
        '2025-06-09',
        '2025-06-13',
        NULL,
        'Cancelled'
    ),
    (
        33,
        31,
        17,
        '2025-06-15',
        '2025-06-20',
        NULL,
        'Cancelled'
    ),
    (
        45,
        38,
        20,
        '2025-06-20',
        '2025-06-25',
        NULL,
        'Cancelled'
    );

SAVEPOINT rentals_loaded;

-- payment
INSERT INTO
    Payments (
        rental_id,
        payment_date,
        amount,
        payment_method,
        payment_status
    )
SELECT
    r.rental_id,
    CASE
        WHEN r.rental_status = 'Completed' THEN r.actual_return_date
        WHEN r.rental_status = 'Active' THEN r.rental_date
        ELSE r.rental_date
    END,
    (
        DATEDIFF(r.expected_return_date, r.rental_date) * cc.daily_rate
    ),
    CASE
        MOD(r.rental_id, 3)
        WHEN 0 THEN 'Cash'
        WHEN 1 THEN 'Card'
        ELSE 'M-Pesa'
    END,
    CASE
        WHEN r.rental_status = 'Completed' THEN 'Paid'
        WHEN r.rental_status = 'Active'
        AND MOD(r.rental_id, 2) = 0 THEN ' Paid '
        WHEN r.rental_status = ' Active ' THEN ' Pending '
        WHEN MOD(r.rental_id, 2) = 0 THEN ' Refunded '
        ELSE ' Pending '
    END
FROM
    Rentals r
    JOIN Cars c ON r.car_id = c.car_id
    JOIN Car_Categories cc ON c.category_id = cc.category_id;

SAVEPOINT payments_loaded;

-- Maintenance records are based on vehicle mileage and current maintenance status
INSERT INTO
    Maintenance (
        car_id,
        service_date,
        description,
        cost,
        mechanic_name
    )
VALUES
    -- Car 4: Subaru Forester 
    (
        4,
        '2025-01-20',
        'Engine oil and oil filter replacement',
        8500.00,
        'Peter Mwangi'
    ),
    (
        4,
        '2025-01-21',
        'Front brake pads and discs replaced',
        18500.00,
        'John Kamau'
    ),
    -- Car 12: Toyota Premio - 62,000 km 
    (
        12,
        '2025-02-05',
        'Engine oil, oil filter and air filter replacement',
        9500.00,
        'Samuel Otieno'
    ),
    (
        12,
        '2025-02-06',
        'Brake pads inspected and replaced',
        12000.00,
        'David Kariuki'
    ),
    -- Car 16: Ford Ranger - 45,000 km 
    (
        16,
        '2025-02-15',
        'Engine service, oil change and filter replacement',
        14500.00,
        'Brian Mutiso'
    ),
    (
        16,
        '2025-02-16',
        'Replacement of two worn tyres',
        24000.00,
        'James Mwangi'
    ),
    -- Car 20: Toyota Land Cruiser - 75,000 km 
    (
        20,
        '2025-02-25',
        'Major engine service and fluid replacement',
        32000.00,
        'Joseph Kibet'
    ),
    (
        20,
        '2025-02-26',
        'Brake pads and brake fluid replacement',
        18000.00,
        'Martin Rotich'
    ),
    -- Car 29: Ford Everest - 68,000 km 
    (
        29,
        '2025-03-05',
        'Engine oil and oil filter replacement',
        9000.00,
        'Victor Kariuki'
    ),
    (
        29,
        '2025-03-06',
        'Brake pads and rear discs replaced',
        21000.00,
        'Susan Kemunto'
    ),
    -- Car 6: Isuzu D-Max - 54,000 km 
    (
        6,
        '2025-03-15',
        'Engine service, filters and fluid inspection',
        16000.00,
        'Dennis Barasa'
    ),
    -- Car 9: Toyota Hilux - 51,000 km 
    (
        9,
        '2025-03-22',
        'Engine oil and oil filter replacement',
        8500.00,
        'Kevin Otieno'
    ),
    -- Car 34: Toyota Prado - 51,000 km 
    (
        34,
        '2025-04-02',
        'Replacement of worn suspension components',
        27500.00,
        'Peter Omondi'
    ),
    -- Car 32: Toyota Fielder - 47,000 km 
    (
        32,
        '2025-04-10',
        'Brake pads inspected and replaced',
        13500.00,
        'Eric Odhiambo'
    ),
    -- Car 2: Toyota Prado - 47,000 km 
    (
        2,
        '2025-04-18',
        'Engine oil and oil filter replacement',
        9000.00,
        'Samuel Kiptoo'
    ),
    -- Car 27: Toyota Fortuner - 47,000 km 
    (
        27,
        '2025-05-01',
        'Replacement of two worn tyres',
        22000.00,
        'Martin Rotich'
    ),
    -- Car 11: Toyota RAV4 - 46,000 km 
    (
        11,
        '2025-05-12',
        'Engine service, filters and fluid inspection',
        15000.00,
        'Lilian Atieno'
    ),
    -- Car 10: Toyota Hilux - 51,000 km 
    (
        10,
        '2025-05-20',
        'Brake pads and brake fluid replacement',
        12500.00,
        'David Musyoka'
    ),
    -- Car 18: Nissan X-Trail - 42,000 km 
    (
        18,
        '2025-06-03',
        'Engine oil and oil filter replacement',
        8000.00,
        'Grace Akoth'
    ),
    -- Car 22: Mazda Axela - 39,000 km 
    (
        22,
        '2025-06-15',
        'Routine inspection and fluid checks',
        6500.00,
        'Eric Kariuki'
    );

SAVEPOINT maintenance_loaded;

-- Rental Service Details
INSERT INTO
    RentalServiceDetails (rental_id, service_id, quantity)
VALUES
    -- COMPLETED RENTALS 
    -- Rental 1 
    (1, 1, 1),
    (1, 5, 1),
    -- Rental 2 
    (2, 2, 1),
    -- Rental 3 -- No additional services
    -- Rental 4 
    (4, 1, 1),
    (4, 4, 1),
    (4, 5, 1),
    -- Rental 5 
    (5, 3, 1),
    -- Rental 6 
    (6, 2, 1),
    (6, 8, 1),
    -- Rental 7 
    (7, 1, 1),
    (7, 4, 1),
    (7, 7, 1),
    -- Rental 8 
    (8, 1, 1),
    (8, 4, 1),
    (8, 5, 1),
    -- Rental 9 
    (9, 3, 2),
    (9, 2, 1),
    -- Rental 10 -- No additional services
    -- Rental 11 
    (11, 5, 1),
    -- Rental 12 
    (12, 1, 1),
    (12, 7, 1),
    -- Rental 13 
    (13, 2, 1),
    (13, 8, 1),
    -- Rental 14 
    (14, 1, 1),
    (14, 4, 1),
    (14, 5, 1),
    (14, 6, 1),
    -- Rental 15 
    (15, 3, 1),
    -- Rental 16 
    (16, 1, 1),
    (16, 2, 1),
    -- Rental 17 -- No additional services
    -- Rental 18 
    (18, 5, 1),
    (18, 7, 1),
    -- Rental 19 
    (19, 1, 1),
    (19, 8, 1),
    -- Rental 20 
    (20, 2, 1),
    (20, 4, 1),
    (20, 5, 1),
    -- Rental 21 
    (21, 3, 2),
    -- Rental 22 
    (22, 1, 1),
    (22, 7, 1),
    -- Rental 23 -- No additional services
    -- Rental 24 
    (24, 1, 1),
    (24, 4, 1),
    (24, 5, 1),
    -- Rental 25 
    (25, 2, 1),
    -- Rental 26 
    (26, 3, 1),
    (26, 8, 1),
    -- Rental 27 
    (27, 1, 1),
    (27, 5, 1),
    (27, 6, 1),
    -- Rental 28 -- No additional services
    -- Rental 29 
    (29, 1, 1),
    (29, 2, 1),
    (29, 7, 1),
    -- Rental 30 
    (30, 4, 1),
    -- Rental 31 
    (31, 5, 1),
    (31, 8, 1),
    -- Rental 32 
    (32, 3, 1),
    -- Rental 33 
    (33, 1, 1),
    (33, 4, 1),
    (33, 5, 1),
    (33, 7, 1),
    -- Rental 34 
    (34, 2, 1),
    (34, 8, 1),
    -- Rental 35 -- No additional services
    -- Rental 36 
    (36, 1, 1),
    (36, 5, 1),
    -- Rental 37 
    (37, 3, 2),
    (37, 2, 1),
    -- Rental 38 
    (38, 1, 1),
    (38, 7, 1),
    -- Rental 39 
    (39, 4, 1),
    (39, 5, 1),
    -- Rental 40 
    (40, 1, 1),
    (40, 2, 1),
    (40, 6, 1),
    -- ACTIVE RENTALS
    -- Rental 41 
    (41, 1, 1),
    (41, 2, 1),
    -- Rental 42 
    (42, 3, 1),
    -- Rental 43 
    (43, 1, 1),
    (43, 5, 1),
    (43, 7, 1),
    -- Rental 44 -- No additional services
    -- Rental 45 
    (45, 2, 1),
    (45, 4, 1),
    -- Rental 46 
    (46, 1, 1),
    (46, 5, 1),
    -- Rental 47 
    (47, 3, 2),
    (47, 4, 1),
    -- Rental 48 
    (48, 1, 1),
    (48, 2, 1),
    (48, 5, 1),
    -- Rental 49 -- No additional services
    -- Rental 50 
    (50, 1, 1),
    (50, 7, 1),
    -- Rental 51 
    (51, 3, 1),
    -- Rental 52 
    (52, 2, 1),
    (52, 8, 1),
    -- Rental 53 
    (53, 1, 1),
    (53, 4, 1),
    (53, 5, 1),
    -- Rental 54 -- No additional services
    -- Rental 55 
    (55, 1, 1),
    (55, 2, 1),
    (55, 7, 1),
    -- CANCELLED RENTALS
    -- Rental 56 -- No additional services
    -- Rental 57 
    (57, 1, 1),
    -- Rental 58 -- No additional services
    -- Rental 59 
    (59, 2, 1),
    -- Rental 60 -- No additional services ;
    SAVEPOINT rental_service_details_loaded;

COMMIT;