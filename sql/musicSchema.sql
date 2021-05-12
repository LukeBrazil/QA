CREATE DATABASE IF NOT EXISTS musicdb;
USE musicdb;
SHOW DATABASES;

CREATE TABLE artists(
	artist_id INT NOT NULL AUTO_INCREMENT,
    artist_name varchar(20) NOT NULL,
    artist_category varchar(20) NOT NULL,
    artist_language varchar(20) NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE albums(
	album_id INT NOT NULL AUTO_INCREMENT,
    album_name varchar(20) NOT NULL,
    album_release DATE NOT NULL DEFAULT '1970-01-01',
    fk_artist_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (fk_artist_id) REFERENCES artists(artist_id)
    
);

CREATE TABLE tracks(
	track_id INT NOT NULL AUTO_INCREMENT,
    track_length INT NOT NULL,
    track_title varchar(20) NOT NULL,
    fk_artist_id INT NOT NULL,
    fk_album_id INT NOT NULL,
    PRIMARY KEY (track_id),
    FOREIGN KEY (fk_artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (fk_album_id) REFERENCES albums(album_id)
);

SHOW DATABASES;
use musicdb;
SHOW TABLES;
desc artists;

INSERT INTO artists(artist_name, artist_category, artist_language) values('VAN HALEN', 'Rock', 'English');
SELECT * FROM artists;
INSERT INTO artists(artist_name, artist_category, artist_language) values('Drake', 'Hip Hop', 'English');
INSERT INTO albums(album_name, album_release, fk_artist_id) values('Nothing Was the Same', '2013-09-24', 2);
SELECT * FROM albums;
INSERT INTO tracks(track_length, track_title, fk_artist_id, fk_album_id) values(3, 'Gods Plan', 2, 1);
SELECT * FROM tracks;