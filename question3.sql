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
WHERE BankName=""

