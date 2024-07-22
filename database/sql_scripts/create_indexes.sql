---------------------------------------------------- 
--Client Indexes
--Sets Indexes on Contact_Person_Name, Business_Name, Phone_Number and Email_Address
----------------------------------------------------
CREATE INDEX idx_Client_Names
ON CLIENT(Contact_Person_Name, Business_Name);

CREATE INDEX idx_Client_Contacts
ON CLIENT(Business_Name, Phone_Number, Email_Address);

---------------------------------------------------- 
--Employee Indexes
--Sets Indexes on First_Name and Last_Name
----------------------------------------------------
CREATE INDEX idx_Emp_Names
ON EMPLOYEE(First_Name, Last_Name);

CREATE INDEX idx_Emp_Last_Name
ON EMPLOYEE(Last_Name);


---------------------------------------------------- 
--Equipment Indexes
--Sets Index on Name
----------------------------------------------------
CREATE INDEX idx_Equipment_Name
ON Equipment(Name);

---------------------------------------------------- 
--Job Indexes
--Sets Index on Client_Id
----------------------------------------------------
CREATE INDEX idx_Job_Client
ON Job(Client_Id);

---------------------------------------------------- 
--Job Equipment Indexes
--Sets Indexes on Job_Id and Equipment_Id
----------------------------------------------------
CREATE INDEX idx_Job_Equipment_fk
ON Job_Equipment(Job_Id, Equipment_Id);

---------------------------------------------------- 
--Sale Indexes
--Sets Index on Employee_Number
----------------------------------------------------
CREATE INDEX idx_Sale_Employee
ON Sale(Employee_Number);

---------------------------------------------------- 
--Sale Item Indexes
--Sets Index on Sale_Id
----------------------------------------------------
CREATE INDEX idx_Sale_Item_Sale_fk
ON Sale_Item(Sale_Id);

---------------------------------------------------- 
--Stock Indexes
--Sets Indexes on Stock_Name
----------------------------------------------------
CREATE INDEX idx_Stock_Name
ON Stock(Stock_Name);
