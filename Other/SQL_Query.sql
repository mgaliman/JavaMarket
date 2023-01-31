create database WebShop
GO

use WebShop
GO

create table UserAccount
(
	IDUserAccount int constraint PK_UserAccount primary key identity,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(50) not null,
	Pswd nvarchar(50) not null,
	IsAdmin bit not null
)
GO

create table Category
(
	IDCategory int constraint PK_Category primary key identity,
	Title nvarchar(50),
	PicturePath nvarchar(max)
)
GO

create table Product
(
	IDProduct int constraint PK_Product primary key identity,
	Title nvarchar(50),
	Descr nvarchar(250),
	Price float,
	PicturePath nvarchar(max),
	CategoryID int constraint FK_CategoryID foreign key references Category(IDCategory)
)
GO

create table LoginHistory
(
	IDLoginHistory int constraint PK_LoginHistory primary key identity,
	LoginDate datetime not null,
	IPAddress nvarchar(50) not null,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(50) not null,
)
GO

create table PaymentHistory
(
	IDPaymentHistory int constraint PK_PaymentHistory primary key identity,
	PaymentType nvarchar(50) not null,
	UserAccountID int constraint FK_UserAccountID foreign key references UserAccount(IDUserAccount),
	Items nvarchar(max) not null,
	PaymentDate datetime not null
)
GO

------------PROCEDURES-----------
------------ACCOUNT-----------
create proc creatAccount
	@Email nvarchar(50),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Pswd nvarchar(50),
	@IsAdmin bit,
	@IDUser int out
as
insert into UserAccount(FirstName, LastName, Email, Pswd, IsAdmin)
values (@FirstName, @LastName, @Email, @Pswd, @IsAdmin)
set @IDUser = SCOPE_IDENTITY()
GO

create proc doesAccountExist
	@Email nvarchar(50)
as
select * from UserAccount
where Email = @Email
GO

create proc getAccount
	@Email nvarchar(50),
	@Pswd nvarchar(50)
as
select * from UserAccount
where Email = @Email and Pswd = @Pswd
GO

------------CATEGORY-----------
create procedure createCategory
	@Title nvarchar(50),
	@PicturePath nvarchar(max),
	@IDCategory int out
as
insert into Category(Title, PicturePath)
values(@Title, @PicturePath)
set @IDCategory = SCOPE_IDENTITY()
GO

create procedure doesCategoryExist
	@Title nvarchar(50)
as
select*from Category
where Title = @Title
GO

create procedure getCategories
as
select*from Category
GO

create proc deleteCategory
	@IDCategory int
as
delete from Product
where categoryID=@IDCategory
delete from Category
where IDCategory = @IDCategory
GO

create proc getCategory
	@IDCategory int
as
select*from Category
where IDCategory = @IDCategory
GO

create proc updateCategory
	@IDCategory int,
	@Title nvarchar(50),
	@PicturePath nvarchar(max)
as
update Category
set Title = @Title, PicturePath = @PicturePath
where IDCategory = @IDCategory
GO

------------PRODUCT-----------
create procedure createProduct
	@Title nvarchar(50),
	@Descr nvarchar(250),
	@Price float,
	@PicturePath nvarchar(max),
	@CategoryID int,
	@IDProduct int out
as 
insert into Product(Title, Descr, Price, PicturePath, CategoryID)
values (@Title, @Descr, @Price, @PicturePath, @CategoryID)
set @IDProduct = SCOPE_IDENTITY()
GO

create procedure getProducts
as
select*from Product
GO

create procedure doesProductExist
	@Title nvarchar(50)
as
select*from Product
where Title = @Title
GO

create proc deleteProduct
	@IDProduct int
as
delete from Product
where IDProduct = @IDProduct
GO

create proc getProduct
	@IDProduct int
as
select * from Product
where IDProduct = @IDProduct
GO

create proc updateProduct
	@IDProduct int,
	@Title nvarchar(50),
	@Descr nvarchar(250),
	@Price float,
	@PicturePath nvarchar(max),
	@CategoryID int
as
update Product
set Title = @Title, Descr = @Descr, PicturePath = @PicturePath, Price = @Price , CategoryID = @CategoryID
where IDProduct = @IDProduct
GO

create proc getProductsByCategory
	@IDCategory int
as
select * from Product
where categoryID = @IDCategory
GO

------------LOGIN HISTORY-----------
create proc getLoginHistory
as
select*from LoginHistory
go

create proc createLoginHistory
	@LoginDate datetime,
	@IPAddress nvarchar(50),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(50),
	@IDLoginHistory int out
as
insert into LoginHistory(LoginDate, IPAddress, FirstName, LastName, Email)
values(@LoginDate, @IPAddress, @FirstName, @LastName, @Email)
set @IDLoginHistory = SCOPE_IDENTITY()
go

------------PAYMENT HISTORY-----------
create proc getPaymentHistoryADMIN
as
select*from PaymentHistory
go

create proc getPaymentHistoryUSER
	@IDUserAccount int
as
select*from PaymentHistory
inner join UserAccount on PaymentHistory.UserAccountID = UserAccount.IDUserAccount
where IDUserAccount = @IDUserAccount
go

create proc createPaymentHistory
	@PaymentType nvarchar(50),
	@UserAccountID int,
	@Items nvarchar(max),
	@PaymentDate datetime ,
	@IDPaymentHistory int out
as
insert into PaymentHistory(PaymentType, UserAccountID, Items, PaymentDate)
values(@PaymentType, @UserAccountID, @Items, @PaymentDate)
set @IDPaymentHistory = SCOPE_IDENTITY()
go