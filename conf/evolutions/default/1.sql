# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table food (
  food_id                   integer auto_increment not null,
  name                      varchar(255),
  price                     integer,
  constraint pk_food primary key (food_id))
;

create table order (
  order_id                  integer auto_increment not null,
  table                     integer,
  user_code                 varchar(255),
  total_price               integer,
  create_date               datetime,
  price_date                datetime,
  real_price                integer,
  status                    integer,
  constraint pk_order primary key (order_id))
;

create table order_food (
  id                        integer auto_increment not null,
  order_id                  integer,
  food_id                   integer,
  constraint pk_order_food primary key (id))
;




# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table food;

drop table order;

drop table order_food;

SET FOREIGN_KEY_CHECKS=1;

