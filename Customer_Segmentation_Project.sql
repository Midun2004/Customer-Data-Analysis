use project_customer_segmentation;
select* from customer;

select distinct* from customer;

select* from customer where null;

# Count & Disticts
select count(*) from customer;
select count(distinct invoice_no) from customer;
select count(distinct customer_id) from customer;
select count(distinct gender) from customer;
select count(distinct age) from customer;
select count(distinct category) from customer;
select count(distinct quantity) from customer;
select count(distinct price) from customer;
select count(distinct payment_method) from customer;
select count(distinct invoice_date) from customer;
select count(distinct shopping_mall) from customer;

# Checking Negative/Zero Values
select sum(age<=0),sum(quantity<=0),sum(price<=0) from customer;

# Shopping Distribution According To Gender
select gender,
count(customer_id)
from customer group by gender
order by gender desc;

# Which Gender Bought More Products
select gender,
count(quantity) as count_of_quantity
from customer
group by gender
order by gender desc;

# Which Gender Generated More Revenue
select gender,
sum(quantity*price) as revenue
from customer
group by gender
order by gender desc;

# Purchase Category Relative To quantity
select category,
sum(quantity) as quantity
from customer
group by category
order by category desc;

# Shopping Distribution Accroding To Age
select age,
count(quantity) as quantity
from customer
group by age
order by age desc;

# shopping distribution by age group
/*SELECT CASE
WHEN age BETWEEN 18 AND 25 THEN '18-25'
WHEN age BETWEEN 26 AND 35 THEN '26-35'
WHEN age BETWEEN 36 AND 45 THEN '36-45'
WHEN age BETWEEN 46 AND 60 THEN '46-60'
WHEN age BETWEEN 60 AND 70 THEN '60-70'
ELSE 'Unknown'
    END AS age_group,
    COUNT(quantity) AS total_quantity
FROM customer
GROUP BY age_group
ORDER BY age_group;*/

# Which Age Group Buys More Products
select age,
sum(quantity) as quantity
from customer 
group by age
order by age desc;

# Which Age Groups Generated More Revenue
select age,
sum(quantity*price) as revenue
from customer
group by age
order by age desc;

# Purchase Category Related To Other Columns 
# Category vs Gender
select category,gender,
sum(quantity*price) as revenue,
sum(quantity) as quantity
from customer
group by category,gender
order by category, revenue desc;


# Category vs Age Group
select category,
Case when age between 18 and 25 then '18-25'
WHEN age BETWEEN 26 AND 35 THEN '26-35'
WHEN age BETWEEN 36 AND 45 THEN '36-45'
WHEN age BETWEEN 46 AND 60 THEN '46-60'
WHEN age BETWEEN 60 AND 70 THEN '60-70'
ELSE 'Unknown'
    END AS age_group, 
sum(quantity*price) as revenue
from customer
group by category,age
order by category, revenue desc;


# Category vs Payment Method
select category,payment_method,
sum(quantity*price) as revenue
from customer
group by category,payment_method
order by category,revenue  desc;

# Payment Method Relation To Other Columns
# Payment Method vs Gender
select payment_method,gender,
sum(quantity) as quantity
from customer
group by payment_method,gender
order by payment_method;


# Payment Method vs Age
select payment_method, CASE
WHEN AGE BETWEEN 18 AND 25 THEN '18-25'
WHEN age BETWEEN 26 AND 35 THEN '26-35'
WHEN age BETWEEN 36 AND 45 THEN '36-45'
WHEN age BETWEEN 46 AND 60 THEN '46-60'
WHEN age BETWEEN 60 AND 70 THEN '60-70'
ELSE 'Unknown'
    END AS age_group,
sum(quantity)
from customer
group by payment_method,age_group
order by payment_method;


# Distribution Of Payment Method
select payment_method,
count(price) as count_of_price
from customer
group by payment_method
order by count_of_price desc;


# Mall-Wise Revenue
select shopping_mall,
sum(quantity*price) as revenue
from customer
group by shopping_mall
order by revenue;

# Monthly Revenue Trend
select invoice_date,
sum(price),sum(quantity)
from customer
group by invoice_date
order by invoice_date;

# Top Category By Revenue Within Each Mall
select shopping_mall,category,
sum(quantity*price) as revenue
from customer
group by shopping_mall,category
order by shopping_mall,revenue;

# Top Customer By Revenue
select customer_id,
sum(quantity*price) as revenue
from customer
group by customer_id
order by customer_id;