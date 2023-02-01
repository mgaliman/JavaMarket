CREATE DATABASE JavaMarketDb
GO

USE JavaMarketDb
GO

CREATE TABLE UserAccount
(
	IDUserAccount INT CONSTRAINT PK_UserAccount PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	Pswd NVARCHAR(50) NOT NULL,
	IsAdmin BIT NOT NULL
)
GO

------------ADMIN-----------
INSERT INTO UserAccount (FirstName, LastName, Email, Pswd, IsAdmin)
VALUES ('AdminFirstName', 'AdminLastName', 'admin@admin.com', 'admin', 1);

CREATE TABLE Category
(
	IDCategory INT CONSTRAINT PK_Category PRIMARY KEY IDENTITY,
	Title NVARCHAR(50),
	PicturePath NVARCHAR(MAX)
)
GO

CREATE TABLE Product
(
	IDProduct INT CONSTRAINT PK_Product PRIMARY KEY IDENTITY,
	Title NVARCHAR(50),
	Descr NVARCHAR(250),
	Price FLOAT,
	PicturePath NVARCHAR(MAX),
	CategoryID INT CONSTRAINT FK_CategoryID FOREIGN KEY REFERENCES Category(IDCategory)
)
GO

CREATE TABLE LoginHistory
(
	IDLoginHistory INT CONSTRAINT PK_LoginHistory PRIMARY KEY IDENTITY,
	LoginDate DATETIME NOT NULL,
	IPAddress NVARCHAR(50) NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
)
GO

CREATE TABLE PaymentHistory
(
	IDPaymentHistory INT CONSTRAINT PK_PaymentHistory PRIMARY KEY IDENTITY,
	PaymentType NVARCHAR(50) NOT NULL,
	UserAccountID INT CONSTRAINT FK_UserAccountID FOREIGN KEY REFERENCES UserAccount(IDUserAccount),
	Items NVARCHAR(MAX) NOT NULL,
	PaymentDate DATETIME NOT NULL
)
GO

------------PROCEDURES-----------
------------ACCOUNT-----------
CREATE PROCEDURE creatAccount
	@Email NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Pswd NVARCHAR(50),
	@IsAdmin BIT,
	@IDUser INT OUT
AS
INSERT INTO UserAccount(FirstName, LastName, Email, Pswd, IsAdmin)
VALUES (@FirstName, @LastName, @Email, @Pswd, @IsAdmin)
SET @IDUser = SCOPE_IDENTITY()
GO

CREATE PROCEDURE doesAccountExist
	@Email NVARCHAR(50)
AS
SELECT * FROM UserAccount
WHERE Email = @Email
GO

CREATE PROCEDURE getAccount
	@Email NVARCHAR(50),
	@Pswd NVARCHAR(50)
AS
SELECT * FROM UserAccount
WHERE Email = @Email and Pswd = @Pswd
GO

------------CATEGORY-----------
CREATE PROCEDURE createCategory
	@Title NVARCHAR(50),
	@PicturePath NVARCHAR(MAX),
	@IDCategory INT OUT
AS
INSERT INTO Category(Title, PicturePath)
VALUES(@Title, @PicturePath)
SET @IDCategory = SCOPE_IDENTITY()
GO

CREATE PROCEDURE doesCategoryExist
	@Title NVARCHAR(50)
AS
SELECT * FROM Category
WHERE Title = @Title
GO

CREATE PROCEDURE getCategories
AS
SELECT * FROM Category
GO

CREATE PROCEDURE deleteCategory
	@IDCategory INT
AS
DELETE FROM Product
WHERE categoryID=@IDCategory
DELETE FROM Category
WHERE IDCategory = @IDCategory
GO

CREATE PROCEDURE getCategory
	@IDCategory INT
AS
SELECT * FROM Category
WHERE IDCategory = @IDCategory
GO

CREATE PROCEDURE updateCategory
	@IDCategory INT,
	@Title NVARCHAR(50),
	@PicturePath NVARCHAR(MAX)
AS
UPDATE Category
SET Title = @Title, PicturePath = @PicturePath
WHERE IDCategory = @IDCategory
GO

------------PRODUCT-----------
CREATE PROCEDURE createProduct
	@Title NVARCHAR(50),
	@Descr NVARCHAR(250),
	@Price FLOAT,
	@PicturePath NVARCHAR(MAX),
	@CategoryID INT,
	@IDProduct INT OUT
AS 
INSERT INTO Product(Title, Descr, Price, PicturePath, CategoryID)
VALUES (@Title, @Descr, @Price, @PicturePath, @CategoryID)
SET @IDProduct = SCOPE_IDENTITY()
GO

CREATE PROCEDURE getProducts
AS
SELECT * FROM Product
GO

CREATE PROCEDURE doesProductExist
	@Title NVARCHAR(50)
AS
SELECT * FROM Product
WHERE Title = @Title
GO

CREATE PROCEDURE deleteProduct
	@IDProduct INT
AS
DELETE FROM Product
WHERE IDProduct = @IDProduct
GO

CREATE PROCEDURE getProduct
	@IDProduct INT
AS
SELECT * FROM Product
WHERE IDProduct = @IDProduct
GO

CREATE PROCEDURE updateProduct
	@IDProduct INT,
	@Title NVARCHAR(50),
	@Descr NVARCHAR(250),
	@Price FLOAT,
	@PicturePath NVARCHAR(MAX),
	@CategoryID INT
AS
UPDATE Product
SET Title = @Title, Descr = @Descr, PicturePath = @PicturePath, Price = @Price , CategoryID = @CategoryID
WHERE IDProduct = @IDProduct
GO

CREATE PROCEDURE getProductsByCategory
	@IDCategory INT
AS
SELECT * FROM Product
WHERE categoryID = @IDCategory
GO

------------LOGIN HISTORY-----------
CREATE PROCEDURE getLoginHistory
AS
SELECT * FROM LoginHistory
GO

CREATE PROCEDURE createLoginHistory
	@LoginDate DATETIME,
	@IPAddress NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Email NVARCHAR(50),
	@IDLoginHistory INT OUT
AS
INSERT INTO LoginHistory(LoginDate, IPAddress, FirstName, LastName, Email)
VALUES(@LoginDate, @IPAddress, @FirstName, @LastName, @Email)
SET @IDLoginHistory = SCOPE_IDENTITY()
GO

------------PAYMENT HISTORY-----------
CREATE PROCEDURE getPaymentHistoryADMIN
AS
SELECT * FROM PaymentHistory
GO

CREATE PROCEDURE getPaymentHistoryUSER
	@IDUserAccount INT
AS
SELECT * FROM PaymentHistory
inner join UserAccount on PaymentHistory.UserAccountID = UserAccount.IDUserAccount
WHERE IDUserAccount = @IDUserAccount
GO

CREATE PROCEDURE createPaymentHistory
	@PaymentType NVARCHAR(50),
	@UserAccountID INT,
	@Items NVARCHAR(MAX),
	@PaymentDate DATETIME ,
	@IDPaymentHistory INT OUT
AS
INSERT INTO PaymentHistory(PaymentType, UserAccountID, Items, PaymentDate)
VALUES(@PaymentType, @UserAccountID, @Items, @PaymentDate)
SET @IDPaymentHistory = SCOPE_IDENTITY()
GO