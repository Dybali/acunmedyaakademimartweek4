SELECT * FROM Books;

SELECT * 
FROM Books
JOIN Categories ON Books.category_id = Categories.id
WHERE Categories.name = 'Bilgisayar Bilimleri';

SELECT * 
FROM Books
WHERE publish_year >= 2020;

SELECT Books.title, Categories.name AS category
FROM Books
JOIN Categories ON Books.category_id = Categories.id;


SELECT Users.first_name, Users.last_name, Books.title
FROM BorrowedBooks
JOIN Users ON BorrowedBooks.user_id = Users.id
JOIN Books ON BorrowedBooks.book_id = Books.id;

CREATE TABLE Authors (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO Authors (id, name) VALUES
(1, 'Ahmet Yılmaz'),
(2, 'Ayşe Demir'),
(3, 'Zeynep Kaya');

CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 1); 

SELECT Books.title, Authors.name AS author, Books.publish_year
FROM Books
JOIN BookAuthors ON Books.id = BookAuthors.book_id
JOIN Authors ON BookAuthors.author_id = Authors.id;

SELECT Users.first_name, Users.last_name, Books.title, BorrowedBooks.borrow_date
FROM BorrowedBooks
JOIN Users ON BorrowedBooks.user_id = Users.id
JOIN Books ON BorrowedBooks.book_id = Books.id
WHERE BorrowedBooks.return_date IS NULL;

SELECT Categories.name AS category, COUNT(Books.id) AS book_count
FROM Categories
LEFT JOIN Books ON Books.category_id = Categories.id
GROUP BY Categories.name;

SELECT Users.first_name, Users.last_name, COUNT(BorrowedBooks.book_id) AS total_borrowed
FROM BorrowedBooks
JOIN Users ON BorrowedBooks.user_id = Users.id
GROUP BY Users.id, Users.first_name, Users.last_name
ORDER BY total_borrowed DESC;








