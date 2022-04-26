select robberid, count (*) from accomplices
where count (*) >  
(select avg (robberid)from accomplices)
group by robberid

select 

group by robberida

--to get average
select avg (rowcount) FROM
(select count (robberid) as rowcount from accomplices) accomplices

--earnings in desc order

select a.robberid, a.nickname, sum (b.share) as earnings from accomplices b
inner join robbers a on a.robberid = b.robberid
where a.noyears = 0
group by a.robberid, a.nickname
order by earnings desc

select banks.security, bankrobberies.norob from banks banks
inner join 
(select bankname,  count(*) as norob from robberies
group by bankname
) bankrobberies on bankrobberies.bankname = banks.bankname
group by banks.security,bankrobberies.norob



-- no of robberies per security  level
select banks.security, count(bankrobberies.norob) from banks banks
right join 
(select bankname, city, count(*) as norob from robberies
group by bankname,city
) bankrobberies on bankrobberies.bankname = banks.bankname and bankrobberies.city=banks.city
group by banks.security

-- average amount 
select banks.security, avg (bankrobberies.amount) aveamt from banks banks
inner join 
(select bankname,  amount as amount from robberies
group by bankname,amount
) bankrobberies on bankrobberies.bankname = banks.bankname
group by banks.security


-- join
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



SELECT
    AVG(pageCount)
FROM
(
    SELECT 
        COUNT(ActionName) AS pageCount
    FROM
        tbl_22_Benchmark
) MyTable
