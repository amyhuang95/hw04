-- 9. Creative addition: Define a new meaningful query using at least three tables, and some window function. Explain clearly what your query achieves, and what the results mean
-- Determine the importance of each customer based on the total amount of money they have spent in the store in percentile, and include the Sales Support Representative who is responsible for each customer.
-- Customer tier rule:
-- Diamond	Top 10%
-- Tier 1	Between top 10% and 20%
-- Tier 2	Between top 20% and 30%
-- Tier 3	Between top 30% and 50%
-- Tier 4	Remaining customers
WITH customersRank AS (
SELECT 
	invoices.CustomerId, 
	SUM(invoices.Total) AggTotal,
	PERCENT_RANK() OVER (
		ORDER BY SUM(invoices.Total)) TotalPercRank
FROM invoices
GROUP BY invoices.CustomerId
ORDER BY TotalPercRank DESC)
SELECT 
	customers.FirstName || " " || customers.LastName CustomerName,
	CASE
		WHEN TotalPercRank > 0.9 THEN
			'Diamond'
		WHEN TotalPercRank > 0.8 THEN
			'Tier 1'
		WHEN TotalPercRank > 0.7 THEN
			'Tier 2'
		WHEN TotalPercRank > 0.5 THEN
			'Tier 3'
		ELSE
			'Tier 4'
		END CustomerTier,
	employees.FirstName || " " || employees.LastName SalesSupportRepName,
	customersRank.CustomerId, 
	customersRank.AggTotal, 
	ROUND(TotalPercRank, 2) TotalPercRank
FROM customersRank
LEFT JOIN customers
	USING(CustomerId)
LEFT JOIN employees
	ON customers.SupportRepId = employees.EmployeeId;