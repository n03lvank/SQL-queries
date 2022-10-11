SELECT 
	orderNumber,
	productName,
	MSRP,
	priceEach,
	(MSRP-priceEach) AS discount,
	((MSRP-priceEach)/MSRP*100) AS percent
	 /*Here I've created "calculated columns" for discount and percent
	  *to show the business which products they should be focusing
	  their sale on.*/
FROM 
	products p 
INNER JOIN orderdetails o
	ON p.productCode = o.productCode
		AND p.MSRP > o.priceEach
WHERE p.productCode = 'S10_1678'
/*Here we've created an inner join on the products and orderdetails tables and are searching for 
 *a specific productcode. We're also looking at items where MSRP is greater than price paid then
 *I also searched if any instances existed where priceEach was greater than MRSP and
 *fortunely, none existed as this would mean the company would not make any
 *profit on the sale of those itmes*/
GROUP BY 
	orderNumber
ORDER BY 
	percent DESC;
/*Lastly, I group by orderNumber and order percent in decending order*/
