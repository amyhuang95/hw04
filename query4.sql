-- 4. Which states have more than 10 unique customers?
SELECT 
    State, 
    COUNT(CustomerId) AS NumCustomers
FROM customers
WHERE 
    State IS NOT NULL
	AND LENGTH(State) = 2 -- Omit 'Dublin' because it's not a State
GROUP BY State
HAVING COUNT(CustomerId) > 10;
