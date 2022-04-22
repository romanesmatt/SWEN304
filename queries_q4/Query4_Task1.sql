SELECT b.BankName ,b.City
FROM Banks b
WHERE NOT EXISTS(SELECT 1 FROM Robberies r WHERE r.BankName = b.BankName
AND r.City = b.City)