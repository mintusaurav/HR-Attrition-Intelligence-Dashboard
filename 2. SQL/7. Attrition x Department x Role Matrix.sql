SELECT
    "Department",
    "JobRole",
    COUNT(*)                                                     AS total,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END)       AS left_count,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
    2)                                                           AS attrition_rate_pct,
    ROUND(AVG("MonthlyIncome"), 0)                              AS avg_income
FROM hr_attrition
GROUP BY "Department", "JobRole"
ORDER BY attrition_rate_pct DESC;