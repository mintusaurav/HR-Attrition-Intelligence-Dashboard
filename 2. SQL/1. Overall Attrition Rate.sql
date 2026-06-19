SELECT
    COUNT(*)                                                     AS total_employees,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END)       AS employees_left,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
    2)                                                           AS attrition_rate_pct
FROM hr_attrition;