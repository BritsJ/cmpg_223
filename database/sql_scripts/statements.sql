-- Ensure you're using the correct database
USE Test;
--------------------------------------------------------------Limitations of rows and Columns--------------------------------------------------------------
---------------------------------------------------- 
--Show only active clients. 
----------------------------------------------------
SELECT 
    c.client_code AS [Client Code],  
    c.contact_person_name AS [Contact Person], 
    c.business_name AS [Business] 
FROM client c
WHERE c.is_active = 1;

--------------------------------------------------------------Sorting--------------------------------------------------------------
---------------------------------------------------- 
--Show employees sorted by last name and then first name
----------------------------------------------------
SELECT 
        emp.employee_number,
        emp.last_name + ', ' + emp.first_name AS [Employee],
        emp.physical_address
FROM employee emp
ORDER BY emp.last_name ASC, emp.first_name ASC;

--------------------------------------------------------------LIKE, AND and OR--------------------------------------------------------------
---------------------------------------------------- 
--Get all active jobs where contact person is "Alice Johnson" 
--or Business Name is "Smith Enterprises"
----------------------------------------------------
SELECT 
    c.contact_person_name, 
    c.business_name
FROM JOB j
JOIN CLIENT c ON j.Client_Id = c.Client_Id
WHERE c.Is_Active = 1
AND (c.Contact_Person_Name = 'Alice Johnson' OR c.Business_Name = 'Smith Enterprises');

---------------------------------------------------- 
--Get Client Details by phone number
--Test Value: 1234567891
----------------------------------------------------
DECLARE @phoneNumber NVARCHAR(15) = '1234567891';

SELECT 
    c.contact_person_name AS [Client], 
    c.client_code,
    c.phone_number,
    c.email_address
FROM Client c 
WHERE c.phone_number LIKE '%' + @phoneNumber + '%';

--------------------------------------------------------------Variables and character functions--------------------------------------------------------------
---------------------------------------------------- 
--Get all active subcategory of a category
--Test Value: ELEC
----------------------------------------------------
DECLARE @cat NVARCHAR(10) = 'ELEC';

SELECT 
    c.category_code,
    sc.subcategory_code, 
    sc.subcategory_name,
    CASE WHEN sc.is_active = 0 THEN 'Inactive' ELSE 'Active' END AS [Active]
FROM subcategory sc
INNER JOIN category c ON sc.category_id = c.category_id
WHERE c.category_code = @cat;

--------------------------------------------------------------Round AND/OR TRUNC--------------------------------------------------------------
---------------------------------------------------- 
--Get the total of each sale By Employee
--Test Value: Davis
----------------------------------------------------
DECLARE @last_name NVARCHAR(50) = 'Davis';

SELECT 
    e.last_name + ', ' + e.first_name AS [Employee], 
    s.sale_id, 
    FORMAT(ROUND(SUM(si.price * si.quantity), 2), 'N2') AS [Total]
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
INNER JOIN employee E ON s.employee_number = e.employee_number
WHERE e.last_name = @last_name
GROUP BY 
    s.sale_id,
    e.last_name + ', ' + e.first_name;

--------------------------------------------------------------Date Function--------------------------------------------------------------
---------------------------------------------------- 
--Get total sales by date and filter between 2 dates
--Test Value: 13/05/24 and 14/05/24
----------------------------------------------------
DECLARE @startDate DATE = '2024-05-13';
DECLARE @endDate DATE = '2024-05-14';

SELECT 
    s.sale_date_time, 
    FORMAT(ROUND(SUM(si.price * si.quantity), 2), 'N2') AS [Total]
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
WHERE s.sale_date_time BETWEEN @startDate AND @endDate
GROUP BY 
    s.sale_date_time;

--------------------------------------------------------------Aggregated Functions--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers the maximum, minimum and average spend per day. 
----------------------------------------------------
SELECT 
    s.sale_date_time AS [Day], 
    FORMAT(ROUND(MAX(si.price * si.quantity), 2), 'N2') AS [Max],
    FORMAT(ROUND(MIN(si.price * si.quantity), 2), 'N2') AS [Min],
    FORMAT(ROUND(AVG(si.price * si.quantity), 2), 'N2') AS [Avg]
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
GROUP BY 
    s.sale_date_time;

--------------------------------------------------------------Group by and Having--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers number of sale where average spend is below a value provided
--Test Value: 500
----------------------------------------------------
DECLARE @value DECIMAL(10, 2) = 500;

SELECT 
    s.sale_date_time AS [Sale Date], 
    COUNT(s.sale_id) AS [Qty]
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
GROUP BY 
    s.sale_date_time
HAVING ROUND(AVG(si.price * si.quantity), 2) < @value;

--------------------------------------------------------------Joins--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers amount of sales done by employee
----------------------------------------------------
SELECT 
    e.employee_number, 
    COUNT(s.sale_id) AS [Sales]
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
INNER JOIN employee E ON s.employee_number = e.employee_number
GROUP BY 
    e.employee_number;

--------------------------------------------------------------Sub-queries--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers all sales below average spend
----------------------------------------------------
SELECT 
    S.sale_id,
    FORMAT(ROUND(SUM(si.price * si.quantity), 2), 'N2') AS [Spend]
FROM SALE S
INNER JOIN SALE_ITEM SI ON s.sale_id = SI.sale_id
GROUP BY s.sale_id
HAVING ROUND(SUM(si.price * si.quantity), 2) < (
    SELECT 
        ROUND(AVG(si.price * si.quantity), 2) AS [Avg_spend]
    FROM SALE S
    INNER JOIN SALE_ITEM SI ON s.sale_id = si.sale_id
);