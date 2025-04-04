-- ========== Measures Exploration 

-- Find the total sales
	SELECT 
	SUM(sales_amount) AS total_sales
	FROM gold.fact_sales;

-- Find how many items are sold
	SELECT
	SUM(quantity) AS total_quantity
	FROM gold.fact_sales;

-- Find the average selling price
	SELECT
	AVG(price) AS avg_selling_price
	FROM gold.fact_sales;

-- Find the total number of orders
	SELECT 
	COUNT(order_number) AS total_orders
	FROM gold.fact_sales;

	SELECT 
	COUNT(DISTINCT order_number) AS total_orders
	FROM gold.fact_sales;

-- Find the total number of products
	SELECT
	COUNT(product_key) AS total_products
	FROM gold.dim_products;

	SELECT
	COUNT(DISTINCT product_key) AS total_products
	FROM gold.dim_products;

-- Find the total number of customers
	SELECT
	COUNT(customer_key) AS total_customers
	FROM gold.dim_customer;

	SELECT
	COUNT(DISTINCT customer_key) AS total_customer
	FROM gold.dim_customer;

-- Find the total number of customers that has placed an order
    SELECT 
	count(DISTINCT customer_key) AS total_cust_placed_ord
	FROM gold.fact_sales;

-- =====================================================================
-- Generate a Report that shows all key metrics of the business

		SELECT 
		'Total Sales' AS measure_name,
		SUM(sales_amount) AS measure_value
		FROM gold.fact_sales
	UNION ALL
		SELECT
		'Total Quantity',
		SUM(quantity) 
		FROM gold.fact_sales
    UNION ALL
		SELECT
		'Average Price',
	    AVG(price) 
	    FROM gold.fact_sales
	UNION ALL
		SELECT 
	    'Total Nr. Orders',
		COUNT(DISTINCT order_number)
	    FROM gold.fact_sales
	UNION ALL
		SELECT
		'Total Nr. Products',
		COUNT(DISTINCT product_key)
		FROM gold.dim_products
	UNION ALL
		SELECT
		'Total Nr. Customer',
		COUNT(DISTINCT customer_key)
		FROM gold.dim_customer
	UNION ALL
		SELECT
		'Total Nr. Cust. Placed Ord.',
		count(DISTINCT customer_key) AS total_cust_placed_ord
		FROM gold.fact_sales;
