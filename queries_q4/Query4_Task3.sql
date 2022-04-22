SELECT DISTINCT b.BankName, b.City
FROM Banks b NATURAL JOIN HasAccounts hs NATURAL JOIN Robbers r
WHERE Hs.RobberId = r.RobberId AND r.NickName = 'Al Capone'