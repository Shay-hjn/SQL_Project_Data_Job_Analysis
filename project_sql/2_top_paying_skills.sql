/*
Skills required for the top-paying data analyst jobs that are remote.
*/

WITH top_paying_jobs AS (
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact jp
LEFT JOIN company_dim cd ON jp.company_id = cd.company_id
WHERE 
    job_location = 'Anywhere'
    AND
    job_title_short = 'Data Analyst'
    AND 
    salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 10

)

SELECT
    skills,
    count (*) AS Number_of_appearance 
FROM 
    top_paying_jobs tpj, skills_job_dim sjd, skills_dim sd
WHERE
    tpj.job_id = sjd.job_id AND sjd.skill_id = sd.skill_id
ORDER BY 
    salary_year_avg DESC


