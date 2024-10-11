-- 5. What are the names of the artists who made an album containing the substring "symphony" in the album title?
SELECT Name
FROM albums
LEFT JOIN artists
    ON albums.ArtistId = artists.ArtistId
WHERE Title LIKE '%symphony%';