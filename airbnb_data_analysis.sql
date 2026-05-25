
/* =========================================================
                AIRBNB DATA ANALYSIS
========================================================= */

-- Airbnb Data Analysis 
-- Source: Kaggle Airbnb Open Dataset
-- Tools Used: Excel, SQLite, Tableau
-- Objective:
-- Analyze pricing trends, host behavior, booking patterns,
-- availability and customer preferences to derive business insights.

SELECT * FROM Airbnb_Open_Dataset;

-- 1: Pricing Trends Across Neighbourhoods 

SELECT 
      neighbourhood_gr, 
      neighbourhood, 
      AVG(price) AS avg_price
FROM Airbnb_Open_Dataset
GROUP BY 1,2
ORDER BY avg_price DESC;

-- Insights:
-- New Dorp and Chelsea have the highest average prices,
-- indicating premium pricing trends in these neighbourhoods.
-- In contrast, Woodside has comparatively lower average prices,
-- suggesting more affordable accommodation options. 

-- Recommendation:
-- Hosts in premium neighbourhoods can adopt competitive premium pricing,
-- while affordable neighbourhoods may focus on attracting budget-conscious travelers.

SELECT 
    id, 
    name, 
    neighbourhood, 
    price
FROM Airbnb_Open_Dataset
WHERE neighbourhood IN ( 'New Dorp', 'Chelsea, Staten Island') 
ORDER BY price DESC;

-- Insight:
-- New Dorp and Chelsea have higher-priced listings compared to other neighbourhoods.
-- Properties like "Tranquil Retreat Outside NYC" contribute significantly to this trend.

-- Recommendation:
-- Hosts in premium areas can maintain competitive premium pricing with quality services.
-- Budget-conscious travelers may prefer lower-priced neighbourhoods.

-- 2: Room_Type Popularity

SELECT room_type, 
       COUNT(DISTINCT id) AS count_of_properties,
       ROUND(AVG(review_rate_numb),3) AS avg_rating,
       ROUND(AVG(price),2) AS avg_price
FROM Airbnb_Open_Dataset
GROUP BY room_type
ORDER BY count_of_properties DESC;

-- Insights:
-- Entire homes are the most commonly listed property type,
-- while hotel rooms receive comparatively higher average ratings.
-- This suggests that customers may value the professional service,
-- maintenance and consistency associated with hotel accommodations.

-- Recommendation:
-- Hosts offering entire homes can improve customer satisfaction
-- by enhancing cleanliness, maintenance and hospitality standards.

-- 3: Host Behaviour and Guest Activity

-- a: Host identity

SELECT 
    host_identity_ve, 
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
GROUP BY host_identity_ve;
 
-- Insights:
-- A significant portion of hosts have unverified identities,
-- which may impact customer trust and booking confidence.

-- Recommendation:
-- Encouraging host identity verification may improve platform credibility
-- and increase customer trust.

-- b: Service Fee

SELECT
    COUNT(CASE WHEN service_fee > 500 THEN service_fee END) AS high_service_fee,
    COUNT(CASE WHEN service_fee BETWEEN 200 AND 500 THEN service_fee END) AS mid_service_fee,
    COUNT(CASE WHEN service_fee < 200 THEN service_fee END) AS low_service_fee
FROM Airbnb_Open_Dataset;

-- Insights:
-- Most hosts charge lower service fees,
-- indicating competitive pricing strategies aimed at attracting more bookings.

-- Recommendation:
-- Maintaining reasonable service fees may help hosts remain competitive,
-- especially in highly saturated markets.

-- c: instantbookable policy

SELECT 
    COUNT(CASE WHEN instant_bookable = 'FALSE' THEN 1 END) AS not_instant_bookable,
    COUNT(CASE WHEN instant_bookable = 'TRUE' THEN 1 END) AS instant_bookable,
    COUNT(CASE WHEN instant_bookable = 'No data' THEN 1 END) AS no_data_available
FROM Airbnb_Open_Dataset;

-- Insights
-- The number of instantly bookable listings is nearly equal to 
-- the number of non-instantly bookable listings, indicating a balanced distribution 
-- some data is not available, reflecting missing information regarding instant booking status. 

-- Recommendation:
-- Increasing instant booking options may improve booking convenience
-- and enhance customer experience.

-- d: cancellation policy

SELECT
    COUNT(CASE WHEN cancellation_pol = 'strict' THEN 1 END) AS no_of_strict,
    COUNT(CASE WHEN cancellation_pol = 'moderate' THEN 1 END) AS no_of_moderate,
    COUNT(CASE WHEN cancellation_pol = 'flexible' THEN 1 END) AS no_of_flexible
FROM Airbnb_Open_Dataset; 

-- Insights:
-- The total count of all three cancellation policies is almost equal,
-- but the highest count is for moderate policies,
-- indicating that hosts slightly prefer a moderate cancellation policy.

-- Recommendation:
-- Moderate cancellation policies may help balance customer flexibility
-- and host revenue protection.

-- e: review rate no.

SELECT 
    review_rate_numb,
    COUNT(*) AS count
FROM Airbnb_Open_Dataset
GROUP BY review_rate_numb
ORDER BY review_rate_numb DESC;
 
-- Insights:
-- Review ratings are fairly evenly distributed across different rating values,
-- with 5-star ratings having the highest count.
-- 1-star ratings are slightly lower compared to others
-- and a small number of listings have missing review ratings.

-- Recommendation:
-- Hosts should focus on maintaining service quality and guest satisfaction
-- to achieve higher review ratings and improve booking potential.

-- f: availability 365

SELECT 
    CASE 
        WHEN availability_365 = 0 THEN 'Not Available'
        WHEN availability_365 <= 100 THEN 'Low Availability'
        WHEN availability_365 <= 200 THEN 'Medium Availability'
        ELSE 'High Availability'
    END AS availability_category,
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
GROUP BY availability_category
ORDER BY count_of_properties DESC;

-- Insights:
-- Most properties fall under high and low availability categories,
-- while medium availability listings are comparatively fewer.
-- This indicates a relatively balanced distribution of property availability across the market.

-- Recommendation:
-- Hosts with lower availability may optimize occupancy through better pricing,
-- seasonal offers or flexible booking policies.

-- 4: Booking Patterns and Availability 

-- a: instant_bookable 

SELECT 
    instant_bookable, 
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
GROUP BY 1;  -- No specific insight 

-- b: cancellation_policy 

SELECT 
    cancellation_pol, 
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
GROUP BY 1;  -- No specific insight 

-- c: price 

SELECT 
    CASE 
        WHEN price <= 200 THEN 'Low Price'
        WHEN price <= 600 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_category,
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
GROUP BY price_category
ORDER BY count_of_properties DESC;

-- Insights:
-- High-priced listings dominate the dataset,
-- suggesting strong demand for premium accommodations.
-- Lower-priced listings are comparatively limited within the market.

-- Recommendation:
-- Hosts should analyze competitor pricing within similar neighbourhoods
-- to maintain competitive yet profitable pricing strategies.

-- d: minimum_no_of_nights

SELECT  -- less than 365 minimum_no_of_nights
    CASE 
        WHEN minimum_nights = 1 THEN '1 Night'
        WHEN minimum_nights <= 7 THEN 'Short Stay'
        WHEN minimum_nights <= 30 THEN 'Medium Stay'
        ELSE 'Long Stay'
    END AS stay_category,
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
WHERE minimum_nights <= 365   
GROUP BY stay_category
ORDER BY count_of_properties DESC;

SELECT 
    COUNT(DISTINCT id) AS no_of_properties -- outlier data
FROM Airbnb_Open_Dataset
WHERE minimum_nights > 365;  

-- Insight:
-- The market is heavily dominated by short-stay listings, highlighting higher demand for flexible accommodation options.
-- In contrast, long-stay properties are relatively limited, while listings with unusually high minimum night requirements appear to be outliers.

-- Recommendation:
-- Short-stay friendly policies may attract a wider range of travelers
-- and increase booking frequency.
 
-- e: room_type 

SELECT 
    room_type,
    COUNT(DISTINCT id) AS count_of_properties
FROM Airbnb_Open_Dataset
GROUP BY room_type
ORDER BY count_of_properties DESC;
 
-- Insight:
-- Entire homes and private rooms dominate the market, indicating stronger host preference toward offering more private accommodation options.
-- Shared and hotel rooms represent only a small portion of listings, suggesting comparatively lower market presence and demand.

-- Recommendation:
-- Since private and entire room accommodations dominate the market,
-- hosts can focus on improving privacy, comfort and amenities
-- to attract more guests.

-- Final Overall Insight:
-- The Airbnb market is largely driven by premium-priced listings,
-- short-stay accommodations, and entire/private room preferences.
-- Customer satisfaction appears to be influenced by service quality,
-- pricing strategy, booking flexibility and property availability.
-- Data-driven pricing and improved guest experience can help hosts
-- maximize occupancy and revenue potential.

-- Final Recommendation:
-- Hosts should adopt competitive pricing, maintain high service quality,
-- encourage instant bookings and optimize availability strategies
-- to improve customer satisfaction and maximize revenue.









