USE Lavrinc_HealthcareDB
GO

DELETE FROM PROC_INFO
WHERE Phys_ID = '104';

DELETE FROM PHYS_INFO
WHERE Phys_ID = '104';