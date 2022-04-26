

-- Mom's Solution
-- Question 6.2
-- no of robberies per security  level
create view robberiespersec as 
select banks.security, count(bankrobberies.norob) from banks banks
right join 
(select bankname, city, count(*) as norob from robberies
group by bankname,city
) bankrobberies on bankrobberies.bankname = banks.bankname and bankrobberies.city=banks.city
group by banks.security

-- average amount 
create view avgamt as
select banks.security, avg (bankrobberies.amount) aveamt from banks banks
inner join 
(select bankname,  amount as amount from robberies
group by bankname,amount
) bankrobberies on bankrobberies.bankname = banks.bankname
group by banks.security


-- join
create view securitylevelsandamounts as
select banks.security, count(bankrobberies.norob),avg(bankrobberies2.amount) from banks banks
inner join(select bankname, city, count(*) as norob from robberies
group by bankname, city
) bankrobberies on bankrobberies.bankname = banks.bankname
inner join (select bankname, city, amount as amount from robberies
group by bankname,city,amount
) bankrobberies2 on bankrobberies2.bankname = banks.bankname
group by banks.security

select * from bank
where bankname not in (select bankname from robberies)

select security from banks
where 

--no of robberies per bank
select bankname, count(*) from robberies
group by bankname

-- My solution
-- Step wise approach
CREATE VIEW securityAmt as (
SELECT b.BankName, b.City, b.Security, r.Amount
FROM Banks b NATURAL JOIN Robberies r
ORDER BY b.Security);

CREATE VIEW robberAmt as (
SELECT Security, COUNT(Security) AS NumberRobberies, ROUND(AVG(Amount),2 ) AS
AverageAmount
FROM securityAmt
GROUP BY Security
ORDER BY NumberRobberies DESC);
 
--  Nested query
SELECT Security AS SecurityLevel, COUNT(Security) AS NumberRobberies,
ROUND(AVG(Amount), 2) AS AverageAmount
FROM (SELECT b.BankName, b.City, b.Security, r.Amount
FROM Robberies r NATURAL JOIN Bank b) AS sec
GROUP BY Security
ORDER BY NumberRobberies DESC

