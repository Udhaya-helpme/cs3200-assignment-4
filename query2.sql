SELECT al.Title AS AlbumTitle, ar.Name AS ArtistName
FROM albums al
JOIN artists ar ON al.ArtistId = ar.ArtistId
ORDER BY ar.Name, al.Title;

