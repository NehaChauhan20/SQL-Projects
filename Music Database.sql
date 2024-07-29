CREATE DATABASE music_db;
USE music_db;

CREATE TABLE Artist(
artist_id INT PRIMARY KEY,
artist_name VARCHAR(70)
);

INSERT INTO Artist(artist_id,artist_name) VALUES 
(1 , 'Arijit Singh'),
(2 , 'Vishal Mishra'),
(3 , 'Shreya Ghosal'),
(4 , 'Atif Aslam');


CREATE TABLE Genre(
genre_id INT PRIMARY KEY,
genre_name VARCHAR(70)
);

INSERT INTO Genre(genre_id,genre_name) VALUES
(11 , 'Filmi'),
(12 , 'Classical'),
(13 , 'Romantic'),
(14 , 'Indian-Pop');


CREATE TABLE Albums(
album_id INT PRIMARY KEY,
album_name VARCHAR(250),
artist_id INT,
release_date DATE,
FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

INSERT INTO Albums(album_id,album_name,artist_id,release_date) VALUES 
(101 , 'Laapata Ladies' , 1 , STR_TO_DATE('13-02-2024' , '%d-%m-%Y')),
(102 , 'Aashiqui 2' , 1 , STR_TO_DATE('23-03-2013' , '%d-%m-%Y')),
(103 , 'Simmba' , 1 , STR_TO_DATE('28-12-2018' , '%d-%m-%Y')),
(104 , 'Animal' , 1 , STR_TO_DATE('27-10-2023' , '%d-%m-%Y')),
(105 , 'Aaj Bhi' , 2 , STR_TO_DATE('09-04-2020' , '%d-%m-%Y')),
(106 , 'Animal' , 2 , STR_TO_DATE('05-12-2023' , '%d-%m-%Y')),
(107 , 'Devdas' , 3 , STR_TO_DATE('12-07-2002' , '%d-%m-%Y')),
(108 , 'Kalank' , 3 , STR_TO_DATE('14-05-2019' , '%d-%m-%Y')),
(109 , 'Tubelight' , 4 , STR_TO_DATE('20-07-2017' , '%d-%m-%Y')),
(110 , 'Baaghi 2' , 4 , STR_TO_DATE('14-03-2018' , '%d-%m-%Y'));


CREATE TABLE Tracks(
track_id INT PRIMARY KEY ,
track_name VARCHAR(255),
album_id INT,
genre_id INT,
duration TIME,
FOREIGN KEY (album_id) REFERENCES Albums(album_id),
FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

INSERT INTO Tracks(track_id,track_name,album_id,genre_id,duration) VALUES
(111 , 'Sajni' , 101 , 11 , '00:02:50'),
(112 , 'Tum Hi Ho' , 102 , 13 , '00:04:21'),
(113 , 'Bandeya Re Bandeya' , 103 , 14 , '00:04:36'),
(114 , 'Satranga' , 104 , 13 , '00:04:32'),
(115 , 'Aaj Bhi' , 105 , 14 , '00:04:24'),
(116 , 'Pehle Bhi Main' , 106 , 13 , '00:04:30'),
(117 , 'Bairi Piya' , 107 , 12 , '00:05:20'),
(118 , 'Tabah Ho Gaye' , 108 , 12 , '00:07:51'),
(119 , 'Main Agar' , 109 , 11 , '00:04:41'),
(120 , 'O Saathi' , 110 , 14 , '00:04:30');


CREATE TABLE Playlists(
playlist_id INT PRIMARY KEY,
playlist_name VARCHAR(200),
creation_date DATE
);

INSERT INTO Playlists(playlist_id,playlist_name,creation_date) VALUES
(211 , 'Lapata-sajni' , STR_TO_DATE('13-02-2024' , '%d-%m-%Y')),
(212 , 'Fav' , STR_TO_DATE('15-02-2024' , '%d-%m-%Y')),
(213 , 'Encourage' , STR_TO_DATE('20-02-2024' , '%d-%m-%Y')),
(214 , 'Colors' , STR_TO_DATE('25-02-2024' , '%d-%m-%Y')),
(215 , 'kal-bhi' , STR_TO_DATE('19-03-2024' , '%d-%m-%Y')),
(216 , 'Love' , STR_TO_DATE('23-03-2024' , '%d-%m-%Y')),
(217 , 'Peace' , STR_TO_DATE('10-04-2024' , '%d-%m-%Y')),
(218 , 'Lost' , STR_TO_DATE('13-04-2024' , '%d-%m-%Y')),
(219 , 'Calm' , STR_TO_DATE('26-05-2024' , '%d-%m-%Y')),
(220 , 'Feel' , STR_TO_DATE('28-05-2024' , '%d-%m-%Y'));


CREATE TABLE PlaylistTracks(
playlist_id INT,
track_id INT,
FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
FOREIGN KEY (track_id) REFERENCES Tracks(track_id)
);

INSERT INTO PlaylistTracks(playlist_id,track_id) VALUES 
(211 , 111),
(212 , 112),
(213 , 113),
(214 , 114),
(215 , 115),
(216 , 116),
(217 , 117),
(218 , 118),
(219 , 119),
(220 , 120);

SELECT t.track_name, a.album_name, ar.artist_name, g.genre_name, t.duration
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
JOIN Artist ar ON a.artist_id = ar.artist_id
JOIN Genre g ON t.genre_id = g.genre_id;

SELECT p.playlist_name, t.track_name, a.album_name, ar.artist_name, t.duration
FROM Playlists p
JOIN PlaylistTracks pt ON p.playlist_id = pt.playlist_id
JOIN Tracks t ON pt.track_id = t.track_id
JOIN Albums a ON t.album_id = a.album_id
JOIN Artist ar ON a.artist_id = ar.artist_id;

SELECT a.album_name, a.release_date
FROM Albums a
JOIN Artist ar ON a.artist_id = ar.artist_id
WHERE ar.artist_name = 'Arijit Singh'; 

SELECT a.album_name, SUM(TIME_TO_SEC(t.duration)) AS total_duration_seconds
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
WHERE a.album_id = 101;

SELECT g.genre_name, COUNT(t.track_id) AS number_of_tracks
FROM Genre g
JOIN Tracks t ON g.genre_id = t.genre_id
GROUP BY g.genre_name
ORDER BY number_of_tracks DESC
LIMIT 2;

SELECT * FROM albums;
SELECT * FROM artist;
SELECT * FROM genre;
SELECT * FROM playlists;
SELECT * FROM playlisttracks;
SELECT * FROM tracks;


 










