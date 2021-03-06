show variables like 'event%';
set global event_scheduler = on;
set @@global.event_scheduler = on;

drop event timetest;

select * from information_schema.events;

delimiter $$
create event if not exists timetest
	on schedule every 1 day
 		starts '2021-12-15 02:00:00'
 	on completion not preserve
     enable
     comment 'name update'
     do
     begin

     end $$
