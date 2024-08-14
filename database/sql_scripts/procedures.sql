--------------------
-----User-------
--------------------

CREATE PROCEDURE GetIsAdminByUserId
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IsAdmin
    FROM [dbo].[SYSTEM_USER]
    WHERE UserId = @UserId;
END
GO

CREATE OR ALTER PROCEDURE AuthenticateUser
    @Username VARCHAR(50),
    @PasswordHash VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IsActive, 
           UserId, 
           IsAdmin
    FROM [dbo].[SYSTEM_USER]
    WHERE Username = @Username
      AND PasswordHash = @PasswordHash
      AND IsActive = 1;
END
GO

--------------------
-----Category-------
--------------------

CREATE OR ALTER PROCEDURE AddCategory
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

CREATE OR ALTER PROCEDURE UpdateCategory
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

CREATE OR ALTER PROCEDURE SearchCategories
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

CREATE OR ALTER PROCEDURE GetCategoryById
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