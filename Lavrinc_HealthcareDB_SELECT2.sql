USE Lavrinc_HealthcareDB
GO

SELECT	PHYS_INFO.Phys_ID AS "Provider Number",
		trim(Phys_FirstName) + ' ' + trim(Phys_Name) AS "Provider Name",
		DOS AS "Date of Service",
		ICD10_Code AS "Procedure Code",
		trim(Pt_First_Name) + ' ' + trim(Pt_Last_Name) AS "Patient Name",
		PATIENT_INFO.Patient_ID AS "Patient ID"
		
FROM	PHYS_INFO
		JOIN PROC_INFO ON PHYS_INFO.Phys_ID = PROC_INFO.Phys_ID
		JOIN PATIENT_INFO ON PROC_INFO.Patient_ID = PATIENT_INFO.Patient_ID

WHERE	PHYS_INFO.Phys_ID = '101' AND
		DOS BETWEEN '2019-01-01' AND '2019-12-31'

ORDER BY DOS
