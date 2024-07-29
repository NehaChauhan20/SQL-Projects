INSERT INTO  books_db(book_id,book_title,book_publisher_name) VALUES
(111 , 'Alice Adventures in Wonderland' , 'Jaico Publishing House'),
(112 , 'Treasure Island' , 'Westland Publications'),
(113 , 'The Scarlet Letter' , 'Penguin Random House India'),
(114 , 'A Tale of Two Cities' , 'Hachette India'),
(115 , 'A Christmas Carol' , 'Hachette India'),
(116 , 'Harry Potter and the Sorcerers Stone' , 'Become Shakespeare'),
(117 , 'The Red Badge of Courage' , 'Fingerprint Publishing'),
(118 , 'The Stranger' , 'Petals Publishers'),
(119 , 'Harry Potter and the Chamber of Secrets' , 'Become Shakespeare'),
(120 , 'Harry Potter and the Prisoner of Azkaban' , 'Become Shakespeare');


INSERT INTO books_publisher(publisher_name,publisher_address,publisher_mobile) VALUES 
('Jaico Publishing House' , 'Mumbai' , 9092348590 ),
('Westland Publications' , 'Madras' , 7687504090),
('Penguin Random House India' , 'Gurgaon' , 9087654689),
('Hachette India' , 'Gurgaon' , 7899065669 ),
('Become Shakespeare' , 'Bombay' , 8098985767),
('Petals Publishers' , 'Ludhiana' , 9087123498),
('Fingerprint Publishing' , 'Delhi' , 7890459010);


INSERT INTO book_authors(author_id,book_id,author_name) VALUES 
(1 , 111 , 'Lewis Carroll'),
(2 , 112 , 'Robert Louis Stevenson'),
(3 , 113 , 'Nathaniel Hawthorne'),
(4 , 114 , 'Charles Dickens'),
(5 , 115 , 'Charles Dickens'),
(6 , 116 , 'J.K. Rowling'),
(7 , 117 , 'Stephen Crane'),
(8 , 118 , 'Albert Camus'),
(9 , 119 , 'J.K. Rowling'),
(10 , 120 , 'J.K. Rowling');


INSERT INTO library_branch(library_branch_id,library_branch_name,library_branch_address) VALUES
(11 ,'Connemara Public Library','Egmore in Chennai, Tamil Nadu, India'),
(12 ,'Krishnadas Shama State Central Library',' Goa, India'),
(13 ,'The National Library of India' , 'West Bengal , India'),
(14 ,'Delhi Public Library','Indian Union Territory of Delhi, India'),
(15 , 'State Central Library' , 'Trivandrum Kerala, India');


INSERT INTO borrower(borrower_card_id,borrower_name,borrower_address) VALUES
(40 , 'Sahil' , 'Gujrat'),
(41 , 'Neha' , 'Delhi'),
(42 , 'Anisha' , 'Mumbai'),
(43 , 'Raj' , 'Mumbai'),
(44 , 'Nihal' , 'Bengal'),
(45 , 'Sameer' , 'Delhi'),
(46 , 'Karishma' , 'Mumbai');


INSERT INTO books_copies(book_id,branch_id,No_of_copies) VALUES
(111 , 11 , 5),
(112 , 12 , 5),
(113 , 13 , 6),
(114 , 14 , 5),
(115 , 15 , 7),
(116 , 12 , 10),
(117 , 13 , 8),
(118 , 14 , 12),
(119 , 11 , 25),
(120 , 15 , 20);


SELECT * FROM books_db;
SELECT * FROM books_publisher;
SELECT * FROM book_authors;
SELECT * FROM library_branch;
SELECT * FROM borrower;
SELECT * FROM books_copies;

SELECT * FROM books_db AS Books
LEFT JOIN book_authors AS Authors
ON Books.book_id = Authors.book_id
UNION
SELECT * FROM books_db AS Books
RIGHT JOIN book_authors AS Authors
ON Books.book_id = Authors.book_id;




