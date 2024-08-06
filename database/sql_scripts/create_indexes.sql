-- Ensure you're using the correct database
USE Test;

---------------------------------------------------- 
-- Client Indexes
-- Sets indexes on Contact_Person_Name, Business_Name, Phone_Number, and Email_Address
----------------------------------------------------
CREATE INDEX idx_Client_Names
ON dbo.CLIENT(Contact_Person_Name, Business_Name);

CREATE INDEX idx_Client_Contacts
ON dbo.CLIENT(Business_Name, Phone_Number, Email_Address);
GO

---------------------------------------------------- 
-- Employee Indexes
-- Sets indexes on First_Name and Last_Name
----------------------------------------------------
CREATE INDEX idx_Emp_Names
ON dbo.EMPLOYEE(First_Name, Last_Name);

CREATE INDEX idx_Emp_Last_Name
ON dbo.EMPLOYEE(Last_Name);
GO

---------------------------------------------------- 
-- Equipment Indexes
-- Sets index on Name
----------------------------------------------------
CREATE INDEX idx_Equipment_Name
ON dbo.EQUIPMENT(Name);
GO

---------------------------------------------------- 
-- Job Indexes
-- Sets index on Client_Id
----------------------------------------------------
CREATE INDEX idx_Job_Client
ON dbo.JOB(Client_Id);
GO

---------------------------------------------------- 
-- Job Equipment Indexes
-- Sets indexes on Job_Id and Equipment_Id
----------------------------------------------------
CREATE INDEX idx_Job_Equipment_fk
ON dbo.JOB_EQUIPMENT(Job_Id, Equipment_Id);
GO

---------------------------------------------------- 
-- Sale Indexes
-- Sets index on Employee_Number
----------------------------------------------------
CREATE INDEX idx_Sale_Employee
ON dbo.SALE(Employee_Number);
GO

---------------------------------------------------- 
-- Sale Item Indexes
-- Sets index on Sale_Id
----------------------------------------------------
CREATE INDEX idx_Sale_Item_Sale_fk
ON dbo.SALE_ITEM(Sale_Id);
GO

---------------------------------------------------- 
-- Stock Indexes
-- Sets index on Stock_Name
----------------------------------------------------
CREATE INDEX idx_Stock_Name
ON dbo.STOCK(Stock_Name);
GO