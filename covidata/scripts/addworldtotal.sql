-- Add world total as row (without modifying table), then sort and return result accordingly

SELECT * FROM covidata
UNION
SELECT "World" AS Country, SUM(Deaths) AS `Deaths`, SUM(Cases) AS `Cases` FROM covidata
WHERE Country NOT LIKE "%[b]"
ORDER BY Deaths DESC, Cases DESC;