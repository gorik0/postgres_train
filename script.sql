
-- ::: CREATE tables
create table rivers ()


create table countries (name varchar,id serial primary key );

create table fish (
                      name varchar not null ,
                      id serial primary key ,
                      river varchar references rivers(name)
);


select * from rivers;
select * from fish;


select * from rivers order by length desc limit 5;
select  sum(rivers.length) from rivers where country = 'belarus' group by country;
select name from rivers where country in ('brazil','russia');




select concat(name,' of length ::: ',length,' km') as river_len,id from rivers order by length desc limit 5;




-- ::: ALTER TABLES

alter table rivers add column river varchar;

alter  table rivers alter column river set not null ;
alter  table rivers alter column river drop not null ;

alter table rivers add column id serial primary key;




alter  table rivers rename column river to name;
alter  table rivers add constraint river_uniq unique (name);

alter table fish alter column river type int using river::integer;

alter table fish drop constraint "fish_river_fkey";
alter table fish add constraint "fish_river_fkey" foreign key (river) references rivers(id);

alter table rivers add column length int default 100;
alter table fish alter column river set default 1;
alter table fish alter column river set not null ;

alter table rivers alter column country type int using country::integer;






-- :::: INSERT values


insert into rivers (name)
values( 'berezina'),
        ('dnepr'),
        ('sozh'),
        ('pripyat');





insert into fish (name) VALUES
                                   ('carp'),
                                   ('karas'),
                                   ('plotva')
                                      ;


--  :::: UPDATE

update rivers set country='belarus' where true;
update rivers set country='russia ' where id=1;
update rivers set country='1' where true;
update rivers set length=random()*800+100  where true;

update fish set river =2 where id=3;
update rivers set country = floor(random()*7 + 1) where true;

update rivers set country = case
    when name ='dnepr' then 3
    when name ='berezina' then 3
    when name ='sozh' then (select id from countries where name='belarus')
    when name ='pripyat' then 3
    when name ='gang' then 2
    when name ='volga' then 1
    when name ='amazonka' then 5
    when name ='dunai' then 4

end
where true

-- :::: JOIN


select * from fish full join rivers on fish.river = rivers.id

select rivers.name,fish.name, c.name
from rivers
    join fish on rivers.id = fish.river
join countries c on rivers.country = c.id

select name from rivers
union
select name from countries



select * from rivers where name like 'v%'
select * from rivers where name  similar to 'v___'

select * from rivers where name  ~ '^v.'


select count(river) from fish

