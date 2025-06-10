use election;

select * from party_details;
select * from party;
select * from party_short;

-- views
select * from party_full_details;
select * from party_fullform;

create table party_details(
	P_ID int not null primary key auto_increment,
    P_year DATE,
    P_founder varchar(255) not null,
    state varchar(255),
    foreign key party(state) references state(state)
    );
    
alter table party_details auto_increment = 714;

create table party(
	P_ID int unique not null,
    P_name varchar(255) primary key not null,
    P_current varchar(255) unique not null,
    foreign key party(P_ID) references party_details(P_ID)
    );
    
create table party_short(
	P_ID int unique not null,
    P_short varchar(255) primary key not null,
    foreign key party_short(P_ID) references party_details(P_ID)
);
    
insert into party_details values 
	(null, '1949-09-17', 'C. N. Annadurai', 'Tamil Nadu'),
    (null, '1972-10-17', 'M. G. Ramachandran', 'Tamil Nadu'),
    (null, '1980-04-06', 'Jayprakash Nadda', 'Tamil Nadu'),
    (null, '1984-04-14', 'Kanshi Ram', 'Tamil Nadu'),
	(null, '1989-07-16', 'Ramadoss', 'Tamil Nadu');
    
insert into party values
	(714, 'Dravida Munnetra Kazhagam', 'M.K Stalin'),
    (715, 'All India Anna Dravida Munnetra Kazhagam', 'Edapadi K Palanisamy'),
    (716, 'Bharatiya Janata Party', 'Annamalai'),
	(717, 'Bahujan Samaj Party', 'Amstrong'),
	(718, 'Pattali Makkal Katchi', 'Anbumani Ramadoss');
    
insert into party_short values
	(714, 'DMK'),
    (715, 'AIADMK'),
    (716, 'BJP'),
	(717, 'BSP'),
	(718, 'PMK');
    

    
-- views------------------------------------------------------------

drop view party_fullform;

create view party_full_details as
select 
P.P_ID as ID, 
P.P_name as Name, 
P.P_current as 'Current_Admin', 
K.P_year as Founded, 
K.P_founder as Founder,
K.state as State
from party P inner join party_details K on P.P_ID = K.P_ID
order by ID;

create view party_fullform as
select P.P_ID as ID, P.P_name as Full_Name, K.P_short as Short_Form
from  party P inner join party_short K ON P.P_ID = K.P_ID;