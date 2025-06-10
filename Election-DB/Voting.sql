
select * from person;
select * from voting;

-- viewss---------------------

select * from ward_vote_count;
select * from Thoguthi_vote_count;
select * from person_count_gender;




create table person (
	person_ID int not null primary key auto_increment,
	Person_name varchar(255) not null unique,
    gender varchar(10) not null,
    age int not null,
    Nationality varchar(255) default 'INDIAN',
    CHECK (age>=18)
);

alter table person auto_increment = 1001;

-- register here ############################################

insert into person (person_name, gender, age) values 
('Faranan', 'M', 30);
        

create table voting (
	person_ID int unique,
    ward_no int,
	C_ID int,
    T_ID int,
    foreign key (person_ID) references person(person_ID),
	foreign key (ward_no) references ward(ward_no),
	foreign key (C_ID) references candidate(C_ID),
	foreign key (T_ID) references thoguthi(T_ID)
    ); 
    
-- DELIMITER $$

-- CREATE TRIGGER check_age_before_insert
-- BEFORE INSERT ON voting
-- FOR EACH ROW
-- BEGIN
-- 	DECLARE voter_age INT;
-- 	SELECT age INTO voter_age FROM person WHERE person_ID = NEW.person_ID;
-- 	IF voter_age < 18 THEN
-- 		SIGNAL SQLSTATE '45000'
-- 		SET MESSAGE_TEXT = 'Person must be at least 18 years old to vote';
-- 	END IF;
-- END$$

-- DELIMITER ;
    
-- Insert values into voting table
INSERT INTO voting (person_ID, ward_no, C_ID, T_ID) VALUES 


(1167, 1, 101, 1);






-- views --------------------------------------------------------------------------------------

drop view ward_vote_count;

-- create view ward_vote_count as
select ward_no, C_ID as Candidate, count(*) as Votes_Scored
from voting
where (ward_no = 1 or ward_no = 2 or ward_no = 3) and T_ID = 2
group by C_ID, ward_no
order by ward_no, C_ID;
-- order by Votes_Scored desc;

create view Thoguthi_vote_count as
select T_ID, C_ID as Candidate, count(*) as Votes_Scored
from voting
group by C_ID, T_ID
order by Votes_Scored desc;

create view person_count_gender as
select gender, count(gender) as Total
from person
group by gender;




