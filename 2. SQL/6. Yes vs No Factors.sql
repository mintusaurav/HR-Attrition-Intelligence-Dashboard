SELECT
    "Attrition",
    COUNT(*)                                  AS headcount,
    ROUND(AVG("JobSatisfaction"), 2)          AS avg_job_satisfaction,
    ROUND(AVG("MonthlyIncome"), 0)            AS avg_monthly_income,
    ROUND(AVG("YearsAtCompany"), 1)           AS avg_tenure_years,
    ROUND(AVG("WorkLifeBalance"), 2)          AS avg_work_life_balance,
    ROUND(AVG("DistanceFromHome"), 1)         AS avg_distance_from_home
FROM hr_attrition
GROUP BY "Attrition"
ORDER BY "Attrition" DESC;