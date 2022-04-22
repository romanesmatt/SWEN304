SELECT b.BankName ,b.City,b.NoAccounts
FROM Banks b
WHERE b.BankName NOT IN (SELECT b1.BankName FROM Banks b1 WHERE b1.City =
'Chicago')
ORDER BY b.NoAccounts ASC