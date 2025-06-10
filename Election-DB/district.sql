use election;

select * from district_details;
select * from state;

create table state (
	state varchar(255) primary key not null default 'Tamil Nadu',
    country varchar(255) not null default 'INDIA');
    
insert into state(state) values ('Tamil Nadu');

create table district_details(
	D_ID Int not null primary key auto_increment,
	D_name varchar(255) not null unique,
    state varchar(255),
    foreign key district_details(state) references state(state)
	);
    
alter table district_details auto_increment=602022;
    
insert into district_details values 
	(null,'Chennai','Tamil Nadu'),
    (null,'Kanchipuram','Tamil Nadu'),
    (null,'Tiruvallur','Tamil Nadu');
    
    
    