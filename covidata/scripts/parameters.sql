-- Creating one table from another

-- DROP TABLE NoSumCovidata;

-- CREATE TABLE NoSumCovidata AS
-- 	SELECT * FROM covidata
-- 	WHERE Country NOT LIKE "%[b]";

-- World population parameters

SELECT "Countries" AS `Parameter`, COUNT(Country) AS `Value` FROM NoSumCovidata
UNION
SELECT "Total Cases", SUM(Cases) FROM NoSumCovidata
UNION
SELECT "Total Deaths", SUM(Deaths) FROM NoSumCovidata
UNION
SELECT "Mortality Rate", SUM(Deaths) / SUM(Cases) FROM covidata
UNION
SELECT "Avg Cases", AVG(Cases) FROM NoSumCovidata
UNION
SELECT "Avg Deaths", AVG(Deaths) FROM NoSumCovidata
UNION
SELECT "Max Cases", MAX(Cases) FROM NoSumCovidata
UNION
SELECT "Max Deaths", MAX(Deaths) FROM NoSumCovidata
UNION
SELECT "Min Cases", MIN(Cases) FROM NoSumCovidata
UNION
SELECT "Min Deaths", MIN(Deaths) FROM NoSumCovidata
UNION
SELECT "Top10Cases", SUM(t.Cases) FROM
	(SELECT * FROM NoSumCovidata
    ORDER BY Cases DESC
    LIMIT 10) t
UNION
SELECT "Top10CasesPct", SUM(t.Cases) / (SELECT SUM(Cases) FROM NoSumCovidata) FROM
	(SELECT * FROM NoSumCovidata
    ORDER BY Cases DESC
    LIMIT 10) t
UNION
SELECT "Top10Deaths", SUM(t.Deaths) FROM
	(SELECT * FROM NoSumCovidata
    ORDER BY Deaths DESC
    LIMIT 10) t
UNION
SELECT "Top10DeathsPct", SUM(t.Deaths) / (SELECT SUM(Deaths) FROM NoSumCovidata) FROM
	(SELECT * FROM NoSumCovidata
    ORDER BY Deaths DESC
    LIMIT 10) t
