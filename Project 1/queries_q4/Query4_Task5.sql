SELECT r.RobberId ,r.NickName,Rc.TotalEarnings
FROM Robbers r JOIN(SELECT RobberId , SUM(Share) AS TotalEarnings FROM
Accomplices GROUP BY RobberId) Rc
ON Rc.RobberId = r.RobberId
WHERE Rc.TotalEarnings >=40000
ORDER BY Rc.TotalEarnings DESC