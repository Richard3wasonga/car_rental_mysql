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

-- Maintenance
INSERT INTO
    Maintenance (
        car_id,
        service_date,
        description,
        cost,
        mechanic_name
    )
VALUES
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
    (
        6,
        '2025-03-15',
        'Engine service, filters and fluid inspection',
        16000.00,
        'Dennis Barasa'
    ),
    (
        9,
        '2025-03-22',
        'Engine oil and oil filter replacement',
        8500.00,
        'Kevin Otieno'
    ),
    (
        34,
        '2025-04-02',
        'Replacement of worn suspension components',
        27500.00,
        'Peter Omondi'
    ),
    (
        32,
        '2025-04-10',
        'Brake pads inspected and replaced',
        13500.00,
        'Eric Odhiambo'
    ),
    (
        2,
        '2025-04-18',
        'Engine oil and oil filter replacement',
        9000.00,
        'Samuel Kiptoo'
    ),
    (
        27,
        '2025-05-01',
        'Replacement of two worn tyres',
        22000.00,
        'Martin Rotich'
    ),
    (
        11,
        '2025-05-12',
        'Engine service, filters and fluid inspection',
        15000.00,
        'Lilian Atieno'
    ),
    (
        10,
        '2025-05-20',
        'Brake pads and brake fluid replacement',
        12500.00,
        'David Musyoka'
    ),
    (
        18,
        '2025-06-03',
        'Engine oil and oil filter replacement',
        8000.00,
        'Grace Akoth'
    ),
    (
        22,
        '2025-06-15',
        'Routine inspection and fluid checks',
        6500.00,
        'Eric Kariuki'
    );

SAVEPOINT cars_loaded;

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