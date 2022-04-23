Select DISTINCT r.RobberId,r.NickName,s.Description
From Robbers r NATURAL JOIN Skills s NATURAL JOIN HasSkills hs Natural JOIN
(Select r1.RobberId,r1.NickName,count(r1.RobberId) AS c
From Robbers r1 NATURAL JOIN Skills s1 NATURAL JOIN HasSkills hs1
GROUP BY r1.RobberId) c1
WHERE c1.c>=2