-- ========== Date Exploration

-- Find the date of the first and last order
-- How many years of sales are avaiable
	SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(year,MIN(order_date),MAX(order_date)) AS time_spane -- in years
	FROM gold.fact_sales;

-- Find the youngest and the oldest customer
	SELECT 
	MIN(birthdate) AS youngest,
	DATEDIFF(YEAR,MIN(birthdate),GETDATE()) AS oldest_age,
	MAX(birthdate) AS oldest,
	DATEDIFF(YEAR,MAX(birthdate),GETDATE()) AS oldest_age
	FROM gold.dim_customer;
