/*
Comparing Data Analyst jobs based on whether a degree was mentioned or not.

For each group, I calculated total job postings, postings containing salary data, average yearly salary, and percentage of remote jobs.
*/

SELECT

    CASE
        WHEN job_no_degree_mention IS TRUE
            THEN 'No degree mentioned'
        ELSE 'Degree status not flagged'
    END AS degree_category,

    COUNT(*) AS total_job_postings,

    COUNT(salary_year_avg) AS postings_with_salary,

    ROUND(
        AVG(salary_year_avg)::NUMERIC,
        0
    ) AS avg_yearly_salary,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN job_work_from_home IS TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS remote_percentage

FROM job_postings_fact

WHERE job_title_short = 'Data Analyst'

GROUP BY
    CASE
        WHEN job_no_degree_mention IS TRUE
            THEN 'No degree mentioned'
        ELSE 'Degree status not flagged'
    END

ORDER BY total_job_postings DESC;