-- Question 2
-- Populating Banks
\copy Banks(BankName, City, NoAccounts, Security) FROM ~/datafiles/banks_22.data -- Populating Robberies
    \ copy Robberies(BankName, City, Date, Amount)
FROM ~ / datafiles / robberies_22.data -- Populating Plans
    \ copy Plans(BankName, City, PlannedDate, NoRobbers)
FROM ~ / datafiles / plans_22.data -- Populating Robbers
    -- Setting the RobberID
    CREATE SEQUENCE Robbers_RobberId_seq AS integer;
ALTER TABLE Robbers
ALTER COLUMN RobberId
SET DEFAULT nextval('Robbers_RobberId_seq');
ALTER SEQUENCE Robbers_RobberId_seq OWNED BY Robbers.RobberId;
\ copy Robbers(Nickname, Age, NoYears)
FROM ~ / datafiles / robbers_22.data
Select *
From Robbers -- Populating Skills
    CREATE SEQUENCE Skills_SkillId_seq AS integer;
ALTER TABLE Skills
ALTER COLUMN SkillId
SET DEFAULT nextval('Skills_SkillId_seq');
ALTER SEQUENCE Skills_SkillId_seq OWNED BY Skills.SkillId;
-- Creating a temporary table
CREATE TABLE TempSkills (
    RobberNameTemp CHAR(25) NOT NULL,
    DescTemp CHAR(25) NOT NULL,
    Preference int NOT NULL,
    Grade CHAR(3) NOT NULL
);
-- Copying the data to the temporary table
\ copy TempSkills(RobberNameTemp, DescTemp, Preference, Grade)
FROM ~ / datafiles / hasskills_22.data -- Extracting the Description column and adding it to the Skills relation
INSERT INTO Skills(Description) -- Correcting to serial number by order
SELECT DescTemp
FROM TempSkills CREATE SEQUENCE Skills_SkillId_seq2 AS integer;
CREATE SEQUENCE Skills_SkillId_seq2 AS integer;
ALTER SEQUENCE Skills_SkillId_seq2 OWNED BY Skills.SkillId;
update skills
set SkillID = nextval('Skills_SkillId_seq2') 
-- Populating HasSkills
    -- Extracting RobberID and SkillID columns and adding them to HasSkills
INSERT INTO HasSkills(RobberId,SkillId,Preference,Grade)
SELECT r.RobberId,s.SkillId,ts.Preference,ts.Grade
FROM TempSkills ts,Robbers r,Skills s
WHERE r.Nickname=ts.RobberNameTemp AND s.Description=ts.DescTemp -- Populating HasAccounts
    -- Creating temporary table
    CREATE TABLE TempHasAccounts (
        RobberNameTemp CHAR(25) NOT NULL,
        BankName CHAR(30) NOT NULL,
        City CHAR(30) NOT NULL
    );
-- Copying data into relation

\copy TempHasAccounts(RobberNameTemp, BankName, City) FROM ~/Documents/datafiles/hasaccounts_22.data
-- Extracting RobberID column and putting into HasAccounts table
INSERT INTO HasAccounts(RobberId,BankName,City)
SELECT r.RobberId,ta.BankName,ta.City
FROM TempHasAccounts ta,Robbers r
WHERE r.Nickname=ta.RobberNameTemp
-- Populating accomplices
CREATE TABLE TempAccomplices (
RobberNameTemp CHAR(25) NOT NULL,
BankName CHAR(30) NOT NULL,
City CHAR(30) NOT NULL ,
DateTemp DATE NOT NULL,
Share REAL NOT NULL
);

\copy TempAccomplices(RobberNameTemp,BankName,City,DateTemp,Share) FROM ~/Documents/datafiles/accomplices_22.data

INSERT INTO Accomplices(RobberId,BankName,City,Date,Share)
SELECT r.RobberId,ta.BankName,ta.City,ta.DateTemp,ta.Share
FROM TempAccomplices ta,Robbers r
WHERE r.Nickname=ta.RobberNameTemp
-- Dropping temporary tables
DROP TABLE TempSkills
DROP TABLE TempHasAccounts
DROP TABLE TempAccomplices