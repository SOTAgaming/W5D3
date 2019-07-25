DROP TABLE cattoys;
DROP TABLE cats;
DROP TABLE toys;


CREATE TABLE cats(
  id SERIAL PRIMARY KEY,
  name VARCHAR(300),
  color VARCHAR(300),
  breed VARCHAR(300)
);

CREATE TABLE toys(
  id SERIAL PRIMARY KEY,
  price FLOAT,
  color VARCHAR(300),
  name VARCHAR(300)
);

INSERT INTO cats(name, color, breed) 
VALUES
('Snowball', 'White', 'Persian'),
('Rex', 'Brown', 'Shorthair'),
('Roxy', 'Orange', 'Bengal'),
('Ironman', 'Red', 'Sphynx'),
('Batman', 'Black', 'Maine Coon'),
('Porkchop', 'Grey', 'Siberian'),
('Apple', 'Red', 'Bermese'),
('Pear', 'Brown', 'Bobtail'),
('Strawberry', 'Grey', 'Bombay'),
('Grape', 'Purple', 'Curl'),
('Peanut', 'Brown', 'Manx'),
('Butter', 'White', 'Angora'),
('Toast', 'Tan', 'Devon'),
('Peach', 'Pink', 'Somali'),
('Saphire', 'White', 'Munchkin');

INSERT INTO toys(price, color, name) 
VALUES
(5, 'Red', 'Ball'),
(7, 'Blue', 'Rope'),
(4, 'Green', 'Mouse'),
(11, 'Purple', 'Chewtoy'),
(3, 'Yellow', 'Banana'),
(6, 'Brown', 'Stick'),
(2, 'Blue', 'Yarn'),
(7, 'Orange', 'Slinky'),
(9, 'White', 'Yoyo'),
(12, 'Black', 'Piano'),
(13, 'Brown', 'Headphones'),
(20, 'Red', 'Box'),
(15, 'Blue', 'Tree'),
(16, 'Green', 'Cup'),
(21, 'Purple', 'Cord');


CREATE TABLE cattoys(
  id SERIAL PRIMARY KEY,
  cat_id INTEGER,
  toy_id INTEGER,
  FOREIGN KEY (cat_id) REFERENCES cats (id),
  FOREIGN KEY (toy_id) REFERENCES toys (id)
);

INSERT INTO cattoys(cat_id, toy_id)
VALUES
(1,5),
(2,6);

UPDATE toys
SET toys.color = 'Brown'
WHERE toys.id = 5;

DELETE from toys WHERE toys.name = 'Banana';

EXPLAIN SELECT * FROM cats WHERE cats.name = 'Snowball';

EXPLAIN SELECT toys.name 
FROM toys 
JOIN cattoys ON cattoys.toy_id = toys.id
JOIN cats ON cats.id = cattoys.cat_id
WHERE cats.name = 'Rex';

EXPLAIN ANALYZE SELECT toys.name 
FROM toys 
JOIN cattoys ON cattoys.toy_id = toys.id
JOIN cats ON cats.id = cattoys.cat_id
WHERE cats.name = 'Rex';

SELECT toys.name, cats.name
FROM toys, cats
-- JOIN cattoys ON cattoys.toy_id = toys.id
-- JOIN cats ON cats.id = cattoys.cat_id
WHERE cats.color = 'White' OR toys.color = 'White';

EXPLAIN UPDATE toys
SET color = 'Black'
WHERE toys.id = 5;

EXPLAIN DELETE from toys WHERE toys.name = 'Yarn';

EXPLAIN INSERT INTO cattoys(cat_id, toy_id)
VALUES 
(7, 1);


EXPLAIN ANALYZE SELECT toys.name 
FROM cats 
JOIN cattoys ON cattoys.toy_id = cats.id
JOIN toys ON toys.id = cattoys.toy_id
WHERE cats.name = 'Rex';