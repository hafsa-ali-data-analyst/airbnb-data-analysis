
/* =========================================================
                AIRBNB DATA ANALYSIS
========================================================= */

-- Airbnb Data Analysis 
-- Source: Kaggle Airbnb Open Dataset
-- Dataset Preparation: Cleaned using Microsoft Excel
-- Analysis Tools: SQLite, Tableau
-- Objective:
-- Analyze pricing trends, host behavior, booking patterns,
-- availability and customer preferences to derive business insights.

SELECT * FROM cleaned_airbnb_dataset;

-- 1: Pricing Trends Across Neighbourhoods 

SELECT 
      neighbourhood_gr, 
      neighbourhood, 
      AVG(price) AS avg_price
FROM cleaned_airbnb_dataset
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
FROM cleaned_airbnb_dataset
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
FROM cleaned_airbnb_dataset
GROUP BY room_type
ORDER BY count_of_properties DESC;

-- Insights:
-- Hotel rooms have the highest average rating,
-- while entire homes represent the largest share of listings.
-- This highlights differences in both market availability
-- and customer ratings across room types.

-- Recommendation:
-- Hosts offering entire homes can improve customer satisfaction
-- by enhancing cleanliness, maintenance and hospitality standards.

-- 3: Host Behaviour and Guest Activity

-- a: Host identity

SELECT 
    host_identity_ve, 
    COUNT(DISTINCT id) AS count_of_properties
FROM cleaned_airbnb_dataset
GROUP BY host_identity_ve;
 
-- Insights:
-- A substantial share of listings are associated with unverified host identities,
-- highlighting an opportunity to examine whether verification is associated with
-- guest engagement or booking-related outcomes.

-- Recommendation:
-- Encouraging host identity verification may improve platform credibility
-- and increase customer trust.

-- b: Service Fee

SELECT
    COUNT(CASE WHEN service_fee > 500 THEN service_fee END) AS high_service_fee,
    COUNT(CASE WHEN service_fee BETWEEN 200 AND 500 THEN service_fee END) AS mid_service_fee,
    COUNT(CASE WHEN service_fee < 200 THEN service_fee END) AS low_service_fee
FROM cleaned_airbnb_dataset;

-- Insights:
-- Most listings fall within the lower service-fee category,
-- indicating competitive pricing strategies aimed at attracting more bookings.

-- Recommendation:
-- Maintaining reasonable service fees may help hosts remain competitive,
-- especially in highly saturated markets.

-- c: instantbookable policy

SELECT 
    COUNT(CASE WHEN instant_bookable = 'FALSE' THEN 1 END) AS not_instant_bookable,
    COUNT(CASE WHEN instant_bookable = 'TRUE' THEN 1 END) AS instant_bookable,
    COUNT(CASE WHEN instant_bookable = 'No data' THEN 1 END) AS no_data_available
FROM cleaned_airbnb_dataset;

-- Insights
-- The number of instantly bookable listings is nearly equal to 
-- the number of non-instantly bookable listings, indicating a balanced distribution. 
-- A small portion of listings have unavailable booking-status information, 
-- reflecting missing information regarding instant booking status. 

-- Recommendation:
-- Increasing instant booking options may improve booking convenience
-- and enhance customer experience.

-- d: cancellation policy

SELECT
    COUNT(CASE WHEN cancellation_pol = 'strict' THEN 1 END) AS no_of_strict,
    COUNT(CASE WHEN cancellation_pol = 'moderate' THEN 1 END) AS no_of_moderate,
    COUNT(CASE WHEN cancellation_pol = 'flexible' THEN 1 END) AS no_of_flexible
FROM cleaned_airbnb_dataset; 

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
FROM cleaned_airbnb_dataset
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
FROM cleaned_airbnb_dataset
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
FROM cleaned_airbnb_dataset
GROUP BY 1;  -- No specific insight 

-- b: cancellation_policy 

SELECT 
    cancellation_pol, 
    COUNT(DISTINCT id) AS count_of_properties
FROM cleaned_airbnb_dataset
GROUP BY 1;  -- No specific insight 

-- c: price 

SELECT 
    CASE 
        WHEN price <= 200 THEN 'Low Price'
        WHEN price <= 600 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_category,
    COUNT(DISTINCT id) AS count_of_properties
FROM cleaned_airbnb_dataset
GROUP BY price_category
ORDER BY count_of_properties DESC;

-- Insights:
-- High-priced listings represent the largest share of listings in the dataset,
-- indicating a substantial presence of higher-priced accommodation options.
-- Lower-priced listings are comparatively limited within the market.

-- Recommendation:
-- Hosts should compare pricing with similar properties and neighbourhoods
-- to maintain competitive yet profitable rates.

-- d: minimum_no_of_nights

SELECT  -- less than 365 minimum_no_of_nights
    CASE 
        WHEN minimum_nights = 1 THEN '1 Night'
        WHEN minimum_nights <= 7 THEN 'Short Stay'
        WHEN minimum_nights <= 30 THEN 'Medium Stay'
        ELSE 'Long Stay'
    END AS stay_category,
    COUNT(DISTINCT id) AS count_of_properties
FROM cleaned_airbnb_dataset
WHERE minimum_nights <= 365   
GROUP BY stay_category
ORDER BY count_of_properties DESC;

SELECT 
    COUNT(DISTINCT id) AS no_of_properties -- outlier data
FROM cleaned_airbnb_dataset
WHERE minimum_nights > 365;  

-- Insight:
-- The market is heavily concentrated in short-stay listings, while long-stay listings are less common.
-- Listings with unusually high minimum-night requirements can be treated as potential outliers for further investigation.

-- Recommendation:
-- Short-stay friendly policies may attract a wider range of travelers
-- and increase booking frequency.
 
-- e: room_type 

SELECT 
    room_type,
    COUNT(DISTINCT id) AS count_of_properties
FROM cleaned_airbnb_dataset
GROUP BY room_type
ORDER BY count_of_properties DESC;
 
-- Insight:
-- Entire homes and private rooms dominate the market, indicating stronger host preference toward offering more private accommodation options.
-- Shared and hotel rooms represent a smaller share of listings, indicating comparatively lower market presence.

-- Recommendation:
-- Since private and entire room accommodations dominate the market,
-- hosts can focus on improving privacy, comfort and amenities
-- to attract more guests.

-- Final Overall Insight:
-- The Airbnb dataset is characterized by a substantial presence of higher-priced listings,
-- short-stay accommodations and entire-home/private-room listings.
-- Pricing, availability, room type and booking policies 
-- provide useful dimensions for evaluating the market.
-- Review ratings provide an additional indicator for comparing
-- customer experience across room types and listings.

-- Final Recommendation:
-- Hosts can use neighbourhood-level pricing, room-type performance,
-- availability, and booking-policy patterns to refine pricing and listing strategies.
-- Maintaining competitive prices, convenient booking options
-- and strong service quality may help improve listing attractiveness.








