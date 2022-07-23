-- Adding a ratio or percentage column to the table, then sorting by that ratio

SELECT *, Deaths / Cases AS `Mortality Rate` FROM covidata
ORDER BY `Mortality Rate` ASC;