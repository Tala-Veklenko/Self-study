USE book_store;

--create table
CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    category_book ENUM('fiction', 'testing', 'English'),
    reading_device ENUM('paperbook', 'desktop', 'kindle'),
    reading_status ENUM('will read', 'reading now', 'read')
);

--insert into
INSERT INTO books (id, title, author, category_book, reading_device, reading_status)
VALUES
(1, 'The Magic Mountain', 'Thomas Mann', 'fiction', 'kindle', 'will read'),
(2, 'Lessons Learned in Software Testing', 'Bret Pettichord', 'testing', 'desktop', 'will read'),
(3, 'Explore It!', 'Elisabeth Hendrickson', 'testing', 'kindle', 'will read'),
(4, 'A Practitioner's Guide to Software Test Design', 'Lee Copeland', 'testing', 'kindle', 'will read'),
(5, 'How Google Tests Software', 'Jason Joseph Arbon', 'testing', 'paperbook', 'will read'),
(6, 'Agile Testing', 'Lisa Crispin', 'testing', 'paperbook', 'will read'),
(7, 'The Old Man and the Sea', 'Ernest Hemingway', 'fiction', 'paperbook', 'will read'),
(8, 'Educated', 'Tara Westover', 'fiction', 'paperbook', 'reading now')
(9, 'The cut line', 'Carolina Pihelgas', 'fiction', 'paperbook', 'will read'),
(10, 'Girl, Interrupted', 'Susanna Kaysen', 'fiction', 'paperbook', 'will read');

--create employees table
CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100), 
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
); 


--update data

--drop column

