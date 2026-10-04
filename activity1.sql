
CREATE TABLE IF NOT EXISTS books (
        books_id       INTEGER PRIMARY KEY,
        title          TEXT NOT NULL,
        genre          TEXT NOT NULL,
        rating         REAL NOT NULL,
        pages          INTEGER NOT NULL,
        published_year INTEGER NOT NULL
);

INSERT INTO books  VALUES(1, 'The Great Gatsby', 'Fiction', 4.5, 180, 1925);
INSERT INTO books  VALUES(2, 'To Kill a Mockingbird', 'Fiction', 4.8, 281, 1960);
INSERT INTO books  VALUES(3, '1984', 'Dystopian', 4.7, 328, 1949);
INSERT INTO books  VALUES(4, 'Brave New World', 'Dystopian', 4.6, 268, 1932);
INSERT INTO books  VALUES(5, 'The Catcher in the Rye', 'Fiction', 4.0, 214, 1951);
INSERT INTO books  VALUES(6, 'The Hobbit', 'Fantasy', 4.9, 310, 1937);
INSERT INTO books  VALUES(7, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 4.8, 309, 1997);
INSERT INTO books  VALUES(8, 'The Lord of the Rings', 'Fantasy', 4.9, 1178, 1954);
SELECT * FROM books;

--part:2 :ORDER BY ---
SELECT title,rating FROM books ORDER BY rating DESC;
SELECT title,rating FROM books ORDER BY rating ASC;
SELECT title,genre,rating FROM books ORDER BY genre ASC,rating DESC;

--Part 3: LIMIT ---
SELECT title,rating FROM books ORDER BY rating DESC LIMIT 3;
SELECT title,published_year FROM books ORDER BY published_year ASC LIMIT 5;

--Part 4: GROUP BY ---
SELECT genre, COUNT(*) as book_count FROM books GROUP BY genre;

--total pages and average rating per genre
SELECT genre, SUM(pages) as total_pages, AVG(rating) as average_rating FROM
    books GROUP BY genre;

--Part 5: HAVING ---

--Genre that have more than two books
SELECT genre, COUNT(*) as book_count FROM books GROUP BY genre HAVING COUNT(*) > 2;
--Genre where the average rating is at least 8.5
SELECT genre, AVG(rating) as average_rating FROM books GROUP BY genre HAVING AVG(rating) >= 8.5;