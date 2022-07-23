-- Some fun with substrings and group by

SELECT
	SUBSTR(Country, 1, 1) as `Char`,
	COUNT(*) as `Count`,
    SUM(Cases) as `Cases`,
    SUM(Deaths) as `Deaths`
FROM covidata
WHERE Country NOT LIKE "%[b]"
GROUP BY `Char`
ORDER BY `Char` ASC;