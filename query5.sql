SELECT DISTINCT ar.Name AS ArtistName
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
WHERE LOWER(al.Title) LIKE '%symphony%'
ORDER BY ar.Name;
