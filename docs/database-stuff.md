## cleaning out twice-migrated histories

```sql
DELETE FROM battery_histories
WHERE
	(date, coreid, `count`) IN(
		SELECT date,
			coreid,
			MIN(`count`)
		FROM
			battery_histories
		WHERE
			(date, coreid) IN(
				SELECT
					date,
					coreid
				FROM
					battery_histories
				GROUP BY
					date,
					coreid
				HAVING
					COUNT(date) > 1
			)
		GROUP BY
			date,
			coreid
	)
```