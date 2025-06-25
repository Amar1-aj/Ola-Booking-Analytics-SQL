-- Create database Ola

CREATE DATABASE Ola;

--Create table
--DROP TABLE BOOKINGS
DROP TABLE BOOKINGS;
CREATE TABLE BOOKINGS(
					Date	DATE,
					Time	TIME,
					Booking_ID	VARCHAR(50),
					Booking_Status	VARCHAR(50),
					Customer_ID	VARCHAR(50),
					Vehicle_Type	VARCHAR(50),
					Pickup_Location	VARCHAR(50),
					Drop_Location	VARCHAR(50),
					V_TAT	INT,
					C_TAT	INT,
					Canceled_Rides_by_Customer	VARCHAR(50),
					Canceled_Rides_by_Driver	VARCHAR(50),
					Incomplete_Rides	VARCHAR(50),
					Incomplete_Rides_Reason	VARCHAR(50),
					Booking_Value	INT,
					Payment_Method	VARCHAR(50),
					Ride_Distance	INT,
					Driver_Ratings	FLOAT,
					Customer_Rating	FLOAT
)

SELECT * FROM BOOKINGS;

COPY BOOKINGS(Date, Time, Booking_ID, Booking_Status, Customer_ID, Vehicle_Type, Pickup_Location, Drop_Location, V_TAT, C_TAT, Canceled_Rides_by_Customer, 
Canceled_Rides_by_Driver, Incomplete_Rides, Incomplete_Rides_Reason, Booking_Value, Payment_Method, Ride_Distance, Driver_Ratings, Customer_Rating
)
FROM 'E:\EDUCATION\Bookings-100000-Rows.xlsx'
DELIMITER ',' 
CSV HEADER;

--  1. Retrieve all successful bookings:
--  2. Find the average ride distance for each vehicle type:
--  3. Get the total number of cancelled rides by customers:
--  4. List the top 5 customers who booked the highest number of rides:
--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
--  7. Retrieve all rides where payment was made using UPI:
--  8. Find the average customer rating per vehicle type:
--  9. Calculate the total booking value of rides completed 
-- 8. Find the average customer rating per vehicle type:
-- 9. Calculate the total booking value of rides completed successfully:
-- 10. List all incomplete rides along with the reason:

--1. Retrieve all successful bookings:
CREATE VIEW successful bookings AS
SELECT * FROM BOOKINGS
WHERE Bookings_status = 'Success';

SELECT * FROM successful bookings;

--2. Find the average ride distance for each vehicle type:

CREATE VIEW ride_distance_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_distance) AS avg_distance
FROM BOOKINGS
GROUP BY Vehcle_Type;

SELECT * FROM ride_distance_each_vehicle;

--3. Get the total number of cancelled rides by customers:

CREATE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) FROM BOOKINGS
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customers;



--4. List the top 5 customers who booked the highest number of rides:


	CREATE VIEW top_5_customers_higest_rides AS
	SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
	FROM BOOKINGS
	GROUP BY Customer_ID
	ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_cutomers_higest_ride;


--5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Rider_Canceled_by_Dreiver_P_C_Issue AS
SELECT COUNT(*) FROM BOOKINGS
WHERE Canceled_Rider_by_Drive='Personal & Car related issue';

	SELECT * FROM Rider_Canceled_by_Dreiver_P_C_Issue;


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Rating) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM BOOKINGS  
WHERE Vehicle_Type = 'Pirme Sedan';

SELECT * FROM Max_Min_Driver_Rating;

--  7. Retrieve all rides where payment was made using UPI:

CREATE VIEW UPI_Payment_mode AS
SELECT * FROM BOOKINGS
WHERE Payment_Method = 'UPI'

SELECT * FROM UPI_Payment_mode;

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW AvG_rating_per_vehicle AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM BOOKINGS
GROUP BY Vehicle_Type;


-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Total_booking_value_completed AS
SELECT SUM(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status='Success';

SELECT * FROM Total_booking_value_completed;


-- 10. List all incomplete rides along with the reason:

CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM BOOKINGS
WHERE Incomplete_Riders = 'Yes'

SELECT * FROM Incomplete_Rides_Reason;









 
























