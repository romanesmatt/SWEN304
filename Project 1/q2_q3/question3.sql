-- Q1
INSERT INTO Skills (SkillID, Description) 
VALUES(21,'Driving');
-- Q2
INSERT INTO Banks (BankName, City, NoAccounts, Security )
VALUES('Loanshark Bank', 'Evanston', 100,'very good');

INSERT INTO Banks (BankName, City, NoAccounts, Security )
VALUES('EasyLoan Bank', 'Evanston', -5,'excellent');

INSERT INTO Banks (BankName, City, NoAccounts, Security )
VALUES('EasyLoan Bank', 'Evanston', 100,'poor');
-- Q3
INSERT INTO Robberies (BankName, City, Date, Amount )
VALUES('NXP Bank', 'Chicago','2019-01-08' ,1000);
-- Q4
-- Deleting that doesn't do anything
DELETE FROM Skills
WHERE SkillID = 1 AND Description='Driving'

-- Deleting that causes constraint
DELETE FROM Skills
WHERE SkillID = 4 AND Description='Driving'
-- Q5
DELETE FROM Banks
WHERE BankName='PickPocket Bank' AND City='Evanston' AND NoAccounts=2000 AND Security='very good'
-- Q6
DELETE FROM Robberies
WHERE BankName='Loanshark Bank' AND City='Chicago' AND Date='' AND Amount='""'
-- Q7
-- a.
INSERT INTO Robbers (RobberId, Nickname, Age, NoYears)
VALUES (1, 'Shotgun', 70, 0);
-- b
INSERT INTO Robbers (RobberId, Nickname, Age, NoYears)
VALUES (333, 'Jail Mouse', 25, 35);
-- Q8
-- a
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade)
VALUES(1,7,1, 'A+');
-- b
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade)
VALUES(1,2,0, 'A');
-- c
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade)
VALUES(333,1,1, 'B-');
-- d
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade)
VALUES(3,20,3, 'B+');
-- Q9
DELETE FROM Robbers
Where RobberId = 1 AND Nickname = 'Al Capone' AND Age=31 AND NoYears = 2

