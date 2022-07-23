-- Some basic SQL functionality

SELECT * FROM covidata
WHERE Cases > 1e+7
AND Country NOT LIKE "%[b]"
ORDER BY Deaths DESC, Cases ASC;