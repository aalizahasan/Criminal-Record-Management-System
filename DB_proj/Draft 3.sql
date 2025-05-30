CREATE DATABASE CrimeRecordDB;

USE CrimeRecordDB;


CREATE TABLE Cases (
    Case_Id INT PRIMARY KEY ,
    Case_No VARCHAR(50) UNIQUE,
    Case_type VARCHAR(100),
    Case_description TEXT,
    Case_Status VARCHAR(50), -- open, close, in progress
    Investigation_Officer VARCHAR(255),
    Starting_Date DATE,
    End_Date DATE,
    Court_Name VARCHAR(70),
    Judge_Name VARCHAR(255),
    Lawyer_Name VARCHAR(255),
    Sentence VARCHAR(255)
);


CREATE TABLE Criminals (
    Criminal_Id INT PRIMARY KEY ,
    C_Name NVARCHAR(50),
    Age INT,
    Gender NVARCHAR(10),
    C_Address NVARCHAR(255),
    Crime_Type NVARCHAR(100),
    C_Status NVARCHAR(50),
    Father_Name NVARCHAR(50),
    Arrest_Date DATE,
    Release_Date DATE,
    Prison_Name VARCHAR(70),
    Case_Id INT,  -- Foreign Key column
    
    FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)  -- Correct Foreign Key
);

SELECT * FROM Criminals;


CREATE TABLE Officers(
Officer_id INT PRIMARY KEY,
First_Name VARCHAR(100),
Last_Name VARCHAR (100),
O_Rank VARCHAR (100),
Department VARCHAR (40),
Date_of_Joining DATE,
Date_of_Birth Date,
Phone_No  VARCHAR (20),
Officer_Status VARCHAR(50),  -- ACTIVE ,RETIRED , SUSPENDED--
Badge_No VARCHAR(50) UNIQUE,
Case_Id INT,
FOREIGN KEY ( Case_Id) REFERENCES Cases (Case_Id)

);

CREATE TABLE Evidence(
Evidence_Id INT PRIMARY KEY,
Evidence_type VARCHAR(100), -- WEAPON,DOCUMENT ,DNA, FINGERPRINT--
E_Description TEXT,
Collected_by VARCHAR(255), -- NAMES OF OFFICERS OD PEOPLE WHO COLLECTED EVIDENCE
Collection_Date DATE,
Storage_location VARCHAR(255),
Evidence_status VARCHAR(50), -- stored, analyzed, discarded
Associated_suspect VARCHAR(255),
Case_Id INT,
FOREIGN KEY (Case_Id) REFERENCES Cases(Case_Id)
);

CREATE TABLE Victims(
Victim_id INT PRIMARY KEY,
First_Name VARCHAR(100),
Last_Name VARCHAR(100),
Gender VARCHAR(10),
Age INT,
Date_Of_Birth DATE,
Nationality VARCHAR(100),
Contact_No VARCHAR(20),
V_Address TEXT,
Crime_type VARCHAR(100),
Date_Of_Incident DATE,
Victim_Status VARCHAR(50),
Case_Id INT,
FOREIGN KEY (Case_Id) REFERENCES Cases( Case_Id)
);

CREATE TABLE CourtHearings(
Hearing_Id INT PRIMARY KEY,
Case_Id INT,
Hearing_date DATE,
Hearing_time TIME,
Court_name VARCHAR(255),
Judge_name VARCHAR (255),
Prosecutor_name VARCHAR(255),
Defense_lawyer_Name VARCHAR(255),
Hearing_Outcome TEXT,
Hearing_Notes TEXT,
Hearing_Status VARCHAR(50),
FOREIGN KEY (Case_Id) REFERENCES Cases( Case_Id)
);

CREATE TABLE Court (
    Court_Id INT PRIMARY KEY,  -- Unique identifier for the court
    Court_Name VARCHAR(255) NOT NULL,  -- Name of the court
    Court_Type VARCHAR(100),  -- e.g., District, High, Supreme
    Location VARCHAR(255),  -- Address of the court
    Jurisdiction_Area VARCHAR(255),  -- Area under the court's authority
    Judge_Name VARCHAR(255),  -- Name of the main judge
    Contact_Number VARCHAR(20),  -- Court's contact number
    Email VARCHAR(255),  -- Court's official email
    Established_Date DATE,  -- Date when the court was established
    Court_Status VARCHAR(50),  -- Active, Inactive, Under Renovation
    Number_of_Cases INT DEFAULT 0  -- Total cases handled by the court
);


-- Insert into Cases table
INSERT  INTO Cases (Case_Id, Case_No, Case_type, Case_description, Case_Status, Investigation_Officer, Starting_Date, End_Date, Court_Name, Judge_Name, Lawyer_Name, Sentence)
VALUES 
(1, 'C-2024-001', 'Homicide', 'Suspect charged with first-degree murder.', 'In Progress', 'Detective Mark Spencer', '2024-01-10', NULL, 'New York Supreme Court', 'Judge Robert Miller', 'David Thompson', 'Pending Trial'),

(2, 'C-2024-002', 'Fraud', 'Financial fraud by a corporate executive.', 'Closed', 'Detective Sarah Collins', '2023-11-05', '2024-02-20', 'Toronto District Court', 'Judge Emily Davis', 'Jonathan Reed', '5 Years Imprisonment'),

(3, 'C-2024-003', 'Kidnapping', 'Large-scale drug distribution operation.', 'Ongoing', 'Detective James Carter', '2024-03-15', NULL, 'London Crown Court', 'Judge William Harris', 'Emma Robinson', 'Bail Granted'),

(4, 'C-2024-004', 'Assault', 'Assault case involving serious injury.', 'Closed', 'Detective Olivia Martinez', '2024-02-10', '2024-04-05', 'Los Angeles Superior Court', 'Judge Olivia Brown', 'Daniel Lee', 'Case Dismissed'),

(5, 'C-2024-005', 'Cybercrime', 'Illegal hacking and data breach incident.', 'In Progress', 'Detective Michael Adams', '2024-04-25', NULL, 'Berlin High Court', 'Judge Thomas Schmidt', 'Lena Fischer', 'Pending Verdict'),

(6, 'C-2024-006', 'Kidnapping', 'Ransom case involving a high-profile individual.', 'Pending', 'Detective Richard White', '2024-05-08', NULL, 'Paris District Court', 'Judge Jean Moreau', 'Alexandre Dubois', 'Under Review'),

(7, 'C-2024-007', 'Bribery', 'Government official caught accepting bribes.', 'Ongoing', 'Detective Sophia Clark', '2024-06-12', NULL, 'Madrid Supreme Court', 'Judge Carlos Ramirez', 'Luis Fernandez', 'Under Investigation'),

(8, 'C-2024-008', 'Burglary', 'Serial burglary cases reported in residential areas.', 'Closed', 'Detective Nathan Wilson', '2023-12-03', '2024-08-05', 'Sydney Federal Court', 'Judge Benjamin Clarke', 'Olivia Taylor', '3 Years Probation'),

(9, 'C-2024-009', 'Arson', 'Suspect set fire to a shopping mall.', 'Pending', 'Detective Emily Scott', '2024-07-22', NULL, 'Cape Town Magistrate Court', 'Judge Ethan Williams', 'Sophia Brown', 'Awaiting Trial'),

(10, 'C-2024-010', 'Robbery', 'Armed robbery at a luxury store.', 'Ongoing', 'Detective Liam Turner', '2024-08-28', NULL, 'Chicago Criminal Court', 'Judge Henry Adams', 'Liam Miller', 'Appeal in Process');





-- Insert Into Victim Tables

INSERT INTO Victims(Victim_id, First_Name, Last_Name, Gender,
Age, Date_Of_Birth, Nationality, Contact_No, V_Address, Crime_type,
Date_Of_Incident, Victim_Status, Case_Id)
VALUES
(1, 'Emily', 'Johnson', 'Female', 26, '1998-04-12', 'American', '5557851234', 'Los Angeles, USA', 'Robbery', '2024-01-10', 'Alive', 1),-- Case_Id = 1

(2, 'Michael', 'Brown', 'Male', 34, '1990-07-08', 'Canadian', '6479876543', 'Toronto, Canada', 'Assault', '2024-02-05', 'Injured', 2), -- Case_Id = 2

(3, 'Sophia', 'Garcia', 'Female', 29, '1995-06-15', 'Mexican', '5255556789', 'Mexico City, Mexico', 'Kidnapping', '2024-03-01', 'Recovered', 3), -- Case_Id = 3

(4, 'Daniel', 'Miller', 'Male', 41, '1983-11-23', 'British', '447711223344', 'London, UK', 'Homicide', '2023-12-15', 'Deceased', 4), -- Case_Id = 4

(5, 'Olivia', 'Martinez', 'Female', 31, '1993-09-30', 'Spanish', '34987654321', 'Madrid, Spain', 'Fraud', '2024-04-02', 'Alive', 5), -- Case_Id = 5

(6, 'James', 'Wilson', 'Male', 36, '1988-05-19', 'Australian', '6123456789', 'Sydney, Australia', 'Burglary', '2024-03-18', 'Alive', 6), -- Case_Id = 6

(7, 'Emma', 'Taylor', 'Female', 28, '1996-08-14', 'French', '33123456789', 'Paris, France', 'Cyber Crime', '2024-02-20', 'Alive', 7), -- Case_Id = 7

(8, 'William', 'Anderson', 'Male', 52, '1972-12-04', 'German', '4915123456789', 'Berlin, Germany', 'Arson', '2024-01-28', 'Injured', 8), -- Case_Id = 8

(9, 'Charlotte', 'White', 'Female', 23, '2001-04-25', 'South African', '27712345678', 'Cape Town, South Africa', 'Harassment', '2024-03-22', 'Alive', 9), -- Case_Id = 9

(10, 'Liam', 'Harris', 'Male', 46, '1978-10-02', 'American', '5553219876', 'New York, USA', 'Drug Trafficking', '2024-02-10', 'Arrested', 10); -- Case_Id = 10



-- Insert into Court Hearings table
INSERT INTO CourtHearings (Hearing_Id, Case_Id, Hearing_date, Hearing_time, Court_name, Judge_name, Prosecutor_name, Defense_lawyer_Name, Hearing_Outcome, Hearing_Notes, Hearing_Status)
VALUES 
(1, 1, '2024-01-15', '10:00:00', 'New York Supreme Court', 'Judge Robert Miller', 'Michael Carter', 'Sarah Williams', 'Adjourned', 'Defense requested additional evidence.', 'Pending'),

(2, 2, '2024-02-10', '14:30:00', 'Toronto District Court', 'Judge Emily Davis', 'Jonathan Reed', 'David Thompson', 'Guilty Verdict', 'Defendant sentenced to 5 years in prison.', 'Closed'),

(3, 3, '2024-03-05', '09:00:00', 'London Criminal Court', 'Judge William Harris', 'Sophia Clarke', 'Emma Robinson', 'Bail Granted', 'Defendant released on bail.', 'Ongoing'),

(4, 4, '2024-04-01', '11:15:00', 'Los Angeles Superior Court', 'Judge Olivia Brown', 'James Wilson', 'Daniel Lee', 'Dismissed', 'Insufficient evidence to proceed.', 'Closed'),

(5, 5, '2024-05-20', '13:45:00', 'Berlin High Court', 'Judge Thomas Schmidt', 'Felix Bauer', 'Lena Fischer', 'Guilty Verdict', 'Sentenced to 10 years imprisonment.', 'Closed'),

(6, 6, '2024-06-12', '10:30:00', 'Paris District Court', 'Judge Jean Moreau', 'Marie Dupont', 'Alexandre Dubois', 'Rescheduled', 'Prosecutor requested new evidence review.', 'Pending'),

(7, 7, '2024-07-08', '15:00:00', 'Madrid Supreme Court', 'Judge Carlos Ramirez', 'Isabella Martinez', 'Luis Fernandez', 'Under Review', 'New witness testimony submitted.', 'Ongoing'),

(8, 8, '2024-08-03', '09:45:00', 'Sydney Federal Court', 'Judge Benjamin Clarke', 'Lucas White', 'Olivia Taylor', 'Guilty Plea', 'Defendant confessed to charges.', 'Closed'),

(9, 9, '2024-09-18', '12:00:00', 'Cape Town Magistrate Court', 'Judge Ethan Williams', 'Noah Johnson', 'Sophia Brown', 'Awaiting Verdict', 'Final arguments presented.', 'Ongoing'),

(10, 10, '2024-10-25', '14:15:00', 'Chicago Criminal Court', 'Judge Henry Adams', 'Emma Scott', 'Liam Miller', 'Appeal Filed', 'Defense filed an appeal.', 'Pending');



-- Insert Into Court Table
INSERT INTO Court (Court_Id, Court_Name, Court_Type, Location, Jurisdiction_Area, Judge_Name, Contact_Number, Email, Established_Date, Court_Status, Number_of_Cases)
VALUES 
(1, 'New York Supreme Court', 'Supreme', '60 Centre St, New York, USA', 'New York State', 'Judge Robert Miller', '+1 212-123-4567', 'nysc@court.gov', '1896-05-10', 'Active', 15000),

(2, 'Toronto District Court', 'District', '361 University Ave, Toronto, Canada', 'Toronto District', 'Judge Emily Davis', '+1 416-789-1234', 'torontodc@court.ca', '1950-09-22', 'Active', 7200),

(3, 'London Crown Court', 'High', '1 Warwick Row, London, UK', 'Greater London', 'Judge William Harris', '+44 20-9876-5432', 'londoncc@court.uk', '1925-03-17', 'Active', 10450),

(4, 'Los Angeles Superior Court', 'Superior', '111 N Hill St, Los Angeles, USA', 'California State', 'Judge Olivia Brown', '+1 213-654-7890', 'lasuperior@court.gov', '1880-08-12', 'Under Renovation', 18200),

(5, 'Berlin High Court', 'High', 'Kammergericht, Berlin, Germany', 'Berlin Region', 'Judge Thomas Schmidt', '+49 30-8765-4321', 'berlinhc@court.de', '1901-06-30', 'Active', 8900),

(6, 'Paris District Court', 'District', '4 Boulevard du Palais, Paris, France', 'Île-de-France', 'Judge Jean Moreau', '+33 1-2345-6789', 'parisdc@court.fr', '1933-11-05', 'Inactive', 6700),

(7, 'Madrid Supreme Court', 'Supreme', 'Plaza de la Villa, Madrid, Spain', 'Spain', 'Judge Carlos Ramirez', '+34 91-7654-3210', 'madridsc@court.es', '1870-04-20', 'Active', 11300),

(8, 'Sydney Federal Court', 'Federal', '184 Phillip St, Sydney, Australia', 'New South Wales', 'Judge Benjamin Clarke', '+61 2-8765-4321', 'sydneyfc@court.au', '1985-07-14', 'Active', 9500),

(9, 'Cape Town Magistrate Court', 'Magistrate', 'Adderley St, Cape Town, South Africa', 'Western Cape', 'Judge Ethan Williams', '+27 21-543-2109', 'capetownmc@court.za', '1967-02-28', 'Active', 6200),

(10, 'Chicago Criminal Court', 'Criminal', '2650 S California Ave, Chicago, USA', 'Illinois State', 'Judge Henry Adams', '+1 312-678-4321', 'chicagocc@court.gov', '1912-10-18', 'Active', 14250);


UPDATE CourtHearings SET Court_name = 'London Crown Court' WHERE Hearing_Id = 3;



-- Insert into Criminals table
INSERT INTO Criminals (Criminal_Id, C_Name, Age, Gender, C_Address, Crime_Type, C_Status, Father_Name, Arrest_Date, Release_Date, Prison_Name, Case_Id)
VALUES
(1, 'John Doe', 30, 'Male', '123 Main St, New York, USA', 'Homicide', 'Incarcerated', 'Richard Doe', '2024-01-11', NULL, 'Rikers Island', 1),
(2, 'Jane Smith', 28, 'Female', '456 Oak St, Toronto, Canada', 'Fraud', 'Released', 'Michael Smith', '2023-11-06', '2024-02-15', 'Toronto Prison', 2),
(3, 'Carlos Sanchez', 35, 'Male', '789 Pine St, London, UK', 'Drug Trafficking', 'Incarcerated', 'Juan Sanchez', '2024-03-17', NULL, 'London Prison', 3),
(4, 'Olivia Brown', 40, 'Female', '321 Birch St, Los Angeles, USA', 'Assault', 'Released', 'Lucas Brown', '2024-02-11', '2024-04-05', 'Los Angeles Correctional Facility', 4),
(5, 'Michael Adams', 32, 'Male', '987 Cedar St, Berlin, Germany', 'Cybercrime', 'Incarcerated', 'Henry Adams', '2024-04-26', NULL, 'Berlin Prison', 5),
(6, 'Sophia Clark', 27, 'Female', '654 Elm St, Paris, France', 'Kidnapping', 'Released', 'David Clark', '2024-05-10', NULL, 'Paris Prison', 6),
(7, 'James Wilson', 38, 'Male', '321 Willow St, Madrid, Spain', 'Bribery', 'Incarcerated', 'Andrew Wilson', '2024-06-13', NULL, 'Madrid Prison', 7),
(8, 'Emma Taylor', 45, 'Female', '432 Maple St, Sydney, Australia', 'Burglary', 'Released', 'George Taylor', '2024-08-05', NULL, 'Sydney Prison', 8),
(9, 'William Anderson', 50, 'Male', '876 Cedar St, Cape Town, South Africa', 'Arson', 'Incarcerated', 'Paul Anderson', '2024-07-23', NULL, 'Cape Town Prison', 9),
(10, 'Charlotte White', 28, 'Female', '987 Oak St, Chicago, USA', 'Robbery', 'Released', 'Mark White', '2024-08-29', NULL, 'Chicago Jail', 10);

INSERT INTO Officers (Officer_id, First_Name, Last_Name, O_Rank, Department, Date_of_Joining, Date_of_Birth, Phone_No, Officer_Status, Badge_No, Case_Id)
VALUES
(1, 'Mark', 'Spencer', 'Detective', 'Homicide', '2015-03-12', '1985-06-25', '555-123-4567', 'ACTIVE', 'D1234', 1),
(2, 'Sarah', 'Collins', 'Detective', 'Fraud Investigation', '2017-05-20', '1988-10-14', '555-234-5678', 'ACTIVE', 'D2345', 2),
(3, 'James', 'Carter', 'Detective', 'Drug Enforcement', '2016-02-18', '1990-03-12', '555-345-6789', 'ACTIVE', 'D3456', 3),
(4, 'Olivia', 'Martinez', 'Detective', 'Assault & Battery', '2014-07-09', '1986-05-11', '555-456-7890', 'ACTIVE', 'D4567', 4),
(5, 'Michael', 'Adams', 'Detective', 'Cybercrime', '2018-01-23', '1987-08-17', '555-567-8901', 'ACTIVE', 'D5678', 5),
(6, 'Richard', 'White', 'Detective', 'Missing Persons', '2019-11-30', '1984-04-05', '555-678-9012', 'ACTIVE', 'D6789', 6),
(7, 'Sophia', 'Clark', 'Detective', 'Corruption Investigation', '2020-04-22', '1990-08-14', '555-789-0123', 'ACTIVE', 'D7890', 7),
(8, 'Nathan', 'Wilson', 'Detective', 'Robbery', '2017-08-19', '1991-02-11', '555-890-1234', 'ACTIVE', 'D8901', 8),
(9, 'Emily', 'Scott', 'Detective', 'Arson Investigation', '2015-09-03', '1989-09-30', '555-901-2345', 'ACTIVE', 'D9012', 9),
(10, 'Liam', 'Turner', 'Detective', 'Robbery', '2020-05-06', '1986-12-17', '555-012-3456', 'ACTIVE', 'D0123', 10);

-- Insert into Evidence table
INSERT INTO Evidence (Evidence_Id, Evidence_type, E_Description, Collected_by, Collection_Date, Storage_location, Evidence_status, Associated_suspect, Case_Id)
VALUES
(1, 'Weapon', 'Firearm used in the homicide', 'Detective Mark Spencer', '2024-01-12', 'Evidence Locker 1', 'Stored', 'John Doe', 1),
(2, 'Document', 'Forgery documents used in fraud', 'Detective Sarah Collins', '2023-11-07', 'Evidence Locker 2', 'Analyzed', 'Jane Smith', 2),
(3, 'DNA', 'DNA samples from drug trafficking location', 'Detective James Carter', '2024-03-18', 'Evidence Locker 3', 'Stored', 'Carlos Sanchez', 3),
(4, 'Fingerprint', 'Fingerprints found at assault scene', 'Detective Olivia Martinez', '2024-02-12', 'Evidence Locker 4', 'Analyzed', 'Olivia Brown', 4),
(5, 'Weapon', 'Hacking tool used in cybercrime', 'Detective Michael Adams', '2024-04-27', 'Evidence Locker 5', 'Stored', 'Michael Adams', 5),
(6, 'Weapon', 'Kidnapping device used for ransom', 'Detective Richard White', '2024-05-12', 'Evidence Locker 6', 'Stored', 'Sophia Clark', 6),
(7, 'Document', 'Bribery contract', 'Detective Sophia Clark', '2024-06-14', 'Evidence Locker 7', 'Analyzed', 'James Wilson', 7),
(8, 'DNA', 'DNA evidence from burglary scene', 'Detective Nathan Wilson', '2024-08-07', 'Evidence Locker 8', 'Discarded', 'Emma Taylor', 8),
(9, 'Document', 'Arson investigation report', 'Detective Emily Scott', '2024-07-23', 'Evidence Locker 9', 'Stored', 'William Anderson', 9),
(10, 'Weapon', 'Stolen firearm from robbery scene', 'Detective Liam Turner', '2024-08-30', 'Evidence Locker 10', 'Analyzed', 'Charlotte White', 10);

CREATE TABLE LoginCredentials (
    LoginID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('Head', 'Team') DEFAULT 'Team'
);


INSERT INTO LoginCredentials (Username, Password, Role)
VALUES 
('ali', 'password1', 'Head');


-- 1. Retrieve all cases for a specific criminal
SELECT C.*
FROM Cases C
JOIN Criminals CC ON C.Case_Id = CC.Case_Id
JOIN Criminals CR ON CC.Criminal_Id = CR.Criminal_Id
WHERE CR.Criminal_Id = 1;  


-- 3. Calculate the average number of court hearings per case
SELECT AVG(Hearing_Count) AS Avg_Hearings_Per_Case
FROM (
    SELECT Case_Id, COUNT(*) AS Hearing_Count
    FROM CourtHearings
    GROUP BY Case_Id 
	) AS HearingCounts;


-- 4. List the top 5 criminals with the most cases
SELECT Criminal_Id, C_Name, Case_Count 
FROM
(SELECT CR.Criminal_Id, CR.C_Name, COUNT(CC.Case_Id) AS Case_Count,
ROW_NUMBER() OVER (ORDER BY COUNT(CC.Case_Id)DESC) AS rn
FROM Criminals CR
JOIN Criminals CC ON CR.Criminal_Id = CC.Criminal_Id
GROUP BY CR.Criminal_Id, CR.C_Name)
sub WHERE rn<=5;


-- 5. Retrieve the most common type of crime
SELECT Case_type, TotalCases
FROM (
    SELECT ca.Case_type, COUNT(ca.Case_Id) AS TotalCases,
           ROW_NUMBER() OVER (ORDER BY COUNT(ca.Case_Id) DESC) AS rn
    FROM Cases ca
    JOIN Criminals c ON ca.Case_Id = c.Case_Id
    GROUP BY ca.Case_type
) sub
WHERE rn = 1;


-- 6. List all cases that are currently open
SELECT * 
FROM Criminals ;
DESCRIBE Criminals;

WHERE case_status = 'Open';


-- 7. Find criminals who were involved in cases in the last 30 days
SELECT DISTINCT c.criminal_id, c.c_name, c.crime_type
FROM criminals c 
JOIN cases ca ON c.criminal_id = ca.case_id 
WHERE ca.starting_date >= DATEADD( DAY, -30, GETDATE());


-- 8. Calculate the total number of cases heard in court each month
SELECT YEAR(Hearing_Date) AS HearingYear,
       MONTH(Hearing_Date) AS HearingMonth,
       COUNT(Hearing_Id) AS TotalHearings
FROM CourtHearings
GROUP BY YEAR(Hearing_Date), MONTH(Hearing_Date)
ORDER BY HearingYear, HearingMonth;


-- 9. Retrieve the details of the most recent court hearing
SELECT ch.Hearing_Id, ch.Hearing_Date, ch.Hearing_Time, ch.Court_Name,  
              ch.Judge_Name, ch.Hearing_Outcome, ch.Hearing_Status  
FROM CourtHearings ch  
ORDER BY ch.Hearing_Date DESC, ch.Hearing_Time DESC;  


-- 10. Find the average number of victims per case
SELECT AVG(victim_count) AS avg_victims_per_case
FROM (
    SELECT case_id, COUNT(victim_id) AS victim_count 
    FROM victims 
    GROUP BY case_id
) AS victims_per_case;


INSERT INTO Criminals (Criminal_Id, C_Name, Age, Gender, C_Address, Crime_Type, C_Status, Father_Name, Arrest_Date, Release_Date, Prison_Name, Photo,Case_Id)  
VALUES  
(11, 'David Johnson', 35, 'Male', '789 Pine St, Los Angeles, USA', 'Robbery', 'Incarcerated', 'Robert Johnson', '2024-02-10', NULL, 'San Quentin State Prison', NULL,NULL),  
(12, 'Emily Davis', 26, 'Female', '321 Birch St, London, UK', 'Cybercrime', 'Released', 'Thomas Davis', '2023-12-01', '2024-03-20', 'London Correctional Facility', NULL, NULL);  


-- 11.LIST OF OFFICERS WHO HAVE NEVER HANDLED A CASE--
INSERT INTO Officers (Officer_id, First_Name, Last_Name, O_Rank, Department, Date_of_Joining, Date_of_Birth, Phone_No, Officer_Status, Badge_No, Case_Id)
VALUES

(11, 'James', 'Anderson', 'Sergeant', 'Narcotics', '2014-07-22', '1983-09-15', '555-987-6543', 'ACTIVE', 'S5678', NULL),
(12, 'Emma', 'Williams', 'Lieutenant', 'Cyber Crime', '2018-11-10', '1990-05-30', '555-876-5432', 'INACTIVE', 'L6789', NULL);

SELECT Officer_id, First_Name, Last_Name, O_Rank, Department,Date_of_Joining, Date_of_Birth, Phone_No, Officer_Status, Badge_No, Case_Id
FROM Officers
WHERE Case_Id IS NULL;

-- 12. Retrieve the total number of court hearings for each case
SELECT c.Case_Id, c.Case_No, COUNT(ch.Hearing_Id) AS Total_Hearings
FROM Cases c
LEFT JOIN CourtHearings ch ON c.Case_Id = ch.Case_Id
GROUP BY c.Case_Id, c.Case_No;


-- 13. Calculate the total number of pieces of evidence recorded
SELECT COUNT(Evidence_Id) AS Total_Evidence
FROM Evidence;

-- 16. List evidence items along with the cases they are linked to
SELECT e.Evidence_Id, e.Evidence_type, e.E_Description, e.Collected_by, 
       e.Collection_Date, e.Storage_location, e.Evidence_status, 
       e.Associated_suspect, c.Case_Id, c.Case_No, c.Case_type
FROM Evidence e
JOIN Cases c ON e.Case_Id = c.Case_Id;



-- 17. Find the top 3 officers handling the most cases
SELECT  o.Officer_id, o.First_Name, o.Last_Name, COUNT(c.Case_Id) AS Case_Count
FROM Officers o
JOIN Cases c ON o.Case_Id = c.Case_Id
GROUP BY o.Officer_id, o.First_Name, o.Last_Name
ORDER BY Case_Count DESC;

-- 18 Calculate total number of criminals recorded in the system
SELECT COUNT(Criminal_Id) AS Total_Criminals 
FROM Criminals;



-- 19 Retrieve the list of criminals along with the number of cases they are involved in
SELECT cr.Criminal_Id, cr.C_Name, COUNT(c.Case_Id) AS Case_Count
FROM Criminals cr
LEFT JOIN Cases c ON cr.Case_Id = c.Case_Id
GROUP BY cr.Criminal_Id, cr.C_Name
ORDER BY Case_Count DESC;


-- 20 List cases with more than a specified number of hearings
SELECT c.Case_Id, c.Case_No, c.Case_type, COUNT(h.Hearing_Id) AS Hearing_Count
FROM Cases c
JOIN CourtHearings h ON c.Case_Id = h.Case_Id
GROUP BY c.Case_Id, c.Case_No, c.Case_type
HAVING COUNT(h.Hearing_Id) > 3;


-- 21 CREATE A LOG TABLE
CREATE TABLE ChangeLog(
LogId INT PRIMARY KEY,
TableName VARCHAR(50),
RecordId INT,
ChangeDate DATETIME DEFAULT GETDATE(),
ChangedBy VARCHAR(100)
);
GO;

--------------------------------------------------------------------------------------------------------------------------
-- Triggers for Criminal table

-- 22 INSERT TRIGGER FOR CRIMINAL TABLE
CREATE  TRIGGER trg_Insert_Criminal
ON Criminals
AFTER INSERT
AS
BEGIN
	-- Use the NEXT VALUE FOR or any integer for LogId
	INSERT INTO ChangeLog (LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId), 0) + 1 FROM ChangeLog), 'Criminals', inserted.Criminal_ID, SYSTEM_USER
	FROM inserted;

	-- Display a message indicating the trigger has fired
	PRINT 'INSERT OPERATION LOGGED FOR CRIMINALS TABLE';
END;



INSERT INTO Cases (Case_Id, Case_type, Case_description, Case_Status)
VALUES (20, 'Homicide', 'Murder case of Swan Berlin', 'Open');


-- TRY TO INSERT ONE RECORD IN CRIMINALS TABLE
INSERT INTO Criminals (Criminal_Id, C_Name, Age, Gender, C_Address, Crime_Type, C_Status, Father_Name, Arrest_Date, Release_Date, Prison_Name, Photo, Case_Id)
VALUES
(14, 'Swan berlin', 28, 'Female', '76 Land mart, New York, USA', 'Homicide', 'Incarcerated', 'Dean Dizly', '2024-01-11', NULL, 'Rikers Island', NULL, 20);




SELECT * FROM Criminals;
SELECT	* FROM ChangeLog;

GO;


-- 23 UPDATE TRIGGER FOR CRIMINAL TABLE
CREATE TRIGGER trg_Update_Criminal
ON Criminals
AFTER UPDATE
AS
BEGIN
	-- Use the NEXT VALUE FOR or any integer for LogId
	INSERT INTO ChangeLog (LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId), 0) + 1 FROM ChangeLog), 'Criminals', inserted.Criminal_ID, SYSTEM_USER
	FROM inserted;

	-- Display a message indicating the trigger has fired
	PRINT 'UPDATE OPERATION LOGGED FOR CRIMINALS TABLE';
END;

-- TRY TO UPDATE FROM PRODUCTS TABLE
UPDATE Criminals SET C_Status = 'Released' WHERE Criminal_Id = 11;

SELECT * FROM Criminals;
GO;
-- 24 DELETE TRIGGER FROM CRIMINAL TABLE
CREATE OR ALTER TRIGGER trg_Delete_Criminal
ON Criminals
AFTER DELETE
AS
BEGIN
	-- Use the NEXT VALUE FOR or any integer for LogId
	INSERT INTO ChangeLog (LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId), 0) + 1 FROM ChangeLog), 'Criminals', inserted.Criminal_ID, SYSTEM_USER
	FROM inserted;

	-- Display a message indicating the trigger has fired
	-- PRINT 'DELETE OPERATION LOGGED FOR CRIMINALS TABLE';
END;

DELETE FROM Criminals WHERE Case_Id % 2= 0;
DELETE FROM Criminals WHERE Age > 30;
GO;

-----------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS FOR OFFICERS TABLE


-- INSERT TABLE FOR OFFICERS
CREATE OR ALTER TRIGGER trg_INSERT_Officers 
ON Officers
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Officers', deleted.Officer_id, SYSTEM_USER 
	   FROM deleted;
END;
GO;
-- UPDATE TABLE FOR OFFICERS
CREATE TRIGGER trg_UPDATE_Officers 
ON Officers
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Officers', inserted.Officer_id, SYSTEM_USER 
	   FROM inserted;
END;

-- DELETE TABLES FOR officers tables
GO;
CREATE TRIGGER trg_Delete_Officers
ON Officers
AFTER INSERT
AS 
BEGIN
	INSERT INTO	ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId) , 0) + 1  From ChangeLog)  , 'Officers', deleted.Officer_id, SYSTEM_USER
	FROM deleted;

 
END;

SELECT * FROM Officers ;


-----------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS FOR CASES TABLE


-- INSERT TABLE FOR CASES
GO;
CREATE OR ALTER TRIGGER trg_INSERT_Cases 
ON Cases
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Cases', deleted.Case_Id, SYSTEM_USER 
	   FROM deleted;
END;
GO;
-- UPDATE TABLE FOR CASES
CREATE OR ALTER TRIGGER trg_UPDATE_Cases 
ON Cases
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Cases', inserted.Case_Id, SYSTEM_USER 
	   FROM inserted;
END;

--DELETE TABLES FOR cases tables
GO;
CREATE TRIGGER trg_Delete_Cases
ON Cases
AFTER INSERT
AS 
BEGIN
	INSERT INTO	ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId) , 0) + 1  From ChangeLog)  , 'Cases', deleted.Case_Id, SYSTEM_USER
	FROM deleted;

 
END;

SELECT * FROM Cases ;


-----------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS FOR EVIDENCE TABLE


--INSERT TABLE FOR EVIDENCE
GO;
CREATE OR ALTER TRIGGER trg_INSERT_Evidence 
ON Evidence
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Evidence', deleted.Evidence_Id, SYSTEM_USER 
	   FROM deleted;
END;
GO;
--UPDATE TABLE FOR EVIDENCE
CREATE TRIGGER trg_UPDATE_Evidence 
ON Evidence
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Evidence', inserted.Evidence_Id, SYSTEM_USER 
	   FROM inserted;
END;

-- DELETE TABLES FOR evidence tables
GO;
CREATE TRIGGER trg_Delete_Evidence
ON Evidence
AFTER INSERT
AS 
BEGIN
	INSERT INTO	ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId) , 0) + 1  From ChangeLog)  , 'Evidence', deleted.Evidence_Id, SYSTEM_USER
	FROM deleted;

 
END;

SELECT * FROM Evidence ;


-----------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS FOR VICTIMS TABLE


--INSERT TABLE FOR VICTIMS
GO;
CREATE OR ALTER TRIGGER trg_INSERT_Victims
ON Victims
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Victims', deleted.Victim_id, SYSTEM_USER 
	   FROM deleted;
END;
GO;
--UPDATE TABLE FOR VICTIMS
CREATE TRIGGER trg_UPDATE_Victims
ON Victims
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Victims', inserted.Victim_id, SYSTEM_USER 
	   FROM inserted;
END;

-- DELETE TABLES FOR victims tables
GO;
CREATE TRIGGER trg_Delete_Victims
ON Victims
AFTER INSERT
AS 
BEGIN
	INSERT INTO	ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId) , 0) + 1  From ChangeLog)  , 'Victims', deleted.Victim_id, SYSTEM_USER
	FROM deleted;

 
END;

SELECT * FROM Victims ;


-----------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS FOR COURTHEARINGS TABLE


--INSERT TABLE FOR COURTHEARINGS
GO;
CREATE OR ALTER TRIGGER trg_INSERT_CourtHearings
ON CourtHearings 
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'CourtHearings', deleted.Hearing_Id, SYSTEM_USER 
	   FROM deleted;
END;
GO;
-- UPDATE TABLE FOR COURTHEARINGS
CREATE TRIGGER trg_UPDATE_CourtHearings
ON CourtHearings 
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'CourtHearings', inserted.Hearing_Id, SYSTEM_USER 
	   FROM inserted;
END;

-- DELETE TABLES FOR CourtHearings tables
GO;
CREATE TRIGGER trg_Delete_CourtHearings
ON CourtHearings 
AFTER INSERT
AS 
BEGIN
	INSERT INTO	ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId) , 0) + 1  From ChangeLog)  , 'CourtHearings', deleted.Hearing_Id, SYSTEM_USER
	FROM deleted;

 
END;

SELECT * FROM CourtHearings ;


-----------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS FOR COURT TABLE


--INSERT TABLE FOR COURT
GO;
CREATE OR ALTER TRIGGER trg_INSERT_Court
ON Court
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Court', deleted.Court_Id, SYSTEM_USER 
	   FROM deleted;
END;
GO;
--UPDATE TABLE FOR COURT
CREATE TRIGGER trg_UPDATE_Court
ON Court
AFTER INSERT
AS
BEGIN 
       INSERT INTO ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	   SELECT ( SELECT  ISNULL(MAX(LogId),0 ) +1 From ChangeLog) , 'Court', inserted.Court_Id, SYSTEM_USER 
	   FROM inserted;
END;

--DELETE TABLES FOR court tables
GO;
CREATE TRIGGER trg_Delete_Court
ON Court
AFTER INSERT
AS 
BEGIN
	INSERT INTO	ChangeLog ( LogId, TableName, RecordId, ChangedBy)
	SELECT (SELECT ISNULL(MAX(LogId) , 0) + 1  From ChangeLog)  , 'Court', deleted.Court_Id, SYSTEM_USER
	FROM deleted;

 
END;

SELECT * FROM Court ;

-----------------------------------------------------------------------------------------------------------------------------

USE CrimeRecord;
GO
-- Clustered Index on Cases Table (Case_Id)
CREATE CLUSTERED INDEX IDX_Cases_Case_Id
ON Cases (Case_Id);
GO

--------

-- Clustered Index on Victims Table (Victim_id)
CREATE CLUSTERED INDEX IDX_Victims_Victim_id
ON Victims (Victim_id);
GO

--Non-Clustered Index on Case_Id: To speed up queries filtering by Case_Id
CREATE NONCLUSTERED INDEX IDX_Victims_Case_Id
ON Victims (Case_Id);
GO

--Non-Clustered Index on Crime_type: To speed up queries filtering or sorting by Crime_type
CREATE NONCLUSTERED INDEX IDX_Victims_Crime_type
ON Victims (Crime_type);
GO

--------

--Clustered index on Criminals table (Criminal_Id)
CREATE CLUSTERED INDEX IDX_Criminals_Criminal_Id
ON Criminals (Criminal_Id);
GO

--Non-Clustered Index on C_Name: To speed up queries filtering by C_Name
CREATE NONCLUSTERED INDEX IDX_Criminals_C_Name
ON Criminals (C_Name);
GO

--Non-Clustered Index on Arrest_Date: To speed up queries filtering or sorting by Arrest_Date
CREATE NONCLUSTERED INDEX IDX_Criminals_Arrest_Date
ON Criminals (Arrest_Date);
GO

--------

--Clustered index on Officers table (Officer_id)
CREATE CLUSTERED INDEX IDX_Officers_Officer_Id
ON Officers (Officer_id);
GO

--Non-Clustered Index on O_Rank: To speed up queries filtering by O_Rank
CREATE NONCLUSTERED INDEX IDX_Officers_O_Rank
ON Officers (O_Rank);
GO

--Non-Clustered Index on Officer_Status: To speed up queries filtering or sorting by Officer_Status
CREATE NONCLUSTERED INDEX IDX_Officers_Officer_Status
ON Officers (Officer_Status);
GO

--------

--Clustered index on Evidence table (Evidence_Id)
CREATE CLUSTERED INDEX IDX_Evidence_Evidence_Id
ON Evidence (Evidence_Id);
GO

--Non-Clustered Index on Evidence_type: To speed up queries filtering by Evidence_type
CREATE NONCLUSTERED INDEX IDX_Evidence_Evidence_type
ON Evidence (Evidence_type);
GO

--Non-Clustered Index on Evidence_status: To speed up queries filtering or sorting by Evidence_status
CREATE NONCLUSTERED INDEX IDX_Evidence_Evidence_status
ON Evidence (Evidence_status);
GO

--------

--Clustered index on Court table (Court_Id)
CREATE CLUSTERED INDEX IDX_Court_Court_Id
ON Court (Court_Id);
GO

--Non-Clustered Index on Court_type: To speed up queries filtering by Court_type
CREATE NONCLUSTERED INDEX IDX_Court_Court_type
ON Court (Court_type);
GO

--Non-Clustered Index on Court_Status: To speed up queries filtering or sorting by Court_Status
CREATE NONCLUSTERED INDEX IDX_Court_Court_Status
ON Court (Court_Status);
GO

--------

--Clustered index on CourtHearings table (Hearing_Id)
CREATE CLUSTERED INDEX IDX_CourtHearings_Hearing_Id
ON CourtHearings (Hearing_Id);
GO

--Non-Clustered Index on Judge_Name: To speed up queries filtering by Judge_Name
CREATE NONCLUSTERED INDEX IDX_CourtHearings_Judge_Name
ON CourtHearings (Judge_Name);
GO

--Non-Clustered Index on Hearing_Status: To speed up queries filtering or sorting by Hearing_Status
CREATE NONCLUSTERED INDEX IDX_CourtHearings_Hearing_Status
ON CourtHearings (Hearing_Status);
GO

--------



 