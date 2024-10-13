-- 6. What are the names of all artists who performed MPEG (video or audio) tracks in either the "Brazilian Music" or the "Grunge" playlists?
SELECT DISTINCT artists.Name
FROM artists
INNER JOIN albums
    USING(ArtistId)
INNER JOIN tracks
    USING(AlbumId)
INNER JOIN media_types
    USING(MediaTypeId)
INNER JOIN playlist_track
    USING(TrackId)
INNER JOIN playlists
    USING(PlaylistId)
WHERE 
    media_types.Name LIKE '%MPEG%'
    AND playlists.Name IN ('Brazilian Music', 'Grunge');