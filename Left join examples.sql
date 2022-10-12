SELECT 
	c.customerNumber,
	c.customerName,
	o.orderNumber,
	o.status
FROM 
	customers c 
LEFT JOIN orders o ON o.customerNumber = c.customerNumber;
/*The customers table is the left table joined with the right table, orders on key column,
 * customerNumber. If a customer has no order(s) the values in orderNumber and status return NULL.
 */
/*Every customer may have zero or more orders however, each order
 * must belong to a customer*/
SELECT 
	c.customerNumber,
	c.customerName,
	o.orderNumber,
	o.status
FROM 
	customers c 
LEFT JOIN orders o USING (customerNumber);
/*Alternatively, I can use the USING syntax because both tables share the exact
 * same column name.
 */