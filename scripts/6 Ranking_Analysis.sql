-- ========== Ranking Analysis

-- Which 5 Products generate the heighest revenue

	SELECT TOP 5
	p.product_name,
	SUM(c.sales_amount) AS revenue
	FROM gold.fact_sales AS c
	LEFT JOIN gold.dim_products AS p
	ON p.product_key = c.product_key
	GROUP BY p.product_name
-- Second Method
	SELECT
	*
	FROM(
	SELECT 
	p.product_name,
	SUM(c.sales_amount) AS revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(c.sales_amount) DESC) AS rank_product
	FROM gold.fact_sales AS c
	LEFT JOIN gold.dim_products AS p
	ON p.product_key = c.product_key
	GROUP BY p.product_name) AS A
	WHERE rank_product <6;

-- Find the Top-10 customer who have geneated the highest revenue 
   
   SELECT 
   *
   FROM (
   SELECT
   c.customer_key,
   c.first_name,
   c.last_name,
   SUM(sales_amount) as revenue,
   ROW_NUMBER() OVER(ORDER BY SUM(sales_amount) DESC) AS cust_rank
   FROM gold.fact_sales AS s
   LEFT JOIN gold.dim_customer AS c
   ON s.customer_key = c.customer_key
   GROUP BY c.customer_key, c.first_name, c.last_name) AS A
   WHERE cust_rank <=10

-- And 3 customer with the fewest orders placed 

   SELECT 
   *
   FROM (
   SELECT
   c.customer_key,
   c.first_name,
   c.last_name,
   COUNT(DISTINCT order_number) as total_order,
   ROW_NUMBER() OVER(ORDER BY SUM(sales_amount) ) AS cust_rank
   FROM gold.fact_sales AS s
   LEFT JOIN gold.dim_customer AS c
   ON s.customer_key = c.customer_key
   GROUP BY c.customer_key, c.first_name, c.last_name) AS A
   WHERE cust_rank <=3
