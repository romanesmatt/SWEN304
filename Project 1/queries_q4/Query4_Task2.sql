SELECT r.RobberId ,r.NickName,r.Age,s.Description
FROM Robbers r ,HasSkills hs,Skills s
WHERE r.Age >= 40 AND r.RobberId = hs.RobberId AND
s.SkillId=hs.SkillId