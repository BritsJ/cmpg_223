-- Ensure you're using the correct database
USE Test;

---------------------------------------------------- 
-- Employee_Sales_View
-- Create view with Employee First and Last Name.
-- Test: SELECT * FROM dbo.employee_sales_view
----------------------------------------------------
CREATE VIEW dbo.employee_sales_view
AS 
SELECT 
    emp.Last_Name + ', ' + emp.First_Name AS Employee,
    COUNT(sal.Sale_Id) AS Sales
FROM dbo.SALE sal
INNER JOIN dbo.EMPLOYEE emp
    ON sal.Employee_Number = emp.Employee_Number
GROUP BY emp.Last_Name + ', ' + emp.First_Name;
GO

---------------------------------------------------- 
-- Equipment_out_View
-- Create view on which equipment is out on jobs
-- Test: SELECT * FROM dbo.equipment_out_view
----------------------------------------------------
CREATE VIEW dbo.equipment_out_view 
AS  
SELECT 
    e.Name AS Equipment,
    e.Quantity_Checked_Out AS Quantity
FROM dbo.EQUIPMENT e
WHERE e.Is_Active = 1;
GO

---------------------------------------------------- 
-- Active_Jobs_View
-- Create view to see all active jobs
-- Test: SELECT * FROM dbo.Active_Jobs_view
----------------------------------------------------
CREATE VIEW dbo.Active_Jobs_view 
AS 
SELECT 
    j.Employee_Number,
    c.Contact_Person_Name AS Client,
    j.Start_Date_Time AS Start_Date,
    j.Job_Description AS Job_Desc
FROM dbo.JOB j
INNER JOIN dbo.CLIENT c
    ON j.Client_Id = c.Client_Id
WHERE j.End_Date_Time IS NULL;
GO

---------------------------------------------------- 
-- Sales_This_Month_View
-- Create view to see all Sales this month.
-- Test: SELECT * FROM dbo.Sales_This_Month_view
----------------------------------------------------
CREATE VIEW dbo.Sales_This_Month_view 
AS 
SELECT 
    Employee_Number,
    Sale_Date_Time,
    Cash_Received
FROM dbo.SALE
WHERE MONTH(Sale_Date_Time) = MONTH(GETDATE())
AND YEAR(Sale_Date_Time) = YEAR(GETDATE());
GO

---------------------------------------------------- 
-- Low_Stock_View
-- Create view to see which stock is in low quantity
-- Test: SELECT * FROM dbo.Low_Stock_view
----------------------------------------------------
CREATE VIEW dbo.Low_Stock_view 
AS 
SELECT 
    Stock_Name,
    Quantity
FROM dbo.STOCK
WHERE Quantity < 5;
GO