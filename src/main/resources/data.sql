--creating user table
CREATE TABLE Users (
    UserId varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255),
    Address varchar(255),
    AddressType varchar(255)
);
--adding mock values to the user table
INSERT INTO Users (UserId, Password, Name, Email, Phone, Address, AddressType)  
   VALUES ('admin', 'admin', 'TestUser', 'testuser@relevel.com', '7777000055', 'Plot No: 45, Somajiguda, Hyderabad-500032', 'Home');

   
--creating Restaurant table
CREATE TABLE Restaurant (
    RestaurantId INTEGER PRIMARY KEY,
    RestaurantName varchar(255),
    Address varchar(255),
    City varchar(255),
    IsAcceptingOrders boolean
);

--adding mock values to the Restaurant table
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (001, 'Green Bawarchi', 'Y junction Kukatpally', 'Hyderabad', true);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (002, 'Hitex Bawarchi', 'Main road Beeramguda', 'Hyderabad', false);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (003, 'Bawarchi', 'RTC Crossroads, Ashoknagar', 'Hyderabad', true);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (004, 'Delhi Highway', '105 Mistry Mansion Ground Floor Mahatma Gandhi Road Kala Ghoda', 'Mumbai', true);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (005, 'Manuhaar- The Taste of Tradition', 'Hotel Sahara Star, Opp Domestic Airport', 'Mumbai', true);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (006, 'Kebabs & Kurries', '287 Dr B R Ambedkar Road ITC Grand Central Hotel', 'Mumbai', true);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (007, 'HOP House OF Proteins', 'Malviya Nagar SHOP NO 33 Corner Market', 'New Delhi', false);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (008, 'Daryaganj Restaurant (Connaught Place)', 'Shop No. 11 Regal Building Connaught Place', 'New Delhi', false);
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City, IsAcceptingOrders)  
   VALUES (009, 'CIA Call it Asiian', '16 Alaknanda Rd. Opposite Don Bosco School, Narmada Shopping Complex', 'New Delhi', true);

   
--creating Items table
CREATE TABLE Items (
    ItemId INTEGER PRIMARY KEY,
    RestaurantId INTEGER references Restaurant(RestaurantId),
    DishName varchar(255),
    Price DECIMAL
);   

--Inserting menu item details
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (447756,001,'Veg Pulao',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (669785,001,'Chicken Birayani',300);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (552354,001,'Mutton Birayani',400);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (884524,001,'Butter Chicken',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (885697,001,'Romali Roti',10);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (221458,002,'Fish Curry',340.56);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (998745,002,'Chicken Kolapuri',320.24);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (114587,002,'Mutton zafrani',480);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (887744,002,'Egg Birayani',375);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (998874,002,'Romali Roti',30);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (996632,006,'Veg Pulao',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (774158,006,'Chicken Tikka',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (963214,006,'Chilli Chicken',240);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (852364,006,'Paneer Butter Masala',250);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (951236,006,'Butter Nan',35);
   
--creating DeliveryBoyDetails table
CREATE TABLE DeliveryBoyDetails (
    DeliveryBoyId INTEGER PRIMARY KEY,
    DeliveryBoyIdName varchar(255),
    DeliveryBoyMobile varchar(255)
);

--adding mock values to the DeliveryBoyDetails table
INSERT INTO DeliveryBoyDetails (DeliveryBoyId, DeliveryBoyIdName, DeliveryBoyMobile)  
   VALUES (4457, 'Ramesh', '7784455677');
INSERT INTO DeliveryBoyDetails (DeliveryBoyId, DeliveryBoyIdName, DeliveryBoyMobile)  
   VALUES (7745, 'Suresh', '7784454477');

--creating OrderDetails table
CREATE TABLE OrderDetails (
    OrderId INTEGER PRIMARY KEY,
    RestaurantId INTEGER references Restaurant(RestaurantId),
    UserId varchar(255) references Users(UserId),
    DeliveryBoyId INTEGER references DeliveryBoyDetails(DeliveryBoyId),
    OrderStatus varchar(255)
);


--adding mock values to the BookingDetails table
INSERT INTO OrderDetails (OrderId, RestaurantId, UserId, DeliveryBoyId, OrderStatus)  
   VALUES (7745, 001, 'admin', 4457, 'Out For Delivery');
INSERT INTO OrderDetails (OrderId, RestaurantId, UserId, OrderStatus)  
   VALUES (8874, 001, 'admin', 'Ordered');
INSERT INTO OrderDetails (OrderId, RestaurantId, UserId, DeliveryBoyId, OrderStatus)  
   VALUES (9982, 006, 'admin', 7745, 'Out For Delivery');
INSERT INTO OrderDetails (OrderId, RestaurantId, UserId, OrderStatus)  
   VALUES (4471, 002, 'admin', 'Processing');

--creating InOrderItems  table
CREATE TABLE InOrderItems (
    InOrderId INTEGER PRIMARY KEY,
    OrderId INTEGER references OrderDetails(OrderId),
    ItemId INTEGER references Items(ItemId),
    Quantity INTEGER
);

--adding mock values to the InOrderItems table
INSERT INTO InOrderItems (InOrderId, OrderId, ItemId, Quantity)  
   VALUES (4477, 7745, 447756, 1);
INSERT INTO InOrderItems (InOrderId, OrderId, ItemId, Quantity)  
   VALUES (5456, 7745, 884524, 1);
INSERT INTO InOrderItems (InOrderId, OrderId, ItemId, Quantity)  
   VALUES (4475, 8874, 552354, 2);
INSERT INTO InOrderItems (InOrderId, OrderId, ItemId, Quantity)  
   VALUES (7412, 9982, 774158, 1);
INSERT INTO InOrderItems (InOrderId, OrderId, ItemId, Quantity)  
   VALUES (9987, 9982, 963214, 1);
INSERT INTO InOrderItems (InOrderId, OrderId, ItemId, Quantity)  
   VALUES (7789, 4471, 998745, 1);







