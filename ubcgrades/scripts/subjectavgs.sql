-- Returns a table of all subjects and their averages across all courses
-- Average takes number of students enrolled into account

SELECT
	`Subject`,
    SUM(`Enrolled`) AS `Enrolled`,
    SUM(`Avg` * `Enrolled`) / SUM(`Enrolled`) AS `Overall Average`
FROM `combined-ubcv-2021`
WHERE `Section`="Overall"
GROUP BY `Subject`
ORDER BY `Subject` ASC;