-- How many total listings are there?
SELECT COUNT(*) as Total_listings
FROM listings;

-- How many listings exist in each price_tier category?
SELECT price_tier, count(*) as Total_listings
FROM rawlist
GROUP BY price_tier;

-- What are the different room types and how many listings fall under each? 
SELECT room_type, count(*) as No_of_listings
FROM listings
GROUP BY room_type;

-- What is the average price by room_type?
SELECT room_type, round(avg(price),2) as Avg_price
FROM rawlist
WHERE outlier_flag = "Normal"
GROUP BY room_type;

-- Which 5 neighbourhoods have the highest number of listings?
SELECT neighbourhood_group, neighbourhood, count(*) as Top_5
FROM rawlist
GROUP BY neighbourhood_group, neighbourhood
ORDER BY TOP_5 DESC
LIMIT 5;

-- How many listings are marked as Active and Inactive in each neighbourhood_group?
SELECT neighbourhood_group,
SUM(Case when status = "Active" then 1 else 0 end) as Active_listing,
SUM(Case when status = "Inactive" then 1 else 0 end) as Inactive_listing 
FROM rawlist
GROUP BY neighbourhood_group;

-- List the top 10 most expensive listing by price
SELECT * 
FROM rawlist
ORDER BY price desc
LIMIT 10;

-- List the top 5 most expensive listings that have more than 100 reviews.
select *
from rawlist
where number_of_reviews > 100
order by price desc
limit 5;


-- What is the average, minimum, and maximum price per neighbourhood_group?
SELECT neighbourhood_group, round(avg(price),2) as Avg_price, min(price) as min_price, max(price) as max_price
FROM rawlist
where outlier_flag = "Normal"         -- After removing outlier
GROUP BY neighbourhood_group;


-- What is the total potential revenue per listing (price * availability_365)?
SELECT id, name, 
           price,
           availability_365,
           (price * availability_365) as Potential_revenue
FROM rawlist
Where availability_365 > 0 and 
	outlier_flag = "Normal";

-- Which listings are available more than 350 days in a year?
SELECT *
FROM rawlist
WHERE availability_365 > 350;

-- Who are the top 10 hosts by number of listings?
SELECT host_id, host_name, COUNT(*) AS listing_count
FROM rawlist
GROUP BY host_id, host_name
ORDER BY listing_count desc
LIMIT 10;

-- Which neighbourhoods have the highest average price per night?
SELECT neighbourhood, round(avg(price),2) as Avg_price
FROM rawlist
WHERE outlier_flag = "Normal"
GROUP BY neighbourhood
ORDER BY Avg_price desc;

-- Are there listings with high price but low availability (e.g., price > 1000 & availability < 50)?
SELECT count(*) from(
SELECT *
FROM rawlist
WHERE price > 1000 and availability_365 < 50) as X;

-- What is the percentage share of room types per neighbourhood group?
SELECT neighbourhood_group,
	round(sum(case when room_type = "Private room" then 1 else 0 end)/ count(room_type) * 100,2) as Private_room_percent,
    round(sum(case when room_type = "Shared room" then 1 else 0 end)/ count(room_type) * 100,2) as Shared_room_percent,
    round(sum(case when room_type = "Entire home/apt" then 1 else 0 end)/ count(room_type) * 100,2) as apartment_percent
FROM rawlist 
GROUP BY neighbourhood_group;

-- How many listings are there in each borough (neighbourhood_group)?
SELECT neighbourhood_group,
       count(*) as Listing_count
FROM rawlist
GROUP BY neighbourhood_group;

-- Which listings are underpriced but have high review counts?
-- (Price < average but number_of_reviews > average)

WITH cte as (
SELECT
      avg(price) as avg_price,
      avg(number_of_reviews) as Avg_reviews
FROM rawlist
where outlier_flag = "Normal")
SELECT COUNT(*) FROM(
SELECT r.*
FROM rawlist r, cte c
WHERE r.price < c.avg_price 
      and r.number_of_reviews < c.Avg_reviews) as X;


-- What is the revenue contribution % by each neighbourhood group?
SELECT  neighbourhood_group,
		sum(price) as total_revenue,
        Round(100 * sum(price)/ (select sum(price) from rawlist),2) as Revenue_percentage
FROM rawlist
WHERE status = "Active"
group by neighbourhood_group
ORDER BY total_revenue desc;

-- Which listings are available for most of the year
SELECT *
FROM rawlist
WHERE availability_365 > 350;




