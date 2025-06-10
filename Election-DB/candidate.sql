use election;

select * from candidate_details;
select * from candidate;

-- views 
select * from candidate_full_details;
select * from thoguthi_1;
select * from thoguthi_2;
select * from thoguthi_3;

create table candidate_details (
	C_ID int primary key not null auto_increment,
    C_name varchar(255) not null,
    C_mobile bigint unique not null ,
    C_address varchar(255),
    C_city varchar(255)
    );
    
alter table candidate_details auto_increment = 101;

create table candidate (
	C_ID int unique not null,
    P_ID int not null,
    T_ID int not null,
    D_ID int not null,
    foreign key (C_ID) references candidate_details(C_ID),
    foreign key (P_ID) references party_details(P_ID),
    foreign key (T_ID) references thoguthi(T_ID),
    foreign key (D_ID) references district_details(D_ID)
    );
    

INSERT INTO candidate_details VALUES
(NULL, 'M. Nasar', 9876543210, 'Avadi', 'Chennai'),
(NULL, 'Pandiarajan', 9876543211, 'Avadi', 'Chennai'),
(NULL, 'R. Kumar', 9876543212, 'Thirumullaivoyal', 'Chennai'),
(NULL, 'S. Lakshmi', 9876543213, 'Avadi Camp Road', 'Chennai'),
(NULL, 'T. Rajendran', 9876543214, 'Annanur', 'Chennai'),
(NULL, 'Priya Balaji', 9876543215, 'Ambattur OT', 'Chennai'),
(NULL, 'Gowtham K', 9876543216, 'Avadi East', 'Chennai'),
(NULL, 'S. Prakash', 9876543217, 'Avadi West', 'Chennai'),
(NULL, 'Meena Kumari', 9876543218, 'Paruthipattu', 'Chennai'),
(NULL, 'M. Venkatesh', 9876543219, 'Avadi', 'Chennai'),
(NULL, 'A. Kavitha', 9876543220, 'Avadi Housing Board', 'Chennai'),
(NULL, 'Dinesh Kumar', 9876543221, 'Thiruninravur', 'Chennai'),
(NULL, 'Sneha Ramesh', 9876543222, 'Kovilpathagai', 'Chennai'),
(NULL, 'Vijay Anand', 9876543223, 'Avadi Poompozhil Nagar', 'Chennai'),
(NULL, 'Rekha Elangovan', 9876543224, 'Avadi VGN Nagar', 'Chennai'),
(NULL, 'Saravanan M', 9876543225, 'Avadi SIDCO Nagar', 'Chennai'),
(NULL, 'Deepa R', 9876543226, 'Avadi HVF Colony', 'Chennai'),
(NULL, 'John Peter', 9876543227, 'Avadi Railway Station Area', 'Chennai'),
(NULL, 'Anjali Devi', 9876543228, 'Thirumullaivoyal North', 'Chennai'),
(NULL, 'Vignesh R', 9876543229, 'Pattabiram', 'Chennai'),
(NULL, 'Rajalakshmi S', 9876543230, 'Avadi South', 'Chennai'),
(NULL, 'Manikandan K', 9876543231, 'Red Hills Road', 'Chennai'),
(NULL, 'Yamuna Devi', 9876543232, 'Avadi LIC Colony', 'Chennai'),
(NULL, 'Karthick G', 9876543233, 'Pudur, Avadi', 'Chennai'),
(NULL, 'Harini V', 9876543234, 'Nemilichery', 'Chennai');



INSERT INTO candidate VALUES
(101, 714, 1, 602024),
(102, 715, 1, 602024),
(103, 716, 1, 602024),
(104, 717, 1, 602024),
(105, 718, 1, 602024),

(106, 714, 2, 602024),
(107, 715, 2, 602024),
(108, 716, 2, 602024),
(109, 717, 2, 602024),
(110, 718, 2, 602024),

(111, 714, 3, 602024),
(112, 715, 3, 602024),
(113, 716, 3, 602024),
(114, 717, 3, 602024),
(115, 718, 3, 602024);

-- (116, 714, 3),
-- (117, 715, 1),
-- (118, 716, 2),
-- (119, 717, 3),
-- (120, 718, 1),

-- (121, 714, 2),
-- (122, 715, 3),
-- (123, 716, 1),
-- (124, 717, 2),
-- (125, 718, 3);


-- views ----------------------------------------------------------------------

drop view candidate_full_details;

create view Thoguthi_1 as
select 
c.C_ID as Candidate_ID, 
cd.C_name as Candidate_name, 
c.P_ID as Party_ID,
ps.P_short as Party,
c.T_ID as Thoguthi
from candidate c 
inner join candidate_details cd ON c.C_ID = cd.C_ID
inner join party_short ps ON c.P_ID = ps.P_ID
where c.T_ID = 1
order by Candidate_ID;

create view Thoguthi_2 as
select 
c.C_ID as Candidate_ID, 
cd.C_name as Candidate_name, 
c.P_ID as Party_ID,
ps.P_short as Party,
c.T_ID as Thoguthi
from candidate c 
inner join candidate_details cd ON c.C_ID = cd.C_ID
inner join party_short ps ON c.P_ID = ps.P_ID
where c.T_ID = 2
order by Candidate_ID;

create view Thoguthi_3 as
select 
c.C_ID as Candidate_ID, 
cd.C_name as Candidate_name, 
c.P_ID as Party_ID,
ps.P_short as Party,
c.T_ID as Thoguthi
from candidate c 
inner join candidate_details cd ON c.C_ID = cd.C_ID
inner join party_short ps ON c.P_ID = ps.P_ID
where c.T_ID = 3
order by Candidate_ID;


create view candidate_full_details as
select 
c.C_ID as Candidate_ID, 
cd.C_name as Candidate_name, 
c.P_ID as Party_ID,
c.T_ID as Thoguthi,
c.D_ID as District,
ps.P_short as Party,
pfd.current_admin as CM,
pfd.state as State
from candidate c 
inner join candidate_details cd ON c.C_ID = cd.C_ID
inner join party_full_details pfd ON c.P_ID = pfd.ID 
inner join party_short ps ON c.P_ID = ps.P_ID
-- where c.P_ID = 714
order by Candidate_ID;