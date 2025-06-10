use election;

select * from ward;
-- select * from ward_district;

create table ward (
	ward_no int primary key not null
);

insert into ward values (1),(2),(3),(4),(5),(6);

-- create table ward_district (
-- 	ward_no int,
--     T_ID int,
--     D_ID int,
--     state varchar(255),
--     foreign key (ward_no) references ward(ward_no),
--     foreign key (T_ID) references thoguthi(T_ID),
--     foreign key (D_ID) references district_details(D_ID),
--     foreign key (state) references state(state)
-- );