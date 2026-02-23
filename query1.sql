SELECT DISTINCT c.LastName, c.Email
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.LastName IS NOT NULL
  AND c.Email IS NOT NULL
ORDER BY c.LastName;
