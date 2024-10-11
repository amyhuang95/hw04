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