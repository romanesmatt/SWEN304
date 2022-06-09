SELECT r.RobberId, r.Nickname, s.Description
FROM Robbers r NATURAL JOIN HasSkills h NATURAL JOIN Skills s
GROUP BY r.RobberId, r.Nickname, h.Preference, s.Description
HAVING h.Preference = 1;