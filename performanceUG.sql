

-- 1.  COLLECTIONS report using c2b incoming payments data   (sld)

SELECT branch,date(payment_date),
sum(amount) AS grand_total,
sum(CASE when loan_balance<=0 THEN amount else 0 end) AS 'full',
sum(CASE when loan_balance>0 THEN amount else 0 end) AS 'partial',
(sum(CASE when loan_balance>0 THEN amount else 0 end)-4000000) AS DIF,
concat(round((sum(CASE when loan_balance>0 THEN amount else 0 end)/4000000)*100),'%') as rate,
Case 
WHEN round((sum(CASE when loan_balance>0 THEN amount else 0 end)/4000000)*100)<100 THEN 'MISSED'
Else 'HIT'
END AS TARGET
from sld
where date(payment_date)='2025-02-07'
group by branch,date(PAYMENT_DaTe)
order by branch; -- checking why its not running, troubleshoot
use recons; -- to enable it use the database called recons.

use recons;


-- 2.  total DISBURSEMENT report

select ugdisb_target.branch,coalesce(sum(ugdisb.amount_disbursed),0) as total_disbursed,ugdisb_target.disb_target,
((ugdisb_target.disb_target)-coalesce(sum(ugdisb.amount_disbursed),0)) as Diff,
 concat(round((coalesce(sum(ugdisb.amount_disbursed),0)/ugdisb_target.disb_target)*100),'%') as rate from ugdisb_target
 
left JOIN
   ugdisb
ON  ugdisb_target.branch=ugdisb.branch
AND date(ugdisb.disbursement_date)='2025-02-10'
group by ugdisb.branch,ugdisb_target.disb_target,ugdisb_target.branch
order by round((coalesce(sum(ugdisb.amount_disbursed),0)/ugdisb_target.disb_target)*100) desc;

use ug;
select*from ugdisb_target;

-- 3.  New customers (disb) perfomance

select ugdisb_target.branch,coalesce(count(amount_disbursed),0) as New_clients,(coalesce(count(amount_disbursed),0)-6) as DIFF,
concat(round((coalesce(count(amount_disbursed),0)/6)*100),'%') as rate,
CASE
WHEN round((coalesce(count(amount_disbursed),0)/6)*100)<100 THEN 'MISSED'
WHEN round((coalesce(count(amount_disbursed),0)/6)*100)>100 THEN 'HIT'
END AS 'Target'
from ugdisb_target
left JOIN new_disb ON new_disb.branch=ugdisb_target.branch
AND date(disbursement_date)='2025-02-06'
group by ugdisb_target.branch
order by coalesce(count(amount_disbursed),0) desc;


-- 4. Leads performance 

SELECT 
    ugdisb_target.branch,
    COALESCE(COUNT(leads.primary_mobile), 0) AS No_of_leads,
    ugdisb_target.leads_target,
    (ugdisb_target.leads_target - COALESCE(COUNT(leads.primary_mobile), 0)) AS Variance,
    CONCAT(ROUND((COALESCE(COUNT(leads.primary_mobile), 0) / NULLIF(ugdisb_target.leads_target, 0)) * 100), '%') AS rate
FROM ugdisb_target
LEFT JOIN leads 
    ON leads.branch_name = ugdisb_target.branch
    AND DATE(leads.added_date) = '2025-02-10'
GROUP BY ugdisb_target.branch, ugdisb_target.leads_target
ORDER BY ROUND((COALESCE(COUNT(leads.primary_mobile), 0) / NULLIF(ugdisb_target.leads_target, 0)) * 100) DESC;

select * from leads;
select * from new_disb;