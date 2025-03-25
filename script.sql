use PRODSALE; -- first
select COUNT(*) from products; -- github editor
SELECT CATEGORY, AVG(unit_price) AS AVGunitprice from products --trial
ORDER BY (AVGunitprice) DESC
Group by category
Limit 1;
use recons;
select * from xd
where cname LIKE 'SIMPLE%' AND AMOUNT>1;
select count(*) from xd where TransactionID IN (select transaction_code from sld) AND DATE(PayDate) ='2024-10-22';
select count(*) from sld where transaction_code NOT IN (select TransactionID from xd);
use recons;
ALTER TABLE xd
MODIFY Amount VARCHAR(100);
ALTER TABLE xd
MODIFY TransactionID VARCHAR(100) UNIQUE;
SELECT count(*) FROM XD;
Describe xd;
SHOW INDEX FROM xd;
ALTER TABLE xd
MODIFY cname VARCHAR(100);
ALTER TABLE xd DROP INDEX TransactionID;
SELECT*FROM XD;
select count(*)from xd
where DATE(PayDate) ='2024-10-22';
select * from xd where TransactionID NOT IN (select transaction_code from sld) AND DATE(PayDate) ;
select count(*) from sld where transaction_code NOT IN (select TransactionID from xd);

select DATE(PayDate),Xd_ID,Pnumber,TransactionID,xd.amount AS X_amount,transaction_code,sld.amount AS SL_amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID
where Date(PayDate)='2024-10-30';
AND (xd.amount-sld.amount) !=0;
select count(*) from xd where DATE(paydate)='2024-10-29';
select *from xd
where Pnumber NOT LIKE '7%' AND Pnumber NOT LIKE '_______7%' AND cname NOT LIKE 'SIMP%';
select * from xd;
AND Date(PayDate) ='2024-10-29';
select * from sld where Date(payment_date)='2024-10-29';
AlTER table sld
MODIFY transaction_code varchar(100) Primary key;
SELECT Transaction_code, payment_date, Amount, COUNT(*) AS occurrences
FROM sld
GROUP BY Transaction_code, payment_date, Amount
HAVING occurrences > 1;
DELETE from sld
where Date(payment_date)='2024-10-29';
SET SQL_SAFE_UPDATES = 0;
select * from sld;
where Date(payment_date)='2024-10-29';
SET SQL_SAFE_UPDATES=1;
use xd;
ALTER TABLE xd
ADD Xd_ID INT AUTO_INCREMENT,
ADD UNIQUE (Xd_ID);
SELECT count(*) FROM xd;
where Date(paydate)='2024-10-25';
OPTIMIZE TABLE xd;
SELECT * FROM xd;
REPAIR TABLE xd;
SHOW TABLE STATUS LIKE 'xd';
CHECK TABLE xd;
ALTER TABLE xd
MODIFY COLUMN XD_ID INT AUTO_INCREMENT FIRST;
ALTER TABLE xd
MODIFY COLUMN CNAME VARCHAR(100) AFTER TransactionID;
select count(*) from sld
where Date(payment_date)='2024-10-30';
ALTER Table xd
RENAME TO MTNxd;
select * from mtnxd
where Date(paydate)='2024-10-30';
ALTER TABLE mtnxd
RENAME column TransactionID TO ID;
Alter table mtnxd
modify column amount int AFTER cname;
use recons;
create table Airtelxd (
Transaction_ID varchar (100),Transaction_Date datetime,	Sender_Mobile_Number varchar (100),
Transaction_Amount int, Payer_Details varchar(100));
select*from airtelxd;
LOAD DATA INFILE 'airtelxd.csv'
INTO TABLE airtelxd
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Transaction_ID,Transaction_date, sender_mobile_number,Transaction_amount,Payer_Details)
SET Transaction_date = STR_TO_DATE(Transaction_date, '%d/%m/%Y');
SEt SQL_SAFE_UPDATES =0;
LOAD DATA INFILE '/path/to/secure_directory/airtelxd.csv'
INTO TABLE airtelxd
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Transaction_ID, Transaction_date, sender_mobile_number, Transaction_amount, Payer_Details)
SET Transaction_date = STR_TO_DATE(Transaction_date, '%d/%m/%Y');
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airtelxd.csv'
INTO TABLE airtelxd
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Transaction_ID, Transaction_date, sender_mobile_number, Transaction_amount, Payer_Details)
SET Transaction_date = STR_TO_DATE(Transaction_date, '%d/%m/%Y');
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airtelxd.csv'
INTO TABLE airtelxd
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Transaction_ID, Transaction_date, sender_mobile_number, Transaction_amount, Payer_Details)
SET Transaction_date = STR_TO_DATE(Transaction_date, '%d/%m/%Y');
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airtelxd.csv'
INTO TABLE airtelxd
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Transaction_ID, Transaction_date, sender_mobile_number, Transaction_amount, Payer_Details)
SET Transaction_date = STR_TO_DATE(Transaction_date, '%d-%m-%Y');
select COUNT(*) from sld where transaction_code NOT IN (select ID from mtnxd) AND 
transaction_code Not in (select Transaction_ID from airtelxd) and Date(payment_date)='2024-10-30'; 
select * from airtelxd where transaction_id Not IN (SELECT transaction_code FROM SLD) AND Date(transaction_date)='2024-10-30';
SELECT * FROM MTNXD WHERE Date(paydate)='2024-10-30';
ALTER TABLE MTNXD
DROP COLUMN XD_ID;
select *from sld;

CREATE EVENT daily_discrepancy_alert
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 12:35:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
      DATE(xd.PayDate),
      xd.Pnumber,
      xd.TransactionID,
      xd.amount AS xd_amount,
      xd.transaction_code,
      sld.amount AS sld_amount,
      (xd.amount - sld.amount) AS Recon_Amount
  FROM sld
  JOIN xd ON sld.transaction_code = xd.TransactionID
  WHERE 
      (xd.amount - sld.amount) != 0
      OR xd.Pnumber IN (
          SELECT Pnumber
          FROM xd
          GROUP BY Pnumber
          HAVING COUNT(*) > 3
      )
      OR xd.amount > 500000;
      
      use recons;
  drop table airtelxd;
  ALTER table MTNXD
  RENAME XD;
  DELETE FROM xd;
  SELECT *FROM xd;
  SET SQL_SAFE_UPDATES=1;
  ALTER TABLE SLD
  modify status varchar(50);
  ALTER TABLE xd
  rename column id to TransactionID;
  alter table xd
  modify column PayDate varchar(50);
  use recons;
  create table discrepancy_alerts (
  PayDate Varchar(500),Pnumber Varchar(100),TransactionID Varchar(100),xd_amount int, transaction_code Varchar(100),sld_amount int,
Recon_Amount INT GENERATED ALWAYS AS (xd_amount - sld_amount) STORED);
  
  
select count(*) from sld;

select * from xd where TransactionID NOT IN (select transaction_code from sld) ;
select count(*) from sld where transaction_code NOT IN (select TransactionID from xd);

select (PayDate),TransactionID,Pnumber,xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;

SELECT * FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';
select * from discrepancy_alerts;

SELECT LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';

use recons;
ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 1:20:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;

select* from discrepancy_alerts;
SELECT LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';

ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 13:05:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
      (xd.PayDate),
      xd.Pnumber,
      xd.TransactionID,
      xd.amount AS xd_amount,
      xd.transaction_code,
      sld.amount AS sld_amount,
      (xd.amount - sld.amount) AS Recon_Amount
  FROM sld
  JOIN xd ON sld.transaction_code = xd.TransactionID;

SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';



INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
SELECT 
    PayDate,
    Pnumber,
    TransactionID,
    xd.amount,
    transaction_code,
    sld.amount,
    (xd.amount - sld.amount) AS Recon_Amount
FROM sld
JOIN xd ON sld.transaction_code = xd.TransactionID;



select * from discrepancy_alerts;


Alter table discrepancy_alerts
modify column Recon_Amount varchar(100); 


ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 13:45:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;


Alter table discrepancy_alerts
modify column discr_ID int auto_increment FIRST;


SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';

select count(*) from discrepancy_alerts;
select * from xd where TransactionID NOT IN (select transaction_code from sld) ;
use recons;
create table Not_uploaded (
Transaction_ID varchar(100),PayDate varchar (100),Pnumber varchar(100),cname varchar(100), amount int);

CREATE EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 16:20:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
      OR xd.Pnumber IN (
          SELECT Pnumber
          FROM xd
          GROUP BY Pnumber
          HAVING COUNT(*) > 3
      )
      OR xd.amount > 500000;

select* from not_uploaded;
Drop table not_uploaded;
create table not_uploaded (
PayDate varchar (100), Pnumber varchar(100), TransactionID  varchar(100), xd_amount int, transaction_code varchar(100), 
sld_amount int, Recon_Amount varchar(100));

select * from not_uploaded;


SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';

Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 16:50:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
      OR xd.Pnumber IN (
          SELECT Pnumber
          FROM xd
          GROUP BY Pnumber
          HAVING COUNT(*) > 3
      )
      OR xd.amount > 500000;
select* from not_uploaded;

Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 16:50:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
      OR xd.Pnumber IN (
          SELECT Pnumber
          FROM xd
          GROUP BY Pnumber
          HAVING COUNT(*) > 3
      )
      OR xd.amount > 500000;
select* from not_uploaded;

Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 17:30:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
            
select* from discrepancy_alerts;
delete  from discrepancy_alerts;
set sql_safe_updates =1;




Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 12:00:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
            
            

ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 12:00:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;


select *from not_uploaded;
delete from sld;
use recons;
alter table xd
modify column Paydate datetime;
ALTER TABLE sld
MODIFY mobile_number VARCHAR(255) NULL;
set sql_safe_updates =1;


SHOW VARIABLES LIKE 'event_scheduler';
SHOW EVENTS;



INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
FROM xd 
LEFT JOIN sld ON xd.TransactionID = sld.transaction_code
WHERE 
  TransactionID NOT IN (SELECT transaction_code FROM sld) OR
  (xd.amount - sld.amount) != 0
  OR xd.amount > 1000000;
  
  select* from not_uploaded;
  
  
  Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 12:15:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
            delete from not_uploaded;
select count(*)from xd;
SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_not_uploaded';

SELECT @@global.time_zone, @@session.time_zone;
SHOW EVENTS;

SELECT NOW();
SELECT @@global.time_zone, @@session.time_zone;
SET SESSION time_zone = '+03:00';





delete from sld where date(payment_date)= '2024-11-02';
set sql_safe_updates =1;
SET GLOBAL time_zone = '+03:00';

delete from not_uploaded;
select *from discrepancy_alerts;


Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 13:22:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
            
ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 13:21:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;

select *from not_uploaded;

SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN 
  sld ON xd.TransactionID=sld.transaction_code
  WHERE 
transactionid NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
select count(*) from xd;
select * from sld where transaction_code NOT IN (select TransactionID from xd);


Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 16:30:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
    transaction_code NOT IN (select TransactionID from xd) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
            
ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 16:00:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;


ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 11:00:00')
DO
  INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID;

Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 11:05:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
    transaction_code NOT IN (select TransactionID from xd) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;

select  *from not_uploaded;
SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_not_uploaded';

SHOW CREATE EVENT daily_not_uploaded;
SHOW VARIABLES LIKE 'log_error';
SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
(xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
select * from xd where TransactionID NOT IN (select transaction_code from sld);
select * from sld where transaction_code NOT IN (select TransactionID from xd);
SELECT @@global.time_zone, @@session.time_zone;

SELECT EVENT_NAME, STATUS
FROM information_schema.EVENTS 
WHERE EVENT_NAME = 'daily_discrepancy_alerts';
SHOW GLOBAL STATUS LIKE 'Uptime';
SHOW CREATE EVENT daily_discrepancy_alert;
SHOW FULL PROCESSLIST;

SET GLOBAL event_scheduler = OFF;
SET GLOBAL event_scheduler = ON;



Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURRENT_DATE, ' 11:05:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
    transaction_code NOT IN (select TransactionID from xd) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;

select  *from not_uploaded;
SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_not_uploaded';


Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT('2024-11-05', ' 09:10:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
    transaction_code NOT IN (select TransactionID from xd) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT('2024-11-05', ' 10:00:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
    transaction_code NOT IN (select TransactionID from xd) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
set sql_safe_updates=1;          
delete from not_uploaded;
select count(*) from sld;

SHOW VARIABLES LIKE 'event_scheduler';
SELECT NOW();

Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 DAY
STARTS '2024-11-05 10:50:00'
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
    transaction_code NOT IN (select TransactionID from xd) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;
            
INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
FROM xd 
LEFT JOIN sld ON xd.TransactionID = sld.transaction_code
WHERE 
  TransactionID NOT IN (SELECT transaction_code FROM sld) OR
  transaction_code NOT IN (SELECT TransactionID FROM xd) OR
  (xd.amount - sld.amount) != 0 OR
  xd.amount > 1000000;
  

SHOW EVENTS FROM recon
use recons;
select  *from discrepancy_alerts;
SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_not_uploaded';


truncate table not_uploaded;



select * from xd where TransactionID NOT IN (select transaction_code from sld);
select * from sld where transaction_code NOT IN (select TransactionID from xd) AND 
Date(payment_date)= CURRENT_DATE - 1;

SHOW VARIABLES LIKE 'event_scheduler';
SHOW VARIABLES LIKE 'log_error';

INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000;

select *from not_uploaded;
select * from xd where Pnumber NOT LIKE '_______7%' AND pnumber NOT LIKE '7%' AND cname NOT LIKE 'SIM%' AND 
date(paydate) ='current_date'-1;

select * from xd where TransactionID NOT IN (select transaction_code from sld);

select * from xd where Date(paydate)='2024-11-07';


set sql_safe_updates=0;

create database BtoC;
use BtoC;
create table XB2C (
TxnCode varchar (50), Disbursed_Date datetime, From_Number Varchar (50), To_Number Varchar (50), 
Amount int, Fee int, Client_Name varchar (100));
ALter table xb2c
modify fee varchar (100);
delete  from  xb2c;
SHOW COLUMNS FROM xb2c LIKE 'fee';

ALTER TABLE xb2c MODIFY fee INT DEFAULT NULL;
alter table slc2b
Rename slb2c;

use btoc;
create table SLC2B (
uid int, full_name varchar(100), Branch varchar(100), Phone varchar(100), Amount_Disbursed int, transaction_code varchar(100),
Disbursed_By varchar(100),Interest int,	Amount_Repayable int, Amount_Repaid int, Balance int, Disbursement_Date Datetime,
Repayment_Date datetime, LO varchar(100), CO varchar(100),	application_mode varchar(100), Status varchar(100));

select * from xb2c where Txncode  NOT IN (select transaction_code from slb2c);
SELECT To_number, COUNT(*) AS disbursement_count
FROM xb2c
GROUP BY To_number
HAVING disbursement_count > 1;
use btoc;
SELECT To_number, client_name, amount, COUNT(*) AS disbursement_count
FROM xb2c
GROUP BY To_number
HAVING disbursement_count > 1;
select*from xb2c;
SELECT To_number, COUNT(*) AS disbursement_count
FROM xb2c
Group by to_number
having disbursement_count > 1;

SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_discrepancy_alert';

set sql_safe_updates=1;

select * from not_uploaded;
select  count(*) from discrepancy_alerts;

-- discrepancy_alert event
ALTER Event daily_discrepancy_alert 
ON SCHEDULE EVERY 1 hour
STARTS CONCAT(CURRENT_DATE, ' 12:00:00')
DO
INSERT INTO discrepancy_alerts (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
SELECT  
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount from sld
join xd ON sld.transaction_code=xd.TransactionID 
where Date(PayDate) = current_date-1;

select count(*) from (select distinct PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount
 from discrepancy_alerts) as d ;

-- not_uploaded event
Alter EVENT daily_not_uploaded
ON SCHEDULE EVERY 1 hour
STARTS CONCAT(CURRENT_DATE, ' 12:20:00')
DO
  INSERT INTO not_uploaded (PayDate, Pnumber, TransactionID, xd_amount, transaction_code, sld_amount, Recon_Amount)
  SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	(TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000 )
            AND Date(PayDate)=current_date-1;
            
select count(*) from  discrepancy_alerts where Date(PayDate)='2024-11-19';


select count(*) from not_uploaded where date(PayDate)='2024-11-19';

SELECT EVENT_NAME, STATUS, LAST_EXECUTED
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_NAME = 'daily_not_uploaded';

SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	(TransactionID NOT IN (select transaction_code from sld) OR
      (xd.amount - sld.amount) != 0
            OR xd.amount > 1000000) AND Date(PayDate)=current_date-1;

alter event Truncater
ON schedule every 1 day
starts concat(current_date, ' 22:00:00')
Do
truncate table not_uploaded;

select *from not_uploaded where date(PayDate)='2024-11-19';
SET GLOBAL event_scheduler = ON;

-- START

-- This is the recon data.
-- It identifies transactions present in both the statement and the superlender records, 
-- calculates differences in their amounts, and highlights discrepancies for easy review.

SELECT  
PayDate,Pnumber,TransactionID, xd.amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount,
CASE
   WHEN pnumber like '7%' THEN 'Airtel'
   WHEN pnumber like '_______7%' THEN 'MTN'
   ELSE 'FOREIGN_PAYER_NUMBER'
END AS Provider
from sld
join xd ON sld.transaction_code=xd.TransactionID;



-- transactions not uploaded 
-- These are the records from statement that are not in superlender.They are amounts deallocated and transfered from and by Simplpay.
-- The script below shows records that are not in either statement or superlender.

SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount,cname, 
  (xd.amount - sld.amount) AS Recon_Amount from xd
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE
TransactionID NOT IN (select transaction_code from sld);



-- Payments > 1,500,000
-- The script below shows payments either generated by system or paid by clients exceeding 1,500,000.
-- The script is useful in monitoring any large amount coming in and going out (disbursments).

SELECT 
  PayDate, Pnumber, TransactionID, xd.amount AS xd_amount, transaction_code, sld.amount AS sld_amount,cname, 
  (xd.amount - sld.amount) AS Recon_Amount
  from xd 
  Left JOIN sld ON xd.TransactionID=sld.transaction_code
  WHERE 
	xd.amount > 1500000 and cname not like "" and cname not like 'simp%';

select *  from xd where TransactionID NOT IN (select transaction_code from sld);

select * from xd where pnumber not like '_______7%' and pnumber not like '7%' 
and cname not like 'sim%' and cname not like '';

select count(*) from sld;
set sql_safe_updates=0;
update xd
set pnumber=1234567 where transactionID=115307879978;


-- The below query is a CASE STATEMENT inside select statement and WHERE clause while using the JOIN statement
-- I use it to generate another column called Provider that lists Airtel/MTN or FOREIGN PAYER NUMBERS based on the conditions set,
-- and C2B reconciliation.
   use recons;
SELECT 
PayDate,Pnumber,TransactionID, xd.amount as statement_amount,transaction_code,sld.amount,
(xd.amount-sld.amount) AS Recon_Amount,
CASE
   WHEN pnumber like '7%' THEN 'Airtel'
   WHEN pnumber like '_______7%' THEN 'MTN'
   ELSE 'FOREIGN_PAYER_NUMBER'
END AS Provider
from sld
join xd ON sld.transaction_code=xd.TransactionID;

use btoc;
select *from xb2c;
select txncode,to_number,client_name,count(TO_number),
CASE 
WHEN count(TO_number)>1 THEN 'DD'
ELSE 'SD'
END AS STATUS
from xb2c
GROUP BY TO_number, txncode,client_name;

SELECT 
    TO_number,
    txncode,
    client_name,
    COUNT(*) AS occurrence_count
FROM xb2c
GROUP BY TO_number, txncode, client_name
HAVING COUNT(*) >1;
SHOW KEYS FROM xb2c WHERE Key_name = 'PRIMARY';


use btoc;
update xb2c
set to_number=256773244109 where client_name='Esther Mucha';

select *from xb2c where txncode not in (select transaction_code from slb2c);
select * from slb2c where transaction_code=112314006124;
select  from xb2c;

SELECT 
     txncode,
    TO_number, 
    Client_name, 
    COUNT(TO_number) AS CountOccurrences,
    CASE 
        WHEN COUNT(TO_number) > 1 THEN 'DD'
        ELSE 'SD'
    END AS Status
FROM xb2c
GROUP BY TO_number, TxnCode, Client_name
HAVING COUNT(TO_number) > 1;

SELECT to_number,COUNT(*) AS occurrence
FROM xb2c
GROUP BY TO_number
HAVING COUNT(*) > 1;

SELECT 
    xb2c.TxnCode, 
    xb2c.TO_number, 
    xb2c.Client_name, 
    duplicates.CountOccurrences,
    CASE 
        WHEN duplicates.CountOccurrences > 1 THEN 'DD'
        ELSE 'SD'
    END AS Status
FROM xb2c
JOIN (
    SELECT 
        TO_number, 
        COUNT(*) AS CountOccurrences
    FROM xb2c
    GROUP BY TO_number
    HAVING COUNT(*) > 1
) AS duplicates
ON xb2c.TO_number = duplicates.TO_number
and client_name not like 'simple%';

select category,unit_price from products_table
order by unit_price DESC
LIMIT 1;

select * from products_table;
select * from sales_table;
use sales;
insert into products_table
values
(101,'Laptop','Electronics',500.00),
(102,'Smartphone','Electronics',300.00),
(103,'Headphones','Electronics',30.00),
(104,'Keyboard','Electronics',20.00),
(105,'Mouse','Electronics',15.00);

select product_name,sum(total_price) from sales_table 
join products_table ON sales_table.product_id=products_table.product_id
group by total_price,product_name
having sum(total_price)>30;

select Round(AVG(quantity_sold),1) from sales_table
JOIN products_table ON sales_table.product_id=products_table.product_id
where  unit_price>100;

select total_price,
CASE
WHEN total_price>200 THEN 'HIGH'
WHEN total_price BETWEEN 100 and 200 THEN 'MEDIUM'
else 'LOW'
END AS Level
from sales_table;
select sale_id,quantity_sold
 from sales_table 
 GROUP BY sale_id
having quantity_sold>AVG(quantity_sold);
use recons;
truncate xd;
select * from discrepancy_alerts;

select count(*)from sld;
select transactionid,paydate,pnumber,cname,xd.amount as statement_amount,branch,transaction_code,sld.amount as superL_amount,
(xd.amount-sld.amount) AS recon_amount,
CASE
WHEN pnumber LIKE '7%' THEN 'Airtel'
WHEN pnumber LIKE '_______7%' THEN 'MTN'
ELSE 'FOREIGN_PAYER_NUMBER'
END AS 'Provider'
from xd
JOIN sld ON xd.transactionid=sld.transaction_code;


select *from xd where transactionid not in (select transaction_code from sld);

create table Collections (UID int,Amount int,Name varchar(100),Phone varchar(100),Txn_Code varchar(100),Loan_ID int,
Loan_Bal int,Date date,	Branch varchar(100),Status varchar(100),Recon boolean,Payment varchar(100));

alter table collections 
Modify Recon varchar(100);

select *from collections;

select branch,sum(amount) from collections where branch='Busia' and date='2025-01-09' and payment='partial';
select branch,date,sum(amount) as grand_total,
(select sum(amount) where payment='full')as full, (select sum(amount) where payment='partial') AS partial
from collections
group by branch,date,payment
having date='2025-01-09';


select branch,date,sum(amount) as Full from collections
group by branch,payment,date
having date='2025-01-09' and payment='full';

SELECT 
    branch,
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
    date(payment_date) = '2025-01-20'
GROUP BY 
    branch
order by branch;
select *from sld;

use recons;
select * from sales_table;
select * from products_table;

create view Total_Sales AS
select product_name,category,sum(total_price)
from sales_table 
JOIN products_table ON sales_table.product_id=products_table.product_id
group by product_name,category;

select product_name,category,unit_price from products_table
JOIN sales_table ON sales_table.product_id=products_table.product_id
where quantity_sold> (select AVG(quantity_sold) from sales_table);

set sql_safe_updates=0;
truncate xd;

use recons;
use sales;
select * from sales_table;
create view Top_Products
select;

use recons;
create table Previous (uid int,Full_name varchar(100),national_id varchar(100),Branch varchar(100),Phone varchar(100),
Principal int,Given_Date date,Interest int,Penalties int,Membership_Fee int,Total_Amount int,Total_Paid int,Balance int,
Collector varchar(100),Transaction_Code varchar(100),Application_Mode varchar(100),status varchar(100));


create table Current (uid int,Full_name varchar(100),gender VARCHAR(20),national_id varchar(100),Branch varchar(100),Phone varchar(100),
Principal int,Given_Date date,Interest int,Penalties int,Membership_Fee int,Total_Amount int,Total_Paid int,Balance int,
Collector varchar(100),Transaction_Code varchar(100),Application_Mode varchar(100),status varchar(100));
use kenya;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/collections.csv'
INTO TABLE collections
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SET GLOBAL max_allowed_packet=67108864; -- 64MB



select count(*) from disb;

select count(*)from xd;

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/collections.csv'
INTO TABLE collections
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';



SHOW VARIABLES LIKE 'secure_file_priv';
SET GLOBAL sql_mode = '';
ALTER TABLE current MODIFY COLUMN uid int;
select *from previous;
select count(*)from current where given_date between '2022-11-02' and '2024-11-30';

select count(*) from previous where previous.uid NOT in (select current.uid from current) and given_date between '2022-11-02' and
'2024-11-30';
select count(*)from (select previous.given_date,previous.uid as UID,previous.full_name,current.full_name as FN,current.uid as CUID,
(Case when previous.full_name!=current.full_name Then previous.full_name else 0 end)as name_recon,previous.principal as previous_principal,
current.principal as current_principal,(previous.principal-current.principal)as principal_recon,
(Case when previous.national_id!=current.national_id Then previous.national_id else 0 end)as national_recon from previous
Join current ON previous.uid=current.uid)as count;


select previous.given_date,previous.uid as UID,previous.full_name,current.full_name as FN,current.uid as CUID,
(Case when TRIM(previous.full_name)!=TRIM(current.full_name) Then previous.full_name else 0 end)as name_recon,previous.principal as previous_principal,
current.principal as current_principal,(previous.principal-current.principal)as principal_recon,
(Case when previous.national_id!=current.national_id Then previous.national_id else 0 end)as national_recon,current.national_id
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/reconciliation.csv'
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
FROM previous
JOIN current ON previous.uid = current.uid;

use recons;
select count(*) from sld where payment_date between '2025-01-24' and '2025-01-26';

SELECT branch, disbursement_date, SUM(AMOUNT_DISBURSED) AS total_disbursed
FROM disb
WHERE branch = 'Adams'
AND disbursement_date BETWEEN '2025-01-20' AND '2025-01-26'
GROUP BY (branch), disbursement_date
ORDER BY disbursement_date;

SELECT *
FROM disb
WHERE branch = 'Adams'
AND DATE(disbursement_date) BETWEEN '2025-01-20' AND '2025-01-26';


SELECT branch, disbursement_date, SUM(AMOUNT_DISBURSED) AS total_disbursed
FROM disb
WHERE branch = 'Adams'
AND disbursement_date BETWEEN '2025-01-20' AND '2025-01-26'
GROUP BY branch, disbursement_date
ORDER BY disbursement_date;




SELECT 
    branch,
    DATE(disbursement_date) AS disbursement_date,
    SUM(AMOUNT_DISBURSED) AS total_disbursed
FROM disb
WHERE 
    branch IN (
        'Adams', 
        'Eldoret', 
        'Wangige', 
        'Ngong', 
        'Mwingi', 
        'Nkubu', 
        'Makutano-Kapenguria', 
        'Kikima', 
        'Nakuru', 
        'Siaya', 
        'Mbita', 
        'Sondu',
        'Nyali', 
        'Changamwe', 
        'Naivasha', 
        'Taita_taveta', 
        'Kibwezi', 
        'Kajiado', 
        'Marigat', 
        'Kariobangi'
    )
AND disbursement_date = '2025-01-20' 
GROUP BY 
    branch, 
    DATE(disbursement_date)
ORDER BY 
    branch, 
    DATE(disbursement_date);

SELECT DISTINCT DATE(disbursement_date) AS disbursement_date
FROM disb
WHERE DATE(disbursement_date) BETWEEN '2025-01-20' AND '2025-12-26';



SELECT 
    branch,
    DATE(disbursement_date) AS disbursement_date,
    SUM(AMOUNT_DISBURSED) AS total_disbursed
FROM 
    disb
WHERE 
    branch IN (
        'Adams', 
        'Eldoret', 
        'Wangige', 
        'Ngong', 
        'Mwingi', 
        'Nkubu', 
        'Makutano-Kapenguria', 
        'Kikima', 
        'Nakuru', 
        'Siaya', 
        'Mbita', 
        'Sondu',
        'Nyali', 
        'Changamwe', 
        'Naivasha', 
        'Taita_taveta', 
        'Kibwezi', 
        'Kajiado', 
        'Marigat', 
        'Kariobangi'
    )
AND DATE(disbursement_date) BETWEEN '2025-01-20' AND '2025-01-26'
GROUP BY 
    branch, 
    DATE(disbursement_date)
ORDER BY 
    branch, 
    DATE(disbursement_date);

SELECT 
    branch,
    DATE(disbursement_date) AS disbursement_date,
    SUM(AMOUNT_DISBURSED) AS total_disbursed
FROM 
    disb
WHERE 
    branch IN (
        'Adams', 
        'Eldoret', 
        'Wangige', 
        'Ngong', 
        'Mwingi', 
        'Nkubu', 
        'Makutano-Kapenguria', 
        'Kikima', 
        'Nakuru', 
        'Siaya', 
        'Mbita', 
        'Sondu',
        'Nyali', 
        'Changamwe', 
        'Naivasha', 
        'Taita_taveta', 
        'Kibwezi', 
        'Kajiado', 
        'Marigat', 
        'Kariobangi'
    )
AND DATE(disbursement_date) BETWEEN '2025-01-20' AND '2025-01-26'
GROUP BY 
    branch, 
    DATE(disbursement_date)
ORDER BY 
    branch, 
    DATE(disbursement_date);





SELECT 
    branch,
    DATE(disbursement_date) AS disbursement_date,amount_disbursed,
    SUM(AMOUNT_DISBURSED) AS total_disbursed
FROM 
    disb
WHERE 
    LOWER(branch) IN (
        'adams', 
        'eldoret', 
        'wangige', 
        'ngong', 
        'mwingi', 
        'nkubu', 
        'makutano-kapenguria', 
        'kikima', 
        'nakuru', 
        'siaya', 
        'mbita', 
        'sondu',
        'nyali', 
        'changamwe', 
        'naivasha', 
        'taita_taveta', 
        'kibwezi', 
        'kajiado', 
        'marigat', 
        'kariobangi'
    )
GROUP BY 
branch , DATE(disbursement_date)
ORDER BY 
    branch, 
    DATE(disbursement_date);

create table interaction (
ID int,Customer_Name varchar(100),Interaction_Mode varchar(100),Date date,Agent varchar(100),
Outcome_Details varchar(100),Next_Interaction date);

create table collections (
uid int,amount int,comments varchar(100),mobile_number varchar(100),transaction_code VARCHAR(100),
loan_id INT,loan_balance INT,payment_date DATE,	record_method VARCHAR(100),
branch VARCHAR(100),status VARCHAR(100));

SELECT *FROM RECONS.SLD;
use kenya;
create table targets (
branch varchar(100),Full_Loan_Pays int,Partial_Loan_Pays int,Total_Loan_Pays int,
Partial_Targets int,Variance int,Rate int,Target varchar(100));



SELECT branch,
sum(amount) AS grand_total,
sum(CASE when loan_balance<=0 THEN amount else 0 end) AS 'full',
sum(CASE when loan_balance>0 THEN amount else 0 end) AS 'partial',
(sum(CASE when loan_balance>0 THEN amount else 0 end)-partial_targets) AS DIF,
concat(round((sum(CASE when loan_balance>0 THEN amount else 0 end)/partial_targets)*100),'%') as rate,
Case 
WHEN round((sum(CASE when loan_balance>0 THEN amount else 0 end)/partial_targets)*100)<100 THEN 'MISSED'
Else 'HIT'
END AS TARGET
from collections
join targets ON collections.branch=targets.branch
group by branch
order by branch;
select *from collections;
targets;

-- running
SELECT 
    collections.branch,collections.payment_date,
    SUM(collections.amount) AS grand_total,
    SUM(CASE WHEN collections.loan_balance <= 0 THEN collections.amount ELSE 0 END) AS full,
    SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) AS partial,
    (SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) - (targets.partial_targets*7)) AS DIF,
    CONCAT(ROUND((SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) / (targets.partial_targets*7)) * 100), '%') AS rate,
    CASE 
        WHEN ROUND((SUM(CASE WHEN collections.loan_balance > 0 THEN collections.amount ELSE 0 END) / (targets.partial_targets*7) * 100)) < 100 THEN 'MISSED'
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
    collections.branch;

use kenya;
select *from collections;
select uid,collections.amount,comments,mobile_number,transaction_code,loan_id,loan_balance,payment_date,record_method,branch,
status,partial_targets from collections
JOIN targets ON collections.branch=targets.branch;

select * from targets;

create table dist ( branch varchar(100),DAILY_D_TARGET int);

select count(*)collections;


