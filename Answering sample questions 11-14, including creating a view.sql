/*Q.11 - Find products that have 'pad' in their name*/
SELECT * FROM product p 
WHERE Pname LIKE '%pad%';

/*Q.12 - Is a product expensive? If over 1000$ then yes otherwise no.*/
SELECT Pname, Price,
CASE WHEN price > 1000 THEN 'Yes' ELSE 'NO' 
END AS Expensive
FROM product p ;
/*Surfacepro and Thinkpad are expensive*/

/*Q.13 Find products manufactured by USA company costing more than 600$*/
SELECT Pname, Price
	FROM product p, company c 
	WHERE Manufacturer = Cname 
	AND Price > 600 AND Country = 'USA';
/*Join already exists through primary and foreign keys so WHERE clause 
 * can be used but only for inner joins*/

SELECT Pname, Price
	FROM product p 
	JOIN company c ON Manufacturer = Cname
	WHERE price > 600 AND Country = 'USA';
/*If you just use JOIN it defaults to inner join, results same as above*/

SELECT p.Pname, p.Price
	FROM product p 
	JOIN company c ON p.Manufacturer = c.Cname 
	WHERE p.Price > 600 AND Country = 'USA';
 /*Another way to write the query*/

/*Q.14 - In which countries are the smartphones produced?*/
SELECT c.Country 
	FROM product p 
	JOIN company c ON p.Manufacturer = c.Cname 
	WHERE p.Category = 'Smartphone';
/*left table is products, right table is company. Smartphones are
 * produced in USA and TAIWAN*/


/*Using multiple joins, create a view that allows a user to see orders details id, country, 
 * company, product and price. Also create additonal column to show price with tax. 
 * Display in ascending order using id column. */
CREATE VIEW order_summary_view
AS 
SELECT p2.id, c.Country, p.Manufacturer AS Company, p2.product, p.Price, 
SUM(p.Price) * 1.05 AS PricePlusTax
	FROM product p 
	JOIN purchase p2 ON p2.product = p.Pname
	JOIN company c ON p.Manufacturer = c.Cname
	GROUP BY p2.id 
	ORDER BY ABS(p2.id) ASC;

SELECT * FROM order_summary_view; 
/*calling the view*/
