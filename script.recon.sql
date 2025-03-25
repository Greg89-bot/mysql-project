
-- RECONCILING FOR DISCREPANCYYS

SELECT transactionid,paydate,pnumber,cname,xd.amount as statement_amount,branch,transaction_code,sld.amount as superL_amount,
(xd.amount-sld.amount) AS recon_amount,
CASE
WHEN pnumber LIKE '7%' THEN 'Airtel'
WHEN pnumber LIKE '_______7%' THEN 'MTN'
ELSE 'FOREIGN_PAYER_NUMBER'
END AS 'Provider'
from xD
JOIN sld ON xd.transactionid=sld.transaction_code
WHERE DATE(PAYDATE) between '2025-01-23' and '2025-01-26'; 
-- PRINTS RECON FOR UG PAYMENTS.


select * from xd where transactionid not in (select transaction_code from sld) and
DATE(PAYDATE) between '2025-01-24' and '2025-01-26';
USE RECONS;


  -- running disb
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
    disb.disbursement_date = '2025-01-26' -- Filter for the specific date
GROUP BY 
    disb.branch, disb.disbursement_date, dist.DAILY_D_TARGET
ORDER BY 
    disb.branch;
  
  
  -- running collections
SELECT 
    collections.branch,collections.payment_date,
    SUM(collections.amount) AS grand_total,
    SUM(CASE WHEN collections.loan_balance <= 0 THEN collections.amount ELSE 0 END) AS full,
    SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) AS partial,
    (SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) - (targets.partial_targets)) AS DIF,
    CONCAT(ROUND((SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) / (targets.partial_targets)) * 100), '%') AS rate,
    CASE 
        WHEN ROUND((SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) / (targets.partial_targets) * 100)) < 100 THEN 'MISSED'
        ELSE 'HIT'
    END AS TARGET
FROM 
    collections
JOIN 
    targets 
ON 
    collections.branch = targets.branch
 where    collections.payment_date between '2025-01-26' and '2025-01-26'
GROUP BY 
    collections.branch, collections.payment_date,targets.partial_targets
ORDER BY 
    collections.branch














