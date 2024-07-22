--------------------------------------------------------------Limitations of rows and Columns--------------------------------------------------------------
---------------------------------------------------- 
--Show only active clients. 
----------------------------------------------------
select 
    c.client_code as "Client Code",  
    c.contact_person_name as "Contact Person", 
    c.business_name as "Business" 
from client c
where c.is_active = 1;

--------------------------------------------------------------Sorting--------------------------------------------------------------
---------------------------------------------------- 
--Show employees sorted by last name and then first name
----------------------------------------------------
SELECT 
        emp.employee_number,
        emp.last_name  || ', ' || emp.first_name  as "Employee",
        emp.physical_adress
        from employee emp
        ORDER BY emp.last_name ASC, emp.first_name ASC;
--------------------------------------------------------------LIKE, AND and OR--------------------------------------------------------------
---------------------------------------------------- 
--Get all active jobs where contact person is "Alice Johnson" 
--or Business Name is "Smith Enterprises"
----------------------------------------------------

SELECT c.contact_person_name, c.business_name
FROM JOB j
JOIN CLIENT c ON j.Client_Id = c.Client_Id
WHERE c.Is_Active = 1
AND (c.Contact_Person_Name = 'Alice Johnson' OR c.Business_Name = 'Smith Enterprises');


---------------------------------------------------- 
--Get Client Details by phone number
--Test Value: 1234567891
----------------------------------------------------
DEFINE phoneNumber = &phone_number 

SELECT 
    c.contact_person_name  as "Client", 
    c.client_code,
    c.phone_number,
    c.email_address
    
FROM Client c 
where c.phone_number LIKE '%&phoneNumber%';

UNDEFINE phone_number;

--------------------------------------------------------------Variables and character functions--------------------------------------------------------------
---------------------------------------------------- 
--Get all active subcategory of a category
--Test Value: ELEC
----------------------------------------------------
DEFINE cat = &category_code 

SELECT 
    c.category_code,
    sc.subcategory_code, 
    sc.subcategory_name,
    DECODE(TO_CHAR(sc.is_active), '0','Inactive' , '1','Active') "Active"
FROM subcategory sc
inner join category c on sc.category_id = c.category_id
where c.category_code = '&cat';

UNDEFINE cat;

--------------------------------------------------------------Round AND/OR TRUNC--------------------------------------------------------------
---------------------------------------------------- 
--Get the total of each sale By Employee
--Test Value: Davis
----------------------------------------------------
SELECT 
e.last_name  || ', ' || e.first_name  as "Employee", 
s.sale_id, 
TO_CHAR(ROUND(SUM(si.price * si.quantity),2)) as "Total"
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
INNER JOIN employee E on s.employee_number = e.employee_number
WHERE e.last_name = '&last_name'
GROUP BY 
    s.sale_id,
    e.last_name  || ', ' || e.first_name;

--------------------------------------------------------------Date Function--------------------------------------------------------------
---------------------------------------------------- 
--Get total sales by date and filter between 2 dates
--Test Value: 13/05/24 and 14/05/24
----------------------------------------------------
SELECT 
s.sale_date_time, 
TO_CHAR(ROUND(SUM(si.price * si.quantity),2)) as "Total"
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
WHERE  (s.sale_date_time BETWEEN to_date('&startDate','dd/mm/yy') AND  to_date('&endDate','dd/mm/yy'))
GROUP BY 
    s.sale_date_time;
--------------------------------------------------------------Aggregated Functions--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers the maximum, minimum and average spend per day. 
----------------------------------------------------
SELECT 
    s.sale_date_time as "Day", 
    TO_CHAR(ROUND(MAX(si.price * si.quantity),2)) as "Max",
    TO_CHAR(ROUND(MIN(si.price * si.quantity),2)) as "Min",
    TO_CHAR(ROUND(AVG(si.price * si.quantity),2)) as "Avg"
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
GROUP BY 
    s.sale_date_time;
--------------------------------------------------------------Group by and Having--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers number of sale where average spend is below a value provided
--Test Value: 500
----------------------------------------------------
SELECT 
    s.sale_date_time as "Sale Date", 
    COUNT(s.sale_id) as "Qty"
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
GROUP BY 
    s.sale_date_time
HAVING TO_CHAR(ROUND(AVG(si.price * si.quantity),2)) < &value;
--------------------------------------------------------------Joins--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers amount of sales done by employee
----------------------------------------------------
SELECT 
    e.employee_number, 
    COUNT(s.sale_id) as "Sales"
FROM sale S
INNER JOIN sale_item SI ON s.sale_id = si.sale_id
INNER JOIN employee E on s.employee_number = e.employee_number
GROUP BY 
    e.employee_number;
--------------------------------------------------------------Sub-queries--------------------------------------------------------------
---------------------------------------------------- 
--Retrievers all sales below average spend
----------------------------------------------------
SELECT 
S.Sale_id,
TO_CHAR(ROUND(SUM(si.price * si.quantity),2)) as "Spend"
FROM SALE S
INNER JOIN SALE_ITEM SI ON s.sale_id = SI.sale_id
GROUP BY s.sale_id
HAVING TO_CHAR(ROUND(SUM(si.price * si.quantity),2)) < (
        SELECT 
        TO_CHAR( ROUND( AVG(si.price * si.quantity) ,2)) AS "Avg_spend"
        FROM sale S
        INNER JOIN sale_item SI ON s.sale_id = si.sale_id
);
