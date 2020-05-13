USE Lavrinc_HealthcareDB
GO

SELECT	ICD10_Code AS "Procedure Code",
		PATIENT_INFO.Patient_ID AS "Patient ID",
		trim(Pt_First_Name) + ' ' + trim(Pt_Last_Name) AS "Patient Name", 
		Ins_Name AS "Primary Insurance",
		trim(Ins_add1) + ' ' + ISNULL(trim(Ins_add2), '') + ' ' + 
		trim(Ins_city) + ', ' + trim(Ins_state) + ' ' + trim(Ins_zip) AS "Claims Address"

FROM	PROC_INFO
		JOIN PATIENT_INFO ON PROC_INFO.Patient_ID = PATIENT_INFO.Patient_ID
		JOIN INS_BRIDGE ON PATIENT_INFO.Patient_ID = INS_BRIDGE.Patient_ID
		JOIN INS_INFO ON INS_BRIDGE.Prim_Code = INS_INFO.Insurance_Code

WHERE	ICD10_CODE = 'HZ30ZZZ'

ORDER BY [Patient ID]
