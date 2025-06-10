
select * from state;
select * from district_details;

select * from thoguthi;

-- views
select * from thoguthi_district;
select * from thoguthi_state; 

select * from party_details;
select * from party;
select * from party_short;

-- views
select * from party_full_details;
select * from party_fullform;

select * from candidate_details;
select * from candidate;

-- views 
select * from candidate_full_details;

select * from ward;

select * from person;
select * from voting;



-- viewss---------------------

select * from ward_vote_count;
select * from Thoguthi_vote_count;
select * from person_count_gender;

-- standing candidate ----------------------

select * from thoguthi_1;
select * from thoguthi_2;
select * from thoguthi_3;


-- Results ----------------------------

select * from Constituency_One_Result;
select * from Constituency_Two_Result;
select * from Constituency_Three_Result;
select * from Constituency_Total_Result;

select * from ward_one_constituency_one;
select * from ward_two_constituency_one;
select * from ward_three_constituency_one;

select * from ward_one_constituency_Two;
select * from ward_two_constituency_Two;
select * from ward_three_constituency_Two;

select * from ward_one_constituency_three;
select * from ward_two_constituency_three;
select * from ward_three_constituency_three;


select * from Who_Voted_Who;

select ps.P_short as Party, count(p.Person_ID) as Total
from person p 
inner join voting v on v.Person_ID = p.Person_ID
inner join Candidate c on v.C_ID = c.C_ID
inner join Party_short ps on c.P_ID = ps.P_ID
group by ps.P_short
order by party desc;

-- illegal ****************************************88
select 
v.T_ID as Constituency, 
v.ward_no as Ward, 
p.Person_ID as ID, 
p.Person_name as Name, 
p.gender as Gender,
ps.P_short as Party,
cd.C_name as Candidate,
pt.P_current as CM
from person p 
inner join voting v on v.Person_ID = p.Person_ID
inner join Candidate c on v.C_ID = c.C_ID
inner join Party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
inner join party pt on c.P_ID = pt.P_ID
where p.Person_ID = 1056;



-- Who Votes Who $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

create view Who_Voted_Who as
select p.Person_ID as ID, p.Person_name as Name, ps.P_short as Party
from person p 
inner join voting v on v.Person_ID = p.Person_ID
inner join Candidate c on v.C_ID = c.C_ID
inner join Party_short ps on c.P_ID = ps.P_ID;

-- constituency wise result #####################################################

drop view Constituency_One_Result;
drop view  Constituency_Two_Result;
drop view  Constituency_Three_Result;

create view Constituency_One_Result as
select v.T_ID as Constituency, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
where v.T_ID = 1
group by v.T_ID, Party
order by Total desc;


create view Constituency_Two_Result as
select v.T_ID as Constituency, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
where v.T_ID = 2
group by v.T_ID, Party
order by Total desc;


create view Constituency_Three_Result as
select v.T_ID as Constituency, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
where v.T_ID = 3
group by v.T_ID, Party
order by Total desc;

drop view Constituency_Total_Result;

create view Constituency_Total_Result as
select v.T_ID as Constituency, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
group by v.T_ID, Party
order by v.T_ID;



-- Ward wise result ###################################################################

-- DROP VIEW IF EXISTS ward_one_constituency_one;
-- DROP VIEW IF EXISTS ward_two_constituency_one;
-- DROP VIEW IF EXISTS ward_three_constituency_one;
-- DROP VIEW IF EXISTS ward_one_constituency_Two;
-- DROP VIEW IF EXISTS ward_two_constituency_Two;
-- DROP VIEW IF EXISTS ward_three_constituency_Two;
-- DROP VIEW IF EXISTS ward_one_constituency_three;
-- DROP VIEW IF EXISTS ward_two_constituency_three;
-- DROP VIEW IF EXISTS ward_three_constituency_three;


-- Constituency 1
create view ward_one_constituency_one as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 1 and v.T_ID = 1
group by v.C_ID, v.ward_no
order by Total desc;

create view ward_two_constituency_one as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 2 and v.T_ID = 1
group by v.C_ID, v.ward_no
order by Total desc;

create view ward_three_constituency_one as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 3 and v.T_ID = 1
group by v.C_ID, v.ward_no
order by Total desc;





-- Constituency 2
create view ward_one_constituency_Two as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 1 and v.T_ID = 2
group by v.C_ID, v.ward_no
order by Total desc;

create view ward_two_constituency_Two as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 2 and v.T_ID = 2
group by v.C_ID, v.ward_no
order by Total desc;

create view ward_three_constituency_Two as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 3 and v.T_ID = 2
group by v.C_ID, v.ward_no
order by Total desc;




-- Constituency 3
create view ward_one_constituency_three as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 1 and v.T_ID = 3
group by v.C_ID, v.ward_no
order by Total desc;

create view ward_two_constituency_three as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 2 and v.T_ID = 3
group by v.C_ID, v.ward_no
order by Total desc;

create view ward_three_constituency_three as
select v.T_ID as Constituency, v.Ward_no as Ward, cd.C_Name as Candidate_Name, ps.P_short as Party, count(*) as Total
from voting v 
inner join candidate c on v.C_ID = c.C_ID
inner join party_short ps on c.P_ID = ps.P_ID
inner join candidate_details cd on v.C_ID = cd.C_ID
where v.ward_no = 3 and v.T_ID = 3
group by v.C_ID, v.ward_no
order by Total desc;