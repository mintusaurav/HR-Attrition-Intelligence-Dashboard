SELECT
    CASE
        WHEN "YearsAtCompany" BETWEEN 0 AND 2   THEN '0–2 Years  (Early)'
        WHEN "YearsAtCompany" BETWEEN 3 AND 5   THEN '3–5 Years  (Growing)'
        WHEN "YearsAtCompany" BETWEEN 6 AND 10  THEN '6–10 Years (Established)'
        ELSE                                          '10+ Years  (Senior)'
    END                                              AS tenure_bucket,
    COUNT(*)                                         AS total,
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(
        SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
    2)                                               AS attrition_rate_pct
FROM hr_attrition
GROUP BY tenure_bucket
ORDER BY attrition_rate_pct DESC;