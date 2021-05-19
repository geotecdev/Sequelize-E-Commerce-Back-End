
DROP DATABASE IF EXISTS ecommerce_db;

CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE Categories (
    id INTEGER NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)    
);

CREATE TABLE  Tags (
    id INTEGER NOT NULL AUTO_INCREMENT,
    tag_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Products (
    id INTEGER NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL,
    category_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE
);

CREATE TABLE ProductTags (
    id INTEGER NOT NULL AUTO_INCREMENT,
    product_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tags(id) ON DELETE CASCADE
);


-- INSERT INTO Categories (category_name)
-- VALUES
-- 	('Shirts'),
-- 	('Shorts'),
-- 	('Music'),
-- 	('Hats'),
-- 	('Shoes');

-- INSERT INTO Tags (tag_name)
-- VALUES
-- 	('rock music'),
-- 	('pop music'),
-- 	('blue'),
-- 	('red'),
-- 	('green'),
-- 	('white'),
-- 	('gold'),
-- 	('pop culture');

-- INSERT INTO Products (product_name, price, stock, category_id)
-- VALUES
-- 	('Plain T-Shirt', 14.99, 14, 1),
-- 	('Running Sneakers', 90, 25, 5),
-- 	('Branded Baseball Hat', 22.99, 12, 4),
-- 	('Top 40 Music Compilation Vinyl Record', 12.99, 50, 3),
-- 	('Cargo Shorts', 29.99, 22, 2);

-- INSERT INTO ProductTags (product_id, tag_id)
-- VALUES
-- 	(1, 6),
-- 	(1, 7),
-- 	(1, 8),
-- 	(2, 6),
-- 	(3, 1),
-- 	(3, 3),
-- 	(3, 4),
-- 	(3, 5),
-- 	(4, 1),
-- 	(4, 2),
-- 	(4, 8),
-- 	(5, 3);
