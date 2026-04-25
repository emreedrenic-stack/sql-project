/*
Answer: What are the top skills based on salary?
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
RESULT SUMMARY
==============
Top-paying skills for remote Data Analyst roles are concentrated around:
- Big data tools: PySpark, Databricks, Scala
- Data science / ML tools: DataRobot, Jupyter, Pandas, NumPy, Scikit-learn
- Engineering & deployment tools: GitLab, Kubernetes, Airflow, Jenkins
- Cloud platforms: GCP

KEY INSIGHT
===========
The highest-paying Data Analyst skills are not only traditional analytics tools.
They lean toward data engineering, machine learning, and cloud-based analytics, suggesting
that higher compensation is linked to more technical and infrastructure-oriented skill sets.

BUSINESS TAKEAWAY
=================
Candidates aiming for higher-paying Data Analyst roles should build beyond SQL and Excel by adding:
- Python libraries such as Pandas, NumPy, and Scikit-learn
- Big data tools such as PySpark or Databricks
- Cloud/data infrastructure exposure such as GCP, Airflow, or Kubernetes

LIMITATION
==========
This analysis ranks skills by average salary, but it does not account for how frequently
each skill appears. Some high-paying skills may be based on a small number of job postings.
*/