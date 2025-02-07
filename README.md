# Mint-Classics-Company-Project
Mint Classics Company, a retailer of classic model cars and other vehicles, is looking at closing one of their storage facilities. 

To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers. 
The analysis is aimed at answering the following questions with the goal of closing one of the storage facilities. :

1) Where are items stored and if they were rearranged, could a warehouse be eliminated?

2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?

# Project Objectives

1. Explore products currently in inventory.

2. Determine important factors that may influence inventory reorganization/reduction.

3. Provide analytic insights and data-driven recommendations.

# Analysis Methodology
1. Download the mintclassicsDB.sql file and import the data to populate the Mint Classics relational database. 
2. Examine the database structure to see what type of data is stored in each table and how the tables are related.
3. Use SQL queries to isolate the data that specifically relates to the business problem being addressed
   
# Findings
1. West is the most underutilized warehouse (50% free space) despite holding 22.5% of the inventory. Classic Cars are stored in the East warehouse; Vintage Cars are stored in the West; Motor Cycles and Planes in the North and the rest of the vehicles are in the South warehouse.
2. West is 50% full with 124880 units, the total capacity of West will be 249,760. The total capacity of South, North, and East will be 105,840, 182,900 and 327,139 respectively. Since West and East hold Classic and Vintage cars, they might have the similar storage needs.
3. There is a high inventory-to-sales ratio across all categories with Classic cars (164) and Trains (159) being the highest. This means that the company holds 164 units for every Classic Car sold, 159 for every train sold and so on,
4. Revenue Concentration: Classic cars (40.87%), Vintage Cars (18.53%) and Motorcycles (12.23%) of total revenue. The slowest moving categories are Trains, Ships and Planes, and prices are below MSRP across categories.
5. There is a significant peak in Q4 sales each year. The business can leverage this and stock high-demand categories like Classic and Vintage Cars during the holiday season

# Recommendations 
1. Reduce high inventory for all categories to free up storage space and other resources.
2. Together North and East have storage space for 159168 units which can take the 124880 units from West. So close the West warehouse and move the Vintage cars to the East and North since they might have the similar storage facilities as West.
3. Discontinue Trains and phase out Ships and Planes if sales fail to improve.
4. Consider raising prices of high-demand categories like Classic and Vintage cars to increase profit
