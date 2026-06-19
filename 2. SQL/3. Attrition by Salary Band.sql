SELECT
    CASE
        WHEN "MonthlyIncome" < 5000              THEN 'Low  (< $5K)'
        WHEN "MonthlyIncome" BETWEEN 5000 AND 10000 THEN 'Mid  ($5K–$10K)'
        ELSE                                          'High (> $10K)'
    END                                              AS salary_band,
    COUNT(*)                                         AS total,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
    2)                                               AS attrition_rate_pct
FROM hr_attrition
GROUP BY salary_band
ORDER BY attrition_rate_pct DESC;