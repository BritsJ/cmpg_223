---------------------------------------------------- 
-- CATEGORY
-- Adds Data to the Category Table
----------------------------------------------------
INSERT INTO CATEGORY (Category_Id, Category_Code, Category_Name, Category_Decription, Is_Active)
VALUES (Category_Id_seq.NEXTVAL, 'ELEC', 'Electrical Equipment', 'Electrical equipment for sale and repair', 1);

INSERT INTO CATEGORY (Category_Id, Category_Code, Category_Name, Category_Decription, Is_Active)
VALUES (Category_Id_seq.NEXTVAL, 'SRVC', 'Services', 'Services for fixing electrical appliances', 1);

---------------------------------------------------- 
-- Subcategory
-- Adds Data to the Subcategory Table
----------------------------------------------------
INSERT INTO SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Decription, Is_Active)
VALUES (Subcategory_Id_seq.NEXTVAL, 1, 'TEST', 'Testing Equipment', 'Equipment for testing electrical systems', 1);

INSERT INTO SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Decription, Is_Active)
VALUES (Subcategory_Id_seq.NEXTVAL, 1, 'TOOLS', 'Tools', 'Tools for electrical work', 1);

INSERT INTO SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Decription, Is_Active)
VALUES (Subcategory_Id_seq.NEXTVAL, 2, 'REPAIR', 'Repair Services', 'Services for repairing electrical appliances', 1);

INSERT INTO SUBCATEGORY (Subcategory_Id, Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Decription, Is_Active)
VALUES (Subcategory_Id_seq.NEXTVAL, 2, 'INSTALL', 'Installation Services', 'Services for installing electrical appliances', 1);

---------------------------------------------------- 
-- Stock
-- Adds Data to the Stock Table
----------------------------------------------------
INSERT INTO STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Decription, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (Stock_Id_seq.NEXTVAL, 1, 'MM001', 'Multimeter', 'Tool used to measure voltage, current, and resistance', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 50.00, 80.00, 10);

INSERT INTO STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Decription, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (Stock_Id_seq.NEXTVAL, 1, 'IT001', 'Insulation Tester', 'Device used to test the insulation resistance of electrical equipment', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 100.00, 150.00, 5);

INSERT INTO STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Decription, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (Stock_Id_seq.NEXTVAL, 2, 'ES001', 'Electric Screwdriver', 'Tool used for driving screws into electrical devices', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 30.00, 50.00, 8);

INSERT INTO STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Decription, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (Stock_Id_seq.NEXTVAL, 2, 'VT001', 'Voltage Tester', 'Device used to determine whether there is an electrical potential between two points', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 20.00, 35.00, 12);

INSERT INTO STOCK (Stock_Id, Subcategory_Id, Stock_Code, Stock_Name, Stock_Decription, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
VALUES (Stock_Id_seq.NEXTVAL, 2, 'CBF001', 'Circuit Breaker Finder', 'Tool used to locate and identify electrical circuits', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 80.00, 120.00, 3);

---------------------------------------------------- 
-- Employee
-- Adds Data to the Category Table
----------------------------------------------------
INSERT INTO EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Adress)
VALUES (Employee_Number_seq.NEXTVAL, 1234567890123, 'John', 'Doe', 'Smith', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 1234567890, 'john.doe@example.com', '123 Main St, City, Country');

INSERT INTO EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Adress)
VALUES (Employee_Number_seq.NEXTVAL, 1234567890456, 'Jane', 'Doe', 'Williams', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 1234567891, 'jane.williams@example.com', '456 Elm St, City, Country');

INSERT INTO EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Adress)
VALUES (Employee_Number_seq.NEXTVAL, 1234567890789, 'Robert', 'Johnson', 'Brown', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 1234567892, 'robert.brown@example.com', '789 Oak St, City, Country');

INSERT INTO EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Adress)
VALUES (Employee_Number_seq.NEXTVAL, 1234567890912, 'Emily', 'Smith', 'Taylor', TO_DATE('2020-02-15', 'YYYY-MM-DD'), 1234567893, 'emily.taylor@example.com', '101 Pine St, City, Country');

INSERT INTO EMPLOYEE (Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Adress)
VALUES (Employee_Number_seq.NEXTVAL, 1234567890321, 'Michael', 'Wilson', 'Davis', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 1234567894, 'michael.davis@example.com', '111 Cedar St, City, Country');

---------------------------------------------------- 
-- Sale
-- Adds Data to the Sale Table
----------------------------------------------------
INSERT INTO SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (Sale_Id_seq.NEXTVAL, 1000, '12/MAY/24', 200.00);

INSERT INTO SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (Sale_Id_seq.NEXTVAL, 1002, '12/MAY/24', 150.00);

INSERT INTO SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (Sale_Id_seq.NEXTVAL, 1003, '13/MAY/24', 300.00);

INSERT INTO SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (Sale_Id_seq.NEXTVAL, 1004, '14/MAY/24', 180.00);

INSERT INTO SALE (Sale_Id, Employee_Number, Sale_Date_Time, Cash_Received)
VALUES (Sale_Id_seq.NEXTVAL, 1004, '14/MAY/24', 220.00);

---------------------------------------------------- 
-- Sale Item
-- Adds Data to the Sale Item Table
----------------------------------------------------
INSERT INTO SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (Sale_Item_Id_seq.NEXTVAL, 1, 1, 5, 80.50);

INSERT INTO SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (Sale_Item_Id_seq.NEXTVAL, 2, 2, 3, 150.30);

INSERT INTO SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (Sale_Item_Id_seq.NEXTVAL, 3, 3, 7, 50.70);

INSERT INTO SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (Sale_Item_Id_seq.NEXTVAL, 4, 4, 4, 35.99);

INSERT INTO SALE_ITEM (Sale_Item_Id, Stock_Id, Sale_Id, Quantity, Price)
VALUES (Sale_Item_Id_seq.NEXTVAL, 5, 5, 6, 120.22);




---------------------------------------------------- 
-- Client
-- Adds Data to the Sale Item Table
----------------------------------------------------
INSERT INTO CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Adress, Additional_Info, Is_Active)
VALUES (Client_Id_seq.NEXTVAL, 'CLT001', 'Alice Johnson', 'Johnson and Sons', 1234567890, 'alice@example.com', '456 Elm St, City, Country', 'Additional information about the client', 1);

INSERT INTO CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Adress, Additional_Info, Is_Active)
VALUES (Client_Id_seq.NEXTVAL, 'CLT002', 'Bob Smith', 'Smith Enterprises', 1234567891, 'bob@example.com', '789 Oak St, City, Country', 'Additional information about the client', 1);

INSERT INTO CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Adress, Additional_Info, Is_Active)
VALUES (Client_Id_seq.NEXTVAL, 'CLT003', 'Carol Williams', 'Williams Corporation', 1234567892, 'carol@example.com', '101 Pine St, City, Country', 'Additional information about the client', 1);

INSERT INTO CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Adress, Additional_Info, Is_Active)
VALUES (Client_Id_seq.NEXTVAL, 'CLT004', 'David Brown', 'Brown Industries', 1234567893, 'david@example.com', '111 Cedar St, City, Country', 'Additional information about the client', 1);

INSERT INTO CLIENT (Client_Id, Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Adress, Additional_Info, Is_Active)
VALUES (Client_Id_seq.NEXTVAL, 'CLT005', 'Emma Taylor', 'Taylor Co.', 1234567894, 'emma@example.com', '222 Maple St, City, Country', 'Additional information about the client', 1);

---------------------------------------------------- 
-- Equipment
-- Adds Data to the Equipment Table
----------------------------------------------------
INSERT INTO EQUIPMENT (Equipment_Id, Equipment_Code, Name, Decription, Quantity, Quantity_Checked_Out, Is_Active)
VALUES (Equipment_Id_seq.NEXTVAL, 'EQP006', 'Soldering Iron', 'Tool used for soldering electrical connections', 15, 0, 1);

INSERT INTO EQUIPMENT (Equipment_Id, Equipment_Code, Name, Decription, Quantity, Quantity_Checked_Out, Is_Active)
VALUES (Equipment_Id_seq.NEXTVAL, 'EQP007', 'Wire Stripper', 'Tool used for stripping insulation from electrical wires', 20, 0, 1);

---------------------------------------------------- 
-- Job
-- Adds Data to the Job Table
----------------------------------------------------
INSERT INTO JOB (Job_Id, Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES (Job_Id_seq.NEXTVAL, 1000, 1, SYSDATE, SYSDATE, 'Fix geyser heating element');

INSERT INTO JOB (Job_Id, Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES (Job_Id_seq.NEXTVAL, 1001, 2, SYSDATE, SYSDATE, 'Repair fridge compressor');

INSERT INTO JOB (Job_Id, Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
VALUES (Job_Id_seq.NEXTVAL, 1004, 3, SYSDATE, null, 'Fix lighting fixture');

---------------------------------------------------- 
-- Job Equipment
-- Adds Data to the Job Equipment Table
----------------------------------------------------
INSERT INTO JOB_EQUIPMENT (Job_Equipment_Id, job_id, equipment_id)
VALUES (Job_Equipment_Id_seq.NEXTVAL, 1, 1);

Commit;
