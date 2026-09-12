

/*
Analyzing data Analyst hirings, changed month by month.

For each month I calculated 3 things:
total Data Analyst postings
remote Data Analyst postings
average advertised annual salary
*/



SELECT
    DATE_TRUNC('month', job_posted_date)::DATE AS posting_month,

    COUNT(*) AS total_job_postings,

    SUM(
        CASE
            WHEN job_work_from_home IS TRUE THEN 1
            ELSE 0
        END
    ) AS remote_job_postings,

    ROUND(
        AVG(salary_year_avg)::NUMERIC,
        0
    ) AS avg_yearly_salary

FROM job_postings_fact

WHERE job_title_short = 'Data Analyst'

GROUP BY DATE_TRUNC('month', job_posted_date)

ORDER BY posting_month;