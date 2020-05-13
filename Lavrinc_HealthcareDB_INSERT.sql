USE Lavrinc_HealthcareDB
GO

SET IDENTITY_INSERT dbo.PATIENT_INFO OFF

INSERT INTO PATIENT_INFO
		(Pt_Last_Name, Pt_First_Name, Pt_Middle_Name, DOB,
		Pt_Add1, Pt_Add2, Pt_City, Pt_State, Pt_Zip, Pt_Phone) VALUES
		('Malone', 'Hubert', 'P', '2000-03-26', '3802 Carriage Lane', NULL, 'Bloomsberg', 'PA', '17815', '555 259 9895');

INSERT INTO INS_BRIDGE
		(Patient_ID, Prim_Code, Prim_Pt_ID, Sec_Code, Sec_Pt_ID, Ter_Code, Ter_PT_ID) VALUES
		('100013', '1005', '321B-65W3X', NULL, NULL, NULL, NULL);
