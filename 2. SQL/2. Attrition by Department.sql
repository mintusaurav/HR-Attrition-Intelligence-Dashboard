SELECT
    "Department",
    COUNT(*)                                                     AS total,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END)       AS left_count,
    SUM(CASE WHEN "Attrition" = 'No'  THEN 1 ELSE 0 END)       AS stayed_count,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
    2)                                                           AS attrition_rate_pct
FROM hr_attrition
GROUP BY "Department"
ORDER BY attrition_rate_pct DESC;