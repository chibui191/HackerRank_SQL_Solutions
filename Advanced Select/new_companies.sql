SELECT 
    t.company_code, c.founder,
    t.lead_count, t.senior_count, 
    t.manager_count, t.employee_count
FROM (
    SELECT 
        company_code,
        COUNT(DISTINCT lead_manager_code) AS lead_count,
        COUNT(DISTINCT senior_manager_code) AS senior_count,
        COUNT(DISTINCT manager_code) AS manager_count,
        COUNT(DISTINCT employee_code) AS employee_count
    FROM employee
    GROUP BY company_code) t
LEFT JOIN company c
ON (t.company_code = c.company_code)
ORDER BY t.company_code;
    