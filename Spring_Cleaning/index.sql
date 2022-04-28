-- First Step: 
-- Create a new database
CREATE SCHEMA `shirts_db` ;

-- Second Step:
-- Create a new table
CREATE TABLE `shirts_db`.`shirts` (
  `shirt_id` INT NOT NULL,
  `article` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `shirt_size` VARCHAR(45) NULL,
  `last_worn` VARCHAR(45) NULL,
  PRIMARY KEY (`shirt_id`));

-- Third Step:
-- Populate the table with the following data
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('1', 't-shirt', 'white', 'S', '10');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('2', 't-shirt', '	green', 'S', '200');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('3', '	polo shirt', 'black', 'M', '10');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('4', '	tank top', 'blue', 'S', '50');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('5', 't-shirt', 'pink', 'S', '0');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('6', '	polo shirt', 'red', 'M', '5');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('7', '	tank top', 'white', 'S', '200');
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('8', '	tank top', 'blue', 'M', '15');

-- 1) Get all that data in there with a single line
SELECT * FROM shirts_db.shirts;

-- 2)Add a new shirt, purple polo shirt, size M last worn 50 days ago
INSERT INTO `shirts` (`shirt_id`, `article`, `color`, `shirt_size`, `last_worn`) VALUES ('9', 'polo shirt', 'purple', 'M', '50');

-- 3)SELECT all shirts but only print out article and color
SELECT article, color 
FROM shirts_db.shirts;

SELECT article, color 
FROM shirts;

-- 4)SELECT all medium shirts and print out everything but shirt_id
SELECT article, color, shirt_size, last_worn 
FROM shirts
where shirt_size = "M";

-- 5)Update all polo shirts Change their size to L

UPDATE shirts_db.shirts SET shirt_size = "L" WHERE shirt_id = 3;
UPDATE shirts_db.shirts SET shirt_size = "L" WHERE shirt_id = 6;
UPDATE shirts_db.shirts SET shirt_size = "L" WHERE shirt_id = 9;

-- 6)Update the shirt last worn 15 days ago change last_worn to zero ('0')
UPDATE shirts 
SET last_worn = 0
WHERE shirt_id = 8;

-- 7)Update all white shirts and change size to 'XS' and color to 'off white'
UPDATE shirts SET color = "off white", shirt_size = "XS" WHERE shirt_id = 1;
UPDATE shirts SET color = "off white", shirt_size = "XS" WHERE shirt_id = 7;

-- 8)Delete all old shirts that were last worn 200 days ago
DELETE FROM shirts
WHERE last_worn = 200;

-- 9)Delete all tank tops. Your tastes have changed...
DELETE FROM shirts
WHERE article="tank top";

-- 10)Delete all shirts. You are doing some major spring cleaning!
DELETE FROM shirts

-- 11)Drop the entire shirts table. Scraping everything... you must be rich or something!
DROP TABLE shirts