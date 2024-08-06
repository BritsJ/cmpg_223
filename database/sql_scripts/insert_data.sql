-- Ensure you're using the correct database
USE Test;

---------------------------------------------------- 
-- CATEGORY
-- Adds Data to the Category Table
----------------------------------------------------
INSERT INTO dbo.CATEGORY (Category_Id, Category_Code, Category_Name, Category_Description, Is_Active)
VALUES (NEXT VALUE FOR dbo.Category_Id_seq, 'ELEC', 'Electrical Equipment', 'Electrical equipment for sale and repair', 1);

INSERT INTO dbo.CATEGORY (Category_Id, Category_Code, Category_Name, Category_Description, Is_Active)
VALUES (NEXT VALUE FOR dbo.Category_Id_seq, 'SRVC', 'Services', 'Services for fixing electrical appliances', 1);
GO

---------------------------------------------------- 
-- SUBCATEGORY
-- Adds Data to the Subcategory Table
----------------------------------------------------
INSERT INTO dbo.SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
VALUES (NEXT VALUE FOR dbo.Subcategory_Id_seq, 1, 'TEST', 'Testing Equipment', 'Equipment for testing electrical systems', 1);

INSERT INTO dbo.SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
VALUES (NEXT VALUE FOR dbo.Subcategory_Id_seq, 1, 'TOOLS', 'Tools', 'Tools for electrical work', 1);

INSERT INTO dbo.SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
VALUES (NEXT VALUE FOR dbo.Subcategory_Id_seq, 2, 'REPAIR', 'Repair Services', 'Services for repairing electrical appliances', 1);

INSERT INTO dbo.SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
VALUES (NEXT VALUE FOR dbo.Subcategory_Id_seq, 2, 'INSTALL', 'Installation Services', 'Services for installing electrical appliances', 1);
GO

---------------------------------------------------- 
-- STOCK
-- Adds Data to the Stock Table
----------------------------------------------------
INSERT INTO dbo.STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (NEXT VALUE FOR dbo.Stock_Id_seq, 1, 'MM001', 'Multimeter', 'Tool used to measure voltage, current, and resistance', '2024-05-10', 50.00, 80.00, 10);

INSERT INTO dbo.STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (NEXT VALUE FOR dbo.Stock_Id_seq, 1, 'IT001', 'Insulation Tester', 'Device used to test the insulation resistance of electrical equipment', '2024-05-10', 100.00, 150.00, 5);

INSERT INTO dbo.STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (NEXT VALUE FOR dbo.Stock_Id_seq, 2, 'ES001', 'Electric Screwdriver', 'Tool used for driving screws into electrical devices', '2024-05-10', 30.00, 50.00, 8);

INSERT INTO dbo.STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (NEXT VALUE FOR dbo.Stock_Id_seq, 2, 'VT001', 'Voltage Tester', 'Device used to determine whether there is an electrical potential between two points', '2024-05-10', 20.00, 35.00, 12);

INSERT INTO dbo.STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (NEXT VALUE FOR dbo.Stock_Id_seq, 2, 'CBF001', 'Circuit Breaker Finder', 'Tool used to locate and identify electrical circuits', '2024-05-10', 80.00, 120.00, 3);
GO

---------------------------------------------------- 
-- EMPLOYEE
-- Adds Data to the Employee Table
----------------------------------------------------
INSERT INTO dbo.EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
VALUES (NEXT VALUE FOR dbo.Employee_Number_seq, 1234567890123, 'John', 'Doe', 'Smith', '2020-01-01', '123-456-7890', 'john.doe@example.com', '123 Main St, City, Country');

INSERT INTO dbo.EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
VALUES (NEXT VALUE FOR dbo.Employee_Number_seq, 1234567890456, 'Jane', 'Doe', 'Williams', '2020-01-15', '123-456-7891', 'jane.williams@example.com', '456 Elm St, City, Country');

INSERT INTO dbo.EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
VALUES (NEXT VALUE FOR dbo.Employee_Number_seq, 1234567890789, 'Robert', 'Johnson', 'Brown', '2020-02-01', '123-456-7892', 'robert.brown@example.com', '789 Oak St, City, Country');

INSERT INTO dbo.EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
VALUES (NEXT VALUE FOR dbo.Employee_Number_seq, 1234567890912, 'Emily', 'Smith', 'Taylor', '2020-02-15', '123-456-7893', 'emily.taylor@example.com', '101 Pine St, City, Country');

INSERT INTO dbo.EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
VALUES (NEXT VALUE FOR dbo.Employee_Number_seq, 1234567890321, 'Michael', 'Wilson', 'Davis', '2020-03-01', '123-456-7894', 'michael.davis@example.com', '111 Cedar St, City, Country');
GO

---------------------------------------------------- 
-- SALE
-- Adds Data to the Sale Table
----------------------------------------------------
INSERT INTO dbo.SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (NEXT VALUE FOR dbo.Sale_Id_seq, 1000, '2024-05-12T10:00:00', 200.00);

INSERT INTO dbo.SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (NEXT VALUE FOR dbo.Sale_Id_seq, 1001, '2024-05-12T11:00:00', 150.00);

INSERT INTO dbo.SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (NEXT VALUE FOR dbo.Sale_Id_seq, 1002, '2024-05-13T14:00:00', 300.00);

INSERT INTO dbo.SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (NEXT VALUE FOR dbo.Sale_Id_seq, 1003, '2024-05-14T09:00:00', 180.00);

INSERT INTO dbo.SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (NEXT VALUE FOR dbo.Sale_Id_seq, 1004, '2024-05-14T15:00:00', 220.00);
GO

---------------------------------------------------- 
-- SALE_ITEM
-- Adds Data to the Sale Item Table
----------------------------------------------------
INSERT INTO dbo.SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (NEXT VALUE FOR dbo.Sale_Item_Id_seq, 1, 1, 5, 80.50);

INSERT INTO dbo.SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (NEXT VALUE FOR dbo.Sale_Item_Id_seq, 2, 2, 3, 150.30);

INSERT INTO dbo.SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (NEXT VALUE FOR dbo.Sale_Item_Id_seq, 3, 3, 7, 50.70);

INSERT INTO dbo.SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (NEXT VALUE FOR dbo.Sale_Item_Id_seq, 4, 4, 4, 35.99);

INSERT INTO dbo.SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (NEXT VALUE FOR dbo.Sale_Item_Id_seq, 5, 5, 6, 120.22);
GO

---------------------------------------------------- 
-- CLIENT
-- Adds Data to the Client Table
----------------------------------------------------
INSERT INTO dbo.CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES (NEXT VALUE FOR dbo.Client_Id_seq, '001', 'Alice Johnson', 'Johnson and Sons', '123-456-7890', 'alice@example.com', '456 Elm St, City, Country', 'Additional information about the client', 1);

INSERT INTO dbo.CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES (NEXT VALUE FOR dbo.Client_Id_seq, '002', 'Bob Smith', 'Smith Enterprises', '123-456-7891', 'bob@example.com', '789 Oak St, City, Country', 'Additional information about the client', 1);

INSERT INTO dbo.CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES (NEXT VALUE FOR dbo.Client_Id_seq, '003', 'Carol Williams', 'Williams Corporation', '123-456-7892', 'carol@example.com', '101 Pine St, City, Country', 'Additional information about the client', 1);

INSERT INTO dbo.CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES (NEXT VALUE FOR dbo.Client_Id_seq, '004', 'David Brown', 'Brown Industries', '123-456-7893', 'david@example.com', '111 Cedar St, City, Country', 'Additional information about the client', 1);

INSERT INTO dbo.CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
VALUES (NEXT VALUE FOR dbo.Client_Id_seq, '005', 'Emma Taylor', 'Taylor Co.', '123-456-7894', 'emma@example.com', '222 Maple St, City, Country', 'Additional information about the client', 1);
GO

---------------------------------------------------- 
-- EQUIPMENT
-- Adds Data to the Equipment Table
----------------------------------------------------
INSERT INTO dbo.EQUIPMENT (Equipment_Id, Equipment_Code, Name, Description, Quantity, Quantity_Checked_Out, Is_Active)
VALUES (NEXT VALUE FOR dbo.Equipment_Id_seq, '006', 'Soldering Iron', 'Tool used for soldering electrical connections', 15, 0, 1);

INSERT INTO dbo.EQUIPMENT (Equipment_Id, Equipment_Code, Name, Description, Quantity, Quantity_Checked_Out, Is_Active)
VALUES (NEXT VALUE FOR dbo.Equipment_Id_seq, '007', 'Wire Stripper', 'Tool used for stripping insulation from electrical wires', 20, 0, 1);
GO

---------------------------------------------------- 
-- JOB
-- Adds Data to the Job Table
----------------------------------------------------
INSERT INTO dbo.JOB (Job_Id, Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES (NEXT VALUE FOR dbo.Job_Id_seq, 1000, 001, GETDATE(), GETDATE(), 'Fix geyser heating element');

INSERT INTO dbo.JOB (Job_Id, Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES (NEXT VALUE FOR dbo.Job_Id_seq, 1001, 002, GETDATE(), GETDATE(), 'Repair fridge compressor');

INSERT INTO dbo.JOB (Job_Id, Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES (NEXT VALUE FOR dbo.Job_Id_seq, 1004, 003, GETDATE(), NULL, 'Fix lighting fixture');
GO

---------------------------------------------------- 
-- JOB_EQUIPMENT
-- Adds Data to the Job Equipment Table
----------------------------------------------------
INSERT INTO dbo.JOB_EQUIPMENT (Job_Equipment_Id, Job_Id, Equipment_Id)
VALUES (NEXT VALUE FOR dbo.Job_Equipment_Id_seq, 1, 1);
GO