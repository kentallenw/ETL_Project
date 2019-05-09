CREATE DATABASE schooling;
USE schooling;

-- Pull out the duplicates from other tables (standardize so you don't repeat yourself)
CREATE TABLE state (
    state_id int NOT NULL AUTO_INCREMENT,
    state varchar(255) NOT NULL,
    state_abb varchar(255),
    PRIMARY KEY (state_id)
);

CREATE TABLE year (
    year_id int NOT NULL AUTO_INCREMENT,
    year varchar(255) NOT NULL,
    PRIMARY KEY (year_id)
);

-- Convert these columns into attributes in table
---------------------------------------------
-- nst-est2018-alldata <-- make a name of table (e.g. all_data)
-- col1 - state
-- col2 - POPESTIMATE2015
-- col3 - BIRTHS2015
-- col4 - DEATHS2015
-- col5 - NATURALINC2015
-- col6 - INTERNATIONALMIG2015
-- col7 - DOMESTICMIG2015

CREATE TABLE all_data (
    all_data_id int NOT NULL AUTO_INCREMENT,
    state_id int NOT NULL,
    popestimate int,
    births int,
    deaths int,
    internationalmig int,
    domesticmig int,
    PRIMARY KEY (all_data_id)
);

-- Convert these columns into attributes in table
---------------------------------------------
-- enroll_states <-- make a name of table (e.g. enroll_states)
-- col1 - State
-- col2 - Year
-- col3 - GRADES_ALL_G

CREATE TABLE enroll_states (
    enroll_states_id int NOT NULL AUTO_INCREMENT,
    state_id int NOT NULL, -- foreign key
    year_id int NOT NULL, -- foreign key
    Total_Enrolled int,
    PRIMARY KEY (enroll_states_id)
);

-- Convert these columns into attributes in table
---------------------------------------------
-- Finance_states  <-- make a name of table (e.g. finance_states)
-- col1 - State
-- col2 - Year
-- Col3 - Total Revenue
-- Col4 - * INSTRUCTION_EXPENDITURE

CREATE TABLE finance_states (
    finance_id int NOT NULL AUTO_INCREMENT,
    state_id int NOT NULL,  -- foreign key
    year_id int NOT NULL,  -- foreign key
    TOTAL_REVENUE decimal,
    TOTAL_EXPENDITURE decimal,
    INSTRUCTION_EXPENDITURE decimal,
    PRIMARY KEY (finance_id)
);


SELECT state.state, finance_states.TOTAL_REVENUE, finance_states.TOTAL_EXPENDITURE, finance_states.INSTRUCTION_EXPENDITURE
from finance_states
join state on (state.state_id = finance_states.state_id)
join year on (finance_states.year_id = year.year_id)
where year.year = '2015';

-- join year on (finance_states.year_id = year.year_id)
-- where year = '2015';

