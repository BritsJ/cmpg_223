---------------------------------------------------- 
-- Employee_Sales
-- Create View with Employee First and Last Name.
-- Test: Select * from employee_sales_view
----------------------------------------------------
CREATE OR REPLACE VIEW employee_sales_view
    (Employee, Sales)

      AS SELECT 
            emp.last_name  || ', ' || emp.first_name,
            COUNT(sal.sale_Id)
        from sale sal
        inner join employee emp
        on sal.employee_number = emp.employee_number
        GROUP BY emp.last_name  || ', ' || emp.first_name 
WITH READ ONLY ;




---------------------------------------------------- 
-- Equipment_out_view
-- Create view on which equipment is out on jobs
-- Test: Select * from equipment_out_view
----------------------------------------------------
CREATE OR REPLACE VIEW equipment_out_view 
    (Equipment, Quantity)
    AS  SELECT 
             e.name
            ,e.quantity_checked_out
    FROM Equipment E
WITH READ ONLY ;

---------------------------------------------------- 
-- Active_Jobs_view
-- Create view to see all active jobs
-- Test: Select * from Active_Jobs_view
----------------------------------------------------
CREATE OR REPLACE  VIEW Active_Jobs_view 
    AS SELECT 
        Employee_Number
        ,c.contact_person_name as "Client"
        ,Start_Date_Time as "Start Date"
        ,Job_Description "Job Desc"
    FROM Job j
    inner join client c on j.client_id = c.client_id
    WHERE End_Date_Time IS null
WITH READ ONLY ;

---------------------------------------------------- 
-- Sale View
-- Create view to see all Sales this month.
-- Test: Select * from Sales_This_Month_view
----------------------------------------------------
CREATE OR REPLACE  VIEW Sales_This_Month_view 
    AS SELECT 
         Employee_Number
        ,Sale_Date_Time
        ,Cash_Received
    FROM Sale
    WHERE EXTRACT(MONTH FROM Sale_Date_Time) = EXTRACT(MONTH FROM CURRENT_DATE)
    AND EXTRACT(YEAR FROM Sale_Date_Time) = EXTRACT(YEAR FROM CURRENT_DATE)
WITH READ ONLY ;

---------------------------------------------------- 
-- Stock View
-- Create view too see which stock is in low quantity
-- Test: Select * from Low_Stock_view
----------------------------------------------------
CREATE OR REPLACE  VIEW Low_Stock_view AS 
    SELECT 
        Stock_Name
        ,Quantity
    FROM Stock 
    WHERE Quantity < 5
WITH READ ONLY ;
