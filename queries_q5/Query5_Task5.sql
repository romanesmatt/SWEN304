Select c1.BankName,c1.City
From Robbers r Natural JOIN
(select a.BankName,a.City,count( a.RobberId) AS c
From (Select BankName,City,RobberId From Accomplices) a
Group by BankName,City) c1 JOIN (Select Count(*) as c From Robbers )c2
ON c1.c = c2.c