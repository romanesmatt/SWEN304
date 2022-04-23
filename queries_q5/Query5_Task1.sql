Select p.BankName,p.City
From Plans p JOIN
(SELECT b.BankName ,b.City
FROM Banks b
WHERE NOT EXISTS(SELECT 1 FROM Robberies r WHERE r.BankName = b.BankName
AND r.City = b.City) ) nr
ON p.BankName = nr.BankName AND p.City = nr.City