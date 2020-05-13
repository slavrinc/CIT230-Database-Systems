USE Lavrinc_HealthcareDB
GO

ALTER TABLE PHYS_INFO
ADD Phys_FirstName nvarchar(20);

ALTER TABLE PHYS_INFO
ADD Practice_State char(2);

ALTER TABLE PROC_INFO
DROP COLUMN Proc_ID;

ALTER TABLE PHYS_INFO
ALTER COLUMN Practice_phone char(15);
