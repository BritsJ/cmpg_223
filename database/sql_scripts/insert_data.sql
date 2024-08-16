INSERT INTO [SYSTEM_USER] (Username, PasswordHash, IsAdmin, IsActive)
VALUES 
('test', 'test', 0, 1),
('admin', 'admin', 1, 1);

-- Insert records into CATEGORY
INSERT INTO [dbo].[CATEGORY] (Category_Code, Category_Name, Category_Description, Is_Active)
VALUES ('ELEC', 'Electrical Goods', 'Category for electrical goods like switches and plugs', 1),
       ('LIGHT', 'Lighting', 'Category for lighting products', 1);

-- Insert records into SUBCATEGORY
INSERT INTO [dbo].[SUBCATEGORY] (Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
VALUES ((SELECT Category_Id FROM [dbo].[CATEGORY] WHERE Category_Code = 'ELEC'), 'SWITCH', 'Switches', 'Subcategory for light switches', 1),
       ((SELECT Category_Id FROM [dbo].[CATEGORY] WHERE Category_Code = 'LIGHT'), 'BULB', 'Bulbs', 'Subcategory for light bulbs', 1);

-- Insert records into CLIENT
INSERT INTO [dbo].[CLIENT] (Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES (1001, 'John Doe', 'Electrical Supplies Inc.', '123-456-7890', 'johndoe@electricalsupplies.com', '123 Electric Avenue', 'Frequent Buyer', 1),
       (1002, 'Jane Smith', 'Lighting Solutions', '987-654-3210', 'janesmith@lightingsolutions.com', '456 Bright Street', 'Preferred Client', 1);

-- Insert records into EMPLOYEE
INSERT INTO [dbo].[EMPLOYEE] (Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
VALUES ('EMP001', 'Michael', 'T.', 'Johnson', '2023-01-15', '555-123-4567', 'mjohnson@electricalstore.com', '789 Main Street'),
       ('EMP002', 'Emily', 'R.', 'Davis', '2023-02-20', '555-987-6543', 'edavis@electricalstore.com', '321 Oak Avenue');

-- Insert records into EQUIPMENT
INSERT INTO [dbo].[EQUIPMENT] (Equipment_Code, Name, Description, Quantity, Quantity_Checked_Out, Is_Active)
VALUES (2001, 'Voltage Tester', 'Used to test electrical circuits', 15, 3, 1),
       (2002, 'Wire Stripper', 'Used to strip electrical wires', 25, 5, 1);

-- Insert records into STOCK
INSERT INTO [dbo].[STOCK] (Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES ((SELECT Subcategory_Id FROM [dbo].[SUBCATEGORY] WHERE Subcategory_Code = 'SWITCH'), 'SW001', 'Light Switch', 'Standard light switch', '2024-08-01', 3.00, 5.00, 100),
       ((SELECT Subcategory_Id FROM [dbo].[SUBCATEGORY] WHERE Subcategory_Code = 'BULB'), 'BULB001', 'LED Bulb', 'Energy-saving LED bulb', '2024-08-05', 1.50, 3.00, 200);

-- Insert records into JOB
INSERT INTO [dbo].[JOB] (Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES ((SELECT Employee_Number FROM [dbo].[EMPLOYEE] WHERE Id_Number = 'EMP001'), (SELECT Client_Id FROM [dbo].[CLIENT] WHERE Client_Code = 1001), '2024-08-10 09:00', '2024-08-10 17:00', 'Installation of light switches'),
       ((SELECT Employee_Number FROM [dbo].[EMPLOYEE] WHERE Id_Number = 'EMP002'), (SELECT Client_Id FROM [dbo].[CLIENT] WHERE Client_Code = 1002), '2024-08-11 10:00', NULL, 'Lighting consultation');

-- Insert records into JOB_EQUIPMENT
INSERT INTO [dbo].[JOB_EQUIPMENT] (Job_Id, Equipment_Id)
VALUES ((SELECT Job_Id FROM [dbo].[JOB] WHERE Job_Description = 'Installation of light switches'), (SELECT Equipment_Id FROM [dbo].[EQUIPMENT] WHERE Equipment_Code = 2001)),
       ((SELECT Job_Id FROM [dbo].[JOB] WHERE Job_Description = 'Lighting consultation'), (SELECT Equipment_Id FROM [dbo].[EQUIPMENT] WHERE Equipment_Code = 2002));

-- Insert records into SALE
INSERT INTO [dbo].[SALE] (Employee_Number, Sale_Date_Time, Cash_Received)
VALUES ((SELECT Employee_Number FROM [dbo].[EMPLOYEE] WHERE Id_Number = 'EMP001'), '2024-08-12 14:00', 500.00),
       ((SELECT Employee_Number FROM [dbo].[EMPLOYEE] WHERE Id_Number = 'EMP002'), '2024-08-13 11:30', 600.00);

-- Insert records into SALE_ITEM
INSERT INTO [dbo].[SALE_ITEM] (Stock_Id, Sale_Id, Quantity, Price)
VALUES ((SELECT Stock_Id FROM [dbo].[STOCK] WHERE Stock_Code = 'SW001'), (SELECT Sale_Id FROM [dbo].[SALE] WHERE Sale_Date_Time = '2024-08-12 14:00'), 50, 250.00),
       ((SELECT Stock_Id FROM [dbo].[STOCK] WHERE Stock_Code = 'BULB001'), (SELECT Sale_Id FROM [dbo].[SALE] WHERE Sale_Date_Time = '2024-08-13 11:30'), 100, 300.00);
