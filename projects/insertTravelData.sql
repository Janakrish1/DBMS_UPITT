INSERT INTO Customers (customer_id, customer_name, email, join_date)
VALUES 
(1, 'John Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane Smith', 'jane.smith@example.com', '2022-11-23'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '2023-05-10'),
(4, 'Bob Williams', 'bob.williams@example.com', '2024-02-02');


INSERT INTO Customers (customer_id, customer_name, email, join_date)
VALUES 
(5, 'David Brown', 'david.brown@example.com', '2024-03-10'),  -- Customer without review
(6, 'Sarah Miller', 'sarah.miller@example.com', '2024-04-22');

INSERT INTO Hotels (hotel_id, hotel_name, location, star_rating)
VALUES 
(1, 'Grand Palace', 'New York', 4.5),
(2, 'Sunset Resort', 'California', 4.0),
(3, 'Ocean Breeze', 'Miami', 3.8),
(4, 'Mountain Escape', 'Colorado', 4.7);


INSERT INTO Bookings (booking_id, customer_id, hotel_id, check_in, check_out, total_cost)
VALUES 
(1, 1, 1, '2024-08-01', '2024-08-05', 1500.00),
(2, 2, 2, '2024-07-20', '2024-07-25', 1200.00),
(3, 3, 3, '2024-06-15', '2024-06-20', 850.00),
(4, 4, 4, '2024-09-05', '2024-09-10', 2000.00);

INSERT INTO Bookings (booking_id, customer_id, hotel_id, check_in, check_out, total_cost)
VALUES (7, 1, 2, '2024-05-05', '2024-05-10', 1200.00);

-- Insert new bookings with different check-in and check-out dates
INSERT INTO Bookings (booking_id, customer_id, hotel_id, check_in, check_out, total_cost)
VALUES
(8, 4, 1, '2024-06-01', '2024-06-12', 2200),  -- 11 nights
(9, 3, 2, '2024-03-10', '2024-03-15', 600),   -- 5 nights
(10, 5, 3, '2024-07-01', '2024-07-20', 3000), -- 19 nights
(11, 1, 3, '2024-08-01', '2024-08-10', 1700), -- 9 nights (same customer, another booking)
(12, 3, 1, '2024-09-15', '2024-09-25', 1200); -- 10 nights



INSERT INTO Bookings (booking_id, customer_id, hotel_id, check_in, check_out, total_cost)
VALUES
(5, 5, 2, '2024-05-01', '2024-05-05', 1100.00),  -- Booking without a review
(6, 6, 1, '2024-09-10', '2024-09-15', 1400.00); 

INSERT INTO Reviews (review_id, customer_id, hotel_id, rating, review_text)
VALUES 
(1, 1, 1, 5, 'Amazing stay! Highly recommend this hotel.'),
(2, 2, 2, 4, 'Nice resort, but food could be better.'),
(3, 3, 3, 3, 'Good location, average service.'),
(4, 4, 4, 5, 'Perfect getaway in the mountains!');

