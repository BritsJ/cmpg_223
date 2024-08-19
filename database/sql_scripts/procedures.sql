USE [koosieSeDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[UpdateStock]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSaleItem]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[UpdateSaleItem]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSale]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[UpdateSale]
GO

/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[UpdateClient]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[UpdateCategory]
GO

/****** Object:  StoredProcedure [dbo].[SearchStocksSales]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchStocksSales]
GO

/****** Object:  StoredProcedure [dbo].[SearchStocks]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchStocks]
GO

/****** Object:  StoredProcedure [dbo].[SearchSales]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchSales]
GO

/****** Object:  StoredProcedure [dbo].[SearchSaleItems]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchSaleItems]
GO

/****** Object:  StoredProcedure [dbo].[SearchEmployees]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchEmployees]
GO

/****** Object:  StoredProcedure [dbo].[SearchClients]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchClients]
GO

/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchCategories]
GO

/****** Object:  StoredProcedure [dbo].[GetStockById]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[GetStockById]
GO

/****** Object:  StoredProcedure [dbo].[GetSaleItemById]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[GetSaleItemById]
GO

/****** Object:  StoredProcedure [dbo].[GetSaleById]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[GetSaleById]
GO

/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[GetClientById]
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[GetCategoryById]
GO

/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AuthenticateUser]
GO

/****** Object:  StoredProcedure [dbo].[AddSubcategory]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddSubcategory]
GO

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddStock]
GO

/****** Object:  StoredProcedure [dbo].[AddSaleItem]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddSaleItem]
GO

/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddSale]
GO

/****** Object:  StoredProcedure [dbo].[AddJobEquipment]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[AddJob]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddJob]
GO

/****** Object:  StoredProcedure [dbo].[AddEquipment]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddEquipment]
GO

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddEmployee]
GO

/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddClient]
GO

/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[AddCategory]
GO

/****** Object:  StoredProcedure [dbo].[SearchAndSortSales]    Script Date: 2024/08/16 07:49:04 ******/
DROP PROCEDURE [dbo].[SearchAndSortSales]
GO

/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 2024/08/16 07:49:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Add a new category record and return the Category_Id
CREATE PROCEDURE [dbo].[AddCategory]
    @Category_Code VARCHAR(10),
    @Category_Name VARCHAR(25),
    @Category_Description VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[CATEGORY] (Category_Code, Category_Name, Category_Description, Is_Active)
    VALUES (@Category_Code, @Category_Name, @Category_Description, @Is_Active);


END
GO

/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 2024/08/16 07:49:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new client record and return the Client_Id
CREATE PROCEDURE [dbo].[AddClient]
    @Client_Code INT,
    @Contact_Person_Name VARCHAR(35),
    @Business_Name VARCHAR(35),
    @Phone_Number VARCHAR(15),
    @Email_Address VARCHAR(255),
    @Physical_Address VARCHAR(255),
    @Additional_Info VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[CLIENT] (Client_Code, Contact_Person_Name, Business_Name, Phone_Number, Email_Address, Physical_Address, Additional_Info, Is_Active)
    VALUES (@Client_Code, @Contact_Person_Name, @Business_Name, @Phone_Number, @Email_Address, @Physical_Address, @Additional_Info, @Is_Active);

END
GO

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2024/08/16 07:49:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new employee record and return the Employee_Number
CREATE PROCEDURE [dbo].[AddEmployee]
    @Id_Number VARCHAR(25),
    @First_Name VARCHAR(25),
    @Middle_Name VARCHAR(25),
    @Last_Name VARCHAR(25),
    @Hire_Date DATETIME,
    @Phone_Number VARCHAR(15),
    @Email_Address VARCHAR(255),
    @Physical_Address VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[EMPLOYEE] (Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address)
    VALUES (@Id_Number, @First_Name, @Middle_Name, @Last_Name, @Hire_Date, @Phone_Number, @Email_Address, @Physical_Address);
;
END
GO

/****** Object:  StoredProcedure [dbo].[AddEquipment]    Script Date: 2024/08/16 07:49:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new equipment record and return the Equipment_Id
CREATE PROCEDURE [dbo].[AddEquipment]
    @Equipment_Code INT,
    @Name VARCHAR(35),
    @Description VARCHAR(255),
    @Quantity INT,
    @Quantity_Checked_Out INT,
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[EQUIPMENT] (Equipment_Code, Name, Description, Quantity, Quantity_Checked_Out, Is_Active)
    VALUES (@Equipment_Code, @Name, @Description, @Quantity, @Quantity_Checked_Out, @Is_Active);

END
GO

/****** Object:  StoredProcedure [dbo].[AddJob]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new job record and return the Job_Id
CREATE PROCEDURE [dbo].[AddJob]
    @Employee_Number INT,
    @Client_Id INT,
    @Start_Date_Time DATETIME,
    @End_Date_Time DATETIME,
    @Job_Description VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[JOB] (Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
    VALUES (@Employee_Number, @Client_Id, @Start_Date_Time, @End_Date_Time, @Job_Description);


END
GO

/****** Object:  StoredProcedure [dbo].[AddJobEquipment]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new job equipment record and return the Job_Equipment_Id
CREATE PROCEDURE [dbo].[AddJobEquipment]
    @Job_Id INT,
    @Equipment_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[JOB_EQUIPMENT] (Job_Id, Equipment_Id)
    VALUES (@Job_Id, @Equipment_Id);


END
GO

/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Add a new sale record and return the Sale_Id
CREATE PROCEDURE [dbo].[AddSale]
    @Employee_Number INT,
    @Sale_Date_Time DATETIME,
    @Cash_Received MONEY,
    @NewSale_Id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[SALE] (Employee_Number, Sale_Date_Time, Cash_Received)
    VALUES (@Employee_Number, @Sale_Date_Time, @Cash_Received);

    -- Get the last inserted Sale_Id
    SET @NewSale_Id = SCOPE_IDENTITY();
END
GO

/****** Object:  StoredProcedure [dbo].[AddSaleItem]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[AddSaleItem]
    @Stock_Id INT,
    @Sale_Id INT,
    @Quantity INT,
    @Price MONEY
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the sale item into the SALE_ITEM table
    INSERT INTO [dbo].[SALE_ITEM] (Stock_Id, Sale_Id, Quantity, Price)
    VALUES (@Stock_Id, @Sale_Id, @Quantity, @Price);

    -- Update the STOCK table to subtract the sold quantity from the available stock
    UPDATE [dbo].[STOCK]
    SET Quantity = Quantity - @Quantity
    WHERE Stock_Id = @Stock_Id;

END

GO

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new stock record and return the Stock_Id
CREATE PROCEDURE [dbo].[AddStock]
    @Subcategory_Id INT,
    @Stock_Code VARCHAR(10),
    @Stock_Name VARCHAR(25),
    @Stock_Description VARCHAR(255),
    @Purchase_Date DATETIME,
    @Purchase_Price MONEY,
    @Selling_Price MONEY,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[STOCK] (Subcategory_Id, Stock_Code, Stock_Name, Stock_Description, Purchase_Date, Purchase_Price, Selling_Price, Quantity)
    VALUES (@Subcategory_Id, @Stock_Code, @Stock_Name, @Stock_Description, @Purchase_Date, @Purchase_Price, @Selling_Price, @Quantity);

END
GO

/****** Object:  StoredProcedure [dbo].[AddSubcategory]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Add a new subcategory record and return the Subcategory_Id
CREATE PROCEDURE [dbo].[AddSubcategory]
    @Category_Id INT,
    @Subcategory_Code VARCHAR(10),
    @Subcategory_Name VARCHAR(25),
    @Subcategory_Description VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[SUBCATEGORY] (Category_Id, Subcategory_Code, Subcategory_Name, Subcategory_Description, Is_Active)
    VALUES (@Category_Id, @Subcategory_Code, @Subcategory_Name, @Subcategory_Description, @Is_Active);

END
GO

/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AuthenticateUser]
    @Username VARCHAR(50),
    @PasswordHash VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        IsActive, 
        Employee_Number AS UserId, 
        IsAdmin
    FROM [dbo].[EMPLOYEE]
    WHERE Username = @Username
      AND PasswordHash = @PasswordHash
      AND IsActive = 1;
END
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[GetCategoryById]
    @Category_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Category_Id, 
           Category_Code, 
           Category_Name, 
           Category_Description, 
           Is_Active
    FROM [dbo].[CATEGORY]
    WHERE Category_Id = @Category_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetClientById]
    @Client_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Client_Id, 
           Client_Code, 
           Contact_Person_Name, 
           Business_Name, 
           Phone_Number, 
           Email_Address, 
           Physical_Address, 
           Additional_Info, 
           Is_Active
    FROM [dbo].[CLIENT]
    WHERE Client_Id = @Client_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetSaleById]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Get sale details by Sale_Id
CREATE PROCEDURE [dbo].[GetSaleById]
    @Sale_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Sale_Id, 
           Employee_Number, 
           Sale_Date_Time, 
           Cash_Received
    FROM [dbo].[SALE]
    WHERE Sale_Id = @Sale_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetSaleItemById]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Get sale item details by Sale_Item_Id
CREATE PROCEDURE [dbo].[GetSaleItemById]
    @Sale_Item_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Sale_Item_Id, 
           Stock_Id, 
           Sale_Id, 
           Quantity, 
           Price
    FROM [dbo].[SALE_ITEM]
    WHERE Sale_Item_Id = @Sale_Item_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetStockById]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetStockById]
    @Stock_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Stock_Id, 
           Subcategory_Id, 
           Stock_Code, 
           Stock_Name, 
           Stock_Description, 
           Purchase_Date, 
           Purchase_Price, 
           Selling_Price, 
           Quantity
    FROM [dbo].[STOCK]
    WHERE Stock_Id = @Stock_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SearchCategories]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Category_Id, 
           Category_Code, 
           Category_Name, 
           Category_Description,	
           Is_Active
    FROM [dbo].[CATEGORY]
    WHERE (Category_Code LIKE '%' + @SearchTerm + '%')
       OR (Category_Name LIKE '%' + @SearchTerm + '%')
       OR (Category_Description LIKE '%' + @SearchTerm + '%')
       OR (CAST(Is_Active AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchClients]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SearchClients]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Client_Id, 
           Client_Code, 
           Contact_Person_Name, 
           Business_Name, 
           Phone_Number, 
           Email_Address, 
           Physical_Address, 
           Additional_Info, 
           Is_Active
    FROM [dbo].[CLIENT]
    WHERE (Client_Code LIKE '%' + @SearchTerm + '%')
       OR (Contact_Person_Name LIKE '%' + @SearchTerm + '%')
       OR (Business_Name LIKE '%' + @SearchTerm + '%')
       OR (Phone_Number LIKE '%' + @SearchTerm + '%')
       OR (Email_Address LIKE '%' + @SearchTerm + '%')
       OR (Physical_Address LIKE '%' + @SearchTerm + '%')
       OR (Additional_Info LIKE '%' + @SearchTerm + '%')
       OR (CAST(Is_Active AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchEmployees]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create   PROCEDURE [dbo].[SearchEmployees]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SELECT 
		 [Employee_Number]
		,[Id_Number]
		,[First_Name]
		,[Middle_Name]
		,[Last_Name]
		,[Hire_Date]
		,[Phone_Number]
		,[Email_Address]
		,[Physical_Address]
    FROM [dbo].[EMPLOYEE] 
    WHERE 
        [First_Name] LIKE '%' + @SearchTerm + '%' OR
        [Last_Name] LIKE '%' + @SearchTerm + '%' OR
        [Email_Address] LIKE '%' + @SearchTerm + '%';
END
GO

/****** Object:  StoredProcedure [dbo].[SearchSaleItems]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Search sale items by Sale_Id or Stock_Id
CREATE PROCEDURE [dbo].[SearchSaleItems]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Sale_Item_Id, 
           Stock_Id, 
           Sale_Id, 
           Quantity, 
           Price
    FROM [dbo].[SALE_ITEM]
    WHERE (CAST(Sale_Id AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Stock_Id AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchSales]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Search sales by Employee_Number or Sale_Date_Time
CREATE PROCEDURE [dbo].[SearchSales]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Sale_Id, 
           Employee_Number, 
           Sale_Date_Time, 
           Cash_Received
    FROM [dbo].[SALE]
    WHERE (CAST(Employee_Number AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Sale_Date_Time AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchStocks]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SearchStocks]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Stock_Id, 
           Subcategory_Id, 
           Stock_Code, 
           Stock_Name, 
           Stock_Description, 
           Purchase_Date, 
           Purchase_Price, 
           Selling_Price, 
           Quantity
    FROM [dbo].[STOCK]
    WHERE (Stock_Code LIKE '%' + @SearchTerm + '%')
       OR (Stock_Name LIKE '%' + @SearchTerm + '%')
       OR (Stock_Description LIKE '%' + @SearchTerm + '%')
       OR (CAST(Purchase_Date AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Purchase_Price AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Selling_Price AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Quantity AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchStocksSales]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SearchStocksSales]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Stock_Id as [Stock ID], 
           Stock_Code as [Code] , 
           Stock_Name as [Name], 
           Stock_Description as [Description], 
           Selling_Price as [Selling Price]
    FROM [dbo].[STOCK]
    WHERE (Stock_Code LIKE '%' + @SearchTerm + '%')
       OR (Stock_Name LIKE '%' + @SearchTerm + '%')
       OR (Stock_Description LIKE '%' + @SearchTerm + '%')
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[UpdateCategory]
    @Category_Id INT,
    @Category_Code VARCHAR(10),
    @Category_Name VARCHAR(25),
    @Category_Description VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[CATEGORY]
    SET Category_Code = @Category_Code,
        Category_Name = @Category_Name,
        Category_Description = @Category_Description,
        Is_Active = @Is_Active
    WHERE Category_Id = @Category_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateClient]
    @Client_Id INT,
    @Client_Code INT,
    @Contact_Person_Name VARCHAR(35),
    @Business_Name VARCHAR(35),
    @Phone_Number VARCHAR(15),
    @Email_Address VARCHAR(255),
    @Physical_Address VARCHAR(255),
    @Additional_Info VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[CLIENT]
    SET Client_Code = @Client_Code,
        Contact_Person_Name = @Contact_Person_Name,
        Business_Name = @Business_Name,
        Phone_Number = @Phone_Number,
        Email_Address = @Email_Address,
        Physical_Address = @Physical_Address,
        Additional_Info = @Additional_Info,
        Is_Active = @Is_Active
    WHERE Client_Id = @Client_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateSale]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Update sale details by Sale_Id
CREATE PROCEDURE [dbo].[UpdateSale]
    @Sale_Id INT,
    @Employee_Number INT,
    @Sale_Date_Time DATETIME,
    @Cash_Received MONEY
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[SALE]
    SET Employee_Number = @Employee_Number,
        Sale_Date_Time = @Sale_Date_Time,
        Cash_Received = @Cash_Received
    WHERE Sale_Id = @Sale_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateSaleItem]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Update sale item details by Sale_Item_Id
CREATE PROCEDURE [dbo].[UpdateSaleItem]
    @Sale_Item_Id INT,
    @Stock_Id INT,
    @Sale_Id INT,
    @Quantity INT,
    @Price MONEY
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[SALE_ITEM]
    SET Stock_Id = @Stock_Id,
        Sale_Id = @Sale_Id,
        Quantity = @Quantity,
        Price = @Price
    WHERE Sale_Item_Id = @Sale_Item_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2024/08/16 07:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateStock]
    @Stock_Id INT,
    @Subcategory_Id INT = NULL,
    @Stock_Code VARCHAR(10),
    @Stock_Name VARCHAR(25),
    @Stock_Description VARCHAR(255),
    @Purchase_Date DATETIME,
    @Purchase_Price MONEY,
    @Selling_Price MONEY,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[STOCK]
    SET Subcategory_Id = @Subcategory_Id,
        Stock_Code = @Stock_Code,
        Stock_Name = @Stock_Name,
        Stock_Description = @Stock_Description,
        Purchase_Date = @Purchase_Date,
        Purchase_Price = @Purchase_Price,
        Selling_Price = @Selling_Price,
        Quantity = @Quantity
    WHERE Stock_Id = @Stock_Id;
END
GO

-- Create the SearchAndSortSales stored procedure
GO
CREATE PROCEDURE[dbo].[SearchAndSortSales]
    @SearchTerm NVARCHAR(100) = NULL,
    @SortOption NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * 
    FROM SALE
    WHERE (@SearchTerm IS NULL 
           OR Employee_Number LIKE '%' + @SearchTerm + '%' 
           OR CAST(Sale_Id AS NVARCHAR) LIKE '%' + @SearchTerm + '%')
    ORDER BY 
        CASE 
            WHEN @SortOption = 'Alphabetically' THEN Employee_Number
            WHEN @SortOption = 'By ID' THEN CAST(Sale_Id AS NVARCHAR)
            WHEN @SortOption = 'Date(Ascending)' THEN Sale_Date_Time
            WHEN @SortOption = 'Date(Descending)' THEN Sale_Date_Time
            ELSE Employee_Number -- Default sorting if no sort option provided
        END 
END;
GO

GO
CREATE OR ALTER PROCEDURE [dbo].[SeachAndSortStock]
    @SearchTerm NVARCHAR(100) = NULL,
    @SortOption NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * 
    FROM STOCK
    WHERE (@SearchTerm IS NULL 
           OR Stock_Code LIKE '%' + @SearchTerm + '%' 
           OR Stock_Name LIKE '%' + @SearchTerm + '%' 
           OR Stock_Description LIKE '%' + @SearchTerm + '%')
    ORDER BY 
        CASE 
            WHEN @SortOption = 'Stock Code' THEN Stock_Code
            WHEN @SortOption = 'Stock Name' THEN Stock_Name
            WHEN @SortOption = 'Purchase Date (Ascending)' THEN Purchase_Date
            WHEN @SortOption = 'Purchase Date (Descending)' THEN Purchase_Date
            ELSE Stock_Code -- Default sorting if no sort option provided
        END
END;
GO
