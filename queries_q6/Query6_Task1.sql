  SELECT a.RobberId, a.NickName, SUM (b.share) AS Earnings FROM Accomplices b
    INNER JOIN Robbers a ON a.RobberId=b.RobberId
    WHERE a.NoYears=0
    GROUP BY a.RobberId, a.NickName
    ORDER BY Earnings DESC