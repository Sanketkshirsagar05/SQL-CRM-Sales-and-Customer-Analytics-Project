USE CRM_Management_System;
GO

--------------------------------------------------
-- USERS
--------------------------------------------------

ALTER TABLE Users
ADD CONSTRAINT FK_Users_Departments
FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);

ALTER TABLE Users
ADD CONSTRAINT FK_Users_Manager
FOREIGN KEY (ManagerID)
REFERENCES Users(UserID);

--------------------------------------------------
-- ACCOUNTS
--------------------------------------------------

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Users
FOREIGN KEY (AssignedSalesRepID)
REFERENCES Users(UserID);

--------------------------------------------------
-- CONTACTS
--------------------------------------------------

ALTER TABLE Contacts
ADD CONSTRAINT FK_Contacts_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

--------------------------------------------------
-- LEADS
--------------------------------------------------

ALTER TABLE Leads
ADD CONSTRAINT FK_Leads_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Leads
ADD CONSTRAINT FK_Leads_Campaigns
FOREIGN KEY (CampaignID)
REFERENCES Campaigns(CampaignID);

ALTER TABLE Leads
ADD CONSTRAINT FK_Leads_Users
FOREIGN KEY (AssignedSalesRepID)
REFERENCES Users(UserID);

--------------------------------------------------
-- OPPORTUNITIES
--------------------------------------------------

ALTER TABLE Opportunities
ADD CONSTRAINT FK_Opportunities_Leads
FOREIGN KEY (LeadID)
REFERENCES Leads(LeadID);

ALTER TABLE Opportunities
ADD CONSTRAINT FK_Opportunities_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Opportunities
ADD CONSTRAINT FK_Opportunities_Users
FOREIGN KEY (AssignedSalesRepID)
REFERENCES Users(UserID);

--------------------------------------------------
-- QUOTES
--------------------------------------------------

ALTER TABLE Quotes
ADD CONSTRAINT FK_Quotes_Opportunities
FOREIGN KEY (OpportunityID)
REFERENCES Opportunities(OpportunityID);

ALTER TABLE Quotes
ADD CONSTRAINT FK_Quotes_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

--------------------------------------------------
-- QUOTE ITEMS
--------------------------------------------------

ALTER TABLE Quote_Items
ADD CONSTRAINT FK_QuoteItems_Quotes
FOREIGN KEY (QuoteID)
REFERENCES Quotes(QuoteID);

ALTER TABLE Quote_Items
ADD CONSTRAINT FK_QuoteItems_Products
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID);

--------------------------------------------------
-- ORDERS
--------------------------------------------------

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Quotes
FOREIGN KEY (QuoteID)
REFERENCES Quotes(QuoteID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

--------------------------------------------------
-- INVOICES
--------------------------------------------------

ALTER TABLE Invoices
ADD CONSTRAINT FK_Invoices_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID);

--------------------------------------------------
-- PAYMENTS
--------------------------------------------------

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Invoices
FOREIGN KEY (InvoiceID)
REFERENCES Invoices(InvoiceID);

--------------------------------------------------
-- ACTIVITIES
--------------------------------------------------

ALTER TABLE Activities
ADD CONSTRAINT FK_Activities_Leads
FOREIGN KEY (LeadID)
REFERENCES Leads(LeadID);

ALTER TABLE Activities
ADD CONSTRAINT FK_Activities_Opportunities
FOREIGN KEY (OpportunityID)
REFERENCES Opportunities(OpportunityID);

ALTER TABLE Activities
ADD CONSTRAINT FK_Activities_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Activities
ADD CONSTRAINT FK_Activities_Users
FOREIGN KEY (UserID)
REFERENCES Users(UserID);

--------------------------------------------------
-- SUPPORT TICKETS
--------------------------------------------------

ALTER TABLE Support_Tickets
ADD CONSTRAINT FK_Tickets_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Support_Tickets
ADD CONSTRAINT FK_Tickets_Contacts
FOREIGN KEY (ContactID)
REFERENCES Contacts(ContactID);

ALTER TABLE Support_Tickets
ADD CONSTRAINT FK_Tickets_Users
FOREIGN KEY (AssignedUserID)
REFERENCES Users(UserID);