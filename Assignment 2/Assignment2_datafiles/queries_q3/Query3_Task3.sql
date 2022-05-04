-- Original query
select clb.f_name,
    clb.l_name,
    noofbooks
from (
        select f_name,
            l_name,
            count(*) as noofbooks
        from customer
            natural join loaned_book
        group by f_name,
            l_name
    ) as clb
where 3 > (
        select count(*)
        from (
                select f_name,
                    l_name,
                    count(*) as noofbooks
                from customer
                    natural join loaned_book
                group by f_name,
                    l_name
            ) as clb1
        where clb.noofbooks < clb1.noofbooks
    )
order by noofbooks desc;
-- Cost: 86.03
-- Number of tuples shown: 3
-- My first solution
select clb.f_name,
    clb.l_name,
    noofbooks
from (
        select f_name,
            l_name,
            count(*) as noofbooks
        from customer
            natural join loaned_book
        group by f_name,
            l_name
    ) as clb -- Cost: 3.28
    -- Number of tuples shown: 15

    -- Final solution