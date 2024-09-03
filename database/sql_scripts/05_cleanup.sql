USE [koosieSeDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSubcategory]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateSubcategory]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateStock]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSaleItem]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateSaleItem]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSale]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateSale]
GO

/****** Object:  StoredProcedure [dbo].[UpdateJob]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateJob]
GO

/****** Object:  StoredProcedure [dbo].[UpdateEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateEquipment]
GO

/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateEmployee]
GO

/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateClient]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[UpdateCategory]
GO

/****** Object:  StoredProcedure [dbo].[SearchSubcategories]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchSubcategories]
GO

/****** Object:  StoredProcedure [dbo].[SearchStocksSales]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchStocksSales]
GO

/****** Object:  StoredProcedure [dbo].[SearchStocks]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchStocks]
GO

/****** Object:  StoredProcedure [dbo].[SearchSales]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchSales]
GO

/****** Object:  StoredProcedure [dbo].[SearchSaleItems]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchSaleItems]
GO

/****** Object:  StoredProcedure [dbo].[SearchJobs]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchJobs]
GO

/****** Object:  StoredProcedure [dbo].[SearchJobEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[SearchEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchEquipment]
GO

/****** Object:  StoredProcedure [dbo].[SearchEmployees]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchEmployees]
GO

/****** Object:  StoredProcedure [dbo].[SearchClients]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchClients]
GO

/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[SearchCategories]
GO

/****** Object:  StoredProcedure [dbo].[rptStock]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[rptStock]
GO

/****** Object:  StoredProcedure [dbo].[rptSales]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[rptSales]
GO

/****** Object:  StoredProcedure [dbo].[rptJobs]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[rptJobs]
GO

/****** Object:  StoredProcedure [dbo].[rptEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[rptEquipment]
GO

/****** Object:  StoredProcedure [dbo].[rptEmployees]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[rptEmployees]
GO

/****** Object:  StoredProcedure [dbo].[rptClients]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[rptClients]
GO

/****** Object:  StoredProcedure [dbo].[InsertJob]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[InsertJob]
GO

/****** Object:  StoredProcedure [dbo].[GetSubcategoryById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetSubcategoryById]
GO

/****** Object:  StoredProcedure [dbo].[GetStockById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetStockById]
GO

/****** Object:  StoredProcedure [dbo].[GetSaleItemById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetSaleItemById]
GO

/****** Object:  StoredProcedure [dbo].[GetSaleById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetSaleById]
GO

/****** Object:  StoredProcedure [dbo].[GetJobEquipmentByJobId]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetJobEquipmentByJobId]
GO

/****** Object:  StoredProcedure [dbo].[GetJobById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetJobById]
GO

/****** Object:  StoredProcedure [dbo].[GetEquipmentById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetEquipmentById]
GO

/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetEmployeeById]
GO

/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetClientById]
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetCategoryById]
GO

/****** Object:  StoredProcedure [dbo].[GetAllEmployees]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[GetAllEmployees]
GO

/****** Object:  StoredProcedure [dbo].[DeleteJobEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[DeleteJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[CheckUsername]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[CheckUsername]
GO

/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AuthenticateUser]
GO

/****** Object:  StoredProcedure [dbo].[AddSubcategory]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddSubcategory]
GO

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddStock]
GO

/****** Object:  StoredProcedure [dbo].[AddSaleItem]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddSaleItem]
GO

/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddSale]
GO

/****** Object:  StoredProcedure [dbo].[AddJobEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[AddJob]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddJob]
GO

/****** Object:  StoredProcedure [dbo].[AddEquipment]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddEquipment]
GO

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddEmployee]
GO

/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddClient]
GO

/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 2024/09/02 21:07:13 ******/
DROP PROCEDURE [dbo].[AddCategory]
GO


/*Drop tables*/

USE [koosieSeDatabase]
GO

ALTER TABLE [dbo].[STOCK] DROP CONSTRAINT [Stock_Selling_Price_min]
GO

ALTER TABLE [dbo].[STOCK] DROP CONSTRAINT [Stock_Purchase_Price_min]
GO

ALTER TABLE [dbo].[SALE_ITEM] DROP CONSTRAINT [Sale_Item_Quantity_min]
GO

ALTER TABLE [dbo].[SALE_ITEM] DROP CONSTRAINT [Sale_Item_Price_min]
GO

ALTER TABLE [dbo].[SALE] DROP CONSTRAINT [Sale_Cash_Received_min]
GO

ALTER TABLE [dbo].[EQUIPMENT] DROP CONSTRAINT [Equipment_Quantity_min]
GO

ALTER TABLE [dbo].[SUBCATEGORY] DROP CONSTRAINT [FK_Subcategory_Category]
GO

ALTER TABLE [dbo].[SUBCATEGORY] DROP CONSTRAINT [Cat_Subcat_fk]
GO

ALTER TABLE [dbo].[STOCK] DROP CONSTRAINT [Sub_Stock_fk]
GO

ALTER TABLE [dbo].[STOCK] DROP CONSTRAINT [FK_Stock_Subcategory]
GO

ALTER TABLE [dbo].[SALE_ITEM] DROP CONSTRAINT [Stock_Sale_Item_fk]
GO

ALTER TABLE [dbo].[SALE_ITEM] DROP CONSTRAINT [Sale_Sale_Item_fk]
GO

ALTER TABLE [dbo].[SALE_ITEM] DROP CONSTRAINT [FK_SaleItem_Stock]
GO

ALTER TABLE [dbo].[SALE_ITEM] DROP CONSTRAINT [FK_SaleItem_Sale]
GO

ALTER TABLE [dbo].[SALE] DROP CONSTRAINT [Sale_Emp_fk]
GO

ALTER TABLE [dbo].[SALE] DROP CONSTRAINT [FK_Sale_Employee]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] DROP CONSTRAINT [Job_Job_Equip_fk]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] DROP CONSTRAINT [FK_JobEquipment_Job]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] DROP CONSTRAINT [FK_JobEquipment_Equipment]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] DROP CONSTRAINT [Equip_Job_fk]
GO

ALTER TABLE [dbo].[JOB] DROP CONSTRAINT [FK_Job_Employee]
GO

ALTER TABLE [dbo].[JOB] DROP CONSTRAINT [FK_Job_Client]
GO

ALTER TABLE [dbo].[JOB] DROP CONSTRAINT [Employee_Job_fk]
GO

ALTER TABLE [dbo].[JOB] DROP CONSTRAINT [Client_Job_fk]
GO




/****** Object:  Table [dbo].[SUBCATEGORY]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUBCATEGORY]') AND type in (N'U'))
DROP TABLE [dbo].[SUBCATEGORY]
GO

/****** Object:  Table [dbo].[STOCK]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STOCK]') AND type in (N'U'))
DROP TABLE [dbo].[STOCK]
GO

/****** Object:  Table [dbo].[SALE_ITEM]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SALE_ITEM]') AND type in (N'U'))
DROP TABLE [dbo].[SALE_ITEM]
GO

/****** Object:  Table [dbo].[SALE]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SALE]') AND type in (N'U'))
DROP TABLE [dbo].[SALE]
GO

/****** Object:  Table [dbo].[JOB_EQUIPMENT]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JOB_EQUIPMENT]') AND type in (N'U'))
DROP TABLE [dbo].[JOB_EQUIPMENT]
GO

/****** Object:  Table [dbo].[JOB]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JOB]') AND type in (N'U'))
DROP TABLE [dbo].[JOB]
GO

/****** Object:  Table [dbo].[EQUIPMENT]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EQUIPMENT]') AND type in (N'U'))
DROP TABLE [dbo].[EQUIPMENT]
GO

/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLOYEE]
GO

/****** Object:  Table [dbo].[CLIENT]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLIENT]') AND type in (N'U'))
DROP TABLE [dbo].[CLIENT]
GO

/****** Object:  Table [dbo].[CATEGORY]    Script Date: 2024/09/02 21:08:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CATEGORY]') AND type in (N'U'))
DROP TABLE [dbo].[CATEGORY]
GO
