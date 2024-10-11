-- 3. What are the total number of unique customers for each state, ordered alphabetically by state?
SELECT 
    State, 
    COUNT(CustomerId) AS NumCustomers
FROM customers
WHERE 
    State IS NOT NULL 
    AND LENGTH(State) = 2 -- Omit 'Dublin' because it's not a State
GROUP BY State
ORDER BY State;