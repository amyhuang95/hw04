-- 1. What are the last names and emails of all customer who made purchased in the store?
SELECT 
    DISTINCT LastName, 
    Email
FROM invoices
LEFT JOIN customers 
    USING (CustomerId);