-- Database Schema v2.0
CREATE TABLE Donors (
    DonorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    BloodTypeID INT,
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address TEXT,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BloodTypeID) REFERENCES BloodTypes(BloodTypeID)
);

CREATE TABLE BloodTypes (
    BloodTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(3) NOT NULL UNIQUE,
    RhFactor ENUM('+', '-') NOT NULL
);

CREATE TABLE BloodBags (
    BloodBagID INT PRIMARY KEY AUTO_INCREMENT,
    BloodTypeID INT,
    DonationDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Quantity INT NOT NULL, -- in milliliters
    Status ENUM('Available', 'Expired', 'Used') DEFAULT 'Available',
    FOREIGN KEY (BloodTypeID) REFERENCES BloodTypes(BloodTypeID)
);

CREATE TABLE Recipients (
    RecipientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address TEXT,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE BloodRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    RecipientID INT,
    BloodTypeID INT,
    RequestDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Quantity INT NOT NULL, -- in milliliters
    Status ENUM('Pending', 'Fulfilled', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID),
    FOREIGN KEY (BloodTypeID) REFERENCES BloodTypes(BloodTypeID)
);

CREATE TABLE Transfusions (
    TransfusionID INT PRIMARY KEY AUTO_INCREMENT,
    RecipientID INT,
    BloodBagID INT,
    TransfusionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Quantity INT NOT NULL, -- in milliliters
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID),
    FOREIGN KEY (BloodBagID) REFERENCES BloodBags(BloodBagID)
);

-- Inserting Blood Types
INSERT INTO BloodTypes (Type, RhFactor) VALUES 
('A', '+'),
('A', '-'),
('B', '+'),
('B', '-'),
('AB', '+'),
('AB', '-'),
('O', '+'),
('O', '-');

-- Inserting Donors
INSERT INTO Donors (FirstName, LastName, DateOfBirth, Gender, BloodTypeID, Phone, Email, Address) VALUES 
('John', 'Doe', '1985-05-15', 'Male', 1, '1234567890', 'john.doe@example.com', '123 Main St, City, Country'),
('Jane', 'Smith', '1990-08-20', 'Female', 3, '0987654321', 'jane.smith@example.com', '456 Elm St, City, Country');

-- Inserting Blood Bags
INSERT INTO BloodBags (BloodTypeID, DonationDate, ExpiryDate, Quantity, Status) VALUES 
(1, '2023-01-01', '2024-01-01', 500, 'Available'),
(3, '2023-02-01', '2024-02-01', 300, 'Available'),
(2, '2023-03-01', '2024-03-01', 250, 'Expired');

-- Inserting Recipients
INSERT INTO Recipients (FirstName, LastName, DateOfBirth, Gender, Phone, Email, Address) VALUES 
('Alice', 'Johnson', '1988-12-12', 'Female', '1231231234', 'alice.johnson@example.com', '789 Pine St, City, Country'),
('Bob', 'Brown', '1975-03-30', 'Male', '3213214321', 'bob.brown@example.com', '321 Oak St, City, Country');

-- Inserting Blood Requests
INSERT INTO BloodRequests (RecipientID, BloodTypeID, Quantity, Status) VALUES 
(1, 1, 200, 'Pending'),
(2, 3, 300, 'Pending');

-- Inserting Transfusions
INSERT INTO Transfusions (RecipientID, BloodBagID, Quantity) VALUES 
(1, 1, 200),
(2, 2, 300);
