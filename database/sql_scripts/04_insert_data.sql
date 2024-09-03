-- Insert sample data into CATEGORY
INSERT INTO [dbo].[CATEGORY] (Category_Code, Category_Name, Category_Description, Is_Active)
VALUES 
('ELEC', 'Electrical Goods', 'All types of electrical goods and devices', 1),
('SERV', 'Services', 'Electrical installation and repair services', 1),
('SPAR', 'Spare Parts', 'Spare parts for electrical devices', 1),
('TOOL', 'Tools', 'Tools for electrical work', 1),
('SAFE', 'Safety Equipment', 'Safety gear and equipment', 1);

-- Insert sample data into CLIENT
INSERT INTO [dbo].[CLIENT] (Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES 
('CL001', 'John Doe', 'Doe Electricals', '0123456789', 'john.doe@doeelectricals.com', '123 Main St, Townsville', 'Preferred Client', 1),
('CL002', 'Jane Smith', 'Smith Home Services', '0987654321', 'jane.smith@smithhomeservices.com', '456 Market St, Villagetown', 'VIP Client', 1),
('CL003', 'Alice Brown', 'Brown Industries', '0112233445', 'alice.brown@brownindustries.com', '789 Industrial Park, Bigcity', 'Corporate Client', 1),
('CL004', 'Bob Green', 'Green Energy Solutions', '0223344556', 'bob.green@greenenergysolutions.com', '987 Suburb Ln, Smalltown', 'Regular Client', 1),
('CL005', 'Charlie Black', 'Black Electronics', '0334455667', 'charlie.black@blackelectronics.com', '654 Tech St, Metropolis', 'New Client', 1);

-- Insert sample data into EMPLOYEE
INSERT INTO [dbo].[EMPLOYEE] (Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address, Username, PasswordHash, IsAdmin, IsActive)
VALUES 
('8001011234567', 'Peter', 'Michael', 'Johnson', '2021-01-15', '0831112233', 'peter.johnson@koosielectrical.com', '789 Industrial Rd, Bigcity', 'admin', 'admin', 1, 1),
('8002027654321', 'Anna', NULL, 'Brown', '2022-05-20', '0832223344', 'anna.brown@koosielectrical.com', '321 Suburb Ln, Smalltown', 'anna.b', 'hashed_password_2', 0, 1),
('8010103456789', 'Tom', 'Henry', 'Smith', '2023-03-10', '0833334455', 'tom.smith@koosielectrical.com', '123 City Center, Bigcity', 'tom.s', 'hashed_password_3', 0, 1),
('8011122345678', 'Emma', 'Grace', 'White', '2024-06-01', '0834445566', 'emma.white@koosielectrical.com', '456 Countryside Rd, Villagetown', 'emma.w', 'hashed_password_4', 0, 1),
('8022034567890', 'Lucas', NULL, 'King', '2024-07-15', '0835556677', 'lucas.king@koosielectrical.com', '789 Suburbia Ave, Townsville', 'lucas.k', 'hashed_password_5', 1, 1);

-- Insert sample data into EQUIPMENT
INSERT INTO [dbo].[EQUIPMENT] (Equipment_Code, Name, Description, Quantity, Quantity_Checked_Out, Is_Active)
VALUES 
('EQ001', 'Multimeter', 'Digital multimeter for measuring electrical values', 10, 2, 1),
('EQ002', 'Screwdriver Set', 'Set of insulated screwdrivers for electrical work', 15, 5, 1),
('EQ003', 'Ladder', '10-foot ladder for reaching high places', 8, 3, 1),
('EQ004', 'Drill', 'Cordless drill with various bits', 12, 4, 1),
('EQ005', 'Safety Harness', 'Harness for working at heights', 6, 1, 1);

-- Insert sample data into JOB
INSERT INTO [dbo].[JOB] (Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES 
(1, 1, '2024-08-01 08:00', '2024-08-01 12:00', 'Install new circuit breakers in clients home'),
(2, 2, '2024-08-02 09:00', '2024-08-02 15:00', 'Repair malfunctioning oven at clients business'),
(3, 3, '2024-08-03 10:00', '2024-08-03 14:00', 'Upgrade industrial panel for clients factory'),
(4, 4, '2024-08-04 11:00', '2024-08-04 13:00', 'Install solar panels on clients roof'),
(5, 5, '2024-08-05 14:00', '2024-08-05 18:00', 'Set up smart home devices for clients new house');

-- Insert sample data into JOB_EQUIPMENT
INSERT INTO [dbo].[JOB_EQUIPMENT] (Job_Id, Equipment_Id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert sample data into SALE
INSERT INTO [dbo].[SALE] (Employee_Number, Sale_Date_Time, Cash_Received)
VALUES 
(1, '2024-08-15 14:30', 2500.00),
(2, '2024-08-16 11:45', 3200.00),
(3, '2024-08-17 09:20', 4500.00),
(4, '2024-08-18 16:10', 2100.00),
(5, '2024-08-19 13:50', 3800.00);

-- Insert sample data into SUBCATEGORY
INSERT INTO [dbo].[SUBCATEGORY] (Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
VALUES 
(1, 'ELEC001', 'Circuit Breakers', 'Electrical circuit breakers and related components', 1),
(2, 'SPAR001', 'Oven Parts', 'Spare parts for ovens', 1),
(3, 'TOOL001', 'Screwdrivers', 'Insulated screwdrivers for electrical work', 1),
(4, 'SAFE001', 'Gloves', 'Insulated gloves for electrical safety', 1),
(5, 'ELEC002', 'Wiring', 'Electrical wires and cables', 1);

-- Insert sample data into STOCK
INSERT INTO [dbo].[STOCK] (Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES 
(1, 'STK001', 'Circuit Breaker', 'High-quality circuit breaker for electrical panels', '2024-07-15', 150.00, 250.00, 20),
(2, 'STK002', 'Oven Element', 'Replacement element for electric ovens', '2024-07-18', 100.00, 180.00, 50),
(3, 'STK003', 'Insulated Screwdriver', 'Set of insulated screwdrivers for electrical work', '2024-07-20', 50.00, 90.00, 30),
(4, 'STK004', 'Safety Gloves', 'Insulated gloves for electrical safety', '2024-07-22', 20.00, 35.00, 40),
(5, 'STK005', 'Electrical Wire', 'Copper wire for electrical installations', '2024-07-25', 200.00, 300.00, 25);

-- Insert sample data into SALE_ITEM
INSERT INTO [dbo].[SALE_ITEM] (Stock_Id, Sale_Id, Quantity, Price)
VALUES 
(1, 1, 2, 500.00),
(2, 2, 1, 180.00),
(3, 3, 3, 270.00),
(4, 4, 4, 140.00),
(5, 5, 5, 300.00);
