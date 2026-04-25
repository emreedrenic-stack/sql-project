/*
Question: What are the top-paying data analyst jobs?
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
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
LIMIT 10;

/*
RESULT SUMMARY
==============
- Top salaries range from $184K to $650K
- Majority of high-paying roles are senior positions (Director, Principal)
- Remote opportunities exist even at very high salary levels
- Top companies include Meta, AT&T, SmartAsset

KEY INSIGHTS
===========
-High-paying data analyst roles are strongly correlated with seniority and specialization, rather than standard analyst titles.
-While labeled as "Data Analyst", the highest-paying roles are often hybrid or senior positions 
(e.g., Director of Analytics, Principal Data Analyst), indicating that top salaries are tied 
to strategic responsibility rather than purely analytical tasks.
-The presence of extremely high salaries (e.g., $650K) suggests potential outliers or 
non-standard compensation structures (e.g., executive roles or total compensation including bonuses/equity).

BUSINESS TAKEAWAY
=================
Candidates aiming for top salaries should focus on:
- Move beyond entry-level analytics into roles with business ownership
- Develop skills in decision-making, stakeholder management, and strategy
- Specialize in high-impact domains (e.g., marketing analytics, performance optimization)

LIMITATION
==========
The dataset may include inconsistencies in job titles and salary reporting, 
which could affect the accuracy of conclusions regarding compensation levels.
*/