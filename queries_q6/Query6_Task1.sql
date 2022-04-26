-- Question 6.1
create view  as
select robberid, count (*) from accomplices
where count (*) >  
(select avg (robberid)from accomplices)
group by robberid

-- select 
-- group by robberida

--to get average
-- create view avgrobbe
select avg (rowcount) FROM
(select count (robberid) as rowcount from accomplices) accomplices

--earnings in desc order
create view totearningsdesc as
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

