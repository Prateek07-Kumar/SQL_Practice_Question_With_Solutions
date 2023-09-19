-- Sorting
 
 # 1. find top 5 samsung phones with biggest screen size
 
 select * from smart_phones;
 
 select model, screen_size from smart_phones
 where brand_name = 'samsung'
 order by screen_size desc
 limit 5
 
 -- 2. sort all the phone in decending order of number of total cameras.

select model,num_front_cameras + num_rear_cameras as 'total_cameras' 
from smart_phones
order by total_cameras desc;
 
-- 3. sort data on the basis of ppi in decending order

select * from smart_phones;

select model, 
round(sqrt(resolution_width*resolution_width + resolution_height*resolution_height)/ screen_size) as ppi
from smart_phones
order by ppi asc;

-- 4. find the phone with 2nd largest battery

select * from smart_phones;

select model, battery_capacity 
from smart_phones
order by battery_capacity asc limit 1,1;

-- 5. find the name and rating of the worst rated apple phone

select model, rating from smart_phones
where brand_name = 'apple'
order by rating asc
limit 1;


select * from smart_phones
order by brand_name asc, rating desc;


-- 6. sort phones alphabetically and then on the basic of rating in desc order

-- 7. sort phones alphabetically and then on the basic of price in asc order


## Grouping Data

-- 1. Group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity

select brand_name, count(*) as 'num_phones', 
round((price)) as 'avg_price',
max(rating) as 'max_rating',
round((screen_size),2) as 'avg_screen_size',
round((battery_capacity)) as 'avg_battry_capicity'
from smart_phones
group by brand_name
order by num_phones desc limit 15;

-- 2. Group smartphones by weather they have an NFC and get the average price and rating 

select * from smart_phones;

select avg(price) from smart_phones

select has_nfc,
avg(price) as 'avg_price',
avg(rating) 'avg_rating'
from smart_phones
group by has_nfc;


-- Find the 5G smart phone 
select has_5g,
avg(price) as 'avg_price',
avg(rating) 'avg_rating'
from smart_phones
group by has_5g;

-- Check the fast charging phone analysis
select fast_charging_available,
avg(price) as 'avg_price',
avg(rating) 'avg_rating'
from smart_phones
group by fast_charging_available;

-- 3. Group smartphones by the extended memory available and get the average price
select extended_memory_available,
avg(price) as 'avg_price',
avg(rating) 'avg_rating'
from smart_phones
group by extended_memory_available;

-- 4. Group smartphones by the brand and processor brand and get the count of models and average primary camera resolution (rear)
select brand_name,
processor_brand,os,
count(*) as 'num_phones',
round((primary_camera_rear)) as 'avg camera resolution'
from smart_phones
group by brand_name, processor_brand 

-- 5. find top 5 most costly phone brands
select * from smart_phones;

select brand_name,  round(avg(price)) as 'avg_price'
from smart_phones
group by brand_name
order by avg_price desc
limit 5;


-- 6. Which brand makes the smallest screen smartphones
select * from smart_phones

select brand_name,  round(avg(screen_size)) as 'avg_screen_size'
from smart_phones
group by brand_name
order by avg_screen_size asc
limit 1;

-- 7. Avg price of 5g phones vs avg price of non 5g phones  
select * from smart_phones

select brand_name, count(*)
from smart_phones
where has_nfc = 'True' and has_ir_blaster = 'True';

-- 8. Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster
select * from smart_phones

select brand_name, count(*) as 'count'
from smart_phones
where has_nfc = 'True' and has_ir_blaster = 'True'
group by brand_name
order by count desc
limit 1;

-- 9. Find all samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones

select * from smart_phones;

select has_nfc, avg(price) as 'avg_price'
from smart_phones
where brand_name = 'samsung'
group by has_nfc;

-- 10. Find the phone name, price of the costliest phone

select * from smart_phones

select model, price from smart_phones
order by price desc limit 1;

-- Having clause

-- 1. find the avg rating of smartphone brands which have more than 20 phones

select brand_name,
count(*) as 'count',
avg(rating) as 'avg_rating'
from smart_phones
group by brand_name
having count >40
order by avg_rating desc;

-- 2. find the top 3 brands with the higest avg ram that have a refresh rate of at least 90 Hz and fast charging available and dont consider brands which have less than 10 phases
select * from smart_phones;

select brand_name, 
avg(ram_capacity) as 'avg_ram'
from smart_phones
where refresh_rate > 90 and fast_charging_available = 1
group by brand_name
having count(*) > 10
order by 'avg_ram' desc limit 1;

-- 3. find the avg price of all the phone brands with avg rating > 70 and num_phones more than 10 among all 5g enabled phones
select * from smart_phones;

select brand_name, avg(price) as 'avg_price' 
from smart_phones
where has_5g = 'True'
group by brand_name
having avg(rating) > 70 and count(*) > 10ipl_ball_by_ball_2008_2022
