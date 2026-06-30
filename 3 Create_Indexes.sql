USE CRM_Management_System;
GO

--------------------------------------------------
-- USERS
--------------------------------------------------

CREATE INDEX IX_Users_DepartmentID
ON Users(DepartmentID);

CREATE INDEX IX_Users_ManagerID
ON Users(ManagerID);

--------------------------------------------------
-- ACCOUNTS
--------------------------------------------------

CREATE INDEX IX_Accounts_AssignedSalesRepID
ON Accounts(AssignedSalesRepID);

CREATE INDEX IX_Accounts_Industry
ON Accounts(Industry);

CREATE INDEX IX_Accounts_Country
ON Accounts(Country);

--------------------------------------------------
-- CONTACTS
--------------------------------------------------

CREATE INDEX IX_Contacts_AccountID
ON Contacts(AccountID);

--------------------------------------------------
-- CAMPAIGNS
--------------------------------------------------

CREATE INDEX IX_Campaigns_Status
ON Campaigns(Status);

--------------------------------------------------
-- LEADS
--------------------------------------------------

CREATE INDEX IX_Leads_AccountID
ON Leads(AccountID);

CREATE INDEX IX_Leads_CampaignID
ON Leads(CampaignID);

CREATE INDEX IX_Leads_AssignedSalesRepID
ON Leads(AssignedSalesRepID);

CREATE INDEX IX_Leads_Status
ON Leads(Status);

--------------------------------------------------
-- OPPORTUNITIES
--------------------------------------------------

CREATE INDEX IX_Opportunities_LeadID
ON Opportunities(LeadID);

CREATE INDEX IX_Opportunities_Stage
ON Opportunities(Stage);

--------------------------------------------------
-- PRODUCTS
--------------------------------------------------

CREATE INDEX IX_Products_Category
ON Products(Category);

--------------------------------------------------
-- QUOTES
--------------------------------------------------

CREATE INDEX IX_Quotes_OpportunityID
ON Quotes(OpportunityID);

CREATE INDEX IX_Quotes_Status
ON Quotes(Status);

--------------------------------------------------
-- QUOTE ITEMS
--------------------------------------------------

CREATE INDEX IX_QuoteItems_QuoteID
ON Quote_Items(QuoteID);

CREATE INDEX IX_QuoteItems_ProductID
ON Quote_Items(ProductID);

--------------------------------------------------
-- ORDERS
--------------------------------------------------

CREATE INDEX IX_Orders_AccountID
ON Orders(AccountID);

CREATE INDEX IX_Orders_OrderDate
ON Orders(OrderDate);

--------------------------------------------------
-- INVOICES
--------------------------------------------------

CREATE INDEX IX_Invoices_OrderID
ON Invoices(OrderID);

CREATE INDEX IX_Invoices_InvoiceDate
ON Invoices(InvoiceDate);

--------------------------------------------------
-- PAYMENTS
--------------------------------------------------

CREATE INDEX IX_Payments_InvoiceID
ON Payments(InvoiceID);

CREATE INDEX IX_Payments_Status
ON Payments(PaymentStatus);

--------------------------------------------------
-- ACTIVITIES
--------------------------------------------------

CREATE INDEX IX_Activities_UserID
ON Activities(UserID);

CREATE INDEX IX_Activities_LeadID
ON Activities(LeadID);

--------------------------------------------------
-- SUPPORT TICKETS
--------------------------------------------------

CREATE INDEX IX_SupportTickets_AccountID
ON Support_Tickets(AccountID);

CREATE INDEX IX_SupportTickets_Status
ON Support_Tickets(Status);