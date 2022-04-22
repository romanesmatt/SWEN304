Select r.RobberId,r.NickName,s.Description
From Robbers r NATURAL JOIN Skills s NATURAL JOIN HasSkills hs
ORDER BY s.Description