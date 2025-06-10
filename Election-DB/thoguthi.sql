use election;

select * from thoguthi;

select * from thoguthi_district;
select * from thoguthi_state; 

create table thoguthi (
	T_ID int not null primary key auto_increment,
    T_name varchar(255) unique not null,
    D_ID int,
    foreign key thoguthi(D_ID) references district_details(D_ID)
    );
    
insert into thoguthi values
	(null, 'Avadi', 602024),
    (null, 'Tirunindravur', 602024),
    (null, 'Pattabiram', 602024);
    
-- constituency
    
-- views-------------------------------------------------------------------

drop view thoguthi_state;

create view thoguthi_district as
select T.T_ID as 'Thoguthi ID', T.T_name as Thoguthi, D.D_ID as 'District ID', D.D_name as District
from thoguthi T inner join district_details D 
ON T.D_ID = D.D_ID;

create view thoguthi_state as
select T.T_name as Thoguthi, D.D_name as District, D.state as State, S.country as Country
from thoguthi T inner join district_details D
ON T.D_ID = D.D_ID inner join state S ON D.state = S.state;

