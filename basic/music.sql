CREATE DATABASE music DEFAULT CHARACTER SET utf8;

USE music;

CREATE TABLE artist (
  artist_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY(artist_id)
) ENGINE = InnoDB;

CREATE TABLE album(
  album_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  artist_id INTEGER,

  PRIMARY KEY(album_id),
  INDEX USING BTREE(title),

  CONSTRAINT FOREIGN KEY(artist_id)
    REFERENCES artist(artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE genre(
  genre_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY(genre_id)
) ENGINE = InnoDB;

CREATE TABLE track (
  track_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  len INTEGER,
  rating INTEGER,
  count INTEGER,
  album_id INTEGER,
  genre_id INTEGER,

  PRIMARY KEY(track_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY(album_id) REFERENCES album (album_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY(genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Values

INSERT INTO artist(name) VALUES('Led Zepelin');
INSERT INTO artist(name) VALUES('AC/DC');

INSERT INTO genre(name) VALUES('Rock');
INSERT INTO genre(name) VALUES('Metal');

INSERT INTO album(title, artist_id) VALUES ('Who Made Who', 2);
INSERT INTO album(title, artist_id) VALUES ('IV', 1);

INSERT INTO track(title, rating, len, count, album_id, genre_id) VALUES('Black Dog', 5, 297, 0, 2, 1);
INSERT INTO track(title, rating, len, count, album_id, genre_id) VALUES('Stairway', 5, 482, 0, 2, 1);
INSERT INTO track(title, rating, len, count, album_id, genre_id) VALUES('About to Rock', 5, 313, 0, 1, 2);
INSERT INTO track(title, rating, len, count, album_id, genre_id) VALUES('Who Made Who', 5, 207, 0, 1, 2);

SELECT album.title, artist.name FROM album JOIN artist ON album.artist_id = artist.artist_id;

SELECT album.title, album.artist_id, artist.artist_id, artist.name FROM album JOIN artist ON album.artist_id = artist.artist_id;

SELECT track.title, track.genre, genre.genre_id, genre.name FROM track JOIN genre;

SELECT track.title, artist.name, album.title, genre.name FROM track JOIN genre JOIN album JOIN artist ON track.genre_id=genre.genre_id AND track.album_id = album.album_id AND album.artist_id = artist.artist_id ORDER BY album.title;

SELECT DISTINCT artist.name, genre.name FROM track JOIN album JOIN genre JOIN artist ON track.album_id = album.album_id AND track.genre_id = genre.genre_id AND album.artist_id = artist.artist_id WHERE artist.name = 'Aerosmith';
