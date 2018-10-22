-- Start with DELETE statements to wipe out the data in the tables.
Delete FROM Computers;
Delete FROM Customers;
Delete FROM Department;
Delete FROM Employee Computer;
Delete FROM Employee Training;
Delete FROM Employee;
Delete FROM Orders;
Delete FROM PaymentType;
Delete FROM Product Categories;
Delete FROM Product Orders;
Delete FROM Products;
Delete FROM Training Programs;




-- Then DROP TABLE statements to remove the tables.
DROP TABLE Computers ;
DROP TABLE Customers ;
DROP TABLE Department ;
DROP TABLE Employee Computer;
DROP TABLE Employee Training;
DROP TABLE Employee ;
DROP TABLE Orders ;
DROP TABLE PaymentType ;
DROP TABLE Product Categories ;
DROP TABLE Product Orders ;
DROP TABLE Products ;
DROP TABLE Training Programs ;



-- Next should be your CREATE TABLE statements with the CONSTRAINT keywords for the foreign keys.
CREATE TABLE `Computers` (
	`ComputerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`PurchaseDate`	TEXT NOT NULL,
	`DecommissionDate`	TEXT NOT NULL,
	`IsBroken`	Boolean NOT NULL
);

CREATE TABLE `Customers` (
	`CustomerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`AccountCreateDate`	Date NOT NULL,
	`LastLoginDate`	Date NOT NULL
);

CREATE TABLE `Department` (
	`DepartmentId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`DeptName`	TEXT NOT NULL,
	`Budget`	INTEGER NOT NULL
);

CREATE TABLE `EmployeeComputer` (
	`EmployeeCompId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`JoiningDate`	date NOT NULL,
	`EndDate`	date NOT NULL,
	`ComputerId`	INTEGER NOT NULL,
	`EmployeeId`	INTEGER NOT NULL,
    CONSTRAINT FK_ComputerEmployeeComputer
	FOREIGN KEY(`ComputerId`) REFERENCES `Computers`(`ComputerId`),
        CONSTRAINT FK_EmployeeEmployeeComputer
FOREIGN KEY(`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
);

CREATE TABLE `EmployeeTraining` (
	`EmployeeTrainingId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`EmployeeId`	INTEGER NOT NULL,
	`TrainingId`	INTEGER NOT NULL,
        CONSTRAINT FK_TrainingEmployeeTraining FOREIGN KEY(`TrainingId`) REFERENCES `TrainingPrograms`(`TrainingId`),
            CONSTRAINT FK_EmployeeEmployeeTraining FOREIGN KEY(`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
);

CREATE TABLE `Employees` (
	`EmployeeId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`Title`	TEXT NOT NULL,
	`DepartmentId`	INTEGER NOT NULL,
    CONSTRAINT FK_DepartmentEmployee FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`)
);

CREATE TABLE `Orders` (
	`OrderId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`CustomerId`	INTEGER NOT NULL,
	`PaymentId`	INTEGER NOT NULL,
	CONSTRAINT FK_CustomerOrder FOREIGN KEY(`CustomerId`) REFERENCES `Customers`(`CustomerId`),
	CONSTRAINT FK_PaymentOrder FOREIGN KEY(`PaymentId`) REFERENCES `Payment Types`(`PaymentId`)
);

CREATE TABLE `Payment Types` (
	`PaymentId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Type`	TEXT NOT NULL,
	`AccountNumber`	TEXT NOT NULL,
	`Title`	TEXT NOT NULL,
	`CustomerId`	INTEGER NOT NULL,
	CONSTRAINT FK_CustomerPaymentType FOREIGN KEY(`CustomerId`) REFERENCES `Customers`(`CustomerId`)
);

CREATE TABLE `Product Categories` (
	`ProductCatId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`ProductName`	TEXT NOT NULL
);

CREATE TABLE `Product Orders` (
	`ProductOrderID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`ProductId`	INTEGER NOT NULL,
	`OrderId`	INTEGER NOT NULL,
	CONSTRAINT FK_OrderProductOrder FOREIGN KEY(`OrderId`) REFERENCES `Orders`(`OrderId`),
	CONSTRAINT FK_ProductProductorder FOREIGN KEY(`ProductId`) REFERENCES `Products`(`ProductId`)
);

CREATE TABLE `Products` (
	`ProductId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Title`	TEXT NOT NULL,
	`Description`	TEXT NOT NULL,
	`Price`	INTEGER NOT NULL,
	`Quantity`	INTEGER NOT NULL,
	`CustomerId`	INTEGER NOT NULL,
	`ProductCatId`	INTEGER NOT NULL,
	CONSTRAINT FK_ProductCatogoriesProduct FOREIGN KEY(`ProductCatId`) REFERENCES `Product Categories`(`ProductCatId`),
	CONSTRAINT FK_CustomerProduct FOREIGN KEY(`CustomerId`) REFERENCES `Customers`(`CustomerId`)
);

CREATE TABLE `TrainingPrograms` (
	`TrainingId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Name`	TEXT NOT NULL,
	`StartDate`	TEXT NOT NULL,
	`EndDate`	TEXT NOT NULL,
	`MaxAttendies`	INTEGER NOT NULL
);

