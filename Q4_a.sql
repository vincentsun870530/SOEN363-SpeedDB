-- For questions 3-k-2 and 3-l we asked you to use views. However, we are now interested in
-- exploring the performance between views and materialized views. for this reason:
-- Re-implement your answer for question 3-k-2 using materialized views.

create materialized view social_actors
as select
     a1.name as actor_name,
     count(distinct(a2.name)) as co_actors_N
 from
     actors a1,
     actors a2
 where
     a1.mid = a2.mid
     and a1.name <> a2.name
 group by
     a1.name
 order by
     co_actors_N desc;
