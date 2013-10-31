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
  `word` varchar(85) DEFAULT NULL,
  `word1` varchar(85) DEFAULT NULL,
  `exp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
truncate dict;


-- Process the existing data
load data local infile 'dict_words_1.csv' into table dict character set utf8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
load data local infile 'dict_words_2.csv' into table dict character set utf8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

-- Remove non english entries
delete from dict where dict not in ('I', 'P', 'V', 'N');

-- Save out a csv
select dict, fuzzy, word, word1, exp INTO OUTFILE 'english-dict.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
