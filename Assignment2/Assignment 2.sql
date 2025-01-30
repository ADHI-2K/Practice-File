---------- To check the Dataset/Table ----------

select * from imported_file;

---------- To Count the total number of records in the dataset ----------

select count (*) as Total_Records from imported_file;

---------- To find the Sum of the Price column ----------

select sum(price) as Total_Price
from imported_file;

---------- To find the Avg of the Price column ----------

select avg(price) as AVG_Price
from imported_file;

----- To find both SUM and AVG of Price column with where condition -----

select sum(price) as Total_Price, avg(price) as AVG_Price
from imported_file
where price > 100;

----- To find all records with a specific value -----

select *  from imported_file
where quantity < 2;
