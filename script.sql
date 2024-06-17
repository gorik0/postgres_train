
-- ::: CREATE tables
create table rivers ()


create table fish (
                      name varchar not null ,
                      id serial primary key ,
                      river varchar references rivers(name)
);


select * from rivers;



-- ::: ALTER TABLES

alter table rivers add column river varchar;

alter  table rivers alter column river set not null ;
alter  table rivers alter column river drop not null ;

alter table rivers add column id serial primary key;


alter  table rivers rename column river to name;
alter  table rivers add constraint river_uniq unique (name);


