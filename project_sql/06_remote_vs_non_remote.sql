/*
Comparing remote Data Analyst jobs with jobs that are not marked as remote.

For each group, I calculated total job postings, postings containing salary data, percentage of postings with salary data, and average yearly salary.
*/

SELECT

    CASE
        WHEN job_work_from_home IS TRUE
            THEN 'Remote'
        ELSE 'Not marked as remote'
    END AS work_setting,

    COUNT(*) AS total_job_postings,

    COUNT(salary_year_avg) AS postings_with_salary,

    ROUND(
        100.0 * COUNT(salary_year_avg) / COUNT(*),
        2
    ) AS salary_data_percentage,

    ROUND(
        AVG(salary_year_avg)::NUMERIC,
        0
    ) AS avg_yearly_salary

FROM job_postings_fact

WHERE job_title_short = 'Data Analyst'

GROUP BY
    CASE
        WHEN job_work_from_home IS TRUE
            THEN 'Remote'
        ELSE 'Not marked as remote'
    END

ORDER BY total_job_postings DESC;