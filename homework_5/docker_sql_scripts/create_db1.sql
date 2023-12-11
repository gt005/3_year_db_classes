CREATE TABLE Reader (
    ID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Address VARCHAR(255),
    BirthDate DATE
);

CREATE TABLE Book (
    ISBN VARCHAR(255) PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    PagesNum INT,
    PubYear INT,
    PubName VARCHAR(255)
);

CREATE TABLE Publisher (
    PubName VARCHAR(255) PRIMARY KEY,
    PubAddress VARCHAR(255)
);

CREATE TABLE Category (
    CategoryName VARCHAR(255) PRIMARY KEY,
    ParentCat VARCHAR(255)
);

CREATE TABLE Copy (
    ISBN VARCHAR(255),
    CopyNumber INT,
    ShelfPosition VARCHAR(255),
    PRIMARY KEY (ISBN, CopyNumber),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Borrowing (
    ReaderNr INT,
    ISBN VARCHAR(255),
    CopyNumber INT,
    ReturnDate DATE,
    FOREIGN KEY (ReaderNr) REFERENCES Reader(ID),
    FOREIGN KEY (ISBN, CopyNumber) REFERENCES Copy(ISBN, CopyNumber)
);

CREATE TABLE BookCat (
    ISBN VARCHAR(255),
    CategoryName VARCHAR(255),
    PRIMARY KEY (ISBN, CategoryName),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (CategoryName) REFERENCES Category(CategoryName)
);

