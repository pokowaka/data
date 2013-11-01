-- Creates the dict table, loads all the csv files in them
-- Then removes all the non-english entries
-- And saves them as a csv
CREATE DATABASE IF NOT EXISTS pali;
use pali;
CREATE TABLE IF NOT EXISTS `dict` (
  `nr` int DEFAULT NULL,
  `lang` enum('C', 'E') DEFAULT NULL,
  `dict` char(1) DEFAULT NULL,
  `fuzzy` varchar(85) DEFAULT NULL,
  `word` varchar(85)  COLLATE utf8_unicode_ci DEFAULT NULL,
  `word1` varchar(85) DEFAULT NULL,
  `exp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
truncate dict;

CREATE TABLE IF NOT EXISTS `lt` (
  `word` varchar(85) DEFAULT NULL,
  `typ` varchar(85) DEFAULT NULL,
  `exp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `words` (
  `word` varchar(85) COLLATE utf8_unicode_ci  DEFAULT NULL,
  `source` char(1) DEFAULT NULL, 
  `exp` TEXT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Process the existing data
load data local infile 'dict_words_1.csv' into table dict character set utf8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
load data local infile 'dict_words_2.csv' into table dict character set utf8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
load data local infile 'leighb.csv' into table tp character set utf8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

-- Remove non english entries
delete from dict where dict not in ('I', 'P', 'V', 'N');

-- Save out a csv
select word, dict, exp INTO OUTFILE 'english.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
