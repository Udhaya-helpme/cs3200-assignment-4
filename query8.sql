SELECT
    p.PlaylistId,
    p.Name AS PlaylistName,
    ROUND(SUM(t.Milliseconds) / 3600000.0, 2) AS LengthInHours
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks t          ON pt.TrackId = t.TrackId
WHERE t.Milliseconds IS NOT NULL
GROUP BY p.PlaylistId, p.Name
HAVING SUM(t.Milliseconds) / 3600000.0 > 2
ORDER BY LengthInHours DESC;
