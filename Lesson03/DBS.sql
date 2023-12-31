CREATE DATABASE DBS
ON
(
    NAME = DBS_DATA,
    FILENAME = 'D:\00.DATA\DBS.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5
)
LOG ON
(
    NAME = LAB02_log,
    FILENAME = 'D:\00.DATA\DBS_log.ldf',
    SIZE = 5MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 5MB
);
GO

USE DBS
GO

CREATE TABLE CATEGORY
(
	ID BIGINT CONSTRAINT PK_CATEGORY PRIMARY KEY,
	NAME NVARCHAR(500) NOT NULL,
	NOTES NTEXT NOT NULL,
	ICON NVARCHAR(250) NOT NULL,
	IDPARENT BIGINT NOT NULL,
	SLUG NVARCHAR(160) NOT NULL,
	META_TITLE NVARCHAR(100) NOT NULL,
	META_KEYWORD NVARCHAR(500) NOT NULL,
	META_DESCRIPTION NVARCHAR(500) NOT NULL,
	CREATE_DATE DATETIME DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME DEFAULT(GETDATE()),
	CREATE_BY BIGINT NULL,
	UPDATE_BY BIGINT NULL,
	ISDELETE TINYINT DEFAULT(0),
	ISACTIVE TINYINT DEFAULT(1)
)
GO

CREATE TABLE PRODUCT(
	ID BIGINT CONSTRAINT PK_PRODUCT PRIMARY KEY,
	NAME NVARCHAR(500) NOT NULL,
	DESCRIPTION NTEXT NOT NULL,
	NOTES NTEXT NOT NULL,
	IMAGE NVARCHAR(550) NOT NULL,
	IDCATEGORY BIGINT CONSTRAINT FK_PRODUCT_CATEGORY_IDCATEGORY FOREIGN KEY(IDCATEGORY) REFERENCES CATEGORY(ID),
	CONTENTS NTEXT NOT NULL,
	PRICE DECIMAL CONSTRAINT DF_PRICE DEFAULT(0),
	QUANTITY INT CONSTRAINT DF_QUANTITY DEFAULT(1),
	SLUG NVARCHAR(160) NOT NULL,
	META_TITLE NVARCHAR(100) NOT NULL,
	META_KEYWORD NVARCHAR(500) NOT NULL,
	META_DESCRIPTION NVARCHAR(500) NOT NULL,
	CREATE_DATE DATETIME CONSTRAINT DF_CREATE_DATE DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME CONSTRAINT DF_UPDATE_DATE DEFAULT(GETDATE()),
	CREATE_BY BIGINT NULL,
	UPDATE_BY BIGINT NULL,
	ISDELETE TINYINT CONSTRAINT DF_ISDELETE DEFAULT(0),
	ISACTIVE TINYINT CONSTRAINT DF_ISACTIVE DEFAULT(1)
)

GO
CREATE TABLE CONFIGURATIONS(
	ID BIGINT CONSTRAINT PK_CONFIGURATIONS PRIMARY KEY,
	NAME NVARCHAR(500) NOT NULL,
	NOTES NTEXT NOT NULL,
	ISDELETE TINYINT CONSTRAINT DF_ISDELETE DEFAULT(0),
	ISACTIVE TINYINT CONSTRAINT DF_ISACTIVE DEFAULT(1)
)

GO
CREATE TABLE PRODUCT_CONFIG(
	ID BIGINT CONSTRAINT PF_PRODUCT_CONFIG PRIMARY KEY,
	IDPRODUCT BIGINT CONSTRAINT FK_PRODUCT_CONFIG_PRODUCT_IDPRODUCT FOREIGN KEY(IDPRODUCT) REFERENCES PRODUCT(ID),
	IDCONFIG BIGINT CONSTRAINT FK_PRODUCT_CONFIG_CONFIGURATIONS_IDCONFIG FOREIGN KEY(IDCONFIG) REFERENCES CONFIGURATIONS(ID),
	VALUE NTEXT NOT NULL
)
GO
CREATE TABLE PRODUCT_IMAGES(
	ID BIGINT CONSTRAINT PF_PRODUCT_IMAGES  PRIMARY KEY,
	NAME NVARCHAR(250) NOT NULL,
	URLIMAGE NVARCHAR(250) NOT NULL,
	IDPRODUCT BIGINT CONSTRAINT PF_PRODUCT_IMAGES_PRODUCT_IDPRODUCT FOREIGN KEY(IDPRODUCT) REFERENCES PRODUCT(ID)
)

--CHUA HOAN THIEN
CREATE TABLE NEWS_CATEGORY
(
	ID BIGINT CONSTRAINT PF_NEWS_CATEGORY PRIMARY KEY,
	NAME NVARCHAR(500) NOT NULL,
	NOTES NTEXT NOT NULL,
	ICON NVARCHAR(250) NOT NULL,
	IDPARENT BIGINT NOT NULL,
	SLUG NVARCHAR(160) NOT NULL,
	META_TITLE NVARCHAR(100) NOT NULL,
	META_KEYWORD NVARCHAR(500) NOT NULL,
	META_DESCRIPTION NVARCHAR(500) NOT NULL,
	CREATE_DATE DATETIME DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME DEFAULT(GETDATE()),
	CREATE_BY BIGINT NULL,
	UPDATE_BY BIGINT NULL,
	ISDELETE TINYINT DEFAULT(0),
	ISACTIVE TINYINT DEFAULT(1)
)
GO
CREATE TABLE NEWS_CUSTOMER
(
	ID BIGINT PRIMARY KEY,
	NAME NVARCHAR(250) NOT NULL,
	USERNAME NVARCHAR(50) NOT NULL,
	PASSWORD NVARCHAR(32) NOT NULL,
	ADDRESS NVARCHAR(500)  NOT NULL,
	EMAIL NVARCHAR(150)  NOT NULL,
	PHONE NVARCHAR(50)  NOT NULL,
	AVATAR NVARCHAR(250)  NOT NULL,
	CREATE_DATE DATETIME DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME DEFAULT(GETDATE()),
	CREATE_BY BIGINT NULL,
	UPDATE_BY BIGINT NULL,
	ISDELETE TINYINT DEFAULT(0),
	ISACTIVE TINYINT DEFAULT(1)
)
GO
CREATE TABLE ORDERS
(
	ID BIGINT PRIMARY KEY,
	IDORDERS CHAR(10),
	ORDERS_DATE DATETIME NOT NULL,
	IDCUSTOMER BIGINT,
	IDPAYMENT BIGINT,
	TOTAL_MONEY DECIMAL,
	NOTES NTEXT,
	NAME_RECIVER NVARCHAR(250) NOT NULL,
	ADDRESS NVARCHAR(500)  NOT NULL,
	EMAIL NVARCHAR(150)  NOT NULL,
	PHONE NVARCHAR(50)  NOT NULL,
	ISDELETE TINYINT DEFAULT(0),
	ISACTIVE TINYINT DEFAULT(1)
)
GO

CREATE TABLE ORDERS_DETAILS
(
	ID BIGINT PRIMARY KEY,
	IDORD BIGINT,
	PRICE DECIMAL,
	QTY  INT, 
	TOTAL DECIMAL,
	RETURN_QTY  INT
)
GO
CREATE TABLE NEWS
(
	ID BIGINT PRIMARY KEY,
	NAME NVARCHAR(500) NOT NULL,
	DESCRIPTION NTEXT NOT NULL,
	IMAGE NVARCHAR(550) NOT NULL,
	IDNEWSCATEGORY BIGINT FOREIGN KEY(IDNEWSCATEGORY) REFERENCES NEWS_CATEGORY(ID),
	CONTENTS NTEXT NOT NULL,
	SLUG NVARCHAR(160) NOT NULL,
	META_TITLE NVARCHAR(100) NOT NULL,
	META_KEYWORD NVARCHAR(500) NOT NULL,
	META_DESCRIPTION NVARCHAR(500) NOT NULL,
	CREATE_DATE DATETIME DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME DEFAULT(GETDATE()),
	CREATE_BY BIGINT NULL,
	UPDATE_BY BIGINT NULL,
	ISDELETE TINYINT DEFAULT(0),
	ISACTIVE TINYINT DEFAULT(1)
)
GO
CREATE TABLE PAYMENT_METHOD
(
	ID BIGINT PRIMARY KEY,
	NAME NVARCHAR(250),	
	NOTES NTEXT,
	CREATE_DATE DATETIME DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME DEFAULT(GETDATE()),
	ISDELETE TINYINT ,
	ISACTIVE TINYINT 
)
GO

CREATE TABLE ORDERS_PAYMENT
(
	ID BIGINT PRIMARY KEY,
	IDORD BIGINT,
	IDPAYMENT BIGINT,
	TOTAL DECIMAL,
	NOTES NTEXT,
	ISACTIVE TINYINT
)
GO

CREATE TABLE TRANPORT_METHOD
(
	ID BIGINT PRIMARY KEY,
	NAME NVARCHAR(250),
	NOTES NTEXT,
	CREATE_DATE DATETIME DEFAULT(GETDATE()),
	UPDATE_DATE DATETIME DEFAULT(GETDATE()),
	ISDELETE TINYINT,
	ISACTIVE TINYINT 
)
GO

CREATE TABLE ORDERS_TRANPORT
(
	ID BIGINT PRIMARY KEY,
	IDORD BIGINT,
	IDTRANPORT BIGINT,
	TOTAL DECIMAL,
	NOTES NTEXT,
	ISACTIVE TINYINT 
)
GO