create database Kenya;
USE KENYA;
create table disb
(UID int,full_name varchar(100),Branch varchar(100),Phone varchar(100),Amount_Disbursed int,Transaction_Code varchar(100),
Interest int,Amount_Repayable int,	Amount_Repaid int,Balance int,Disbursement_Date date,Disbursement_Time time,
Repayment_Date date,LO varchar(100),CO VARCHAR(100),application_mode VARCHAR(100),Status VARCHAR(100));


 
   -- 1. running collections
   
use kenya;
SELECT 
    distinct collections.branch,collections.payment_date,partial_targets,
    SUM(collections.amount) AS grand_total,
    SUM(CASE WHEN collections.loan_balance <= 0 THEN collections.amount ELSE 0 END) AS full,
    SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) AS partial,
    (SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) - (collections_targets .partial_targets)) AS DIF,
    CONCAT(ROUND((SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) / (collections_targets .partial_targets)) * 100), '%') AS rate,
    CASE 
        WHEN ROUND((SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) / (collections_targets .partial_targets) * 100)) < 100 THEN 'MISSED'
        ELSE 'HIT'
    END AS TARGET
FROM 
    collections
JOIN 
    collections_targets 
ON 
    collections.branch = collections_targets.branch
WHERE collections.payment_date between '2025-01-20' and '2025-01-20'
GROUP BY 
    collections.branch, collections.payment_date,collections_targets.partial_targets
ORDER BY 
    collections.branch;
    use kenya;
 
 
 
 
    
    
    -- 2. running disb
    
    SELECT 
    disb.branch,
    disb.disbursement_date,
    SUM(disb.AMOUNT_DISBURSED) AS total_disbursed,
    dist.DAILY_D_TARGET,
    (dist.DAILY_D_TARGET - SUM(disb.AMOUNT_DISBURSED)) AS DIF,
    CONCAT(ROUND((SUM(disb.AMOUNT_DISBURSED) / dist.DAILY_D_TARGET) * 100), '%') AS rate
FROM 
    disb
JOIN 
    dist ON disb.branch = dist.branch
WHERE 
    disb.disbursement_date = '2025-01-20' -- Filter for the specific date
GROUP BY 
    disb.branch, disb.disbursement_date, dist.DAILY_D_TARGET
ORDER BY 
    disb.branch;
  
        
    
  -- 3. running new loans report
  
   SELECT 
    newdis.branch,
    SUM(newdis.amount_disbursed) AS total_disbursed,         -- Total amount disbursed per branch
    SUM(newdis.Amount_Repaid) AS total_repaid,               -- Total amount repaid per branch
    COUNT(newdis.Amount_Repaid) AS total_count,              -- Total count of repaid entries per branch
    newdistar.daily_target,                                  -- Daily target for the branch
    (newdistar.daily_target - COUNT(newdis.Amount_Repaid)) AS variance, -- Variance: daily_target - total_count
    newdis.disbursement_date,                                -- Disbursement date
    newdis.application_mode                                  -- Application mode
FROM 
    newdis
JOIN 
    newdistar 
ON 
    newdis.branch = newdistar.branch
WHERE 
    newdis.disbursement_date BETWEEN '2025-01-25' AND '2025-01-25'
GROUP BY 
    newdis.branch, 
    newdis.disbursement_date, 
    newdistar.daily_target, 
    newdis.application_mode
ORDER BY 
    newdis.branch; 
    
 
 -- 4.running leads    

SELECT 
    leads.branch_name,
    DATE(leads.added_date) AS added_date, -- Ensure consistent date format
    COUNT(leads.primary_mobile) AS total_primary_mobile, -- Count unique primary numbers
    leads_target.daily_target AS daily_targett,
    (leads_target.daily_target - COUNT(leads.primary_mobile)) AS difference, -- Target difference
    CONCAT(
        ROUND(
            (COUNT(leads.primary_mobile) / NULLIF(leads_target.daily_target, 0)) * 100, 2
        ), '%'
    ) AS rate -- Avoid division by zero
FROM 
    leads
JOIN 
    leads_target 
ON 
    LOWER(TRIM(leads.branch_name)) = LOWER(TRIM(leads_target.branch))
WHERE 
    DATE(leads.added_date) between '2025-01-25' and '2025-01-25'
GROUP BY 
    leads.branch_name, 
    DATE(leads.added_date),
    leads_target.daily_target
ORDER BY 
    leads.branch_name;
    
    create table leads_target (
BRANCH varchar(100),Daily_Target int);	
alter table leads_target
modify column BRANCH varchar(100) unique;
use kenya;
   select count(*) from leads_target;
    


-- 5.running interactions
    SELECT 
    interactions.branch,
    interac.INTERACTION_TARGET,
    COUNT(*) AS interactions_done,(interaction_target-count(*))as Dif,
    concat(round((count(*)/interaction_target)*100),'%')as rate
FROM 
    interactions
 JOIN 
    interac 
ON 
    interactions.branch = interac.branch
WHERE 
    DATE(interactions.date) between '2025-01-20' and '2025-01-20'
GROUP BY 
    interactions.branch, 
    interac.INTERACTION_TARGET
    order by branch;
    
    
    
-- For Uploading large files

    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/leads.csv'  
INTO TABLE leads  
FIELDS TERMINATED BY ','   
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS;



-- For upload files with more mixed texts like interactions;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/interactions.csv' 
INTO TABLE interactions 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS
(ID, Customer_Name, branch,Interaction_Mode, Date, Agent, Outcome_Details, Next_Interaction);



