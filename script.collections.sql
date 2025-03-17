SELECT 
    branch,
    date,
    SUM(amount) AS grand_total,
    SUM(CASE WHEN payment = 'full' THEN amount ELSE 0 END) AS full,
    SUM(CASE WHEN payment = 'partial' THEN amount ELSE 0 END) AS partial,
   (SUM(CASE WHEN payment = 'partial' THEN amount ELSE 0 END)-4000000)AS DIF,
  concat(round((SUM(CASE WHEN payment = 'partial' THEN amount ELSE 0 END)/4000000)*100),'%') AS rate,
  CASE
  WHEN (SUM(CASE WHEN payment = 'partial' THEN amount ELSE 0 END)/4000000)*100<100 THEN 'MISSED'
  ELSE 'HIT'
  END AS Target
FROM 
    sld
WHERE 
    date = '2025-01-15'
GROUP BY 
    branch, date
order by branch;


select * from sld;
-- collections report using c2b incoming payments data
-- The script is used to determine the rate of collection of our branches
-- month to date
select * from collections;
SELECT branch,
sum(amount) AS grand_total,
sum(CASE when loan_balance<=0 THEN amount else 0 end) AS 'full',
sum(CASE when loan_balance>0 THEN amount else 0 end) AS 'partial',
(sum(CASE when loan_balance>0 THEN amount else 0 end)-64000000) AS DIF,
concat(round((sum(CASE when loan_balance>0 THEN amount else 0 end)/64000000)*100),'%') as rate,
Case 
WHEN round((sum(CASE when loan_balance>0 THEN amount else 0 end)/64000000)*100)<100 THEN 'MISSED'
Else 'HIT'
END AS TARGET,
(sum(CASE when loan_balance>0 THEN amount else 0 end)-60800000) AS amount_to_95
from collections
group by branch
order by branch;
select *from sld;

SELECT branch,
sum(amount) AS grand_total,
sum(CASE when loan_balance<=0 THEN amount else 0 end) AS 'full',
sum(CASE when loan_balance>0 THEN amount else 0 end) AS 'partial',
(sum(CASE when loan_balance>0 THEN amount else 0 end)-80000) AS DIF,
concat(round((sum(CASE when loan_balance>0 THEN amount else 0 end)/80000)*100),'%') as rate,
Case 
WHEN round((sum(CASE when loan_balance>0 THEN amount else 0 end)/80000)*100)<100 THEN 'MISSED'
Else 'HIT'
END AS TARGET
from collections
where payment_date = '2025-01-20'
group by branch
order by branch;

SELECT payment_date 
FROM collections 
WHERE payment_date = '2025-01-20';

SELECT DISTINCT payment_date
FROM collections
WHERE DATE(payment_date) = '2025-01-20';




select* from collections;