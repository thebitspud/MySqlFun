-- Returns a table of all courses and their overall averages

SELECT `Subject`,`Course`,`Title`,`Enrolled`,`Avg` FROM `combined-ubcv-2021`
WHERE `Section`="Overall"
ORDER BY `Enrolled` DESC;