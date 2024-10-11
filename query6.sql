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