create table test_data (
    transaction_id int,
    dates date,
    customer_id varchar(30),
    gender varchar(30),
    age int,
    product_category varchar(35),
    Quantity int,
    Price_per_unit int,
    Total_amount int
);

select * from test_data;

  ----- (Transform) -----
  
----- To Remove Values less than 3 -----    
delete from test_data where quantity is null;

delete from test_data WHERE quantity <= 0;

select count(quantity) as Total_Quantity 
from test_data
where quantity > 0;

----- Filter Gender based on Product_Category  -----

select gender
from test_data 
where product_category = 'Electronics';

----- Find the Total_Quantity by Age Group -----

select age,count(quantity) as Total_Quantity
from test_data 
group by age;

----- Save Transformed Data into a New Table -----
create table transformed_total_quantity (
    Total_Quantity int
);


create table transformed_gender_by_category (
    gender varchar(50)
);


create table transformed_total_quantity_by_age_group (
    age int,
    Total_Quantity int
);

  ----- (LOAD) -----
  
----- Save Transformed Data into the Database -----

insert into transformed_total_quantity (Total_Quantity)
select count(quantity) AS Total_Quantity
from test_data
where quantity > 3;


insert into transformed_gender_by_category (gender)
select gender
from test_data
where product_category = 'Electronics';


insert into transformed_total_quantity_by_age_group (age, Total_Quantity)
select age, count(quantity) as Total_Quantity
from test_data
group by age;


SELECT * FROM transformed_total_quantity;

SELECT * FROM transformed_gender_by_category;

SELECT * FROM transformed_total_quantity_by_age_group;