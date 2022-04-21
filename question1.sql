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
        Security = 'excellent'
        OR Security = 'very good'
        OR Security = 'weak'
    );
-- Table Robberies
CREATE TABLE Robberies(
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    Date DATE NOT NULL,
    Amount int NOT NULL,
    CONSTRAINT RobberiesPK Primary Key (BankName, City, Date),
    FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City)
);
-- Amount should not be int
ALTER TABLE Robberies
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