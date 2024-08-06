-- Ensure you're using the correct database
USE Test;

-- Create tables in the dbo schema

-- CATEGORY
CREATE TABLE dbo.CATEGORY 
( 
    Category_Id INT PRIMARY KEY, 
    Category_Code VARCHAR(10) NOT NULL, 
    Category_Name VARCHAR(25) NOT NULL, 
    Category_Description VARCHAR(255) NOT NULL, 
    Is_Active BIT DEFAULT 1 NOT NULL,
    CONSTRAINT Category_Code_uk UNIQUE (Category_Code)
);

-- SUBCATEGORY
CREATE TABLE dbo.SUBCATEGORY
(
    Subcategory_Id INT PRIMARY KEY, 
    Category_Id INT, 
    Subcategory_Code VARCHAR(10) NOT NULL, 
    Subcategory_Name VARCHAR(25) NOT NULL, 
    Subcategory_Description VARCHAR(255) NOT NULL, 
    Is_Active BIT DEFAULT 1 NOT NULL,
    CONSTRAINT Cat_Subcat_fk FOREIGN KEY (Category_Id) REFERENCES dbo.CATEGORY(Category_Id),
    CONSTRAINT Subcategory_Code_uk UNIQUE (Subcategory_Code)
);

-- STOCK
CREATE TABLE dbo.STOCK
(
    Stock_Id INT PRIMARY KEY, 
    Subcategory_Id INT, 
    Stock_Code VARCHAR(10) NOT NULL, 
    Stock_Name VARCHAR(25) NOT NULL, 
    Stock_Description VARCHAR(255) NOT NULL, 
    Purchase_Date DATETIME NOT NULL, 
    Purchase_Price MONEY NOT NULL, 
    Selling_Price MONEY NOT NULL, 
    Quantity INT NOT NULL, 
    CONSTRAINT Sub_Stock_fk FOREIGN KEY (Subcategory_Id) REFERENCES dbo.SUBCATEGORY(Subcategory_Id),
    CONSTRAINT Stock_Code_uk UNIQUE (Stock_Code),
    CONSTRAINT Stock_Purchase_Price_min CHECK (Purchase_Price >= 0),
    CONSTRAINT Stock_Selling_Price_min CHECK (Selling_Price >= 0)
);

-- EMPLOYEE
CREATE TABLE dbo.EMPLOYEE
(
    Employee_Number INT PRIMARY KEY, 
    Id_Number VARCHAR(25) NOT NULL UNIQUE, 
    First_Name VARCHAR(25) NOT NULL, 
    Middle_Name VARCHAR(25) NULL,
    Last_Name VARCHAR(25) NOT NULL, 
    Hire_Date DATETIME NOT NULL, 
    Phone_Number VARCHAR(15) NOT NULL, 
    Email_Address VARCHAR(255) NOT NULL, 
    Physical_Address VARCHAR(255) NOT NULL, 
    CONSTRAINT Id_Number_uk UNIQUE (Id_Number)
);

-- SALE
CREATE TABLE dbo.SALE
(
    Sale_Id INT PRIMARY KEY, 
    Employee_Number INT, 
    Sale_Date_Time DATETIME NOT NULL, 
    Cash_Received MONEY NOT NULL, 
    CONSTRAINT Sale_Emp_fk FOREIGN KEY (Employee_Number) REFERENCES dbo.EMPLOYEE(Employee_Number),
    CONSTRAINT Sale_Cash_Received_min CHECK (Cash_Received >= 0)
);

-- SALE_ITEM
CREATE TABLE dbo.SALE_ITEM
(
    Sale_Item_Id INT PRIMARY KEY, 
    Stock_Id INT, 
    Sale_Id INT, 
    Quantity INT NOT NULL, 
    Price MONEY NOT NULL, 
    CONSTRAINT Stock_Sale_Item_fk FOREIGN KEY (Stock_Id) REFERENCES dbo.STOCK(Stock_Id),
    CONSTRAINT Sale_Sale_Item_fk FOREIGN KEY (Sale_Id) REFERENCES dbo.SALE(Sale_Id),
    CONSTRAINT Sale_Item_Quantity_min CHECK (Quantity >= 0),
    CONSTRAINT Sale_Item_Price_min CHECK (Price >= 0)
);

-- CLIENT
CREATE TABLE dbo.CLIENT
(
    Client_Id INT PRIMARY KEY, 
    Client_Code INT NOT NULL, 
    Contact_Person_Name VARCHAR(35) NOT NULL, 
    Business_Name VARCHAR(35) NOT NULL,
    Phone_Number VARCHAR(15) NOT NULL, 
    Email_Address VARCHAR(255) NOT NULL, 
    Physical_Address VARCHAR(255) NOT NULL, 
    Additional_Info VARCHAR(255) NOT NULL,
    Is_Active BIT DEFAULT 1 NOT NULL, 
    CONSTRAINT Client_Code_uk UNIQUE (Client_Code)
);

-- EQUIPMENT
CREATE TABLE dbo.EQUIPMENT
(
    Equipment_Id INT PRIMARY KEY, 
    Equipment_Code INT NOT NULL, 
    Name VARCHAR(35) NOT NULL, 
    Description VARCHAR(255) NOT NULL, 
    Quantity INT NOT NULL, 
    Quantity_Checked_Out INT NOT NULL, 
    Is_Active BIT DEFAULT 1 NOT NULL, 
    CONSTRAINT Equipment_Code_uk UNIQUE (Equipment_Code),
    CONSTRAINT Equipment_Quantity_min CHECK (Quantity >= 0)
);

-- JOB
CREATE TABLE dbo.JOB
(
    Job_Id INT PRIMARY KEY, 
    Employee_Number INT, 
    Client_Id INT, 
    Start_Date_Time DATETIME NOT NULL, 
    End_Date_Time DATETIME NULL, 
    Job_Description VARCHAR(255) NOT NULL, 
    CONSTRAINT Employee_Job_fk FOREIGN KEY (Employee_Number) REFERENCES dbo.EMPLOYEE(Employee_Number),
    CONSTRAINT Client_Job_fk FOREIGN KEY (Client_Id) REFERENCES dbo.CLIENT(Client_Id)
);

-- JOB_EQUIPMENT
CREATE TABLE dbo.JOB_EQUIPMENT
(
    Job_Equipment_Id INT PRIMARY KEY, 
    Job_Id INT, 
    Equipment_Id INT, 
    CONSTRAINT Job_Job_Equip_fk FOREIGN KEY (Job_Id) REFERENCES dbo.JOB(Job_Id),
    CONSTRAINT Equip_Job_fk FOREIGN KEY (Equipment_Id) REFERENCES dbo.EQUIPMENT(Equipment_Id)
);