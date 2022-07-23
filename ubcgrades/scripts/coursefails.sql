-- Returns a table of popular courses and their fail rates

SELECT
	`Subject`,
    CONCAT(`Course`, `Detail`) AS `Course`,
    `Title`,
    `Enrolled`,
    (`Enrolled` - `<50`) as `Pass`,
    `<50` as `Fail`,
    (`<50` / `Enrolled` * 100) as `Fail %`
FROM 
	(SELECT * FROM `combined-ubcv-2021`
    ORDER BY `Enrolled` DESC
	LIMIT 500) t
WHERE `Section`="Overall"
ORDER BY `<50` / `Enrolled` DESC;