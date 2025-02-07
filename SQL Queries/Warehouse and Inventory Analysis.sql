### Warehouse and Inventory Analysis 
## How much of the current inventory is stored in each warehouse? How is the storage space of each warehouse being utilized? To answer these questions, I will run a query to give a table of how much of the total inventory is stored in each of the warehouses, and how much space they have taken up

SELECT 
    w.warehouseCode,
    w.warehouseName,
    SUM(prd.quantityInStock) AS Inventory,
    (SUM(prd.quantityInStock) / (SELECT SUM(quantityInStock) 
								 FROM products)) * 100 AS PctofInventory,
	w.warehousePctCap as FillCapacity
FROM 
    products as prd
JOIN warehouses as w 
ON prd.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, FillCapacity
ORDER BY PctofInventory;

# West is the most underutilized warehouse (50% free space) despite holding 22.5% of the inventory
# Assumption (1): West is 50% full with 124880 units, the total capacity will be 249760. Total capacity of South, North and East will be 105840, 182900 and 327139 respectively


## It is also necessary to know how the different productlines are organized across the warehouses. The following query gives insights into where each productline is stored

SELECT 
	w.warehouseCode,
    w.warehouseName as Warehouse,
    w.warehousePctCap as FillCapacity,
    prd.productline as ProductCategory
    
FROM 
	products as prd
    LEFT JOIN warehouses as w 
    ON prd.warehouseCode = w.warehouseCode
    
GROUP BY warehouseCode, Warehouse, FillCapacity, ProductCategory

# Classic Cars are stored in East warehouse; Vintage Cars are stored in West; Motor Cycles and Planes in North and the rest of the vehicles are in the South warehouse
# Assumption (2): West holds Vintage cars which are of high value and might require special storage. East which holds Classic cars might have the same storage needs


## How much inventory does the company hold relative to its sales? To answer this question, I analyzed the data to find the inventory to sales ratio at the product category level

SELECT 
    prd.productLine as ProductCategory,
    SUM(prd.quantityInStock) / SUM(ord.quantityOrdered) as InventorytoSaleRatio
    
FROM products as prd
LEFT JOIN orderdetails as ord
ON prd.productCode = ord.productCode

GROUP BY ProductCategory
ORDER BY  InventorytoSaleRatio DESC 

# There is a high inventory to sales ratio across all categories with Classic cars (164) and Trains (159) being the highest.
# The company holds 164 units for every Classic Car sold, 159 for every train sold and so on. 

### Conclusion: 
# Reduce high inventory for all categories to free up storage space and other resources
# Together North and East have storage space for 159168 units which can take the 124880 units from West. So close the West warehouse and move the Vintage cars to East and North since they might have the same storage needs
