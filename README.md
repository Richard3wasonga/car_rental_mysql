# DriveEase Rentals Database

> A relational MySQL database for **DriveEase Rentals**, a fictional car rental company. The system manages customers, branches, employees, vehicles, rentals, payments, vehicle maintenance, and optional rental services.

---

## Features

- Relational database design following normalization principles
- 10 interconnected tables
- Primary and composite keys
- One-to-Many and Many-to-Many relationships
- Foreign key constraints and referential integrity
- `ON UPDATE CASCADE`, `ON DELETE CASCADE` and `ON DELETE RESTRICT`
- Unique constraints for important identifiers
- Sample data for testing and analysis
- Basic, cross-table, and advanced DQL queries
- Management-oriented database views

---

## Database Overview

DriveEase Rentals supports the main operations of a car rental company:

- Customer registration
- Branch management
- Employee management
- Vehicle categorization
- Fleet management
- Vehicle rentals
- Payment processing
- Vehicle maintenance history
- Additional rental services

The database is organised into three main SQL layers:

| Layer | Purpose |
|-------|---------|
| DDL | Creates the database structure |
| DML | Populates the database with sample data |
| DQL | Retrieves and analyzes data |

---


## Project Structure

```
car_rental_mysql/
│
├── ddl/
│   └── car_rental_database.sql
│
├── dml/
│   └── car_rental_data.sql
│
├── dql/
│   └── car_rental_queries.sql
│
└── README.md
```

---

## Setup & Installation

### Prerequisites

- MySQL Server 8.0 or later
- Git

> [!IMPORTANT]
> The scripts should be executed in the order **DDL → DML → DQL**.

### Option 1: Using Visual Studio Code

### Recommended Extensions

#### Steps

- SQLTools
- SQLTools MySQL/MariaDB Driver

1. Clone the repository

```bash
git clone https://github.com/Richard3wasonga/car_rental_mysql
```

2. Navigate into the project

```bash
cd car_rental_mysql
```

3. Open the project in Visual Studio Code

```bash
code .
```

4. Connect SQLTools to your MySQL server.

5. Open and execute the DDL script

```
ddl/car_rental_database.sql
```

This creates the `driveease_rentals` database, tables, keys, constraints, and relationships.


6. Open and execute the DML script

```
dml/car_rental_data.sql
```

This populates the database with the sample data.

7. Open and execute the DQL script

```
dql/car_rental_queries.sql
```

Execute individual queries or the entire script to retrieve and analyze the data.

---

### Option 2: Using MySQL Workbench

### Prerequisites

- MySQL Server 8.0 or later
- MySQL Workbench
- Git

#### Steps

1. Clone the repository

```bash
git clone https://github.com/Richard3wasonga/car_rental_mysql
```

2. Open MySQL Workbench.

3. Connect to your MySQL server.

4. Open and execute the DDL script

```
ddl/car_rental_database.sql
```

This creates the `driveease_rentals` database, tables, keys, constraints, and relationships.

5. Open and execute the DML script

```
dml/car_rental_data.sql
```

This populates the database with the sample data.

6. Open and execute the DQL script

```
dql/car_rental_queries.sql
```

---

# Database Schema

The database consists of the following tables.

| Table | Description |
|-------|-------------|
| Customers | Stores customer information |
| Branches | Company rental branches |
| Employees | Employees assigned to branches |
| CarCategories | Vehicle categories and daily rental rates |
| Cars | Vehicle fleet |
| Rentals | Rental transactions |
| Payments | Rental payment records |
| Maintenance | Vehicle servicing history |
| RentalServices | Optional rental services |
| RentalServiceDetails | Junction table linking rentals and services |

---
# Database Relationships

The database includes the following relationships:

| Relationship | Type |
|-------------|------|
| Branches → Employees | One-to-Many |
| Branches → Cars | One-to-Many |
| CarCategories → Cars | One-to-Many |
| Customers → Rentals | One-to-Many |
| Cars → Rentals | One-to-Many |
| Employees → Rentals | One-to-Many |
| Rentals → Payments | One-to-Many |
| Cars → Maintenance | One-to-Many |
| Rentals ↔ RentalServices | Many-to-Many |

---

# Database Features

### Primary Keys

Each major entity uses an AUTO_INCREMENT primary key.

Example:

```sql
customer_id INT AUTO_INCREMENT PRIMARY KEY
```

---

### Composite Primary Key

The database implements a composite primary key using the junction table:

```sql
PRIMARY KEY (rental_id, service_id)
```

This prevents duplicate service entries for the same rental.

---

### Foreign Keys

The database uses foreign keys to maintain referential integrity.

Example:

```sql
CONSTRAINT fk_employee_branch
FOREIGN KEY (branch_id)
REFERENCES Branches(branch_id)
```

---

### Cascade Rules

The schema implements both:

- ON UPDATE CASCADE
- ON DELETE CASCADE

where appropriate, while using

- ON DELETE RESTRICT

to prevent accidental deletion of important parent records.

---

## Technologies Used

| Category | Technology |
|----------|------------|
| Database | MySQL 8 |
| SQL Language | DDL |
| Development Environment | Visual Studio Code / MySQL Workbench |
| Version Control | Git & GitHub |

---

## Authors

- **Megan Philister** *(Group Leader)*
- Joel Ndung'u
- Nashaa Ndamu
- Ashley Mwanza
- Eric Kabui
- Fred Nyaga
- Eric Mwendwa
- Zuwena Kisya
- Richard Wasonga
- Melissa Wanjiru
- Andreas Muhavi

---

## Contributing

Pull requests are welcome. For significant changes, please open an issue first to discuss the proposed modifications.

---

## License

This project is intended for educational purposes as part of a Car Rental Management System database design assignment.