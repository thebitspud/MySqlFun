-- Returns a table of all courses and their overall averages

SELECT
	`Subject`,
    CONCAT(`Course`, `Detail`) AS `Course`,
    `Title`,
    `Enrolled`,
    `Avg`
FROM `combined-ubcv-2021`
WHERE `Section`="Overall"
ORDER BY `Enrolled` DESC;