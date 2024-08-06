-- Ensure you're using the correct database
USE Test;

---------------------------------------------------- 
--Drop Views--
--Drop all views
----------------------------------------------------
DROP VIEW employee_sales_view;
DROP VIEW equipment_out_view;
DROP VIEW Low_Stock_view;
DROP VIEW Sales_This_Month_view;
DROP VIEW Active_Jobs_view;

---------------------------------------------------- 
--Drop Tables--
--Drop all created tables
----------------------------------------------------
DROP TABLE JOB_EQUIPMENT;
DROP TABLE JOB;
DROP TABLE EQUIPMENT;
DROP TABLE CLIENT;
DROP TABLE SALE_ITEM;
DROP TABLE SALE;
DROP TABLE EMPLOYEE;
DROP TABLE STOCK;
DROP TABLE SUBCATEGORY;
DROP TABLE CATEGORY;

---------------------------------------------------- 
--Drop Sequences
--Drop all created sequences. 
----------------------------------------------------
DROP SEQUENCE Category_Id_seq;
DROP SEQUENCE Subcategory_Id_seq;
DROP SEQUENCE Stock_Id_seq;
DROP SEQUENCE Employee_Number_seq;
DROP SEQUENCE Sale_Id_seq;
DROP SEQUENCE Sale_Item_Id_seq;
DROP SEQUENCE Client_Id_seq;
DROP SEQUENCE Equipment_Id_seq;
DROP SEQUENCE Job_Id_seq;
DROP SEQUENCE Job_Equipment_Id_seq;

---------------------------------------------------- 
--Drop Indexes
--Drops all created Indexes. 
----------------------------------------------------
DROP INDEX idx_Emp_Last_Name ON EMPLOYEE;
DROP INDEX idx_Equipment_Name ON EQUIPMENT;
DROP INDEX idx_Job_Client ON JOB;
DROP INDEX idx_Job_Equipment_fk ON JOB_EQUIPMENT;
DROP INDEX idx_Sale_Employee ON SALE;
DROP INDEX idx_Sale_Item_Sale_fk ON SALE_ITEM;
DROP INDEX idx_Stock_Name ON STOCK;