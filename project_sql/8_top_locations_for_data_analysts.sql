/*
Here I wanted to see which locations had the most number of Data Analyst positions.

For each location, we will have total job postings, postings containing salary data, and average yearly salary.
*/
SELECT
    job_location,

    COUNT(*) AS total_job_postings,

    COUNT(salary_year_avg) AS postings_with_salary,

    ROUND(
        AVG(salary_year_avg)::NUMERIC,
        0
    ) AS avg_yearly_salary

FROM job_postings_fact

WHERE
    job_title_short = 'Data Analyst'
    AND job_location IS NOT NULL
    AND job_location <> 'Anywhere'

GROUP BY job_location

ORDER BY total_job_postings DESC

LIMIT 20;