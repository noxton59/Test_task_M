WITH RECURSIVE months(month, days_in_month) AS (
  VALUES (1, CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE) = 2 AND EXTRACT(YEAR FROM CURRENT_DATE) % 4 = 0 THEN 29 ELSE 28 END)
  UNION ALL
  SELECT month + 1,
         CASE month + 1
           WHEN 4 THEN 30
           WHEN 6 THEN 30
           WHEN 9 THEN 30
           WHEN 11 THEN 30
           ELSE 31
         END
  FROM months
  WHERE month < 12
)
SELECT month, days_in_month
FROM months;