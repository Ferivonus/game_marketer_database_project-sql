-- Create Tables:

CREATE TABLE Game(
Game_id int(3) primary key,
Game_name varchar(200),
Version float, 
Published_day date,
Price float, 
Payment_id int(3), 
Dev_name varchar(40)
);

CREATE TABLE Developer(
Game_id int(3), 
Is_one_person boolean,
Dev_name varchar(40),
Is_company boolean
);


CREATE TABLE Company_information(
Company_name varchar(200),
Dev_name varchar(40),
Homeland_of_company varchar(40),
Is_new_company_flag boolean
);


CREATE TABLE Game_type(
Game_type varchar(40),
Game_id int(3)
);

CREATE TABLE Platform(
Game_id int(3),
Platform_name varchar(40),
Platform_id int(3)
);

CREATE TABLE Publisher(
Game_id int(3),
Address varchar(100),
Company_name varchar(40),
Founder_of_company varchar(40)
);

CREATE TABLE Payment(
Base_price float,
Is_installment_flag boolean,
Taxment float,
Last_priece float,
Payment_id int(3),
Selling_in_store_flag boolean,
Selling_in_internet_flag boolean
);

CREATE TABLE Store(
Store_address varchar(200),
Telephone int(30),
Selling_in_store_flag boolean,
Payment_id int(3)
);

CREATE TABLE Game_dev_informations(
Dev_name varchar(40),
Homeland varchar(40),
Is_new_dev_flag boolean
);

CREATE TABLE Internet(
payment_id int(3),
website_address varchar(50),
selling_in_internet_flag boolean
);