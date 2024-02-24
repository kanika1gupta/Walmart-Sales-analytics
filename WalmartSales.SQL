CREATE DATABASE if not exists Walmartsales;

USE Walmartsales;
CREATE table if not exists Sales(
Invoice_id VARCHAR(30) not null PRIMARY KEY,
Branch VARCHAR(05) not Null,
City VARCHAR(30) not null,
Customer_type VARCHAR(30) not null,
Gender VARCHAR(10) not null,
Product_line VARCHAR(100) not null,
Unit_price DECIMAL(5,2) not null,
Quantity INT not null,
VAT FLOAT(6,4) not null,
Total DECIMAL(12,4) not null,
Date DATETIME not null,
Time TIME not null,
Payment_method VARCHAR(15) not null,
COGS DECIMAL (10,2) not null,
Gross_margin_percentage FLOAT(11,9) not null,
Gross_income DECIMAL(12, 4) not null,
Rating FLOAT(2, 1) not null
);

SELECT * from Sales;

-- -------------------Feature engineering-------------------------
-- ---------------------------------------------------------------
-- -------------------------Time_of_day---------------------------

Alter table Sales ADD column Time_of_day VARCHAR(20);

UPDATE SALES 
SET Time_of_day = CASE 
    WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN TIME BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END;

-- ---------------------------------------------------------------
-- -------------------------Day_name------------------------------
SELECT Date,
 Dayname(Date) as Day_name FROM Sales;
 
ALTER table Sales 
Add column Day_name VARCHAR(10);

UPDATE Sales 
SET Day_name = Dayname(Date);

-- ---------------------------------------------------------------
-- -------------------------Month_name----------------------------

SELECT Date,
	   Monthname(Date) as Month_name
       FROM Sales;

ALTER table Sales ADD column Month_name VARCHAR(20);

UPDATE Sales SET Month_name = Monthname(Date);

-- ---------------------------------------------------------------

-- ---------------GENERIC QUESTIONS-------------------------------

-- How many unique cities does the data have?
SELECT COUNT(DISTINCT City) AS No_of_cities FROM Sales;
--  -------------------------------------------------------------

-- How many unique branches does the data have?
SELECT COUNT(DISTINCT Branch) AS No_of_branches
 FROM Sales;
--  -------------------------------------------------------------

-- In which city is each branch?
SELECT DISTINCT City,Branch
	   FROM Sales;
--  -------------------------------------------------------------

-- -------------PRODUCT QUESTIONS--------------------------------

-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT Product_line) FROM Sales;
-- -------------------------------------------------------------

-- What is the most common payment method?
SELECT  Payment_method,
        COUNT(Payment_method) AS Count_of_use
        FROM Sales
        GROUP BY Payment_method
        ORDER BY Count_of_use DESC
        LIMIT 1;
-- -------------------------------------------------------------

-- What is the most selling product line?
SELECT  Product_line,
        COUNT(Product_line) AS Count_of_use
        FROM Sales
        GROUP BY Product_line
        ORDER BY Count_of_use DESC
        LIMIT 1;

-- -----------------------------------------------------------
-- What is the total revenue by month?
SELECT Month_name,
       SUM(Total) AS Total_revenue
       FROM Sales
       GROUP BY Month_name
       ORDER BY Total_revenue DESC ;
-- -----------------------------------------------------------

-- What month had the largest COGS?
SELECT month_name, COGS
       FROM Sales
       ORDER BY COGS DESC
       LIMIT 1;
-- -----------------------------------------------------------

-- What product line had the largest revenue?
SELECT Product_line,
       SUM(Total) AS Total_revenue
       FROM Sales
       GROUP BY Product_line
       ORDER BY Total_revenue 
       LIMIT 1;
       
-- -----------------------------------------------------------

-- What product line had the largest VAT?
SELECT Product_line,
       SUM(VAT) AS Total_VAT
       FROM Sales
       GROUP BY Product_line
       ORDER BY Total_VAT 
       LIMIT 1;
-- -----------------------------------------------------------

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;
-- -----------------------------------------------------------

-- What is the most common product line by gender?
SELECT product_line, gender, count(gender) AS gender_Count
FROM Sales
GROUP BY product_line,gender
ORDER BY gender_count DESC LIMIT 1;
-- -----------------------------------------------------------

-- What is the average rating of each product line?
SELECT product_line, ROUND( AVG (rating),2) AS rating_avg
FROM Sales
GROUP BY(product_line)
ORDER BY rating_avg DESC;

-- -----------------------------------------------------------
-- ----------------SALES--------------------------------------
-- -----------------------------------------------------------
-- Number of sales made in each time of the day per day?
SELECT count(quantity) as sales, time_of_day, day_name
FROM Sales
GROUP BY time_of_day, day_name
ORDER BY day_name, time_of_day DESC;
-- -----------------------------------------------------------

-- Which of the customer types brings the most revenue?
SELECT customer_type, COUNT(quantity) as Sales
FROM Sales
GROUP BY customer_type
ORDER BY Sales DESC;
-- -----------------------------------------------------------

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, SUM(VAT) AS vat
FROM sales
GROUP BY city
ORDER BY vat DESC LIMIT 1;
-- -----------------------------------------------------------

-- Which customer type pays the most in VAT?
SELECT customer_type, SUM(VAT) as vat
FROM Sales
GROUP BY customer_type
ORDER BY vat LIMIT 1;
-- -----------------------------------------------------------

-- -----------------------------------------------------------
-- ---------------------CUSTOMER------------------------------
-- -----------------------------------------------------------

-- How many unique customer types does the data have? 
SELECT COUNT( DISTINCT customer_type) as Customer_type
FROM sales;
-- -----------------------------------------------------------

-- What is the most common customer type?
SELECT DISTINCT customer_type 
FROM sales
ORDER BY customer_type DESC LIMIT 1;
-- -----------------------------------------------------------

-- Which customer type buys the most?
SELECT customer_type, COUNT(quantity) as qnt
FROM Sales
GROUP BY customer_type
ORDER BY qnt DESC LIMIT 1;
-- ------------------------------------------------------------

-- What is the gender of most of the customers?
SELECT gender, COUNT(gender)  as no_of_customers
FROM sales
GROUP BY gender
ORDER BY no_of_customers DESC LIMIT 1;
-- ------------------------------------------------------------

-- What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) as gender_count
FROM Sales
GROUP BY branch,gender
ORDER BY branch ASC;

-- ------------------------------------------------------------

-- Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) as rating_count
FROM sales
GROUP BY time_of_day
ORDER BY rating_count DESC LIMIT 1 ;

-- ----------------------------------------------------------

-- Which time of the day do customers give most ratings per branch?
SELECT time_of_day, AVG(rating) as rating_count, branch
FROM sales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY rating_Count DESC;
-- SIMILARLY FOR B AND C-- 
-- ----------------------------------------------------------

-- Which day fo the week has the best avg ratings?
SELECT day_name, AVG(Rating) as Rating
FROM Sales
GROUP BY day_name
ORDER BY rating DESC LIMIT 1;
-- ----------------------------------------------------------

-- Which day of the week has the best average ratings per branch?
SELECT day_name, AVG(Rating) as Rating
FROM Sales
WHERE BRANCH = "A"
GROUP BY day_name
ORDER BY rating DESC LIMIT 1;

-- ----------------------------------------------------------
-- --------------------END-----------------------------------
-- ----------------------------------------------------------









       



      
       

