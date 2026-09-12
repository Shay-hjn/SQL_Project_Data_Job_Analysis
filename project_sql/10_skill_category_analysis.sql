/*
Analyzing the different skill categories required for Data Analyst jobs.

For each skill category, I calculated number of job postings, number of different skills, and percentage of Data Analyst jobs related to that category.
*/

SELECT
    sd.type AS skill_category,

    COUNT(DISTINCT jp.job_id) AS job_postings,

    COUNT(DISTINCT sd.skills) AS number_of_skills,

    ROUND(
        100.0 * COUNT(DISTINCT jp.job_id)
        /
        (
            SELECT COUNT(*)
            FROM job_postings_fact
            WHERE job_title_short = 'Data Analyst'
        ),
        2
    ) AS percentage_of_data_analyst_jobs

FROM job_postings_fact jp

INNER JOIN skills_job_dim sjd
    ON jp.job_id = sjd.job_id

INNER JOIN skills_dim sd
    ON sjd.skill_id = sd.skill_id

WHERE
    jp.job_title_short = 'Data Analyst'
    AND sd.type IS NOT NULL

GROUP BY sd.type

ORDER BY job_postings DESC;