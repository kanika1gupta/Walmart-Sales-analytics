# Walmart-Sales-analytics
The project aims to analyze sales data from Walmart for the year 2019 using MySQL. The project performs various analyses which includes exploratory data analysis, Seasonal trends, geographic analysis, customer segmentation, product performance, and much more. The dataset was obtained from GitHub.

#Puprose of this project
The major aim of this project is to gain insight into the sales data of Walmart from different perspectives to understand the different factors that affect sales of the different branches.

#About Data
This dataset contains sales transactions from three different branches of Walmart, respectively located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows:

Column                  	Description	                          Data Type
invoice_id	              Invoice of the sales made           	VARCHAR(30)
Branch	                  Branch at which sales were made     	VARCHAR(5)
City	                    The location of the branch           	VARCHAR(30)
Customer_type            	The type of the customer	            VARCHAR(30)
Gender                  	Gender  making purchase             	VARCHAR(10)
Product_line	            Product line of the product sold	    VARCHAR(100)
Unit_price	              The price of each product           	DECIMAL(10, 2)
Quantity                	The amount of the product sold	      INT
VAT	                      The amount of tax on the purchase   	FLOAT(6, 4)
Total	                    The total cost of the purchase	      DECIMAL(10, 2)
Date                    	The Purchase date	                    DATE
Time	                    The time of purchase                  TIMESTAMP
Payment_method	          The total amount paid	                DECIMAL(10, 2)
Cogs	                    Cost Of Goods sold	                  DECIMAL(10, 2)
Gross_margin_percentage  	Gross margin percentage              	FLOAT(11, 9)
Gross_income	            Gross Income                        	DECIMAL(10, 2)
Rating	                  Rating	                              FLOAT(2, 1)
