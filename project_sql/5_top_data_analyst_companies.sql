/*
Here I wanted to see which companies had the most number of Data Analys positions. For each company, we will have number of Data Analyst postings,
remote postings, postings containing salary data, and average advertised salary.
*/




SELECT
    c.name AS company_name,

    COUNT(*) AS total_job_postings,

    SUM(
        CASE
            WHEN j.job_work_from_home IS TRUE THEN 1
            ELSE 0
        END
    ) AS remote_job_postings,

    COUNT(j.salary_year_avg) AS postings_with_salary,

    ROUND(
        AVG(j.salary_year_avg)::NUMERIC,
        0
    ) AS avg_yearly_salary

FROM job_postings_fact AS j

INNER JOIN company_dim AS c
    ON j.company_id = c.company_id

WHERE j.job_title_short = 'Data Analyst'

GROUP BY c.company_id, c.name

ORDER BY total_job_postings DESC

LIMIT 20;