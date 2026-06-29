----- 1. Create Database

CREATE DATABASE CRM_Management_System;
GO

USE CRM_Management_System;
GO


----- 2. Create Tables

--------------------------------------------------
-- 1. Departments
--------------------------------------------------

CREATE TABLE Departments
(
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    AnnualBudget BIGINT
);

--------------------------------------------------
-- 2. Users
--------------------------------------------------

CREATE TABLE Users
(
    UserID VARCHAR(10) PRIMARY KEY,

    DepartmentID VARCHAR(10),

    FirstName VARCHAR(50),

    LastName VARCHAR(50),

    FullName VARCHAR(120),

    Email VARCHAR(150),

    Phone VARCHAR(20),

    JobTitle VARCHAR(100),

    Salary DECIMAL(12,2),

    HireDate DATE,

    Status VARCHAR(20),

    ManagerID VARCHAR(10)
);

--------------------------------------------------
-- 3. Accounts
--------------------------------------------------

CREATE TABLE Accounts
(
    AccountID VARCHAR(10) PRIMARY KEY,

    AccountName VARCHAR(150),

    Industry VARCHAR(100),

    Country VARCHAR(50),

    City VARCHAR(50),

    Employees INT,

    AnnualRevenue BIGINT,

    AssignedSalesRepID VARCHAR(10),

    CreatedDate DATE,

    Status VARCHAR(20)
);


--------------------------------------------------
-- 4. Contacts
--------------------------------------------------

CREATE TABLE Contacts
(
    ContactID VARCHAR(15) PRIMARY KEY,

    AccountID VARCHAR(10),

    FirstName VARCHAR(50),

    LastName VARCHAR(50),

    FullName VARCHAR(120),

    Department VARCHAR(50),

    JobTitle VARCHAR(100),

    Email VARCHAR(150),

    Phone VARCHAR(20),

    PrimaryContact VARCHAR(10),

    Status VARCHAR(20)
);

--------------------------------------------------
-- 5. Campaigns
--------------------------------------------------

CREATE TABLE Campaigns
(
    CampaignID VARCHAR(10) PRIMARY KEY,

    CampaignName VARCHAR(150),

    CampaignType VARCHAR(50),

    TargetIndustry VARCHAR(100),

    Budget DECIMAL(18,2),

    ExpectedLeads INT,

    ExpectedRevenue DECIMAL(18,2),

    StartDate DATE,

    EndDate DATE,

    Status VARCHAR(20)
);

--------------------------------------------------
-- 6. Leads
--------------------------------------------------

CREATE TABLE Leads
(
    LeadID VARCHAR(15) PRIMARY KEY,

    AccountID VARCHAR(10),

    CampaignID VARCHAR(10),

    AssignedSalesRepID VARCHAR(10),

    LeadSource VARCHAR(50),

    LeadScore INT,

    Status VARCHAR(30),

    EstimatedDealValue DECIMAL(18,2),

    CreatedDate DATE
);


--------------------------------------------------
-- 7. Opportunities
--------------------------------------------------

CREATE TABLE Opportunities
(
    OpportunityID VARCHAR(15) PRIMARY KEY,

    LeadID VARCHAR(15),

    AccountID VARCHAR(10),

    AssignedSalesRepID VARCHAR(10),

    Stage VARCHAR(50),

    Probability INT,

    OpportunityAmount DECIMAL(18,2),

    CreatedDate DATE,

    ExpectedCloseDate DATE
);

--------------------------------------------------
-- 8. Products
--------------------------------------------------

CREATE TABLE Products
(
    ProductID VARCHAR(10) PRIMARY KEY,

    ProductName VARCHAR(150),

    Category VARCHAR(50),

    UnitPrice DECIMAL(18,2),

    UnitCost DECIMAL(18,2),

    ProfitPerUnit DECIMAL(18,2),

    Status VARCHAR(20)
);

--------------------------------------------------
-- 9. Quotes
--------------------------------------------------

CREATE TABLE Quotes
(
    QuoteID VARCHAR(15) PRIMARY KEY,

    OpportunityID VARCHAR(15),

    AccountID VARCHAR(10),

    QuoteDate DATE,

    ExpiryDate DATE,

    QuoteAmount DECIMAL(18,2),

    DiscountPercent DECIMAL(5,2),

    FinalAmount DECIMAL(18,2),

    Status VARCHAR(20)
);

--------------------------------------------------
-- 10. Quote_Items
--------------------------------------------------

CREATE TABLE Quote_Items
(
    QuoteItemID VARCHAR(15) PRIMARY KEY,

    QuoteID VARCHAR(15),

    ProductID VARCHAR(10),

    Quantity INT,

    UnitPrice DECIMAL(18,2),

    DiscountPercent DECIMAL(5,2),

    DiscountAmount DECIMAL(18,2),

    LineTotal DECIMAL(18,2)
);

--------------------------------------------------
-- 11. Orders
--------------------------------------------------

CREATE TABLE Orders
(
    OrderID VARCHAR(15) PRIMARY KEY,

    QuoteID VARCHAR(15),

    AccountID VARCHAR(10),

    OrderDate DATE,

    OrderAmount DECIMAL(18,2),

    ShippingMethod VARCHAR(50),

    OrderStatus VARCHAR(30)
);

--------------------------------------------------
-- 12. Invoices
--------------------------------------------------

CREATE TABLE Invoices
(
    InvoiceID VARCHAR(15) PRIMARY KEY,

    OrderID VARCHAR(15),

    InvoiceDate DATE,

    DueDate DATE,

    SubTotal DECIMAL(18,2),

    Tax DECIMAL(18,2),

    TotalAmount DECIMAL(18,2),

    PaymentTerms VARCHAR(30),

    InvoiceStatus VARCHAR(30)
);

--------------------------------------------------
-- 13. Payments
--------------------------------------------------

CREATE TABLE Payments
(
    PaymentID VARCHAR(15) PRIMARY KEY,

    InvoiceID VARCHAR(15),

    PaymentDate DATE,

    PaymentMethod VARCHAR(50),

    AmountPaid DECIMAL(18,2),

    BalanceAmount DECIMAL(18,2),

    PaymentStatus VARCHAR(20)
);

--------------------------------------------------
-- 14. Activities
--------------------------------------------------

CREATE TABLE Activities
(
    ActivityID VARCHAR(15) PRIMARY KEY,

    LeadID VARCHAR(15),

    OpportunityID VARCHAR(15) NULL,

    AccountID VARCHAR(10),

    UserID VARCHAR(10),

    ActivityType VARCHAR(50),

    ActivityDate DATE,

    Status VARCHAR(20)
);

--------------------------------------------------
-- 15. Support_Tickets
--------------------------------------------------

CREATE TABLE Support_Tickets
(
    TicketID VARCHAR(15) PRIMARY KEY,

    AccountID VARCHAR(10),

    ContactID VARCHAR(15),

    AssignedUserID VARCHAR(10),

    Category VARCHAR(100),

    Priority VARCHAR(20),

    Status VARCHAR(20),

    CreatedDate DATE,

    ResolvedDate DATE NULL
);