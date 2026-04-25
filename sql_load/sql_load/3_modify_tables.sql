
COPY company_dim
FROM 'C:\Users\PC\OneDrive\Desktop\Projects\sql project\csv_files-20260418T230540Z-3-001\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\PC\OneDrive\Desktop\Projects\sql project\csv_files-20260418T230540Z-3-001\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\PC\OneDrive\Desktop\Projects\sql project\csv_files-20260418T230540Z-3-001\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\PC\OneDrive\Desktop\Projects\sql project\csv_files-20260418T230540Z-3-001\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');