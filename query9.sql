SELECT
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS TotalSpent,
    RANK() OVER (
        PARTITION BY c.Country
        ORDER BY SUM(ii.UnitPrice * ii.Quantity) DESC
    ) AS SpendingRankInCountry
FROM customers c
JOIN invoices i     ON c.CustomerId = i.CustomerId
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
WHERE c.Country IS NOT NULL
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY c.Country, SpendingRankInCountry;
