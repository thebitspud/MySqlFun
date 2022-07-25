-- Table that assigns ranks to courses by enrollment within their subject
CREATE TEMPORARY TABLE IF NOT EXISTS CourseRanks AS (
	SELECT *,
		ROW_NUMBER() OVER (
			PARTITION BY `Subject`
			ORDER BY `Enrolled` DESC
		) AS `Rank`
	FROM `combined-ubcv-2021`
	WHERE `Section`="Overall"
); -- Execute to create `CourseRanks`

DROP TABLE CourseRanks; -- Execute to delete `CourseRanks`

-- Table that orders subjects by enrollment in their top 3 courses
CREATE TEMPORARY TABLE IF NOT EXISTS SubjectRanks AS (
	SELECT `Subject`, SUM(`Enrolled`) AS `Enrolled` FROM CourseRanks
	WHERE `Rank` <= 3
	GROUP BY `Subject`
	ORDER BY SUM(`Enrolled`) DESC
); -- Execute to create `SubjectRanks`

DROP TABLE SubjectRanks; -- Execute to delete `SubjectRanks`

SELECT * FROM SubjectRanks;

-- Selects the top 3 courses (by enrollment) from each subject,
-- sorted by total enrollment in top 3 courses of that subject
-- using inner join
SELECT
	CourseRanks.`Subject`,
    CONCAT(CourseRanks.`Course`, CourseRanks.`Detail`) AS `Course`,
    CourseRanks.`Title`,
    CourseRanks.`Enrolled`,
    SubjectRanks.`Enrolled` as `Subject Total`
FROM CourseRanks
INNER JOIN SubjectRanks
ON CourseRanks.`Subject`=SubjectRanks.`Subject`
WHERE CourseRanks.`Rank` <= 3
ORDER BY `Subject Total` DESC, `Subject` ASC, `Enrolled` DESC;