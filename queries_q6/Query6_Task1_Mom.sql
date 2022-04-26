-- Mom's solution
-- Question 6.1
create view  as(
select robberid, count (*) from accomplices
where count (*) >  
(select avg (robberid)from accomplices)
group by robberid)

-- select 
-- group by robberida

--to get average
CREATE VIEW AverageRobberies AS
select avg (rowcount) FROM
(select count (robberid) as rowcount from accomplices) accomplices

--earnings in desc order
create view totearningsdesc as(
select a.robberid, a.nickname, sum (b.share) as earnings from accomplices b
inner join robbers a on a.robberid = b.robberid
where a.noyears = 0
group by a.robberid, a.nickname
order by earnings desc)

-- My copy
CREATE VIEW TotalEarningsDesc AS (
    SELECT a.RobberId, a.NickName, SUM (b.share) AS Earnings FROM Accomplices b
    INNER JOIN Robbers a ON a.RobberId=b.RobberId
    WHERE a.NoYears=0
    GROUP BY a.RobberId, a.NickName
    ORDER BY Earnings DESC
)

SELECT Banks.Security, BankRobberies.NoRob from Banks Banks
INNER JOIN
(SELECT BankName,  count(*) as NoRob from Robberies
GROUP BY BankName
) BankRoberies on BankRobberies.BankName = Banks.BankName
GROUP BY Banks.Security,BankRobberies.NoRob

