# blood_bank_management
# Blood Bank Management System

## Overview
The Blood Bank Management System is a database-driven application designed to manage blood donations, blood inventory, and blood requests. It allows for efficient tracking of donors, recipients, blood types, and transfusions, ensuring that blood is available when needed.

## Features
- Manage donor information (name, contact details, blood type)
- Track blood inventory (blood bags, types, expiry dates)
- Handle recipient information and blood requests
- Record blood transfusions
- Generate reports on blood donations and requests

## Database Schema
The database consists of the following tables:
- **Donors**: Stores information about blood donors.
- **BloodTypes**: Contains different blood types and their Rh factors.
- **BloodBags**: Tracks blood bags, their donation dates, expiry dates, and quantities.
- **Recipients**: Stores information about blood recipients.
- **BloodRequests**: Manages requests for blood from recipients.
- **Transfusions**: Records details of blood transfusions.

## Getting Started

### Prerequisites
- A SQL database management system (e.g., MySQL, PostgreSQL)
- Basic knowledge of SQL

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/sakshiipawarpatil/blood-bank-management.git
   cd blood-bank-management
