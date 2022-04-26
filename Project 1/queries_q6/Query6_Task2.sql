SELECT Security AS SecurityLevel, COUNT(Security) AS NumberRobberies,
AVG(Amount) AS AverageAmount
FROM (SELECT b.BankName, b.City, b.Security, r.Amount
FROM Robberies r NATURAL JOIN Banks b) AS sec
GROUP BY Security
ORDER BY NumberRobberies DESC

