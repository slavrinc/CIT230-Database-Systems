USE Lavrinc_HealthcareDB
GO

SELECT	PATIENT_INFO.Patient_ID AS "Patient ID", 
		trim(Pt_First_Name) + ' ' + trim(Pt_Last_Name) AS "Patient Name", 
		Prim_Code AS "Primary", 
		ISNULL(Sec_Code, '') AS "Secondary", 
		ISNULL(Ter_Code, '') AS "Tertiary", 
		DOS AS "Date of Service", ICD10_Code AS "Procedure Code"
FROM	PATIENT_INFO
		JOIN INS_BRIDGE ON PATIENT_INFO.Patient_ID = INS_BRIDGE.Patient_ID
		JOIN PROC_INFO ON PATIENT_INFO.Patient_ID = PROC_INFO.Patient_ID
WHERE	Prim_Code BETWEEN 1000 AND 1003 OR 
		Sec_Code BETWEEN 1000 AND 1003 OR 
		Ter_Code BETWEEN 1000 AND 1003

ORDER BY PATIENT_INFO.Patient_ID
