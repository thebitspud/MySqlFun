-- Returns a table of subjects and their overall fail rates

SELECT
	`Subject`,
    SUM(`Enrolled`) AS `Enrolled`,
    SUM(`Enrolled` - `<50`) AS `Pass`,
    SUM(`<50`) AS `Fail`,
    (SUM(`<50`) / SUM(`Enrolled`) * 100) AS `Fail %`
FROM `combined-ubcv-2021`
WHERE `Section`="Overall"
GROUP BY `Subject`
HAVING SUM(`Enrolled`) > 100
ORDER BY `Enrolled` DESC;