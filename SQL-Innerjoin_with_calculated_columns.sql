SELECT 
	orderNumber,
	productName,
	MSRP,
	priceEach,
	(MSRP-priceEach) AS discount,
	((MSRP-priceEach)/MSRP*100) AS percent
	 /*Here I've created "calculated columns" for discount and percent
	  *to show the business which products they should be focusing
	  their sales on.*/
FROM 
	products p 
INNER JOIN orderdetails o
	ON p.productCode = o.productCode
		AND p.MSRP > o.priceEach
WHERE p.productCode = 'S10_1678'
/*Here I've created an inner join on the products and orderdetails tables and am searching for 
 *a specific productcode. I'm also looking at items where MSRP is greater than price paid. In a seperate query, I
 *searched if any instances existed where priceEach was greater than MRSP and
 *fortunately, none existed as this would mean the company would not make any
 *profit on the sale of those items*/
GROUP BY 
	orderNumber
ORDER BY 
	percent DESC;
/*Lastly, I grouped by orderNumber and ordered percent in decending order*/
