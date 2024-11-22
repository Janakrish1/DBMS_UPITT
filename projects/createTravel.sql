create database Travel;
use Travel;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,                -- Primary key for customers
    customer_name VARCHAR(100) NOT NULL,        -- Name of the customer, can't be null
    email VARCHAR(100) UNIQUE NOT NULL,         -- Unique email address, can't be null
    join_date DATE                              -- Date when the customer joined the system
);

CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY,                   -- Primary key for hotels
    hotel_name VARCHAR(100) NOT NULL,           -- Name of the hotel, can't be null
    location VARCHAR(100),                      -- Location of the hotel
    star_rating DECIMAL(2,1)                    -- Star rating of the hotel, e.g., 4.5
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,                 -- Primary key for bookings
    customer_id INT,                            -- Foreign key referencing Customers table
    hotel_id INT,                               -- Foreign key referencing Hotels table
    check_in DATE,                              -- Check-in date for the booking
    check_out DATE,                             -- Check-out date for the booking
    total_cost DECIMAL(10,2),                   -- Total cost of the booking
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),  -- Customer reference
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)            -- Hotel reference
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,                  -- Primary key for reviews
    customer_id INT,                            -- Foreign key referencing Customers table
    hotel_id INT,                               -- Foreign key referencing Hotels table
    rating INT CHECK (rating BETWEEN 1 AND 5),  -- Rating between 1 and 5
    review_text TEXT,                           -- Text of the customer review
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),  -- Customer reference
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)            -- Hotel reference
);

