---------------------------------------------------- 
--CATEGORY
--Creates a table to store all our Category data. This includes 5 Columns and 2 Constraints.
----------------------------------------------------
CREATE TABLE CATEGORY 
( 
Category_Id NUMBER(8) , 
Category_Code VARCHAR(20) NOT NULL , 
Category_Name VARCHAR(255) NOT NULL , 
Category_Decription VARCHAR(255) NOT NULL , 
Is_Active NUMBER(1) DEFAULT 1 NOT NULL ,
 
CONSTRAINT Category_Id_PK PRIMARY KEY (Category_Id),
CONSTRAINT Category_Code_uk UNIQUE (Category_Code)
);
 
---------------------------------------------------- 
--SUBCATEGORY
--Creates a table to store all our Subcategory data. This includes 6 Columns and 3 Constraints.
----------------------------------------------------
CREATE TABLE SUBCATEGORY
(
Subcategory_Id NUMBER(8)  ,
Category_Id NUMBER(3) REFERENCES CATEGORY(Category_Id) ,
Subcategory_Code VARCHAR(20) NOT NULL ,
Subcategory_Name VARCHAR(255) NOT NULL ,
Subcategory_Decription VARCHAR(255) NOT NULL ,
Is_Active NUMBER(1) DEFAULT 1 NOT NULL,
 
CONSTRAINT Subcategory_Id_PK PRIMARY KEY (Subcategory_Id),
CONSTRAINT Cat_Subcat_fk FOREIGN KEY (Category_Id) REFERENCES CATEGORY(Category_Id),
CONSTRAINT Subcategory_Code_uk UNIQUE (Subcategory_Code)
);
 
---------------------------------------------------- 
--Stock
--Creates a table to store all our Stock data. This includes 9 Columns and 5 Constraints
----------------------------------------------------
CREATE TABLE STOCK
(
Stock_Id NUMBER(8),
Subcategory_Id NUMBER(3) ,
Stock_Code VARCHAR(20) NOT NULL ,
Stock_Name VARCHAR(255) NOT NULL ,
Stock_Decription VARCHAR(255) NOT NULL ,
Purchase_Date Date NOT NULL ,
Purchase_Price DECIMAL(18,9) NOT NULL ,
Selling_Price DECIMAL(18,9) NOT NULL ,
Quantity NUMBER(4) NOT NULL ,
 
CONSTRAINT Stock_Id_PK PRIMARY KEY (Stock_Id),
CONSTRAINT Sub_Stock_fk FOREIGN KEY (Subcategory_Id) REFERENCES SUBCATEGORY(Subcategory_Id),
CONSTRAINT Stock_Code_uk UNIQUE (Stock_Code),
CONSTRAINT Stock_Purchase_Price_min CHECK (Purchase_Price >= 0),
CONSTRAINT Stock_Selling_Price_min CHECK (Selling_Price >= 0)
);


---------------------------------------------------- 
--Employee
--Creates a table to store all our Employee data. This includes 9 Columns and 2 Constraints
----------------------------------------------------
CREATE TABLE EMPLOYEE
(
Employee_Number NUMBER(8) ,
Id_Number NUMBER(13) NOT NULL ,
First_Name VARCHAR(30) NOT NULL ,
Middle_Name VARCHAR(30) NULL,
Last_Name VARCHAR(30) NOT NULL ,
Hire_Date Date NOT NULL ,
Phone_Number NUMBER(10) NOT NULL ,
Email_Address VARCHAR(100) NOT NULL ,
Physical_Adress VARCHAR(255) NOT NULL ,
 
CONSTRAINT Employee_Number_PK PRIMARY KEY  (Employee_Number),
CONSTRAINT Id_Number_uk UNIQUE (Id_Number)
);
 





---------------------------------------------------- 
--Sale
--Creates a table to store all our Sale data. This includes 4 Columns and 3 Constraints
----------------------------------------------------
CREATE TABLE SALE
(
Sale_Id NUMBER(9) ,
Employee_Number NUMBER(8) ,
Sale_Date_Time DATE NOT NULL ,
Cash_Received DECIMAL(18,9) NOT NULL ,
 
CONSTRAINT Sale_Id_PK PRIMARY KEY (Sale_Id),
CONSTRAINT Sale_Emp_fk FOREIGN KEY (Employee_Number) REFERENCES EMPLOYEE(Employee_Number),
CONSTRAINT Sale_Cash_Received_min CHECK (Cash_Received >= 0)
);
 
---------------------------------------------------- 
--Sale Item
--Creates a table to store all our Sale Item data. This includes 5 Columns and 5 Constraints
----------------------------------------------------
CREATE TABLE SALE_ITEM
(
Sale_Item_Id NUMBER(8) ,
Stock_Id NUMBER(3) ,
Sale_Id NUMBER(3) ,
Quantity INT NOT NULL, 
Price DECIMAL(18,9) NOT NULL ,
 
CONSTRAINT Sale_Item_Id_PK PRIMARY KEY (Sale_Item_Id),
CONSTRAINT Stock_Sale_Item_fk FOREIGN KEY (Stock_Id) REFERENCES STOCK(Stock_Id),
CONSTRAINT Sale_Sale_Item_fk FOREIGN KEY (Sale_Id) REFERENCES SALE(Sale_Id),
CONSTRAINT Sale_Item_Quantity_min CHECK (Quantity >= 0),
CONSTRAINT Sale_Item_Price_min CHECK (Price >= 0)
);
 
---------------------------------------------------- 
--Client
--Creates a table to store all our Client data. This includes 9 Columns and 2 Constraints
----------------------------------------------------
CREATE TABLE CLIENT
(
Client_Id NUMBER(8)  ,
Client_Code VARCHAR(20) NOT NULL ,
Contact_Person_Name VARCHAR(30) NOT NULL ,
Business_Name VARCHAR(30) NULL,
Phone_Number NUMBER(10) NOT NULL ,
Email_Address VARCHAR(100) NOT NULL ,
Physical_Adress VARCHAR(255) NOT NULL,
Additional_Info VARCHAR(512) NOT NULL,
Is_Active NUMBER(1) DEFAULT 1 NOT NULL ,
 
CONSTRAINT Client_Id_PK PRIMARY KEY (Client_Id),
CONSTRAINT Client_Code_uk UNIQUE (Client_Code)
);


---------------------------------------------------- 
--Equipment
--Creates a table to store all our Sale Item data. This includes 7 Columns and 3 Constraints
----------------------------------------------------
CREATE TABLE EQUIPMENT
(
Equipment_Id NUMBER(3)  ,
Equipment_Code VARCHAR(20) NOT NULL ,
Name VARCHAR(255) NOT NULL , 
Decription VARCHAR(255) NOT NULL ,
Quantity INT NOT NULL,
Quantity_Checked_Out INT NOT NULL,
Is_Active NUMBER(1) DEFAULT 1 NOT NULL ,
 
CONSTRAINT Equipment_Id_PK PRIMARY KEY (Equipment_Id),
CONSTRAINT Equipment_Code_uk UNIQUE (Equipment_Code),
CONSTRAINT Equipment_Quantity_min CHECK (Quantity >= 0)
);
 
---------------------------------------------------- 
--Job
--Creates a table to store all our Job data. This includes 6 Columns and 3 Constraints
----------------------------------------------------
CREATE TABLE JOB
(
Job_Id NUMBER(8)  ,
Employee_Number NUMBER(8) ,
Client_Id NUMBER(3) ,
Start_Date_Time DATE NOT NULL ,
End_Date_Time DATE NULL ,
Job_Description VARCHAR(255) NOT NULL ,
 
CONSTRAINT Job_Id_PK PRIMARY KEY (Job_Id),
CONSTRAINT Employee_Job_fk FOREIGN KEY (Employee_Number) REFERENCES EMPLOYEE(Employee_Number),
CONSTRAINT Client_Job_fk FOREIGN KEY (Client_Id) REFERENCES CLIENT(Client_Id)
);
 
---------------------------------------------------- 
--Job Equipment
--Creates a table to store all our Job Equipment data. This includes 3 Columns and 3 Constraints
----------------------------------------------------
CREATE TABLE JOB_EQUIPMENT
(
Job_Equipment_Id NUMBER(8) ,
Job_Id NUMBER(3) ,
Equipment_Id NUMBER(3) ,
 
CONSTRAINT Job_Equipment_Id_PK PRIMARY KEY  (Job_Equipment_Id),
CONSTRAINT Job_Job_Equip_fk FOREIGN KEY (Job_Id) REFERENCES JOB(Job_Id),
CONSTRAINT Equip_Job_fk FOREIGN KEY (Equipment_Id) REFERENCES EQUIPMENT(Equipment_Id)
); 
