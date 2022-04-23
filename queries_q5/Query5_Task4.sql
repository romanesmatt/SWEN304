Select r.BankName,r.City ,r.Date
From Robberies r Natural JOIN
(Select City,Max(Amount) AS MaxAmount
From Robberies
Group By City) hs
Where r.Amount = hs.MaxAmount