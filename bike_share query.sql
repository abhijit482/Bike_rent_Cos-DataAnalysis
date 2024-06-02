USE bike_share
GO

WITH CTE AS (
SELECT *
FROM bike_share_yr_0

UNION ALL

SELECT *
FROM bike_share_yr_1)


SELECT dteday,
	   season,
	   a.yr,
	   weekday,
	   hr,
	   rider_type,
	   riders,
	   price,
	   COGS,
	   riders*price as revenue,
	   riders*price - COGS*riders as profit

FROM CTE AS a
LEFT JOIN cost_table b
ON a.yr = b.yr