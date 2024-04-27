create database Project3;
use Project3;

CREATE TABLE Student (
Student_ID VARCHAR(15),
Student_School VARCHAR(15),
Student_Program VARCHAR(15),
Student_GraduateYear DATE,
PRIMARY KEY(Student_ID)
);
INSERT INTO Student VALUES('12345','UBC','Math','2025-04-30');
INSERT INTO Student VALUES('16665','UCW','Science','2028-04-30');
INSERT INTO Student VALUES('14545','SFW','Math','2026-07-10');
INSERT INTO Student VALUES('16742','UBC','Business','2025-02-21');
INSERT INTO Student VALUES('12322','UCW','Finance','2025-09-22');

CREATE TABLE Faculty (
Faculty_ID VARCHAR(15),
Faculty_Department VARCHAR(100),
Faculty_HireDate DATE,
PRIMARY KEY(Faculty_ID)
);

INSERT INTO Faculty VALUES('66644','LIB','2020-01-30');
INSERT INTO Faculty VALUES('99222','LIB','2017-02-23');
INSERT INTO Faculty VALUES('99245','LIB','2022-01-21');
INSERT INTO Faculty VALUES('99253','LIB','2021-04-30');
INSERT INTO Faculty VALUES('99246','LIB','2015-06-30');

CREATE TABLE itemLimit (
User_Type CHAR(1),
itemLimit_Num INT,
PRIMARY KEY(User_Type)
);

INSERT INTO itemLimit VALUES('S','5');
INSERT INTO itemLimit VALUES('G','3');
INSERT INTO itemLimit VALUES('F','5');

CREATE TABLE Catalog (
Catalog_ID INT,
Catalog_Title VARCHAR(50),
Catalog_Author VARCHAR(50),
Catalog_Genre VARCHAR(50),
Catalog_PublicationDate INT,
Catalog_TotalCopies INT,
Catalog_TotalAvailable INT,
Catalog_TotalCheckout INT,
Catalog_TotalReserved INT,
Catalog_Status VARCHAR(11),
Book_Location VARCHAR(15),
PRIMARY KEY (Catalog_ID)
);

CREATE TABLE User (
User_ID INT,
User_FName VARCHAR(50),
User_LName VARCHAR(50),
User_Password VARCHAR(100),
User_Type CHAR(1),
Photo_ID VARCHAR(15),
User_Address VARCHAR(255),
User_Phone VARCHAR(15),
User_Status VARCHAR(20),
User_BooksOut INT,
User_OwingBalance DECIMAL(10,2),
Student_ID VARCHAR(15),
Faculty_ID VARCHAR(15),
User_dateCreated DATE,
PRIMARY KEY(User_ID),
FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID),
FOREIGN KEY (User_Type) REFERENCES itemLimit(User_Type)
);

CREATE TABLE Payment (
Payment_ID VARCHAR(10),
User_ID INT,
Payment_Amount DECIMAL(10,2),
Payment_Date DATE,
PRIMARY KEY (Payment_ID),
FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Holds (
Reservation_ID VARCHAR(10),
Catalog_ID INT,
User_ID INT,
Hold_Status CHAR(5), -- 'Q = In Queue','H = eld','C = Complete','E =Expired'
Hold_Location VARCHAR(20),
Hold_startDate DATE,
Hold_completeDate DATE,
PRIMARY KEY (Reservation_ID),
FOREIGN KEY (User_ID) REFERENCES User(User_ID),
FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID)
);

CREATE TABLE Transaction (
Transaction_ID VARCHAR(10),
User_ID INT,
Catalog_ID INT,
Transaction_Action VARCHAR(25),
Transaction_Date DATE,
Transaction_Location VARCHAR(20),
Transaction_CheckOutDate DATE,
Transaction_DuekBackDate DATE,
Transaction_CheckIntDate DATE,
PRIMARY KEY (Transaction_ID),

FOREIGN KEY (User_ID) REFERENCES User(User_ID),
FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID)
);

CREATE TABLE FineHistoy (
Transaction_ID VARCHAR(10),
User_ID INT,
Catalog_ID INT,
Fine_Amount DECIMAL(10,2),
PRIMARY KEY (User_ID),
FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)

);

CREATE TABLE Book (
    Catalog_ID INT,
    BookISBN VARCHAR(20),
    Title VARCHAR(200),
    Author VARCHAR(100),
    Year_Published DATE,
    Genre VARCHAR(50),
    Call_Number VARCHAR(50),
    PRIMARY KEY (BookISBN),
    FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID)
);

CREATE TABLE Audio (
    Catalog_ID INT,
    Item_ID VARCHAR(20),
    Media_Type VARCHAR(20),
    Title VARCHAR(200),
    Author VARCHAR(100),
    Year_Published DATE,
    Genre VARCHAR(50),
    Call_Number VARCHAR(50),
    PRIMARY KEY (Item_ID),
    FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID)
);

CREATE TABLE Video (
    Catalog_ID INT,
    Item_ID VARCHAR(20),
    Media_Type VARCHAR(20),
    Title VARCHAR(200),
    Author VARCHAR(100),
    Year_Published DATE,
    Genre VARCHAR(50),
    Call_Number VARCHAR(50),
    PRIMARY KEY (Item_ID),
    FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID)
);

-- Inserting sample data into the Student table
INSERT INTO Student VALUES('12323','UBC','Math','2025-04-30');
INSERT INTO Student VALUES('16465','UBC','Science','2028-04-30');

-- Inserting sample data into the Faculty table
INSERT INTO Faculty VALUES('66644','LIB','2020-01-30');
INSERT INTO Faculty VALUES('99222','LIB','2017-01-30');

-- Inserting sample data into the itemLimit table
INSERT INTO itemLimit VALUES('S',5);
INSERT INTO itemLimit VALUES('G',3);
INSERT INTO itemLimit VALUES('F',5);

-- Inserting sample data into the Catalog table
INSERT INTO Catalog VALUES(1,'The Great Gatsby','F. Scott Fitzgerald','Fiction',1925,10,7,3,0,'Available','Main Library');
INSERT INTO Catalog VALUES(2,'To Kill a Mockingbird','Harper Lee','Fiction',1960,8,5,3,0,'Available','Main Library');
INSERT INTO Catalog VALUES(3,'1984','George Orwell','Science Fiction',1949,6,4,2,0,'Available','Main Library');

-- Inserting sample data into the User table (students)
INSERT INTO User VALUES(1001,'John','Doe','password123','S',NULL,'123 Main St','123-456-7890','Active',2,0,NULL,NULL,'2022-01-01');
INSERT INTO User VALUES(1002,'Jane','Smith','letmein','S',NULL,'456 Oak Ave','987-654-3210','Active',1,0,NULL,NULL,'2022-01-15');

-- Inserting sample data into the User table (faculty)
INSERT INTO User VALUES(2001,'Prof','Johnson','facultyPass','F',NULL,'789 Elm St','111-222-3333','Active',3,0,NULL,NULL,'2022-02-01');
INSERT INTO User VALUES(2002,'Dr','Smith','faculty123','F',NULL,'321 Maple Ave','444-555-6666','Active',2,0,NULL,NULL,'2022-02-15');

-- Inserting sample data into the Payment table
INSERT INTO Payment VALUES('PAY001',1001,20.50,'2022-01-10');
INSERT INTO Payment VALUES('PAY002',1002,15.75,'2022-01-20');

-- Inserting sample data into the Holds table
INSERT INTO Holds VALUES('HOLD001',1,1001,'H','Main Library','2022-01-05',NULL);
INSERT INTO Holds VALUES('HOLD002',2,1002,'Q','Main Library','2022-01-15',NULL);



-- Inserting sample data into the Transaction table
INSERT INTO Transaction VALUES('TRANS001',1001,1,'Check Out','2022-01-05','Main Library','2022-01-05','2022-01-12','2022-01-13');
INSERT INTO Transaction VALUES('TRANS002',1002,2,'Check Out','2022-01-15','Main Library','2022-01-15','2022-01-22','2022-01-23');

-- Inserting sample data into the FineHistory table
INSERT INTO FineHistoy VALUES('TRANS001',1001,1,0.00);
INSERT INTO FineHistoy VALUES('TRANS002',1002,2,0.00);

-- Inserting sample data into the Book table
INSERT INTO Book VALUES(1,'9780743273565','The Great Gatsby','F. Scott Fitzgerald','1925-01-01','Fiction','PN1997 .G715 2003');

-- Inserting sample data into the Audio table
INSERT INTO Audio VALUES(2,'AUDIO001','CD','To Kill a Mockingbird','Harper Lee','1960-01-01','Fiction','PN1997 .T53 2006');

-- Inserting sample data into the Video table
INSERT INTO Video VALUES(3,'VIDEO001','DVD','1984','George Orwell','1949-01-01','Science Fiction','PN1997 .N56 2003');

