/*
Here I wanted to see which job posting sources had the most number of Data Analyst positions.

For each source, we will have total job postings, remote job postings, percentage of remote jobs, and postings containing salary data.
*/

SELECT
    job_via,

    COUNT(*) AS total_job_postings,

    SUM(
        CASE
            WHEN job_work_from_home IS TRUE THEN 1
            ELSE 0
        END
    ) AS remote_job_postings,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN job_work_from_home IS TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS remote_percentage,

    COUNT(salary_year_avg) AS postings_with_salary

FROM job_postings_fact

WHERE
    job_title_short = 'Data Analyst'
    AND job_via IS NOT NULL

GROUP BY job_via

ORDER BY total_job_postings DESC

LIMIT 20;