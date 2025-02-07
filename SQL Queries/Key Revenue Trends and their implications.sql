### Key Revenue Trends and their implications  
## Firstly, I analyze slow-moving product categories to align inventory with revenue trends with a look into the monthly revenue figures to reveal the high demand categories. It is also necessary to understand Mint Classic's pricing by comparing the avg prices to the MSRP

SELECT 
    prd.productLine as ProductCategory,
    SUM(quantityOrdered) as Orders,
    AVG(ord.priceEach) as AvgPrice,
    AVG(prd.MSRP) as AVGMSRPrice,
    SUM(priceEach * quantityOrdered) as Revenue,
    SUM(priceEach * quantityOrdered)/(SELECT SUM(priceEach * quantityOrdered)
									  FROM products as prd
									  JOIN orderdetails as ord
									  ON prd.productCode = ord.productCode
									  JOIN orders as ors
									  ON ord.orderNumber = ors.orderNumber
									  WHERE ors.status = "Shipped") as PctTotalRevenue
FROM products as prd
LEFT JOIN orderdetails as ord
ON prd.productCode = ord.productCode
LEFT JOIN orders as ors
ON ord.orderNumber = ors.orderNumber

WHERE ors.status = "Shipped"
GROUP BY ProductCategory
ORDER BY  Orders,Revenue DESC  

# Revenue Concentration: Classic cars (40.87%), Vintage Cars (18.53%) and Motorcycles (12.23%) of total revenue
# The slowest moving categories are Trains, Ships and Planes, and prices are below MSRP across categories.



## Next, I checked whether the MoM revenue growth is consistent and whether there are any spikes in monthly sales

SELECT YEAR(orderDate) as OrderYear,
	MONTH(orderDate) as OrderMonth,
    SUM(ord.quantityOrdered * ord.priceEach) as Revenue
FROM customers as cus
JOIN orders as ors
ON cus.customerNumber = ors.customerNumber
JOIN orderdetails as ord
ON ors.orderNumber = ord.orderNumber

WHERE ors.status = "Shipped" 

GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear 

# There is significant peak in Q4 sales each year. The business can leverage this and stock high demand categories like Classic and Vintage Cars during the holiday season

## Conclusions
# Discountinue Trains and phase out Ships and Planes if sales don't improve. 
# Consider raising prices of high demand categories like Classic and Vintage cars to increase profit
