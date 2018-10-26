--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden, Derek Fisher
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS PropertyGame;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	cash money,
	score integer,
	location varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50)
	)

CREATE TABLE PropertyGame (
	playerGameID integer REFERENCES PlayerGame(ID),
	propertyID integer REFERENCES Property(ID),
	houses integer,
	hotels boolean
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PropertyGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 'Calvin College');
INSERT INTO Property VALUES (2, 'Gold Lab');
INSERT INTO Property VALUES (3, 'Maroon Lab');

INSERT INTO PlayerGame VALUES (1, 1, 1, 0.00, 0.00, 'Calvin College');
INSERT INTO PlayerGame VALUES (2, 1, 2, 0.00, 0.00, 'Gold Lab');
INSERT INTO PlayerGame VALUES (3, 1, 3, 2350.00, 2350.00, 'Maroon Lab');
INSERT INTO PlayerGame VALUES (4, 2, 1, 1000.00, 1000.00, 'Calvin College');
INSERT INTO PlayerGame VALUES (5, 2, 2, 0.00, 0.00, 'Gold Lab');
INSERT INTO PlayerGame VALUES (6, 2, 3, 500.00, 500.00, 'Maroon Lab');
INSERT INTO PlayerGame VALUES (7, 3, 2, 0.00, 0.00, 'Calvin College');
INSERT INTO PlayerGame VALUES (8, 3, 3, 5500.00, 5500.00, 'Gold Lab');

INSERT INTO PropertyGame VALUES(1, 1, 1, FALSE)
INSERT INTO PropertyGame VALUES(1, 2, 0, TRUE)
INSERT INTO PropertyGame VALUES(1, 3, 2, FALSE)
INSERT INTO PropertyGame VALUES(2, 1, 0, FALSE)
INSERT INTO PropertyGame VALUES(2, 2, 1, FALSE)
INSERT INTO PropertyGame VALUES(2, 3, 0, TRUE)
INSERT INTO PropertyGame VALUES(3, 1, 0, FALSE)
INSERT INTO PropertyGame VALUES(3, 2, 1, FALSE)
INSERT INTO PropertyGame VALUES(3, 3, 1, FALSE)
