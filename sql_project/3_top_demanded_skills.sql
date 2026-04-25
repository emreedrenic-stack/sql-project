/*
Question: What are the most in-demand skills for data analysts?
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
RESULT SUMMARY
==============
Top 5 most in-demand skills for remote Data Analyst roles:

1. SQL — 7,291 postings
2. Excel — 4,611 postings
3. Python — 4,330 postings
4. Tableau — 3,745 postings
5. Power BI — 2,609 postings

KEY INSIGHT
===========
The most demanded skills combine core data handling tools (SQL, Excel), programming 
capability (Python), and business intelligence tools (Tableau, Power BI).

BUSINESS TAKEAWAY
=================
For aspiring Data Analysts, SQL should be the top priority, followed by Excel, Python, 
and at least one BI tool such as Tableau or Power BI.

LIMITATION
==========
This query focuses only on remote roles because job_work_from_home = TRUE.
*/