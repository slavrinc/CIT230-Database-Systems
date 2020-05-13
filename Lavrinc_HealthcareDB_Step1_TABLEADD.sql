USE Lavrinc_HealthcareDB
GO


CREATE TABLE INS_INFO(
		Insurance_Code	Int				NOT NULL		IDENTITY(1000,1),
		Ins_Name		nvarchar(50)	NOT NULL,
		Ins_add1		nvarchar(100)	NOT NULL,
		Ins_add2		nvarchar(100)	NULL,
		Ins_city		nvarchar(40)	NOT NULL,
		Ins_state		char(2)			NULL,	  /* To allow addresses that don't follow US postal standards. */
		Ins_zip			char(10)		NOT NULL,
		Ins_phone		varchar(15)		NOT NULL, /* Max possible phone number digits in the world. */
		CONSTRAINT INS_CODE_PK		PRIMARY KEY(Insurance_Code),
		CONSTRAINT INS_CODE_U		UNIQUE(Insurance_Code)
);


CREATE TABLE PATIENT_INFO(
		Patient_ID			Int					NOT NULL		IDENTITY(100000,1),
		Pt_Last_Name		nvarchar(30)		NOT NULL,
		Pt_First_Name		nvarchar(30)		NOT NULL,
		Pt_Middle_Name		nvarchar(30)		NULL,
		DOB					date				NOT NULL,
		Pt_Add1				nvarchar(100)		NOT NULL,
		Pt_Add2				nvarchar(100)		NULL,
		Pt_City				nvarchar(40)		NOT NULL,
		Pt_State			char(2)				NULL, /* To allow addresses that don't follow US postal standards. */
		Pt_Zip				char(10)			NOT NULL,
		Pt_Phone			char(15)			NOT NULL, /* Max  possible phone number digits in the world. */
		CONSTRAINT PAT_ID_PK		PRIMARY KEY(Patient_ID),
		CONSTRAINT PAT_ID_U			UNIQUE(Patient_ID)
);


CREATE TABLE PHYS_INFO(
		Phys_ID				Int				NOT NULL			IDENTITY(100,1),
		Phys_Name			nvarchar(20)	NOT NULL,
		Practice_add1		nvarchar(100)	NOT NULL,
		Practice_add2		nvarchar(100)	NULL,
		Practice_city		nvarchar(30)	NOT NULL,
		Practice_zip		char(10)		NOT NULL,
		Practice_phone  	char(10)		NOT NULL,
		CONSTRAINT Phys_ID_PK		PRIMARY KEY(Phys_ID),
		CONSTRAINT Phys_ID_U		UNIQUE(Phys_ID)
);


CREATE TABLE INS_BRIDGE(
		Patient_ID			Int				NOT NULL,
		Prim_Code			Int				NOT NULL,
		Prim_Pt_ID			nvarchar(30)	NULL,
		Sec_Code			Int				NULL,
		Sec_Pt_ID			nvarchar(30)	NULL,
		Ter_Code			Int				NULL,
		Ter_PT_ID			nvarchar(30)	NULL,

CONSTRAINT FK_INS_BRIDGE_PATIENT_INFO FOREIGN KEY(Patient_ID)
REFERENCES PATIENT_INFO(Patient_ID),

CONSTRAINT FK_INS_BRIDGE_INS_INFO FOREIGN KEY(Prim_Code)
REFERENCES INS_INFO (Insurance_Code)
ON UPDATE CASCADE
ON DELETE CASCADE,

CONSTRAINT FK_INS_BRIDGE_INS_INFO2 FOREIGN KEY(Sec_Code)
REFERENCES INS_INFO (Insurance_Code),

CONSTRAINT FK_INS_BRIDGE_INS_INFO3 FOREIGN KEY(Ter_Code)
REFERENCES INS_INFO (Insurance_Code)
);


CREATE TABLE PROC_INFO(
		Patient_ID			Int				NOT NULL,
		Proc_ID				varchar(20)		NOT NULL,
		ICD10_Code			varchar(20)		NOT NULL,
		DOS					date			NOT NULL,
		Phys_ID				Int				NOT NULL,

CONSTRAINT FK_PROC_INFO_PATIENT_INFO FOREIGN KEY(Patient_ID)
					REFERENCES PATIENT_INFO(Patient_ID),

CONSTRAINT FK_PROC_INFO_PHYS_INFO FOREIGN KEY(Phys_ID)
					REFERENCES PHYS_INFO(Phys_ID)
					ON UPDATE CASCADE
					ON DELETE CASCADE	
);


