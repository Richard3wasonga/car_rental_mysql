# DriveEase Rentals Database

> A relational MySQL database for **DriveEase Rentals**, a fictional car rental company. This project implements the database schema for managing customers, vehicles, branches, employees, rentals, payments, vehicle maintenance, and optional rental services.

---

## Features

- Relational database design following normalization principles
- 10 interconnected tables
- AUTO_INCREMENT primary keys
- Composite primary key using a junction table
- One-to-Many relationships
- Many-to-Many relationship implementation
- Foreign key constraints with referential integrity
- ON UPDATE CASCADE rules
- ON DELETE CASCADE and ON DELETE RESTRICT actions
- Unique constraints for important customer and vehicle identifiers

---

## Database Overview

The database supports the complete rental process, including:

- Customer registration
- Branch management
- Employee management
- Vehicle categorization
- Fleet management
- Vehicle rentals
- Payment processing
- Vehicle maintenance history
- Additional rental services (GPS, Wi-Fi, Child Seat, etc.)

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
└── README.md
```

---

# Setup & Installation

## Option 1: Using Visual Studio Code

### Prerequisites

- MySQL Server 8.0 or later
- Visual Studio Code
- Git

### Recommended Extensions

- SQLTools
- SQLTools MySQL/MariaDB Driver

### Installation

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

5. Open

```
ddl/car_rental_database.sql
```

6. Execute the script to create the database and all tables.

---

## Option 2: Using MySQL Workbench

### Prerequisites

- MySQL Server 8.0 or later
- MySQL Workbench
- Git

### Installation

1. Clone the repository

```bash
git clone https://github.com/<your-username>/car_rental_mysql.git
```

2. Open MySQL Workbench.

3. Connect to your MySQL server.

4. Open

```
ddl/car_rental_database.sql
```

5. Execute the script.

The script will automatically create:

- Database
- Tables
- Constraints
- Relationships

---