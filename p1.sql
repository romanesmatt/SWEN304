-- Question 1
-- Table Banks
CREATE TABLE Banks(
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    NoAccounts INT DEFAULT 0,
    Security CHAR(15),
    CONSTRAINT BanksPK PRIMARY KEY (BankName, City)
);
-- Add constraint that number cannot be below zero
ALTER TABLE Banks
ADD CONSTRAINT bankAccountNumConstraint CHECK(NoAccounts >= 0);
-- Add bank security constraint
ALTER TABLE Banks
ADD CONSTRAINT bankSecConstraint CHECK(
        Security = "excellent"
        OR Security = "very good"
        OR Security = "weak"
    );
-- Table Robberies
CREATE TABLE Robberies(
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    Date DATE NOT NULL,
    Amount int NOT NULL,
    CONSTRAINT Robberies PK Primary Key (BankName, City, Date),
    FOREIGN KEY (BankName, City),
    REFERENCES Banks(BankName, City)
);
-- Amount should not be int
ALTER TABLE Robberies;
ALTER COLUMN Amount TYPE REAL;
-- Table Plans
CREATE TABLE Plans(
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    NoRobbers int,
    PlannedDate DATE NOT NULL,
    CONSTRAINT PlansPK PRIMARY KEY (BankName, City, PlannedDate),
    FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City)
);
-- Table Robbers
CREATE TABLE Robbers(
    RobberId int NOT NULL UNIQUE,
    Nickname CHAR(25) NOT NULL,
    Age int NOT NULL,
    NoYears int,
    CONSTRAINT RobbersPK PRIMARY KEY (RobberId),
    CONSTRAINT RobberNoYears CHECK (Age >= NoYears)
);
-- Table Skills
CREATE TABLE Skills(
    SkillId int NOT NULL UNIQUE CONSTRAINT SkillsPK PRIMARY KEY,
    Description CHAR(25) NOT NULL
);
-- Table HasSkills
CREATE TABLE HasSkills (
    RobberId int NOT NULL,
    SkillId int NOT NULL,
    Preference int NOT NULL,
    Grade CHAR(3) NOT NULL,
    CONSTRAINT HasSkillsPK PRIMARY KEY (RobberId, SkillId),
    FOREIGN KEY (RobberId) REFERENCES Robbers(RobberId),
    FOREIGN KEY (SkillId) REFERENCES Skills(SkillId)
);
-- Table HasAccounts
CREATE TABLE HasAccounts (
    RobberId int NOT NULL,
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    CONSTRAINT HasAccountsPK PRIMARY KEY (RobberId, BankName, City),
    CONSTRAINT HasAccounts2FK FOREIGN KEY (RobberId) REFERENCES Robbers(RobberId),
    CONSTRAINT HasAccounts1FK FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City)
);
-- Table HasAccomplices
CREATE TABLE Accomplices (
    RobberId int NOT NULL,
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    Date DATE NOT NULL,
    Share REAL NOT NULL,
    CONSTRAINT AccomplicesPK PRIMARY KEY (RobberId, BankName, City, Date),
    CONSTRAINT AccomplicesFK FOREIGN KEY (RobberId) REFERENCES Robbers(RobberId),
    CONSTRAINT HasAccounts1FK FOREIGN KEY (BankName, City, Date) REFERENCES Robberies(BankName, City, Date)
);
-- Question 2
-- Populating Banks
\ copy Banks(BankName, City, NoAccounts, Security)
FROM ~ / datafiles / banks_22.data -- Populating Robberies
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
ALTER SEQUENCE Skills_SkillId_seq2 OWNED BY Skills.SkillId;
update skills
set SkillID = nextval('Skills_SkillId_seq2') -- Populating HasSkills
    -- Extracting RobberID and SkillID columns and adding them to HasSkills
INSERT INTO HasSkills(RobberId, SkillId, Preference, Grade)
SELECT r.RobberId,
    s.SkillId,
    ts.Preference,
    ts.Grade
FROM TempSkills ts,
    Robbers r,
    Skills s
WHERE r.Nickname = ts.RobberNameTemp
    AND s.Description = ts.DescTemp -- Populating HasAccounts
    -- Creating temporary table
    CREATE TABLE TempHasAccounts (
        RobberNameTemp CHAR(25) NOT NULL,
        BankName CHAR(30) NOT NULL,
        City CHAR(30) NOT NULL
    );
-- Copying data into relation
\ copy TempHasAccounts(RobberNameTemp, BankName, City)
FROM ~ / datafiles / hasaccounts_22.data