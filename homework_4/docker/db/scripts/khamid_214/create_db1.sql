CREATE TABLE Reader (
    reader_number SERIAL PRIMARY KEY,
    name VARCHAR,
    surname VARCHAR,
    birthdate DATE,
    address VARCHAR
);

CREATE TABLE Publisher (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    address VARCHAR
);

CREATE TABLE Category (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    parent_category_id INTEGER NULL REFERENCES Category(id)
);

CREATE TABLE Book (
    isbn VARCHAR PRIMARY KEY,
    category_id INTEGER REFERENCES Category(id),
    publisher_id INTEGER REFERENCES Publisher(id),
    name VARCHAR,
    author VARCHAR,
    year INTEGER,
    pages_amount INTEGER
);

CREATE TABLE Copy (
    copy_number INTEGER,
    isbn VARCHAR REFERENCES Book(isbn),
    shelf_position VARCHAR,
    PRIMARY KEY (copy_number, isbn)
);

CREATE TABLE Borrow (
    id SERIAL PRIMARY KEY,
    reader_number INTEGER REFERENCES Reader(reader_number),
    copy_number INTEGER,
    book_isbn VARCHAR,
    return_date DATE,
    FOREIGN KEY (copy_number, book_isbn) REFERENCES Copy(copy_number, isbn)
);
