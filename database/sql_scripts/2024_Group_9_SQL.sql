-- ///
-- //Group Members	
-- //Jaco Brits	38980274
-- //Marcel Volschenk	33451524
-- //Hendrik Diedericks	45973466
-- //Karina Visagie	40878554
-- //Ryno Williamson	47492058
-- ///


USE [koosieSeDatabase]
GO

/****** Object:  Table [dbo].[CATEGORY]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CATEGORY](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Code] [varchar](10) NOT NULL,
	[Category_Name] [varchar](25) NOT NULL,
	[Category_Description] [varchar](255) NOT NULL,
	[Is_Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CLIENT]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CLIENT](
	[Client_Id] [int] IDENTITY(1,1) NOT NULL,
	[Client_Code] [varchar](10) NOT NULL,
	[Contact_Person_Name] [varchar](35) NOT NULL,
	[Business_Name] [varchar](35) NOT NULL,
	[Phone_Number] [varchar](15) NOT NULL,
	[Email_Address] [varchar](255) NOT NULL,
	[Physical_Address] [varchar](255) NOT NULL,
	[Additional_Info] [varchar](255) NOT NULL,
	[Is_Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Client_Code_uk] UNIQUE NONCLUSTERED 
(
	[Client_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EMPLOYEE](
	[Employee_Number] [int] IDENTITY(1,1) NOT NULL,
	[Id_Number] [varchar](25) NOT NULL,
	[First_Name] [varchar](25) NOT NULL,
	[Middle_Name] [varchar](25) NULL,
	[Last_Name] [varchar](25) NOT NULL,
	[Hire_Date] [datetime] NOT NULL,
	[Phone_Number] [varchar](15) NOT NULL,
	[Email_Address] [varchar](255) NOT NULL,
	[Physical_Address] [varchar](255) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Id_Number_uk] UNIQUE NONCLUSTERED 
(
	[Id_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Id_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_EMPLOYEE_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EQUIPMENT]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EQUIPMENT](
	[Equipment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Equipment_Code] [varchar](10) NOT NULL,
	[Name] [varchar](35) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Quantity_Checked_Out] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Equipment_Code_uk] UNIQUE NONCLUSTERED 
(
	[Equipment_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[JOB]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JOB](
	[Job_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Number] [int] NULL,
	[Client_Id] [int] NULL,
	[Start_Date_Time] [datetime] NOT NULL,
	[End_Date_Time] [datetime] NULL,
	[Job_Description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Job_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[JOB_EQUIPMENT]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JOB_EQUIPMENT](
	[Job_Equipment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Job_Id] [int] NULL,
	[Equipment_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Job_Equipment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SALE]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALE](
	[Sale_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Number] [int] NULL,
	[Sale_Date_Time] [datetime] NOT NULL,
	[Cash_Received] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sale_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SALE_ITEM]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALE_ITEM](
	[Sale_Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Stock_Id] [int] NULL,
	[Sale_Id] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sale_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STOCK]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STOCK](
	[Stock_Id] [int] IDENTITY(1,1) NOT NULL,
	[Subcategory_Id] [int] NULL,
	[Stock_Code] [varchar](10) NOT NULL,
	[Stock_Name] [varchar](25) NOT NULL,
	[Stock_Description] [varchar](255) NOT NULL,
	[Purchase_Date] [datetime] NOT NULL,
	[Purchase_Price] [money] NOT NULL,
	[Selling_Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Stock_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Stock_Code_uk] UNIQUE NONCLUSTERED 
(
	[Stock_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SUBCATEGORY]    Script Date: 2024/09/02 21:08:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SUBCATEGORY](
	[Subcategory_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NULL,
	[Subcategory_Code] [varchar](10) NOT NULL,
	[Subcategory_Name] [varchar](25) NOT NULL,
	[Subcategory_Description] [varchar](255) NOT NULL,
	[Is_Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Subcategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Subcategory_Code_uk] UNIQUE NONCLUSTERED 
(
	[Subcategory_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CATEGORY] ADD  DEFAULT ((1)) FOR [Is_Active]
GO

ALTER TABLE [dbo].[CLIENT] ADD  DEFAULT ((1)) FOR [Is_Active]
GO

ALTER TABLE [dbo].[EMPLOYEE] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO

ALTER TABLE [dbo].[EMPLOYEE] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[EQUIPMENT] ADD  DEFAULT ((1)) FOR [Is_Active]
GO

ALTER TABLE [dbo].[SUBCATEGORY] ADD  DEFAULT ((1)) FOR [Is_Active]
GO

ALTER TABLE [dbo].[JOB]  WITH CHECK ADD  CONSTRAINT [Client_Job_fk] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[CLIENT] ([Client_Id])
GO

ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [Client_Job_fk]
GO

ALTER TABLE [dbo].[JOB]  WITH CHECK ADD  CONSTRAINT [Employee_Job_fk] FOREIGN KEY([Employee_Number])
REFERENCES [dbo].[EMPLOYEE] ([Employee_Number])
GO

ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [Employee_Job_fk]
GO

ALTER TABLE [dbo].[JOB]  WITH CHECK ADD  CONSTRAINT [FK_Job_Client] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[CLIENT] ([Client_Id])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [FK_Job_Client]
GO

ALTER TABLE [dbo].[JOB]  WITH CHECK ADD  CONSTRAINT [FK_Job_Employee] FOREIGN KEY([Employee_Number])
REFERENCES [dbo].[EMPLOYEE] ([Employee_Number])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [FK_Job_Employee]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [Equip_Job_fk] FOREIGN KEY([Equipment_Id])
REFERENCES [dbo].[EQUIPMENT] ([Equipment_Id])
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] CHECK CONSTRAINT [Equip_Job_fk]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_JobEquipment_Equipment] FOREIGN KEY([Equipment_Id])
REFERENCES [dbo].[EQUIPMENT] ([Equipment_Id])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] CHECK CONSTRAINT [FK_JobEquipment_Equipment]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_JobEquipment_Job] FOREIGN KEY([Job_Id])
REFERENCES [dbo].[JOB] ([Job_Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] CHECK CONSTRAINT [FK_JobEquipment_Job]
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [Job_Job_Equip_fk] FOREIGN KEY([Job_Id])
REFERENCES [dbo].[JOB] ([Job_Id])
GO

ALTER TABLE [dbo].[JOB_EQUIPMENT] CHECK CONSTRAINT [Job_Job_Equip_fk]
GO

ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Employee] FOREIGN KEY([Employee_Number])
REFERENCES [dbo].[EMPLOYEE] ([Employee_Number])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [FK_Sale_Employee]
GO

ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [Sale_Emp_fk] FOREIGN KEY([Employee_Number])
REFERENCES [dbo].[EMPLOYEE] ([Employee_Number])
GO

ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [Sale_Emp_fk]
GO

ALTER TABLE [dbo].[SALE_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_SaleItem_Sale] FOREIGN KEY([Sale_Id])
REFERENCES [dbo].[SALE] ([Sale_Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SALE_ITEM] CHECK CONSTRAINT [FK_SaleItem_Sale]
GO

ALTER TABLE [dbo].[SALE_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_SaleItem_Stock] FOREIGN KEY([Stock_Id])
REFERENCES [dbo].[STOCK] ([Stock_Id])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[SALE_ITEM] CHECK CONSTRAINT [FK_SaleItem_Stock]
GO

ALTER TABLE [dbo].[SALE_ITEM]  WITH CHECK ADD  CONSTRAINT [Sale_Sale_Item_fk] FOREIGN KEY([Sale_Id])
REFERENCES [dbo].[SALE] ([Sale_Id])
GO

ALTER TABLE [dbo].[SALE_ITEM] CHECK CONSTRAINT [Sale_Sale_Item_fk]
GO

ALTER TABLE [dbo].[SALE_ITEM]  WITH CHECK ADD  CONSTRAINT [Stock_Sale_Item_fk] FOREIGN KEY([Stock_Id])
REFERENCES [dbo].[STOCK] ([Stock_Id])
GO

ALTER TABLE [dbo].[SALE_ITEM] CHECK CONSTRAINT [Stock_Sale_Item_fk]
GO

ALTER TABLE [dbo].[STOCK]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Subcategory] FOREIGN KEY([Subcategory_Id])
REFERENCES [dbo].[SUBCATEGORY] ([Subcategory_Id])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[STOCK] CHECK CONSTRAINT [FK_Stock_Subcategory]
GO

ALTER TABLE [dbo].[STOCK]  WITH CHECK ADD  CONSTRAINT [Sub_Stock_fk] FOREIGN KEY([Subcategory_Id])
REFERENCES [dbo].[SUBCATEGORY] ([Subcategory_Id])
GO

ALTER TABLE [dbo].[STOCK] CHECK CONSTRAINT [Sub_Stock_fk]
GO

ALTER TABLE [dbo].[SUBCATEGORY]  WITH CHECK ADD  CONSTRAINT [Cat_Subcat_fk] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[CATEGORY] ([Category_Id])
GO

ALTER TABLE [dbo].[SUBCATEGORY] CHECK CONSTRAINT [Cat_Subcat_fk]
GO

ALTER TABLE [dbo].[SUBCATEGORY]  WITH CHECK ADD  CONSTRAINT [FK_Subcategory_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[CATEGORY] ([Category_Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SUBCATEGORY] CHECK CONSTRAINT [FK_Subcategory_Category]
GO

ALTER TABLE [dbo].[EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [Equipment_Quantity_min] CHECK  (([Quantity]>=(0)))
GO

ALTER TABLE [dbo].[EQUIPMENT] CHECK CONSTRAINT [Equipment_Quantity_min]
GO

ALTER TABLE [dbo].[SALE]  WITH CHECK ADD  CONSTRAINT [Sale_Cash_Received_min] CHECK  (([Cash_Received]>=(0)))
GO

ALTER TABLE [dbo].[SALE] CHECK CONSTRAINT [Sale_Cash_Received_min]
GO

ALTER TABLE [dbo].[SALE_ITEM]  WITH CHECK ADD  CONSTRAINT [Sale_Item_Price_min] CHECK  (([Price]>=(0)))
GO

ALTER TABLE [dbo].[SALE_ITEM] CHECK CONSTRAINT [Sale_Item_Price_min]
GO

ALTER TABLE [dbo].[SALE_ITEM]  WITH CHECK ADD  CONSTRAINT [Sale_Item_Quantity_min] CHECK  (([Quantity]>=(0)))
GO

ALTER TABLE [dbo].[SALE_ITEM] CHECK CONSTRAINT [Sale_Item_Quantity_min]
GO

ALTER TABLE [dbo].[STOCK]  WITH CHECK ADD  CONSTRAINT [Stock_Purchase_Price_min] CHECK  (([Purchase_Price]>=(0)))
GO

ALTER TABLE [dbo].[STOCK] CHECK CONSTRAINT [Stock_Purchase_Price_min]
GO

ALTER TABLE [dbo].[STOCK]  WITH CHECK ADD  CONSTRAINT [Stock_Selling_Price_min] CHECK  (([Selling_Price]>=(0)))
GO

ALTER TABLE [dbo].[STOCK] CHECK CONSTRAINT [Stock_Selling_Price_min]
GO


---------------------------------------------------------Procedure---------------------------------------------------------


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

/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddEquipment]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddJob]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddJobEquipment]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddSaleItem]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AddSubcategory]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[CheckUsername]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[DeleteJobEquipment]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetAllEmployees]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetEquipmentById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetJobById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetJobEquipmentByJobId]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetSaleById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetSaleItemById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetStockById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[GetSubcategoryById]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[InsertJob]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[rptClients]    Script Date: 2024/09/02 21:07:13 ******/
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
    DECLARE @SearchFilter NVARCHAR(MAX) = '';
    
    -- Build the base SQL query
    SET @SQL = N'SELECT c.Client_Id, c.Business_Name,
                        COUNT(j.Job_Id) AS Total_Jobs,
                        ISNULL(SUM(DATEDIFF(day, j.Start_Date_Time, j.End_Date_Time)), 0) AS Total_Job_Duration
                FROM Client c
                LEFT JOIN Job j ON c.Client_Id = j.Client_Id';
    
    -- Apply search filter if @SearchValue is provided
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SearchFilter = N' WHERE c.Client_Id LIKE N''%' + @SearchValue + '%''
                             OR c.Business_Name LIKE N''%' + @SearchValue + '%''';
    END
    
    -- Append search filter to the base SQL query
    SET @SQL = @SQL + @SearchFilter;
    
    -- Group by Client and apply sorting
    SET @SQL = @SQL + N' GROUP BY c.Client_Id, c.Business_Name
                        ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    -- Execute the dynamically built SQL statement
    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptEmployees]    Script Date: 2024/09/02 21:07:13 ******/
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
    
    SET @SQL = N'SELECT e.Employee_Number, e.First_Name, e.Last_Name, 
                        COUNT(j.Job_ID) AS Total_Jobs,
                        SUM(s.Cash_Received) AS Total_Sales
                FROM Employee e
                LEFT JOIN Job j ON e.Employee_Number = j.Employee_Number
                LEFT JOIN Sale s ON e.Employee_Number = s.Employee_Number';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE e.Employee_Number LIKE N''%' + @SearchValue + '%''
                     OR e.First_Name LIKE N''%' + @SearchValue + '%''
                     OR e.Last_Name LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' GROUP BY e.Employee_Number, e.First_Name, e.Last_Name';
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptEquipment]    Script Date: 2024/09/02 21:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptEquipment]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Equipment_Code',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    -- Start building the SQL query
    SET @SQL = N'SELECT Equipment_Code, Name, 
                        SUM(Quantity) AS Total_Quantity, 
                        SUM(Quantity_Checked_Out) AS Total_Checked_Out
                 FROM Equipment';
    
    -- Add search functionality if a search value is provided
    IF @SearchValue IS NOT NULL AND @SearchValue <> ''
    BEGIN
        SET @SQL += N' WHERE Equipment_Code LIKE N''%' + @SearchValue + '%'' 
                     OR Name LIKE N''%' + @SearchValue + '%'' 
                     OR Quantity LIKE N''%' + @SearchValue + '%'' 
                     OR Quantity_Checked_Out LIKE N''%' + @SearchValue + '%''';
    END
    
    -- Group by Equipment_Code and Name
    SET @SQL += N' GROUP BY Equipment_Code, Name';
    
    -- Add sorting functionality
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    -- Execute the dynamically generated SQL
    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptJobs]    Script Date: 2024/09/02 21:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[rptJobs]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Client_Business_Name',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    -- Define the base SQL query with joins and grouping
    SET @SQL = N'SELECT 
                    c.Business_Name AS Client_Business_Name, 
                    j.Client_Id, 
                    COUNT(j.Job_Id) AS Total_Jobs
                FROM Job j
                INNER JOIN Client c ON j.Client_Id = c.Client_Id';

    -- Apply search filter if a search value is provided
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE c.Business_Name LIKE N''%' + @SearchValue + '%''
                     OR j.Job_Id LIKE N''%' + @SearchValue + '%''';
    END

    -- Group by Client_Id and Employee_Number to aggregate the data
    SET @SQL += N' GROUP BY c.Business_Name, j.Client_Id';

    -- Apply sorting based on user input
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    -- Execute the dynamic SQL query
    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptSales]    Script Date: 2024/09/02 21:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[rptSales]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Employee_Number',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT Employee_Number, COUNT(Sale_Id) AS Total_Sales, SUM(Cash_Received) AS Total_Revenue
                FROM Sale';
    
    IF @SearchValue IS NOT NULL
    BEGIN
        SET @SQL += N' WHERE Employee_Number LIKE N''%' + @SearchValue + '%''
                     OR Sale_Id LIKE N''%' + @SearchValue + '%''';
    END
    
    SET @SQL += N' GROUP BY Employee_Number';
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[rptStock]    Script Date: 2024/09/02 21:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[rptStock]
    @SearchValue NVARCHAR(100) = NULL,
    @SortColumn NVARCHAR(50) = 'Stock_Code',
    @SortOrder NVARCHAR(4) = 'ASC'
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    -- Start building the SQL query
    SET @SQL = N'SELECT Stock_Code, Stock_Name, 
                        SUM(Quantity) AS Total_Quantity, 
                        SUM(Purchase_Price * Quantity) AS Total_Purchase_Cost, 
                        SUM(Selling_Price * Quantity) AS Total_Selling_Value
                 FROM Stock';
    
    -- Add search functionality if a search value is provided
    IF @SearchValue IS NOT NULL AND @SearchValue <> ''
    BEGIN
        SET @SQL += N' WHERE Stock_Code LIKE N''%' + @SearchValue + '%'' 
                     OR Stock_Name LIKE N''%' + @SearchValue + '%'' 
                     OR Purchase_Price LIKE N''%' + @SearchValue + '%'' 
                     OR Selling_Price LIKE N''%' + @SearchValue + '%'' 
                     OR Quantity LIKE N''%' + @SearchValue + '%''';
    END
    
    -- Group by Stock_Code and Stock_Name
    SET @SQL += N' GROUP BY Stock_Code, Stock_Name';
    
    -- Add sorting functionality
    SET @SQL += N' ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    -- Execute the dynamically generated SQL
    EXEC sp_executesql @SQL, N'@SearchValue NVARCHAR(100)', @SearchValue;
END
GO

/****** Object:  StoredProcedure [dbo].[SearchCategories]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchClients]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchEmployees]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchEquipment]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchJobEquipment]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchJobs]    Script Date: 2024/09/02 21:07:13 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchSaleItems]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchSales]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchStocks]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchStocksSales]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[SearchSubcategories]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateEquipment]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateJob]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateSale]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateSaleItem]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2024/09/02 21:07:14 ******/
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

/****** Object:  StoredProcedure [dbo].[UpdateSubcategory]    Script Date: 2024/09/02 21:07:14 ******/
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


