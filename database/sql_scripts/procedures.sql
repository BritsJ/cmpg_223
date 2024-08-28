USE [koosieSeDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSubcategory]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateSubcategory]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateStock]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSaleItem]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateSaleItem]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSale]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateSale]
GO

/****** Object:  StoredProcedure [dbo].[UpdateJob]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateJob]
GO

/****** Object:  StoredProcedure [dbo].[UpdateEquipment]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateEquipment]
GO

/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateEmployee]
GO

/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateClient]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[UpdateCategory]
GO

/****** Object:  StoredProcedure [dbo].[SearchSubcategories]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchSubcategories]
GO

/****** Object:  StoredProcedure [dbo].[SearchStocksSales]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchStocksSales]
GO

/****** Object:  StoredProcedure [dbo].[SearchStocks]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchStocks]
GO

/****** Object:  StoredProcedure [dbo].[SearchSales]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchSales]
GO

/****** Object:  StoredProcedure [dbo].[SearchSaleItems]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchSaleItems]
GO

/****** Object:  StoredProcedure [dbo].[SearchJobs]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchJobs]
GO

/****** Object:  StoredProcedure [dbo].[SearchJobEquipment]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[SearchEquipment]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchEquipment]
GO

/****** Object:  StoredProcedure [dbo].[SearchEmployees]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchEmployees]
GO

/****** Object:  StoredProcedure [dbo].[SearchClients]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchClients]
GO

/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[SearchCategories]
GO

/****** Object:  StoredProcedure [dbo].[rptStock]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[rptStock]
GO

/****** Object:  StoredProcedure [dbo].[rptSales]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[rptSales]
GO

/****** Object:  StoredProcedure [dbo].[rptJobs]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[rptJobs]
GO

/****** Object:  StoredProcedure [dbo].[rptEmployees]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[rptEmployees]
GO

/****** Object:  StoredProcedure [dbo].[rptClients]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[rptClients]
GO

DROP PROCEDURE [dbo].[rptEquipment]
GO

/****** Object:  StoredProcedure [dbo].[InsertJob]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[InsertJob]
GO

/****** Object:  StoredProcedure [dbo].[GetSubcategoryById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetSubcategoryById]
GO

/****** Object:  StoredProcedure [dbo].[GetStockById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetStockById]
GO

/****** Object:  StoredProcedure [dbo].[GetSaleItemById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetSaleItemById]
GO

/****** Object:  StoredProcedure [dbo].[GetSaleById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetSaleById]
GO

/****** Object:  StoredProcedure [dbo].[GetJobEquipmentByJobId]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetJobEquipmentByJobId]
GO

/****** Object:  StoredProcedure [dbo].[GetJobById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetJobById]
GO

/****** Object:  StoredProcedure [dbo].[GetEquipmentById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetEquipmentById]
GO

/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetEmployeeById]
GO

/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetClientById]
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetCategoryById]
GO

/****** Object:  StoredProcedure [dbo].[GetAllEmployees]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[GetAllEmployees]
GO

/****** Object:  StoredProcedure [dbo].[DeleteJobEquipment]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[DeleteJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[CheckUsername]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[CheckUsername]
GO

/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AuthenticateUser]
GO

/****** Object:  StoredProcedure [dbo].[AddSubcategory]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddSubcategory]
GO

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddStock]
GO

/****** Object:  StoredProcedure [dbo].[AddSaleItem]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddSaleItem]
GO

/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddSale]
GO

/****** Object:  StoredProcedure [dbo].[AddJobEquipment]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddJobEquipment]
GO

/****** Object:  StoredProcedure [dbo].[AddJob]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddJob]
GO

/****** Object:  StoredProcedure [dbo].[AddEquipment]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddEquipment]
GO

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddEmployee]
GO

/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddClient]
GO

/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 2024/08/27 06:10:23 ******/
DROP PROCEDURE [dbo].[AddCategory]
GO

/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- Add a new client record and return the Client_Id
CREATE PROCEDURE [dbo].[AddClient]
    @Client_Code varchar(10),
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

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[AddEmployee]
    @Id_Number VARCHAR(25),
    @First_Name VARCHAR(25),
    @Middle_Name VARCHAR(25) = NULL,
    @Last_Name VARCHAR(25),
    @Hire_Date DATETIME,
    @Phone_Number VARCHAR(15),
    @Email_Address VARCHAR(255),
    @Physical_Address VARCHAR(255),
    @Username NVARCHAR(255),
    @PasswordHash NVARCHAR(255),
    @IsAdmin BIT,
    @IsActive BIT = 1 -- Default is active
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[EMPLOYEE]
        (Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address, Username, PasswordHash, IsAdmin, IsActive)
    VALUES
        (@Id_Number, @First_Name, @Middle_Name, @Last_Name, @Hire_Date, @Phone_Number, @Email_Address, @Physical_Address, @Username, @PasswordHash, @IsAdmin, @IsActive);
END
GO

/****** Object:  StoredProcedure [dbo].[AddEquipment]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddEquipment]
    @Equipment_Code varchar(10),
    @Name VARCHAR(35),
    @Description VARCHAR(255),
    @Quantity INT,
    @Quantity_Checked_Out INT,
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        
        INSERT INTO [dbo].[EQUIPMENT] (Equipment_Code, Name, Description, Quantity, Quantity_Checked_Out, Is_Active)
        VALUES (@Equipment_Code, @Name, @Description, @Quantity, @Quantity_Checked_Out, @Is_Active);
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Handle the error here, e.g., log the error message
        THROW;
    END CATCH;
END


GO

/****** Object:  StoredProcedure [dbo].[AddJob]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddJob]
    @Client_Id INT,
    @Employee_Number INT,
    @Start_Date_Time DATETIME,
    @End_Date_Time DATETIME = NULL,
    @Job_Description VARCHAR(255),
    @NewJob_Id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[JOB] (Client_Id, Employee_Number, Start_Date_Time, End_Date_Time, Job_Description)
    VALUES (@Client_Id, @Employee_Number, @Start_Date_Time, @End_Date_Time, @Job_Description);

    SET @NewJob_Id = SCOPE_IDENTITY();
END
GO

/****** Object:  StoredProcedure [dbo].[AddJobEquipment]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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

/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[AddSaleItem]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[AddSubcategory]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- AddSubcategory Procedure
CREATE PROCEDURE [dbo].[AddSubcategory]
    @Category_Id INT,
    @Subcategory_Code VARCHAR(10),
    @Subcategory_Name VARCHAR(25),
    @Subcategory_Description VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO [dbo].[SUBCATEGORY] (
        [Category_Id],
        [Subcategory_Code],
        [Subcategory_Name],
        [Subcategory_Description],
        [Is_Active]
    )
    VALUES (
        @Category_Id,
        @Subcategory_Code,
        @Subcategory_Name,
        @Subcategory_Description,
        @Is_Active
    );
END;
GO

/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[CheckUsername]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CheckUsername]
    @Username VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [EMPLOYEE] WHERE Username = @Username)
    BEGIN
        SELECT CAST(1 AS BIT);  -- Username exists
    END
    ELSE
    BEGIN
        SELECT CAST(0 AS BIT);  -- Username does not exist
    END
END;


GO

/****** Object:  StoredProcedure [dbo].[DeleteJobEquipment]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteJobEquipment]
    @Job_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[JOB_EQUIPMENT]
    WHERE Job_Id = @Job_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetAllEmployees]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetAllEmployees]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Employee_Number,
        Id_Number,
        First_Name,
        Middle_Name,
        Last_Name,
        Hire_Date,
        Phone_Number,
        Email_Address,
        Physical_Address,
        Username,
        IsAdmin,
        IsActive
    FROM [dbo].[EMPLOYEE]
    ORDER BY Employee_Number ASC;
END
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetEmployeeById] 
    @Employee_Number INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Employee_Number,
        Id_Number,
        First_Name,
        Middle_Name,
        Last_Name,
        Hire_Date,
        Phone_Number,
        Email_Address,
        Physical_Address,
        Username,
		PasswordHash,
        IsAdmin,
        IsActive
    FROM [dbo].[EMPLOYEE]
    WHERE Employee_Number = @Employee_Number;
END
GO

/****** Object:  StoredProcedure [dbo].[GetEquipmentById]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetEquipmentById]
    @Equipment_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Equipment_Id, 
           Equipment_Code, 
           Name, 
           Description, 
           Quantity, 
           Quantity_Checked_Out, 
           Is_Active
    FROM [dbo].[EQUIPMENT]
    WHERE Equipment_Id = @Equipment_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetJobById]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetJobById]
    @Job_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve job details
    SELECT j.Job_Id,
           j.Employee_Number,
           j.Client_Id,
           j.Start_Date_Time AS Start_Date,
           j.End_Date_Time AS End_Date,
           j.Job_Description AS Description
    FROM [dbo].[JOB] j
    WHERE j.Job_Id = @Job_Id;

END
GO

/****** Object:  StoredProcedure [dbo].[GetJobEquipmentByJobId]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[GetJobEquipmentByJobId]
    @Job_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT e.Equipment_Id as [Equipment Id], 
           e.Equipment_Code as [Equipment Code], 
           e.Name, 
           e.Description
    FROM [dbo].[JOB] j
    LEFT JOIN [dbo].[JOB_EQUIPMENT] je ON j.Job_Id = je.Job_Id
    LEFT JOIN [dbo].[EQUIPMENT] e ON je.Equipment_Id = e.Equipment_Id
    WHERE j.Job_Id = @Job_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[GetSaleById]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[GetSaleItemById]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[GetStockById]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[GetSubcategoryById]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSubcategoryById]
    @Subcategory_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Subcategory_Id,
        Category_Id,
        Subcategory_Code,
        Subcategory_Name,
        Subcategory_Description,
        Is_Active
    FROM 
        SUBCATEGORY
    WHERE 
        Subcategory_Id = @Subcategory_Id;
END;
GO

/****** Object:  StoredProcedure [dbo].[InsertJob]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Insert a new job
CREATE PROCEDURE [dbo].[InsertJob]
    @Employee_Number INT,
    @Client_Id INT,
    @Start_Date_Time DATETIME,
    @End_Date_Time DATETIME = NULL,
    @Job_Description VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[JOB] (Employee_Number, Client_Id, Start_Date_Time, End_Date_Time, Job_Description)
    VALUES (@Employee_Number, @Client_Id, @Start_Date_Time, @End_Date_Time, @Job_Description);
END
GO

/****** Object:  StoredProcedure [dbo].[rptClients]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptClients]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Client_Id',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT * FROM Client';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Client_Id LIKE N''%' + @SearchValue + '%''
                    OR Client_Code LIKE N''%' + @SearchValue + '%''
                    OR Contact_Person_Name LIKE N''%' + @SearchValue + '%''
                    OR Business_Name LIKE N''%' + @SearchValue + '%''
                    OR Phone_Number LIKE N''%' + @SearchValue + '%''
                    OR Email_Address LIKE N''%' + @SearchValue + '%''
                    OR Physical_Address LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;
    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptEmployees]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptEmployees]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Employee_Number',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT * FROM Employee';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Employee_Number LIKE N''%' + @SearchValue + '%''
                     OR Id_Number LIKE N''%' + @SearchValue + '%''
                     OR First_Name LIKE N''%' + @SearchValue + '%''
                     OR Middle_Name LIKE N''%' + @SearchValue + '%''
                     OR Last_Name LIKE N''%' + @SearchValue + '%''
                     OR Hire_Date LIKE N''%' + @SearchValue + '%''
                     OR Phone_Number LIKE N''%' + @SearchValue + '%''
                     OR Email_Address LIKE N''%' + @SearchValue + '%''
                     OR Physical_Address LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptJobs]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptJobs]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Job_Id',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT * FROM Job';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Job_Id LIKE N''%' + @SearchValue + '%''
                    OR Employee_Number LIKE N''%' + @SearchValue + '%''
                    OR Client_Id LIKE N''%' + @SearchValue + '%''
                    OR Start_Date_Time LIKE N''%' + @SearchValue + '%''
                    OR End_Date_Time LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptSales]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptSales]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Sale_Id',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT * FROM Sale';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Sale_Id LIKE N''%' + @SearchValue + '%''
                    OR Employee_Number LIKE N''%' + @SearchValue + '%''
                    OR Sale_Date_Time LIKE N''%' + @SearchValue + '%''
                    OR Cash_Received LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptStock]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptStock]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Stock_Id',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT * FROM Stock';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Stock_Id LIKE N''%' + @SearchValue + '%''
                    OR Stock_Code LIKE N''%' + @SearchValue + '%''
                    OR Stock_Name LIKE N''%' + @SearchValue + '%''
                    OR Purchase_Date LIKE N''%' + @SearchValue + '%''
                    OR Purchase_Price LIKE N''%' + @SearchValue + '%''
                    OR Selling_Price LIKE N''%' + @SearchValue + '%''
                    OR Quantity LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[rptEquipment]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Equipment_Id',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT * FROM Equipment';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Equipment_Id LIKE N''%' + @SearchValue + '%''
                    OR Equipment_Code LIKE N''%' + @SearchValue + '%''
                    OR Name LIKE N''%' + @SearchValue + '%''
                    OR Quantity LIKE N''%' + @SearchValue + '%''
                    OR Quantity_Checked_Out LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchClients]    Script Date: 2024/08/27 06:10:23 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchEmployees]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SearchEmployees]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Employee_Number, Id_Number, First_Name, Middle_Name, Last_Name, Hire_Date, Phone_Number, Email_Address, Physical_Address, Username, IsAdmin, IsActive
    FROM dbo.EMPLOYEE
    WHERE First_Name LIKE '%' + @SearchTerm + '%'
       OR Last_Name LIKE '%' + @SearchTerm + '%'
       OR Id_Number LIKE '%' + @SearchTerm + '%'
       OR Email_Address LIKE '%' + @SearchTerm + '%'
       OR Username LIKE '%' + @SearchTerm + '%';
END;

GO

/****** Object:  StoredProcedure [dbo].[SearchEquipment]    Script Date: 2024/08/27 06:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SearchEquipment]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Equipment_Id, 
           Equipment_Code, 
           Name, 
           Description, 
           Quantity, 
           Quantity_Checked_Out, 
           Is_Active
    FROM [dbo].[EQUIPMENT]
    WHERE (CAST(Equipment_Code AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (Name LIKE '%' + @SearchTerm + '%')
       OR (Description LIKE '%' + @SearchTerm + '%')
       OR (CAST(Quantity AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Quantity_Checked_Out AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Is_Active AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchJobEquipment]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[SearchJobEquipment]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Equipment_Id as [Equipment Id], 
           Equipment_Code as [Equipment Code], 
           Name, 
           Description
    FROM [dbo].[EQUIPMENT]
    WHERE (CAST(Equipment_Code AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (Name LIKE '%' + @SearchTerm + '%')
       OR (Description LIKE '%' + @SearchTerm + '%')
       OR (CAST(Quantity AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Quantity_Checked_Out AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Is_Active AS VARCHAR) LIKE '%' + @SearchTerm + '%')
	and Is_Active = 1
END
GO

/****** Object:  StoredProcedure [dbo].[SearchJobs]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- Search for jobs
CREATE PROCEDURE [dbo].[SearchJobs]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Job_Id, 
           Employee_Number, 
           Client_Id, 
           Start_Date_Time, 
           End_Date_Time, 
           Job_Description
    FROM [dbo].[JOB]
    WHERE (CAST(Job_Id AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Employee_Number AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Client_Id AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Start_Date_Time AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (Job_Description LIKE '%' + @SearchTerm + '%');
END
GO

/****** Object:  StoredProcedure [dbo].[SearchSaleItems]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchSales]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchStocks]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchStocksSales]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchSubcategories]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SearchSubcategories]
    @SearchTerm VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Subcategory_Id,
           Subcategory_Code,
           Subcategory_Name,
           Subcategory_Description,
           Category_Id,
           Is_Active
    FROM [dbo].[SUBCATEGORY]
    WHERE (Subcategory_Code LIKE '%' + @SearchTerm + '%')
       OR (Subcategory_Name LIKE '%' + @SearchTerm + '%')
       OR (Subcategory_Description LIKE '%' + @SearchTerm + '%')
       OR (CAST(Category_Id AS VARCHAR) LIKE '%' + @SearchTerm + '%')
       OR (CAST(Is_Active AS VARCHAR) LIKE '%' + @SearchTerm + '%');
END

GO

/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[UpdateClient]
    @Client_Id INT,
    @Client_Code varchar(10),
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

/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateEmployee]
    @Employee_Number INT,
    @Id_Number VARCHAR(25),
    @First_Name VARCHAR(25),
    @Middle_Name VARCHAR(25) = NULL,
    @Last_Name VARCHAR(25),
    @Hire_Date DATETIME,
    @Phone_Number VARCHAR(15),
    @Email_Address VARCHAR(255),
    @Physical_Address VARCHAR(255),
    @Username NVARCHAR(255),
    @PasswordHash NVARCHAR(255) = NULL,
    @IsAdmin BIT,
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[EMPLOYEE]
    SET Id_Number = @Id_Number,
        First_Name = @First_Name,
        Middle_Name = @Middle_Name,
        Last_Name = @Last_Name,
        Hire_Date = @Hire_Date,
        Phone_Number = @Phone_Number,
        Email_Address = @Email_Address,
        Physical_Address = @Physical_Address,
        Username = @Username,
        PasswordHash = COALESCE(@PasswordHash, PasswordHash), -- Update password only if provided
        IsAdmin = @IsAdmin,
        IsActive = @IsActive
    WHERE Employee_Number = @Employee_Number;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateEquipment]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateEquipment]
    @Equipment_Id INT,
    @Equipment_Code INT,
    @Name VARCHAR(35),
    @Description VARCHAR(255),
    @Quantity INT,
    @Quantity_Checked_Out INT,
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE [dbo].[EQUIPMENT]
        SET Equipment_Code = @Equipment_Code,
            Name = @Name,
            Description = @Description,
            Quantity = @Quantity,
            Quantity_Checked_Out = @Quantity_Checked_Out,
            Is_Active = @Is_Active
        WHERE Equipment_Id = @Equipment_Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Handle the error here, e.g., log the error message
        THROW;
    END CATCH;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateJob]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateJob]
    @Job_Id INT,
    @Client_Id INT,
    @Employee_Number INT,
    @Start_Date_Time DATETIME,
    @End_Date_Time DATETIME = NULL,
    @Job_Description VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[JOB]
    SET Client_Id = @Client_Id,
        Employee_Number = @Employee_Number,
        Start_Date_Time = @Start_Date_Time,
        End_Date_Time = @End_Date_Time,
        Job_Description = @Job_Description
    WHERE Job_Id = @Job_Id;
END
GO

/****** Object:  StoredProcedure [dbo].[UpdateSale]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateSaleItem]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2024/08/27 06:10:24 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateSubcategory]    Script Date: 2024/08/27 06:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- UpdateSubcategory Procedure
CREATE PROCEDURE [dbo].[UpdateSubcategory]
    @Subcategory_Id INT,
    @Category_Id INT,
    @Subcategory_Code VARCHAR(10),
    @Subcategory_Name VARCHAR(25),
    @Subcategory_Description VARCHAR(255),
    @Is_Active BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[SUBCATEGORY]
    SET 
        [Category_Id] = @Category_Id,
        [Subcategory_Code] = @Subcategory_Code,
        [Subcategory_Name] = @Subcategory_Name,
        [Subcategory_Description] = @Subcategory_Description,
        [Is_Active] = @Is_Active
    WHERE 
        [Subcategory_Id] = @Subcategory_Id;
END;
GO


