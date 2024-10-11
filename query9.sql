-- 9. Creative addition: Define a new meaningful query using at least three tables, and some window function. Explain clearly what your query achieves, and what the results mean
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
	ON customersRank.CustomerId = customers.CustomerId
LEFT JOIN employees
	ON customers.SupportRepId = employees.EmployeeId;