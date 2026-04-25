/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Used Query #3
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles
-- Used Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 30
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 15;

-- rewrote this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 30
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 15;

/*
RESULT SUMMARY
==============
The most optimal skills (high demand + high salary) include:

- Cloud & Data Platforms: Snowflake, Azure, AWS
- Programming & Analytics: Python, R
- BI & Visualization: Tableau, Power BI, Looker
- Databases: SQL, SQL Server, Oracle
- Foundational Tools: Excel, PowerPoint

KEY INSIGHT
===========
Cloud and data platform skills offer the highest salary potential. Snowflake, Azure, 
and AWS have lower demand than SQL or Excel, but they are associated with higher 
average salaries, suggesting that specialized platform knowledge creates a salary premium.

ADDITIONAL INSIGHT
==================
SQL has the highest demand in the dataset, but its average salary is lower than 
specialized cloud tools. This suggests that SQL is a foundational requirement for 
Data Analyst roles, while cloud and data platform skills are stronger differentiators 
for higher compensation.

BUSINESS TAKEAWAY
=================
To maximize both job opportunities and salary potential, candidates should:
- Master SQL and Excel as baseline skills
- Build strong analytical capability with Python
- Learn one BI tool such as Tableau or Power BI
- Add cloud/data platform knowledge such as Snowflake, Azure, or AWS

LIMITATION
==========
This analysis only includes remote Data Analyst roles with available salary data.
The demand_count threshold reduces noise from rare skills, but it may exclude niche 
skills that are high-paying but appear in fewer job postings.
*/