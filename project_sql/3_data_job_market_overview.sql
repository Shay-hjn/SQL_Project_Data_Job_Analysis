/*
Comparing Data Analyst, Data Scientist, and Data Engineer roles by number of job postings, number of postings that contan annual salary data, average annual salary, number of remote jobs, and percentage of postings marked remote.
*/

SELECT
    job_title_short,
    COUNT(*) AS total_job_postings,
    COUNT(salary_year_avg) AS postings_with_salary,

    ROUND(AVG(salary_year_avg)::NUMERIC, 0) AS avg_yearly_salary,

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
    ) AS remote_percentage

FROM job_postings_fact

WHERE job_title_short IN (
    'Data Analyst',
    'Data Scientist',
    'Data Engineer'
)

GROUP BY job_title_short

ORDER BY total_job_postings DESC;