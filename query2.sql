-- 2. What are the names of each album and the artist who created it?
SELECT 
    Title, 
    Name
FROM albums
LEFT JOIN artists
    ON albums.ArtistId = artists.ArtistId;