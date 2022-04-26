Select r.RobberId,r.NickName,(r.Age-r.NoYears) AS YearsNotInPrison
From Robbers r
Where r.NoYears>(r.age/2)