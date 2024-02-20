CREATE TABLE users (
    userid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name CHAR(20),
    username CHAR(20),
    address CHAR(25),
    city CHAR(20),
    state CHAR(2),
    zip INT(5),
    password CHAR(20)
);

CREATE TABLE locations (
	itemid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type INT,
    description CHAR(25),
    lng REAL,
    lat REAL
);

CREATE TABLE photograph (
	photoid INT,
    locationid INT
);

ALTER TABLE locations
MODIFY COLUMN type INT NOT NULL,
MODIFY COLUMN description CHAR(25) NOT NULL,
MODIFY COLUMN lng REAL NOT NULL,
MODIFY COLUMN lat REAL NOT NULL;

ALTER TABLE users
MODIFY COLUMN name CHAR(20) NOT NULL,
MODIFY COLUMN username CHAR(20) NOT NULL,
MODIFY COLUMN password CHAR(20) NOT NULL;

ALTER TABLE photograph
MODIFY COLUMN photoid INT NOT NULL,
MODIFY COLUMN locationid INT NOT NULL;

CREATE UNIQUE INDEX id 
ON users (userid);
CREATE UNIQUE INDEX photo
ON photograph (photoid);

INSERT INTO users 
VALUES (0,'Bonnie Buntcake', 'bbunt', '6709 Wonder Street', 'Wonderbread', 'OH', 46105, 'eclectic'),
		(0,'Sam Smarf', 'ssmarf', '356 A Street', 'Beefy', 'PA', 19943, 'swimming'),
        (0,'Wendy Grog', 'wgrog', '900 Star Street', 'Mary', 'MD', 21340, 'wells'),
        (0,'Joe Jogger', 'jjogger', '183713 N North Street', 'Norther', 'WV', 51423, 'tarts');

SELECT count(*) AS total_users from users;

ALTER TABLE photograph
ADD COLUMN userid INT AFTER photoid;

ALTER TABLE photograph
MODIFY COLUMN userid INT NOT NULL;

INSERT INTO locations 
VALUES (0, 1, 'Independence Hall', 794.35, 651.43),
		(0, 2, '6709 Wonder Street', 323.41, 412.22),
		(0, 1, 'Sunrise', 221.45, 132.43),
		(0, 2, '356 A Street', 123.32, 222.43),
        (0, 1, 'Mountains', 34.12, 87.99),
        (0, 2, '900 Star Street', 1071.9, 206.45),
        (0, 1, 'Moonrise', 816.2, 111.2),
        (0, 2, '183714 N North Street', 176.11, 11.176);
        
INSERT INTO photograph 
VALUES (1, '1', 0),
		(2, '1', 0),
        (3, '3', 0),
        (4, '4', 0);
        
SELECT name FROM users;

SELECT name 
FROM users, photograph
WHERE users.userid = photograph.userid;

SELECT DISTINCT name
FROM users, photograph
WHERE users.userid = photograph.userid;