-- 1. What are the last names and emails of all customer who made purchased in the store?
SELECT 
    DISTINCT LastName, 
    Email
FROM invoices
LEFT JOIN customers
    on invoices.CustomerId = customers.CustomerId;

-- 2. What are the names of each album and the artist who created it?
SELECT 
    Title, 
    Name
FROM albums
LEFT JOIN artists
    ON albums.ArtistId = artists.ArtistId;

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

-- 5. What are the names of the artists who made an album containing the substring "symphony" in the album title?
SELECT Name
FROM albums
LEFT JOIN artists
    ON albums.ArtistId = artists.ArtistId
WHERE Title LIKE '%symphony%';

-- 6. What are the names of all artists who performed MPEG (video or audio) tracks in either the "Brazilian Music" or the "Grunge" playlists?
SELECT DISTINCT artists.Name
FROM artists
INNER JOIN albums
    ON artists.ArtistId = albums.ArtistId
INNER JOIN tracks
    ON tracks.AlbumId = albums.AlbumId
INNER JOIN media_types
    ON media_types.MediaTypeId = tracks.MediaTypeId
INNER JOIN playlist_track
    ON playlist_track.TrackId = tracks.TrackId
INNER JOIN playlists
    ON playlists.PlaylistId = playlist_track.PlaylistId
WHERE 
    media_types.Name LIKE '%MPEG%'
    AND playlists.Name IN ('Brazilian Music', 'Grunge');

-- 7. How many artists published at least 10 MPEG tracks?
SELECT COUNT(*)
FROM
    (SELECT artists.Name, COUNT(*) AS NumMpegTracks
     FROM artists
     INNER JOIN albums
         ON artists.ArtistId = albums.ArtistId
     INNER JOIN tracks
         ON tracks.AlbumId = albums.AlbumId
     INNER JOIN media_types
         ON media_types.MediaTypeId = tracks.MediaTypeId
     WHERE media_types.Name LIKE '%MPEG%'
     GROUP BY artists.Name
     HAVING NumMpegTracks >= 10);

-- 8. What is the total length of each playlist in hours? List the playlist id and name of only those playlists that are longer than 2 hours, along with the length in hours rounded to two decimals.
SELECT 
    playlists.PlaylistId, 
    playlists.Name, 
    ROUND(SUM(tracks.Milliseconds)/3600000.0, 2) AS Hours
FROM playlists
LEFT JOIN playlist_track
    ON playlist_track.PlaylistId = playlists.PlaylistId
LEFT JOIN tracks
    ON playlist_track.TrackId = tracks.TrackId
GROUP BY playlists.PlaylistId
HAVING Hours > 2;

-- 9. Creative addition: Define a new meaningful query using at least three tables, and some window function. Explain clearly what your query achieves, and what the results mean
WITH customersRank AS (
SELECT 
	invoices.CustomerId, 
	SUM(invoices.Total) AggTotal,
	PERCENT_RANK() OVER (
		ORDER BY SUM(invoices.Total)) TotalPercRank
FROM invoices
GROUP BY invoices.CustomerId
ORDER BY TotalPercRank DESC)
SELECT 
	customers.FirstName || " " || customers.LastName CustomerName,
	CASE
		WHEN TotalPercRank > 0.9 THEN
			'Diamond'
		WHEN TotalPercRank > 0.8 THEN
			'Tier 1'
		WHEN TotalPercRank > 0.7 THEN
			'Tier 2'
		WHEN TotalPercRank > 0.5 THEN
			'Tier 3'
		ELSE
			'Tier 4'
		END CustomerTier,
	employees.FirstName || " " || employees.LastName SalesSupportRepName,
	customersRank.CustomerId, 
	customersRank.AggTotal, 
	ROUND(TotalPercRank, 2) TotalPercRank
FROM customersRank
LEFT JOIN customers
	ON customersRank.CustomerId = customers.CustomerId
LEFT JOIN employees
	ON customers.SupportRepId = employees.EmployeeId;