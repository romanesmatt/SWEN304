-- My solution
-- Step wise approach
CREATE VIEW SecurityAmount as (
SELECT b.BankName, b.City, b.Security, r.Amount
FROM Banks b NATURAL JOIN Robberies r
ORDER BY b.Security);

CREATE VIEW RobberAmount as (
SELECT Security, COUNT(Security) AS NumberRobberies, 
AVG(Amount) AS AverageAmount
FROM SecurityAmount
GROUP BY Security
ORDER BY NumberRobberies DESC);
 
--  Nested query
SELECT Security AS SecurityLevel, COUNT(Security) AS NumberRobberies,
AVG(Amount) AS AverageAmount
FROM (SELECT b.BankName, b.City, b.Security, r.Amount
FROM Robberies r NATURAL JOIN Banks b) AS sec
GROUP BY Security
ORDER BY NumberRobberies DESC

