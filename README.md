## CIT230-Database-Systems
Final DBMS Project - SQL

### NARRATIVE OF THE PURPOSE OF THE CREATED DATABASE  
*This database was created using Microsoft SQL Management Studio 2017.*  
  
**Database Name:**	Lavrinc_HealthcareDB.mdf  
**Tables:**  

    dbo.PATIENT_INFO  
	  dbo.PROC_INFO  
	  dbo.PHYS_INFO  
	  dbo.INS_BRIDGE  
	  dbo.INS_INFO  

The Lavrinc_HealthcareDB database was created to allow medical billing facilities and departments the  
ability to access multiple patient accounts in correlation with their medical history and insurance  
information to support the billing process within a timely manner. Most health insurance companies will  
deny claims that haven’t been received within a 60-120 day timeline, resulting in a profit loss for  
physicians and healthcare groups. To promote efficiency and increase profits, it’s crucial that healthcare  
providers utilize a database that consists of the correct data to include on a HCFA 1500 form, including  
Patient Information, Insurance Information, Physician Information and Procedure Information.  
  
Insurance billing standards change annually. While this database includes the most basic data sets   
required to process services rendered, it also enables us to later add additional requirements if   
these standards change based on any insurance billing updates.  

The biggest feature of this database is that it allows detection of issues that may arise by pulling  
patient accounts with similar parameters to rebill or adjust coding on accounts that meet these parameters,  
rather than comb through individual patient accounts one-by-one. As an example, if a specific insurance  
company changes their claim approval to require an additional pre-existing condition ICD-10 code on a  
certain procedure, we will be able to pull records of every patient with that specific insurance and  
ICD-10 service code and make these appropriate adjustments all at once.   

### A LISTING OF ALL OF THE DATABASE TABLE STRUCTURES  
**Table: INS_INFO**  
Contents: General insurance company contact information.  
  
The primary key, Insurance_Code, is a 4-digit value assigned to each insurance company that can be  
easily accessed numerous times with the INS_BRIDGE table.  
  
base type nvarchar is utilized in the Insurance Name, Address lines and City to account for the  
possibility that names or addresses have accents and/or need access to extended Unicode characters.  
  
No constraints added to zip as standard rules suggest because Insurance provider may not be located within the United States, and requiring integers may prevent ability for claims to be filed to countries which utilize characters in their postal codes.
  
Constraints added to Insurance_Code to assign PRIMARY KEY and ensure a UNIQUE ID is used.  
  
**Table: PATIENT_INFO**  
Contents: Patient contact information.  
  
The primary key, Patient_ID, is a unique 6-digit integer assigned to each patient that can be  
linked to different procedures via PROC_INFO and the INS_BRIDGE.  
  
base type nvarchar is utilized in the Patient Name, Address lines and City to account for the  
possibility that names or addresses have accents and/or need access to extended Unicode characters.  
  
No constraints added to zip as standard rules suggest because Patient may not reside within the United States, and requiring integers may prevent ability for claims to be filed to countries which utilize characters in their postal codes.
Constraints added to Patient_ID to assign PRIMARY KEY and to ensure a UNIQUE ID is used.  
  
**Table: PHYS_INFO**  
Contents: Physician and practice information.  
  
Phys_ID is the Primary Key, with a unique 5 digit code assigned to each service provider.  
  
base type nvarchar is only utilized in the columns that may contain extended characters such as names or addresses.  
  
Constraints added to Phys_ID to assign PRIMARY KEY and ensure a UNIQUE ID was used.  
  
After working with the data used in the PHYS_INFO table, it became evident that the State and Physician First Name column was missing, please reference Other Database Project Information for additional commentary and UPDATE information.  

**Table: INS_BRIDGE**  
Contents: Primary, Secondary and Tertiary Insurance information for each Patient.  
  
Constraints include multiple foreign keys which allows this table to work as a bridge and populate insurance contact information within a filed claim.  
  
base type nvarchar is only utilized in columns where the patient policy number may contain unknown characters.  

**Table: PROC_INFO**  
Contents: Information on the procedure and date of service.  
  
Constraints include foreign keys Patient_ID and Phys_ID to link the procedure performed by specific physicians  
to the services received by the specific patients.  

### TABLE RELATIONSHIPS 
**PATIENT_INFO to PROC_INFO** – Each patient can have multiple procedures, but only one procedure on the specific  
date of service can apply to each patient, so this is a one to many relationship. (1:N)  
  
**PROC_INFO to PHYS_INFO** – Each physician can perform multiple procedures, but each procedure will only have  
one primary physician, so this is a one to many relationship. (1:N)  
  
**PATIENT INFO to INS_BRIDGE** – Each patient is assigned to one insurance bridge and each insurance bridge  
is assigned to one patient, so this is a one to one relationship. (1:1)  
  
**INS_BRIDGE to INS_INFO** – Each instance of INS_BRIDGE assigned per patient can have multiple references to  
INS_INFO, such as if a patient were to have both primary and secondary insurance with the same provider,  
and each instance of INS_INFO can be applied to multiple instances of INS_BRIDGE, therefore this  
relationship is many to many. (N:M)

### SUMMARY OF CREATED DATABASE MANAGEMENT SYSTEM  
  
This database was created as an exploratory project to enhance my understanding of the way databases  
work within a medical billing context. It includes Patient Information, Procedure Information,  
Physician Information, and Insurance Information to allow quick access and functionality to the users  
which inherently discourages profit loss from timely filing and disorganization. Utilizing a database  
for a medical billing system allows the ability to change large amounts of information all at once  
which is beneficial in an evolving environment where data may change rapidly depending on annual updates.  
The data in this system will grow exponentially as new patients, procedures, doctors and insurance  
companies are added, and being able to pull accounts that meet certain parameters increases efficiency  
and allows more opportunity for practice growth.  
  
My biggest realization while working on this project is the scope of responsibilities that must be covered  
in order for the database to be useful for each user role. While I’m less familiar with the requirements a  
database must adhere to in order for some departments to be fully functional, this project can be utilized  
as a base model with intentions to expand the data included based on additional roles and responsibilities  
of the users. 




