use yelp;

/* Data Preprocessing */

-- See if there is any invalid data in 'yelp_business'
SELECT *
FROM `yelp_business`
-- Filter the results where 'name' is NULL
-- or 'state' is NULL
-- or 'stars' is less than 0 or greater than 5
WHERE
    name IS NULL
    OR state IS NULL
    OR stars < 0
    OR stars > 5;


-- Select the business that doesn't operate at all
SELECT *
FROM `yelp_business_hours`
WHERE
    monday = "None"
    and tuesday = "None"
    and wednesday = "None"
    and thursday = "None"
    and friday ="None"
    and saturday = "None"
    and sunday = "None";

-- See if there is any null values in yelp_checking:
SELECT *
FROM `yelp_checkin`
WHERE
    weekday IS NULL
    OR hour IS NULL
    OR checkins IS NULL;

-- See if there is any null values in 'yelp_review' table
SELECT *
FROM yelp_review
-- Filter the results where 'review_id' is NULL
-- or 'business_id' is NULL
-- or 'user_id' is NULL
-- or 'date' is NULL
-- or 'stars' is less than 0 or greater than 5
WHERE
    review_id IS NULL
    OR business_id IS NULL
    OR user_id IS NULL
    OR date IS NULL
    OR stars < 0
    OR stars > 5;

-- See if there is any null values in 'yelp_tip' table
SELECT *
FROM yelp_tip
-- Filter the results where 'text' is NULL
-- or 'business_id' is NULL
-- or 'user_id' is NULL
-- or 'date' is NULL
-- or 'likes' is less than 0
WHERE
    text IS NULL
    OR business_id IS NULL
    OR user_id IS NULL
    OR date IS NULL
    OR likes < 0;

-- See if there is any null values in 'yelp_user' table
SELECT *
FROM `yelp_user`
-- Filter the results where any of the following conditions are met:
-- 'useful' is less than 0
-- 'funny' is less than 0
-- 'cool' is less than 0
-- 'fans' is less than 0
-- 'average_stars' is less than 0
-- 'average_stars' is greater than 5
WHERE
    useful < 0
    OR funny < 0
    OR cool < 0
    OR fans < 0
    OR average_stars < 0
    OR average_stars > 5;

-- Select all columns from the 'yelp_user' table
-- Where 'name', 'review_count', and 'yelping_since' is  NULL
SELECT *
FROM `yelp_user`
WHERE
    name IS  NULL
    or review_count IS  NULL
    or yelping_since IS  NULL;

/* Data preprocessing end */


/* Analysis */
-- select the latest registration date
SELECT max(yelping_since)
FROM `yelp_user`;

-- Display the registration days and average daily comment count for non-elite users
SELECT
    user_id,
    DATEDIFF("2017-12-11", yelping_since) as register_time,
    (review_count / DATEDIFF("2017-12-11", yelping_since)) as avg_review_day
FROM `yelp_user`
WHERE elite = "None";

-- Calculate the average of 'avg_review_day' values for non-elite users.
SELECT AVG(sub.avg_review_day) as avg_review_day_nelite
FROM (
    -- Subquery to display 'avg_review_day' for non-elite users
    SELECT
        user_id,
        DATEDIFF("2017-12-11", yelping_since) as register_time,
        (review_count / DATEDIFF("2017-12-11", yelping_since)) as avg_review_day
    FROM `yelp_user`
    WHERE elite = "None"
) as sub;

-- Calculate the rates of 'useful','funny', and 'cool' votes per review:
SELECT
    SUM(review_count) as total_review_count,
    SUM(useful) / SUM(review_count) as useful_rate_ne,
    SUM(funny) / SUM(review_count) as funny_rate_ne,
    SUM(cool) / SUM(review_count) as cool_rate_ne
FROM `yelp_user`
WHERE elite = "None";

-- Calculate the average of 'avg_review_day' values for elite users.
SELECT AVG(sub.avg_review_day) as avg_review_day_elite
FROM (
    -- Subquery to calculate 'avg_review_day' for elite users
    SELECT
        user_id,
        DATEDIFF("2017-12-11", yelping_since) as register_time,
        (review_count / DATEDIFF("2017-12-11", yelping_since)) as avg_review_day
    FROM `yelp_user`
    WHERE elite <> "None"
) as sub;

-- Calculate the total review count for elite users,
-- as well as the rates of 'useful,' 'funny,' and 'cool' votes per review.
SELECT
    SUM(review_count) as total_review_count,
    SUM(useful) / SUM(review_count) as useful_rate_e,
    SUM(funny) / SUM(review_count) as funny_rate_e,
    SUM(cool) / SUM(review_count) as cool_rate_e
FROM `yelp_user`
WHERE elite <> "None";


-- Calculate the count of reviews with 'useful' values greater than 1000,
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 1000
) as sub;

-- Calculate the count of reviews with 'useful' values greater than 500,
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 500
) as sub;

-- Calculate the count of reviews with 'useful' values greater than 200,
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 200
) as sub;

-- Calculate the count of reviews with 'useful' values greater than 100,
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 100
) as sub;

-- Calculate the count of reviews with 'funny' values greater than 500,
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, funny
FROM yelp_review
WHERE funny>500
) as sub

-- Calculate the count of reviews with 'funny' values greater than 200,
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, funny
FROM yelp_review
WHERE funny>200
) as sub

-- Calculate the count of reviews with 'funny' values greater than 100,
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, funny
FROM yelp_review
WHERE funny>100
) as sub

-- Calculate the count of reviews with 'cool' values greater than 500,
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, cool
FROM yelp_review
WHERE cool>500
) as sub

-- Calculate the count of reviews with 'cool' values greater than 200,
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, cool
FROM yelp_review
WHERE cool>200
) as sub

-- Calculate the count of reviews with 'cool' values greater than 100,
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, cool
FROM yelp_review
WHERE cool>100
) as sub

-- Calculate the average business star rating for each unique review star rating,
-- ordering the results by review star rating in descending order.
SELECT
    yelp_review.stars,
    ROUND(AVG(yelp_business.stars), 2) as avg_busi_star
FROM
    yelp_review
LEFT JOIN
    yelp_business
ON
    yelp_review.business_id = yelp_business.business_id
GROUP BY
    yelp_review.stars
ORDER BY
    yelp_review.stars DESC;

-- Calculate the count of businesses, count of reviews with a star rating of 5,
SELECT
    yelp_business.stars,
    COUNT(yelp_business.business_id) AS count_busi
FROM
    yelp_review
LEFT JOIN
    yelp_business
ON
    yelp_review.business_id = yelp_business.business_id
WHERE
    yelp_review.stars = 5
GROUP BY
    yelp_business.stars 
ORDER BY 
yelp_business.stars DESC;

-- Calculate the count of businesses, count of reviews with a star rating of 1,
SELECT
    yelp_business.stars,
    COUNT(yelp_business.business_id) AS count_busi
FROM
    yelp_review
LEFT JOIN
    yelp_business
ON
    yelp_review.business_id = yelp_business.business_id
WHERE
    yelp_review.stars = 1
GROUP BY
    yelp_business.stars 
ORDER BY 
yelp_business.stars DESC;

-- Calculate the count of restaurant respect to star rating
select 
yelp_business.stars,
count(yelp_business.business_id) as count_busi
from yelp_business
group by 
yelp_business.stars
order by 
yelp_business.stars DESC;

-- Relationship between number of reviews, number of photos, and number of followers for elite users
SELECT sum(fans), sum(review_count), sum(compliment_photos), sum(review_count)/sum(
fans)as fans_re_rate_e, sum(compliment_photos)/sum(fans)as fans_ph_rate_e
FROM `yelp_user`
WHERE elite<>"None";

-- Calculate for non-elite users
SELECT sum(fans), sum(review_count), sum(compliment_photos), sum(review_count)/sum(
fans)as fans_re_rate_e, sum(compliment_photos)/sum(fans)as fans_ph_rate_e
FROM `yelp_user`
WHERE elite="None";

-- Number of Non-elite users' fans
SELECT count(user_id), sum(fans), sum(fans)/count(user_id) as fans_rate_ne
FROM `yelp_user`
WHERE elite="None";

-- Number of fans for elite users
SELECT count(user_id), sum(fans), sum(fans)/count(user_id) as fans_rate_e
FROM `yelp_user`
WHERE elite<>"None";

--Number of reviews for each state

SELECT yelp_business.state, COUNT(yelp_review.review_id) AS count_re_state
FROM yelp_review LEFT JOIN yelp_business
ON yelp_review.business_id = yelp_business.business_id
GROUP BY yelp_business.state
ORDER BY count_re_state DESC;

-- Average stars for restaurants
SELECT round(avg(stars),1)
FROM yelp_business;

-- Number of restaurant for each star rating 
SELECT stars, count(business_id)
FROM yelp_business
GROUP BY stars
ORDER BY stars DESC;

-- Calculate the average review star rating and count of reviews for each business star rating
SELECT
    yelp_business.stars,
    ROUND(AVG(yelp_review.stars), 2) as avg_re_star,
    COUNT(review_id) as count_re
FROM
    yelp_business
RIGHT JOIN
    yelp_review
ON
    yelp_business.business_id = yelp_review.business_id
GROUP BY
    yelp_business.stars
ORDER BY
    yelp_business.stars DESC;

-- Calculate the total number of restaurants in each state:
SELECT state, count(state)
FROM yelp_business 
GROUP BY state
ORDER BY count(state) DESC;

-- Calculate statistics related to star ratings for businesses grouped by state.
SELECT
    state,
    COUNT(state) as count_state,
    SUM(CASE stars WHEN 5.0 THEN 1 ELSE 0 END) as sum_5,
    (SUM(CASE stars WHEN 5.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_5,
    SUM(CASE stars WHEN 4.5 THEN 1 ELSE 0 END) as sum_4_5,
    (SUM(CASE stars WHEN 4.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_4_5,
    SUM(CASE stars WHEN 4.0 THEN 1 ELSE 0 END) as sum_4,
    (SUM(CASE stars WHEN 4.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_4,
    SUM(CASE stars WHEN 3.5 THEN 1 ELSE 0 END) as sum_3_5,
    (SUM(CASE stars WHEN 3.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_3_5,
    SUM(CASE stars WHEN 3.0 THEN 1 ELSE 0 END) as sum_3,
    (SUM(CASE stars WHEN 3.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_3,
    SUM(CASE stars WHEN 2.5 THEN 1 ELSE 0 END) as sum_2_5,
    (SUM(CASE stars WHEN 2.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_2_5,
    SUM(CASE stars WHEN 2.0 THEN 1 ELSE 0 END) as sum_2,
    (SUM(CASE stars WHEN 2.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_2,
    SUM(CASE stars WHEN 1.5 THEN 1 ELSE 0 END) as sum_1_5,
    (SUM(CASE stars WHEN 1.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_1_5,
    SUM(CASE stars WHEN 1.0 THEN 1 ELSE 0 END) as sum_1,
    (SUM(CASE stars WHEN 1.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_1
FROM
    yelp_business
GROUP BY
    state
ORDER BY
    count_state DESC;

-- Calculate the number of open days for each business.
with open_days as 
(SELECT
    business_id,
    (
        (CASE WHEN monday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN tuesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN wednesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN thursday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN friday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN saturday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN sunday = 'None' THEN 0 ELSE 1 END)
    ) AS open_days
FROM
    yelp_business_hours)
select * from open_days;

-- Calculate the count of businesses with different star ratings
-- group by the number of open days.
with open_days as 
(SELECT
    business_id,
    (
        (CASE WHEN monday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN tuesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN wednesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN thursday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN friday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN saturday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN sunday = 'None' THEN 0 ELSE 1 END)
    ) AS open_days
FROM
    yelp_business_hours)
SELECT
    open_days.open_days,
    SUM(CASE yelp_business.stars WHEN 5.0 THEN 1 ELSE 0 END) as sum_5,
    SUM(CASE yelp_business.stars WHEN 4.5 THEN 1 ELSE 0 END) as sum_4_5,
    SUM(CASE yelp_business.stars WHEN 4.0 THEN 1 ELSE 0 END) as sum_4,
    SUM(CASE yelp_business.stars WHEN 3.5 THEN 1 ELSE 0 END) as sum_3_5,
    SUM(CASE yelp_business.stars WHEN 3.0 THEN 1 ELSE 0 END) as sum_3,
    SUM(CASE yelp_business.stars WHEN 2.5 THEN 1 ELSE 0 END) as sum_2_5,
    SUM(CASE yelp_business.stars WHEN 2.0 THEN 1 ELSE 0 END) as sum_2,
    SUM(CASE yelp_business.stars WHEN 1.5 THEN 1 ELSE 0 END) as sum_1_5,
    SUM(CASE yelp_business.stars WHEN 1.0 THEN 1 ELSE 0 END) as sum_1
FROM
    yelp_business
LEFT JOIN
    open_days
ON
    yelp_business.business_id = open_days.business_id
GROUP BY
    open_days.open_days
order by open_days.open_days desc;

-- Calculate the average number of open days and the average star rating
-- for businesses that are not open (is_open = 0).
with open_days as 
(SELECT
    business_id,
    (
        (CASE WHEN monday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN tuesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN wednesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN thursday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN friday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN saturday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN sunday = 'None' THEN 0 ELSE 1 END)
    ) AS open_days
FROM
    yelp_business_hours)
SELECT
    ROUND(AVG(open_days.open_days), 1) as avg_open,
    ROUND(AVG(yelp_business.stars), 2) as avg_stars
FROM
    yelp_business
LEFT JOIN
    open_days
ON
    yelp_business.business_id = open_days.business_id
WHERE
    yelp_business.is_open = 0;

-- Calculate the number of users registered in each year
SELECT 
    YEAR(yelping_since) AS year_since, 
    COUNT(user_id) AS user_count
FROM 
    yelp_user
GROUP BY 
    YEAR(yelping_since)
ORDER BY 
    year_since ASC;

-- Retrieve the count of users who joined Yelp in each year and month
SELECT
    YEAR(yelping_since) as year_since,
    MONTH(yelping_since) as month_since,
    COUNT(user_id)
FROM
    yelp_user
GROUP BY
    YEAR(yelping_since),
    MONTH(yelping_since);

-- Calculate the total number of reviews posted by users on the platform each YEAR
SELECT YEAR(date) as year_review, count(review_id)
FROM yelp_review
GROUP BY YEAR(date)
ORDER BY YEAR(date) ASC;

-- users who have been selected as elite users for at least one year:

SELECT user_id, elite
FROM yelp_user
WHERE elite <> 'None';

-- Calculate the count of users with elite status in each year from 2004 to 2017.

with elite as(
    SELECT user_id, elite
FROM yelp_user
WHERE elite <> 'None'
)
SELECT
    SUM(CASE WHEN elite LIKE '%2004%' THEN 1 ELSE 0 END) as 2004_elite,
    SUM(CASE WHEN elite LIKE '%2005%' THEN 1 ELSE 0 END) as 2005_elite,
    SUM(CASE WHEN elite LIKE '%2006%' THEN 1 ELSE 0 END) as 2006_elite,
    SUM(CASE WHEN elite LIKE '%2007%' THEN 1 ELSE 0 END) as 2007_elite,
    SUM(CASE WHEN elite LIKE '%2008%' THEN 1 ELSE 0 END) as 2008_elite,
    SUM(CASE WHEN elite LIKE '%2009%' THEN 1 ELSE 0 END) as 2009_elite,
    SUM(CASE WHEN elite LIKE '%2010%' THEN 1 ELSE 0 END) as 2010_elite,
    SUM(CASE WHEN elite LIKE '%2011%' THEN 1 ELSE 0 END) as 2011_elite,
    SUM(CASE WHEN elite LIKE '%2012%' THEN 1 ELSE 0 END) as 2012_elite,
    SUM(CASE WHEN elite LIKE '%2013%' THEN 1 ELSE 0 END) as 2013_elite,
    SUM(CASE WHEN elite LIKE '%2014%' THEN 1 ELSE 0 END) as 2014_elite,
    SUM(CASE WHEN elite LIKE '%2015%' THEN 1 ELSE 0 END) as 2015_elite,
    SUM(CASE WHEN elite LIKE '%2016%' THEN 1 ELSE 0 END) as 2016_elite,
    SUM(CASE WHEN elite LIKE '%2017%' THEN 1 ELSE 0 END) as 2017_elite
FROM
    elite;

-- Calculate the count of reviews posted by each user in each year from 2008 to 2017.
SELECT
    user_id,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2008 THEN 1 ELSE 0 END) as 2008_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2009 THEN 1 ELSE 0 END) as 2009_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2010 THEN 1 ELSE 0 END) as 2010_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2011 THEN 1 ELSE 0 END) as 2011_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2012 THEN 1 ELSE 0 END) as 2012_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2013 THEN 1 ELSE 0 END) as 2013_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2014 THEN 1 ELSE 0 END) as 2014_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2015 THEN 1 ELSE 0 END) as 2015_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2016 THEN 1 ELSE 0 END) as 2016_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2017 THEN 1 ELSE 0 END) as 2017_exist
FROM
    yelp_review
GROUP BY
    user_id;

-- Calculate the proportion of users who posted reviews in consecutive years for each pair of yeats from 2008 to 2017. 
with user_keep as(
SELECT
    user_id,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2008 THEN 1 ELSE 0 END) as 2008_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2009 THEN 1 ELSE 0 END) as 2009_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2010 THEN 1 ELSE 0 END) as 2010_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2011 THEN 1 ELSE 0 END) as 2011_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2012 THEN 1 ELSE 0 END) as 2012_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2013 THEN 1 ELSE 0 END) as 2013_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2014 THEN 1 ELSE 0 END) as 2014_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2015 THEN 1 ELSE 0 END) as 2015_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2016 THEN 1 ELSE 0 END) as 2016_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2017 THEN 1 ELSE 0 END) as 2017_exist
FROM
    yelp_review
GROUP BY
    user_id
)
SELECT
    ROUND(SUM(CASE WHEN (2008_exist <> 0 AND 2009_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2008_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2009,
    ROUND(SUM(CASE WHEN (2009_exist <> 0 AND 2010_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2009_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2010,
    ROUND(SUM(CASE WHEN (2010_exist <> 0 AND 2011_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2010_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2011,
    ROUND(SUM(CASE WHEN (2011_exist <> 0 AND 2012_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2011_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2012,
    ROUND(SUM(CASE WHEN (2012_exist <> 0 AND 2013_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2012_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2013,
    ROUND(SUM(CASE WHEN (2013_exist <> 0 AND 2014_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2013_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2014,
    ROUND(SUM(CASE WHEN (2014_exist <> 0 AND 2015_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2014_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2015,
    ROUND(SUM(CASE WHEN (2015_exist <> 0 AND 2016_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2015_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2016,
    ROUND(SUM(CASE WHEN (2016_exist <> 0 AND 2017_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2016_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2017
FROM
    user_keep;


-- Calculate the proportion of users who had elite status in consecutive years for each pair of years from 2005 to 2017.
with elite as(
    SELECT user_id, elite
FROM yelp_user
WHERE elite <> 'None'
)
SELECT
    ROUND(SUM(CASE WHEN (elite LIKE '%2005%' AND elite LIKE '%2006%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2005%' THEN 1 ELSE 0 END), 2) AS exist_2006,
    ROUND(SUM(CASE WHEN (elite LIKE '%2006%' AND elite LIKE '%2007%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2006%' THEN 1 ELSE 0 END), 2) AS exist_2007,
    ROUND(SUM(CASE WHEN (elite LIKE '%2007%' AND elite LIKE '%2008%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2007%' THEN 1 ELSE 0 END), 2) AS exist_2008,
    ROUND(SUM(CASE WHEN (elite LIKE '%2008%' AND elite LIKE '%2009%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2008%' THEN 1 ELSE 0 END), 2) AS exist_2009,
    ROUND(SUM(CASE WHEN (elite LIKE '%2009%' AND elite LIKE '%2010%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2009%' THEN 1 ELSE 0 END), 2) AS exist_2010,
    ROUND(SUM(CASE WHEN (elite LIKE '%2010%' AND elite LIKE '%2011%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2010%' THEN 1 ELSE 0 END), 2) AS exist_2011,
    ROUND(SUM(CASE WHEN (elite LIKE '%2011%' AND elite LIKE '%2012%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2011%' THEN 1 ELSE 0 END), 2) AS exist_2012,
    ROUND(SUM(CASE WHEN (elite LIKE '%2012%' AND elite LIKE '%2013%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2012%' THEN 1 ELSE 0 END), 2) AS exist_2013,
    ROUND(SUM(CASE WHEN (elite LIKE '%2013%' AND elite LIKE '%2014%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2013%' THEN 1 ELSE 0 END), 2) AS exist_2014,
    ROUND(SUM(CASE WHEN (elite LIKE '%2014%' AND elite LIKE '%2015%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2014%' THEN 1 ELSE 0 END), 2) AS exist_2015,
    ROUND(SUM(CASE WHEN (elite LIKE '%2015%' AND elite LIKE '%2016%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2015%' THEN 1 ELSE 0 END), 2) AS exist_2016,
    ROUND(SUM(CASE WHEN (elite LIKE '%2016%' AND elite LIKE '%2017%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2016%' THEN 1 ELSE 0 END), 2) AS exist_2017
FROM
    elite;
















