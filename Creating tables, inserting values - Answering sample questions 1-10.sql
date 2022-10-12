CREATE TABLE Company (
Cname varchar(255) PRIMARY KEY,
Stockprice decimal(15,2),
Country varchar(255)
);

CREATE TABLE Product (
Pname varchar(255) PRIMARY KEY,
Price decimal(15,2),
Category varchar(255),
Manufacturer varchar(255),
FOREIGN KEY (Manufacturer) REFERENCES Company(Cname)
);

CREATE TABLE Purchase (
id varchar(255) PRIMARY KEY,
product varchar(255) NOT NULL,
buyer varchar(255) NOT NULL,
FOREIGN KEY (product) REFERENCES Product(Pname)
);

INSERT INTO Company (Cname, Stockprice, Country)
VALUES 
('Google', '55', 'USA'),
('Microsoft', '100', 'USA' ),
('IBM', '60', 'USA' ),
('ASUS', '25', 'TAIWAN' ),
('Baidu', '140', 'CHINA' );

INSERT INTO Product (Pname, Price, Category, Manufacturer)
VALUES
('Pixel6', '600', 'Smartphone','Google'),
('SurfacePro', '1200', 'Computer', 'Microsoft'),
('Thinkpad', '2000', 'Computer', 'IBM'),
('Zenfone', '500', 'Smartphone', 'ASUS'),
('Haokan', '200', 'App', 'Baidu');

INSERT INTO Purchase (id, product, buyer)
VALUES
('1', 'Pixel6', 'Sally Smith'),
('2', 'SurfacePro', 'Tina Fey'),
('3', 'Thinkpad', 'Jen Thomson'),
('4', 'Haokan', 'Billy Jones'),
('5', 'Pixel6', 'CJ Mack'),
('6', 'Zenfone', 'Derek Bull'),
('7', 'Zenfone', 'Shayla Thomson'),
('8', 'Thinkpad', 'Joe Axe'),
('9', 'Haokan', 'Chris VanK'),
('10', 'SurfacePro', 'Mike T.Trike'),
('11', 'Pixel6', 'Saul Goodman');

SELECT * FROM Purchase
ORDER BY ABS(id) ASC;
/*ABS(id) RETURNS id AS ABSOLUTE number. The DATA TYPE OF the id
COLUMN IS varchar so it needs TO be converted BEFORE it can be ordered numerically*/


SELECT * FROM purchase p;
/* Q.1 - Show number of sales*/
SELECT count(*) AS Purchases 
FROM purchase p;
/*total sales = 11*/

/*Q.2 - Show only computer products and their details*/
SELECT *
	FROM product p
	WHERE Category = 'Computer';
/*Displays rows that satisfies category condition*/

/*Q.3 - Using alaising change Pname to better title and show price in CAD
 * Also, show only smartphones.*/
SELECT Pname AS Product, Price AS 'Price in CAD'
FROM product p
WHERE Category = 'Smartphone';

/*Q.4 - Which product categories are there?*/
SELECT Category  FROM product p ; 
/*Without using distinct clause we have duplicates*/
SELECT DISTINCT Category FROM product p ;
SELECT DISTINCT Category, price FROM product p ;
/*using distinct clause here still shows duplicate categories but distinct prices*/

SELECT * FROM product p ;

/*Q.5 - Find smartphones that cost under 550 dollars*/
SELECT * FROM product p 
WHERE Category = 'Smartphone' AND Price < 550;
/*Result is Zenfone costing 500$*/

/*Q.6 - Order products descending expensive to cheapest*/
SELECT * FROM product p
ORDER BY price DESC;

/*Q.7 - How many products are there?*/
SELECT count(*) AS Number_of_products FROM product p; 

/*Q.8 - Which products cost between 500$ and 1500$? Show price ascending*/
SELECT * FROM product p
WHERE Price BETWEEN 500 AND 1500
ORDER BY Price ASC;

/*Q.9 - Which products have manufacturer names starting with 'A' and 'G"?*/
SELECT * FROM product p 
WHERE Manufacturer BETWEEN 'A' AND 'G';
/*Now find manufacturers that have 'B' in the second letter position
 * and 'R' in forth letter position */
SELECT * FROM product p 
WHERE Manufacturer LIKE '_B%'
OR Manufacturer LIKE '___R%';
/*Results show Microsft and IBM*/

/*Q.10 - Show only ASUS and Google products*/
SELECT * FROM product p 
WHERE Manufacturer IN ('ASUS', 'Google');
/*OR this way, but first way is cleaner and concise*/
SELECT * FROM product p 
WHERE Manufacturer='ASUS'
OR Manufacturer='Google';
