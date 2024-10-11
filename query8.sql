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