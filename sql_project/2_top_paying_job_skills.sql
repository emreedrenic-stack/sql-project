/*
Question: What skills are required for the top-paying data analyst jobs?
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

    /*
RESULT SUMMARY
==============
- SQL appears most frequently among the top-paying Data Analyst roles
- Python is also highly demanded, especially in senior or technical analyst positions
- Tableau, Power BI, Excel, and cloud tools appear across several high-paying roles
- Some roles require broader data stack knowledge, including Snowflake, AWS, Azure, Databricks, and PySpark

KEY INSIGHT
===========
Top-paying Data Analyst roles are not limited to basic reporting skills. They often combine 
core analytics skills like SQL and Python with visualization tools, cloud platforms, and 
data infrastructure knowledge.

BUSINESS TAKEAWAY
=================
Candidates aiming for higher-paying Data Analyst roles should prioritize:
- SQL and Python as core technical foundations
- Visualization tools such as Tableau or Power BI
- Cloud/data platform exposure such as Snowflake, AWS, Azure, or Databricks

LIMITATION
==========
This analysis is based only on the top 10 highest-paying remote Data Analyst roles, 
so the findings show patterns among premium roles rather than the entire job market.
*/