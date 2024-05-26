-- USE master
-- CREATE DATABASE SQLFinal2024

-- USE SQLFinal2024

-- ----- Tables -----
-- CREATE TABLE Clients (
--     Client_ID INT IDENTITY(1,1) PRIMARY KEY,
--     First_Name VARCHAR(50) NOT NULL,
--     MI VARCHAR(1),
--     Last_Name VARCHAR (50) NOT NULL,
--     DOB DATE,
--     Phone VARCHAR (15) NOT NULL, 
--     Email VARCHAR(100)
-- )

-- CREATE TABLE Services (
--      Service_ID INT IDENTITY(1,1) PRIMARY KEY,
--      Service_Name VARCHAR (50) NOT NULL,
--      Service_Cost MONEY NOT NULL,
--      Service_Desc VARCHAR (Max) NOT NULL,
--      Avg_Time INT NOT NULL
-- )

-- CREATE TABLE Stylists (
--     Stylist_ID INT IDENTITY(1,1) PRIMARY KEY, 
--     First_Name VARCHAR(50) NOT NULL,
--     MI VARCHAR(1),
--     Last_Name VARCHAR (50) NOT NULL,
--     DOB DATE NOT NULL,
--     Street VARCHAR (100) NOT NULL,
--     CITY VARCHAR (50) NOT NULL,
--     State VARCHAR(2) NOT NULL,
--     Zip_Code INT NOT NULL,
--     Phone VARCHAR (15) NOT NULL    
-- )

-- CREATE TABLE Vendors (
--     Vendor_ID INT IDENTITY(1,1) PRIMARY KEY,
--     Vendor_Name VARCHAR (100) NOT NULL,
--     Street VARCHAR (100) NOT NULL,
--     CITY VARCHAR (50) NOT NULL,
--     State VARCHAR(2) NOT NULL,
--     Zip_Code INT NOT NULL,
--     Phone VARCHAR (15),
--     Email VARCHAR (100),
--     Website VARCHAR(100)    
-- )

-- CREATE TABLE Products (
--     Product_ID INT IDENTITY(1,1) PRIMARY KEY,
--     Vendor_ID INT FOREIGN KEY REFERENCES Vendors(Vendor_ID),
--     Product_Name VARCHAR(100) NOT NULL,
--     UPC VARCHAR(100) NOT NULL, 
--     Wholesale_Price MONEY NOT NULL,
--     Retail_Price MONEY,
--     Order_Qty INT NOT NULL,
--     Discontinued VARCHAR(10)
-- )

-- CREATE TABLE Inventory (
--     Stock_ID INT IDENTITY(1,1) PRIMARY KEY,
--     Product_ID INT FOREIGN KEY REFERENCES Products(Product_ID),
--     Amt_In_Stock INT NOT NULL,
--     Min_Stock INT NOT NULL
-- )

-- CREATE TABLE Appointments (
--     Appt_ID INT IDENTITY(1,1) PRIMARY KEY,
--     Appt_Date DATE NOT NULL,
--     Appt_Time TIME NOT NULL,
--     Client_ID INT FOREIGN KEY REFERENCES Clients(Client_ID),
--     Stylist_ID INT FOREIGN KEY REFERENCES Stylists(Stylist_ID),
--     Service_ID INT FOREIGN KEY REFERENCES Services(Service_ID),
--     Product_ID INT FOREIGN KEY REFERENCES Products(Product_ID)
-- )

-- CREATE TABLE Sales (
--     Sales_ID INT IDENTITY(1,1) PRIMARY KEY,
--     Appt_ID INT FOREIGN KEY REFERENCES Appointments(Appt_ID),
--     Transation_Date DATE NOT NULL,
--     Total_Charge MONEY NOT NULL,
--     Payment_Type VARCHAR (50),
--     Credit_Transaction VARCHAR (50) 
-- )

-- ----- Insert -----
-- BULK INSERT Clients
-- FROM 'D:\Allie SQL Course\Final Project\Clients.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Services
-- FROM 'D:\Allie SQL Course\Final Project\Services.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Stylists
-- FROM 'D:\Allie SQL Course\Final Project\Stylists.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Vendors
-- FROM 'D:\Allie SQL Course\Final Project\Vendors.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Products
-- FROM 'D:\Allie SQL Course\Final Project\Products.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Inventory
-- FROM 'D:\Allie SQL Course\Final Project\Inventory.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Appointments
-- FROM 'D:\Allie SQL Course\Final Project\Appointments.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- BULK INSERT Sales
-- FROM 'D:\Allie SQL Course\Final Project\Sales.csv'
-- WITH (
--     FORMAT='CSV',
--     FIRSTROW=2,
--     ROWTERMINATOR = '0x0a'
-- );

-- INSERT INTO Appointments
-- VALUES
-- ('05-24-2024', '9:00', 87, 19, 14, 8),
-- ('05-24-2024', '10:00', 20, 37, 33, 18),
-- ('05-24-2024', '11:00', 143, 5, 5, 7),
-- ('05-24-2024', '12:00', 360, 19, 14, 756),
-- ('05-24-2024', '13:00', 420, 37, 27, 690),
-- ('05-24-2024', '14:00', 399, 46, 5, 215),
-- ('05-24-2024', '9:30', 12, 46, 32, 450),
-- ('05-24-2024', '11:30', 270, 46, 36, 999),
-- ('05-24-2024', '14:30', 500, 19, 14, 8),
-- ('05-24-2024', '13:30', 369, 05, 32, 343);

-- ----- SELECT -----
-- SELECT * FROM Appointments 
-- WHERE Appt_Date = '05/24/2024'
-- ORDER BY Appt_Time

-- ----- Update -----
-- USE SQLFinal2024
-- UPDATE Products 
-- SET Retail_Price = (Products.Wholesale_Price * 2)

-- ----- FUNCTION ----- 
-- CREATE FUNCTION Day_Sheet(@Day AS DATE) 
-- RETURNS TABLE
-- AS
-- RETURN (
--     SELECT a.Appt_Date, a.Appt_Time, CONCAT(c.First_Name, ' ', c.Last_Name) AS Client_Name, se.Service_Name, p.Product_Name, CONCAT(st.First_Name, ' ', st.Last_Name) AS Stylist_Name
-- FROM Appointments AS a
-- JOIN Clients AS c
-- ON a.Client_ID = c.Client_ID 
-- JOIN Products AS p
-- ON a.Product_ID = p.Product_ID
-- JOIN Services AS se
-- ON a.Service_ID = se.Service_ID
-- JOIN Stylists AS st
-- ON a.Stylist_ID = st.Stylist_ID
-- WHERE a.Appt_Date = @Day
-- ) 

-- SELECT * FROM Day_Sheet('04-24-2024')

-- ----- VIEW -----
-- CREATE VIEW Stock_Low
-- AS
-- SELECT i.Product_ID, i.Amt_In_Stock, i.Min_Stock, p.Product_Name, p.Order_Qty, p.Discontinued, v.Vendor_Name, v.Phone, v.Email, v.Website 
-- FROM Inventory AS i
-- JOIN Products AS p
-- ON p.Product_ID = i.Product_ID
-- JOIN Vendors AS v
-- ON v.Vendor_ID = p.Vendor_ID
-- WHERE i.Amt_In_Stock < i.Min_Stock

-- USE SQLFinal2024
-- SELECT * FROM dbo.Stock_Low

-- ----- Stored Procedure -----
-- CREATE PROCEDURE Book_Appt(
--     @Appt_Date DATE,
--     @Appt_Time TIME,
--     @Client_ID INT,
--     @Stylist_ID INT,
--     @Service_ID INT,
--     @Product_ID INT
-- )
-- AS
-- INSERT INTO Appointments(
--     Appt_Date,
--     Appt_Time,
--     Client_ID,
--     Stylist_ID,
--     Service_ID,
--     Product_ID
-- )
-- VALUES(
--     @Appt_Date,
--     @Appt_Time,
--     @Client_ID,
--     @Stylist_ID,
--     @Service_ID,
--     @Product_ID
-- )

-- EXECUTE Book_Appt '05-25-2024','12:00','404','13','23','789'

-- -----DELETE-----
-- USE master
-- GO
-- DROP DATABASE SQLFinal2024
-- GO

-- BACKUP DATABASE SQLFinal2024
-- TO DISK = 'D:\Allie SQL Course\Final Project\SQLFinalProject2024.BAK';	