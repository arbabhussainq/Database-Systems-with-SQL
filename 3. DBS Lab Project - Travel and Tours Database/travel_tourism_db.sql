CREATE DATABASE IF NOT EXISTS travel_tourism_db;
USE travel_tourism_db;

CREATE TABLE Destinations (
    destinationID INT NOT NULL,
    destinationName VARCHAR(255),
    destinationDescription VARCHAR(255),
    destinationLocation VARCHAR(255),
    PRIMARY KEY (destinationID)
);


CREATE TABLE Transportation (
    transportID INT NOT NULL,
    transportMode VARCHAR(50),
    departureLocation VARCHAR(255),
    arrivalLocation VARCHAR(255),
    PRIMARY KEY(transportID)
);


CREATE TABLE Accommodations (
    accommodationID INT NOT NULL,
    accommodationType VARCHAR(50),
    accommodationName VARCHAR(255),
    accomodationLocation VARCHAR(255),
    accomodationRent FLOAT,
    PRIMARY KEY(accommodationID)
);


CREATE TABLE Activities (
    activityID INT NOT NULL,
    activityName VARCHAR(255),
    activityDescription VARCHAR(255),
    activityLocation VARCHAR(255),
    activityDuration INT,
    PRIMARY KEY(activityID)
);


CREATE TABLE Users (
    userID INT NOT NULL,
    userName VARCHAR(50),
    userEmail VARCHAR(255),
    userRole VARCHAR(50),
    PRIMARY KEY(userID)
);


CREATE TABLE Bookings (
    bookingID INT NOT NULL,
    userID INT,
    destinationID INT,
    transportID INT,
    accommodationID INT,
    activityID INT,
    bookingDate DATE NOT NULL,
    bookingPrice FLOAT,
    primary key(bookingID),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (destinationID) REFERENCES Destinations(destinationID),
    FOREIGN KEY (transportID) REFERENCES Transportation(transportID),
    FOREIGN KEY (accommodationID) REFERENCES Accommodations(accommodationID),
    FOREIGN KEY (activityID) REFERENCES Activities(activityID)
);


CREATE TABLE Reviews (
    reviewID INT NOT NULL,
    userID INT,
    destinationID INT,
    accommodationID INT,
    activityID INT,
    reviewRating INT NOT NULL,
    reviewComment VARCHAR(255),
    PRIMARY KEY(reviewID),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (destinationID) REFERENCES Destinations(destinationID),
    FOREIGN KEY (accommodationID) REFERENCES Accommodations(accommodationID),
    FOREIGN KEY (activityID) REFERENCES Activities(activityID)
);


CREATE TABLE Payments (
    paymentID INT NOT NULL,
    userID INT,
    bookingID INT,
    amount FLOAT,
    paymentDate DATE,
    PRIMARY KEY(paymentID),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (bookingID) REFERENCES Bookings(bookingID)
);


CREATE TABLE WeatherData (
    weatherID INT NOT NULL,
    destinationID INT,
    currentDate DATE,
    conditions VARCHAR(255),
    PRIMARY KEY(weatherID),
    FOREIGN KEY (destinationID) REFERENCES Destinations(destinationID)
);

INSERT INTO Destinations (destinationID, destinationName, destinationDescription, destinationLocation)
VALUES 
    (1, 'Lahore', 'The ancient city of Pakistan famous for its historical buildings and Food.', 'Pakistan'),
    (2, 'Tokyo', 'A city known for its beauty and modernism.', 'Japan'),
    (3, 'Dubai', 'The heaven full of SkyScrapers. If you wanna touch the sky, go to Dubai.', 'UAE'),
    (4, 'New York City', 'The largest city of USA, famous for its diversity.', 'USA'),
    (5, 'Edinburgh', 'A city known for it\'s enchanting ancient beauty.', 'Scotland');

INSERT INTO Transportation(transportID, transportMode, departureLocation, arrivalLocation)
VALUES 
    (1, 'Flight', 'Lahore', 'New York City'),
    (2, 'Flight', 'Tokyo', 'Dubai'),
    (3, 'Train', 'New York City', 'Edinburgh'),
    (4, 'Train', 'Dubai', 'Lahore'),
    (5, 'Flight', 'Dubai', 'Edinburgh');


INSERT INTO Accommodations (accommodationID, accommodationType, accommodationName, accomodationLocation, accomodationRent)
VALUES 
    (1, 'Hotel', 'Bakhtawar Hotel', 'Lahore', 5000),
    (2, 'Hotel', 'Konohagakure', 'Tokyo', 8000),
    (3, 'Resort', 'Skyline Resort', 'Dubai', 16000),
    (4, 'Hotel', 'Silicon Suites', 'New York City', 23000),
    (5, 'Resort', 'Ancient Resort', 'Edinburgh', 18000);
    
INSERT INTO Activities (activityID, activityName, activityDescription, activityLocation, activityDuration)
VALUES 
    (1, 'Louvre Museum Tour', 'Guided tour of the famous Louvre Museum.', 'Tokyo', 120),
    (2, 'HarryPotter Land Tour', 'Guided tour of Potter Castle.', 'Edinburgh', 180),
    (3, 'Minar e Pakistan', 'Experience the magic of Acrchitecture.', 'Lahore', 100),
    (4, 'Central Park Bike Ride', 'Rent a bike and explore Central Park.', 'New York City', 90),
    (5,  'Sky Diving', 'Guided tour of the iconic Sky Diving.', 'Dubai', 200);

INSERT INTO Users (userID, userName, userEmail, userRole)
VALUES 
    (1, 'arbab', 'arbab@gmail.com', 'Tourist'),
    (2, 'talha', 'adatalha@gmail.com', 'Tourist'),
    (3, 'parkash', 'omp@gmail.com', 'Travel Agent'),
    (4, 'maghan', 'dmaghan@gmail.com', 'Administrator');
    
INSERT INTO Bookings (bookingID, userID, destinationID, transportID, accommodationID, activityID, bookingDate, bookingPrice)
VALUES 
    (1, 1, 1, 1, 1, 1, '2024-04-15', 500.00),
    (2, 1, 2, 2, 2, 2, '2024-05-20', 600.00),
    (3, 2, 3, 3, 3, 3, '2024-06-25', 700.00),
    (4, 2, 4, 4, 4, 4, '2024-07-30', 800.00),
    (5, 3, 5, 5, 5, 5, '2024-08-10', 900.00);
    
INSERT INTO Reviews (reviewID, userID, destinationID, accommodationID, activityID, reviewRating, reviewComment)
VALUES 
    (1, 1, 1, 1, 1, 5, 'Amazing experience at the Eiffel Tower Hotel!'),
    (2, 2, 2, 2, 2, 4, 'The tour was great, but breakfast could be improved.'),
    (3, 1, 3, 3, 3, 5, 'Skyline Resort was perfect for our stay!'),
    (4, 2, 4, 4, 4, 4, 'Big Apple Suites provided a comfortable stay in New York City.'),
    (5, 1, 5, 5, 5, 5, 'Lahore Lodge had stunning views of the ancient beauty!');
    

INSERT INTO Payments (paymentID, userID, bookingID, amount, paymentDate)
VALUES 
    (1, 1, 1, 500.00, '2024-04-10'),
    (2, 1, 2, 600.00, '2024-05-15'),
    (3, 2, 3, 700.00, '2024-06-20'),
    (4, 2, 4, 800.00, '2024-07-25'),
    (5, 3, 5, 900.00, '2024-08-05');  
    
INSERT INTO WeatherData (weatherID, destinationID, currentDate, conditions)
VALUES 
     (1, 1, '2024-04-15', 'Sunny'),
	   (2, 2, '2024-05-20', 'Partly Cloudy'),
	   (3, 3, '2024-06-25', 'Rainy'),
     (4, 4, '2024-07-30', 'Cloudy'),
     (5, 5, '2024-08-10', 'Clear');
