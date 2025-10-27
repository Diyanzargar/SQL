-- CREATE DATABASE REAL_ESTATE; 
-- USE REAL_ESTATE;

-- CREATE TABLE Neighborhoods (
--     neighborhood_id INTEGER PRIMARY KEY,
--     neighborhood_name VARCHAR(100) NOT NULL,
--     city VARCHAR(50) NOT NULL,
--     average_price_per_sqft DECIMAL(10, 2),
--     safety_rating INTEGER CHECK (safety_rating BETWEEN 1 AND 10)
-- );

-- CREATE TABLE Agents (
--     agent_id INTEGER PRIMARY KEY,
--     agent_name VARCHAR(100) NOT NULL,
--     email VARCHAR(100),
--     phone VARCHAR(15),
--     experience_years INTEGER,
--     commission_rate DECIMAL(4, 2) -- percentage
-- );

-- CREATE TABLE Buyers (
--     buyer_id INTEGER PRIMARY KEY,
--     buyer_name VARCHAR(100) NOT NULL,
--     email VARCHAR(100),
--     phone VARCHAR(15),
--     budget DECIMAL(12, 2),
--     preferred_neighborhood_id INTEGER,
--     FOREIGN KEY (preferred_neighborhood_id) REFERENCES Neighborhoods(neighborhood_id)
-- );

-- CREATE TABLE PropertyListings (
--     property_id INTEGER PRIMARY KEY,
--     address VARCHAR(200) NOT NULL,
--     neighborhood_id INTEGER,
--     bedrooms INTEGER,
--     bathrooms INTEGER,
--     square_feet INTEGER,
--     listing_price DECIMAL(12, 2),
--     year_built INTEGER,
--     agent_id INTEGER,
--     listing_date DATE,
--     FOREIGN KEY (neighborhood_id) REFERENCES Neighborhoods(neighborhood_id),
--     FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
-- );

-- CREATE TABLE Sales (
--     sale_id INTEGER PRIMARY KEY,
--     property_id INTEGER,
--     buyer_id INTEGER,
--     agent_id INTEGER,
--     sale_price DECIMAL(12, 2),
--     sale_date DATE,
--     days_on_market INTEGER,
--     FOREIGN KEY (property_id) REFERENCES PropertyListings(property_id),
--     FOREIGN KEY (buyer_id) REFERENCES Buyers(buyer_id),
--     FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
-- );


-- INSERT INTO Neighborhoods VALUES 
-- (1, 'Green Valley', 'Springfield', 250.00, 9),
-- (2, 'Downtown District', 'Springfield', 320.00, 7),
-- (3, 'Sunset Hills', 'Springfield', 280.00, 8),
-- (4, 'Riverside', 'Springfield', 230.00, 8),
-- (5, 'Oak Park', 'Springfield', 200.00, 6);

-- INSERT INTO Agents VALUES 
-- (1, 'John Smith', 'john.smith@realty.com', '555-0101', 8, 3.00),
-- (2, 'Emily Johnson', 'emily.j@realty.com', '555-0102', 5, 2.50),
-- (3, 'Michael Brown', 'mbrown@realty.com', '555-0103', 12, 3.50),
-- (4, 'Sarah Davis', 'sdavis@realty.com', '555-0104', 3, 2.00),
-- (5, 'David Wilson', 'dwilson@realty.com', '555-0105', 15, 4.00);


-- INSERT INTO Buyers VALUES 
-- (1, 'Alice Cooper', 'alice.c@email.com', '555-1001', 450000, 1),
-- (2, 'Bob Martinez', 'bob.m@email.com', '555-1002', 350000, 2),
-- (3, 'Carol White', 'carol.w@email.com', '555-1003', 500000, 3),
-- (4, 'Daniel Lee', 'daniel.l@email.com', '555-1004', 280000, 4),
-- (5, 'Emma Taylor', 'emma.t@email.com', '555-1005', 400000, 1),
-- (6, 'Frank Harris', 'frank.h@email.com', '555-1006', 600000, 2),
-- (7, 'Grace Kim', 'grace.k@email.com', '555-1007', 320000, NULL);


-- INSERT INTO PropertyListings VALUES 
-- (1, '123 Maple Street', 1, 3, 2, 1800, 425000, 2015, 1, '2024-01-15'),
-- (2, '456 Oak Avenue', 2, 2, 1, 1200, 380000, 2018, 2, '2024-02-01'),
-- (3, '789 Pine Road', 3, 4, 3, 2500, 575000, 2012, 3, '2024-01-20'),
-- (4, '321 Elm Drive', 1, 3, 2, 1900, 445000, 2016, 1, '2024-02-10'),
-- (5, '654 Birch Lane', 4, 2, 2, 1400, 310000, 2019, 2, '2024-01-25'),
-- (6, '987 Cedar Court', 2, 3, 2, 1600, 420000, 2017, 4, '2024-02-15'),
-- (7, '147 Willow Way', 3, 5, 4, 3200, 680000, 2010, 3, '2024-01-10'),
-- (8, '258 Ash Street', 5, 2, 1, 1100, 245000, 2020, 5, '2024-02-20'),
-- (9, '369 Spruce Avenue', 1, 4, 3, 2200, 520000, 2014, 1, '2024-01-30'),
-- (10, '741 Cherry Boulevard', NULL, 3, 2, 1700, 390000, 2013, NULL, '2024-02-05'); 


-- INSERT INTO Sales VALUES 
-- (1, 1, 1, 1, 420000, '2024-03-01', 45),
-- (2, 2, 2, 2, 375000, '2024-03-15', 43),
-- (3, 3, 3, 3, 570000, '2024-03-10', 49),
-- (4, 5, 4, 2, 305000, '2024-03-20', 54),
-- (5, 7, 6, 3, 675000, '2024-03-25', 75),
-- (6, 8, 5, 5, 240000, '2024-04-01', 40);