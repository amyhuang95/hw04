-- 7. How many artists published at least 10 MPEG tracks?
SELECT COUNT(*)
FROM
    (SELECT artists.ArtistId, COUNT(*) AS NumMpegTracks
     FROM artists
     INNER JOIN albums
         USING(ArtistId)
     INNER JOIN tracks
         USING(AlbumId)
     INNER JOIN media_types
         USING(MediaTypeId)
     WHERE media_types.Name LIKE '%MPEG%'
     GROUP BY artists.Name
     HAVING NumMpegTracks >= 10);