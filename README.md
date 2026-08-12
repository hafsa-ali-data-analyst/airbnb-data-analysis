# 🏡 Airbnb Market Insights Dashboard

## 📌 Overview

An end-to-end data analytics project using the Airbnb Open Dataset to analyze pricing patterns, room-type distribution, property availability, booking policies, host-related attributes, and customer ratings.

The project combines **Excel for data cleaning, SQL for business analysis, and Tableau for interactive visualization**, transforming raw listing data into business-oriented insights for the short-term rental market.

---

## 🎯 Objective

The objective of this project was to analyze Airbnb listing data to identify patterns in **pricing, room types, availability, booking policies, and customer ratings**, and translate these findings into actionable business insights for hosts and hospitality stakeholders.

---

## 🛠️ Tools & Technologies

* **Excel** — Data cleaning and preparation
* **SQL / SQLite** — Data analysis and business queries
* **Tableau** — Interactive dashboard and data visualization

---

## 📊 Key Analysis Areas

* Pricing Trends Across Neighbourhoods
* Top 10 Most Expensive Neighbourhoods
* Room Type Distribution and Ratings
* Neighbourhood Group Pricing
* Host Identity Verification
* Service Fee Distribution
* Instant Booking and Cancellation Policies
* Property Availability
* Minimum-Night Stay Patterns
* Review Rating Distribution

---

## 🔄 Project Workflow

1. Cleaned and prepared the raw Airbnb listing dataset using Excel.
2. Handled missing and inconsistent values while preserving meaningful missing information where appropriate.
3. Imported the cleaned dataset into SQLite for SQL-based exploratory and business analysis.
4. Analyzed pricing, room types, availability, booking policies, minimum-night requirements, host attributes, and review ratings.
5. Derived business insights and recommendations from the analysis.
6. Built an interactive Tableau dashboard containing KPIs, filters, and analytical visualizations.

---

## 📈 Key Insights

* **Entire Home/Apt** listings are the largest accommodation category, with **53,429 listings**, followed by **Private Rooms** with **46,306 listings**.
* Average prices across the five neighbourhood groups are relatively close, ranging from approximately **$623 to $630**, while individual neighbourhoods show substantially greater variation.
* **New Dorp** and **Chelsea, Staten Island** are among the highest-priced neighbourhoods by average listing price, with average prices of approximately **$1,045** and **$1,042**, respectively.
* Approximately **34,209 listings** fall into the High Availability category, while **23,448 listings** have zero days of availability.
* **Short Stay** listings account for approximately **57,714 properties**, making them the largest minimum-night category in the analysis.
* Review ratings are concentrated between **3 and 5 stars**, with **5-star ratings** representing the largest rating category.
* Instant booking is relatively balanced, with approximately **50.8K listings** marked as instantly bookable and **51.2K listings** marked as not instantly bookable.
* **Moderate cancellation policies** have the highest number of listings among the three major cancellation-policy categories.

---

## 💡 Business Recommendations

* Use **neighbourhood-level pricing patterns** to develop competitive pricing strategies for different locations.
* Monitor properties with high availability and evaluate pricing, amenities, and booking policies to identify opportunities to improve listing performance.
* Consider flexible booking and cancellation policies where appropriate to improve the attractiveness of listings.
* Maintain strong service quality and guest experience to support higher customer ratings.
* Use room-type and minimum-night patterns to understand the accommodation segments that have the strongest representation in the market.
* Compare pricing against similar listings within the same neighbourhood before making pricing decisions.

---

## 📂 Project Files

| File                                    | Description                                                   |
| --------------------------------------- | ------------------------------------------------------------- |
| `Airbnb_Analysis.sql`                   | SQL queries used for business analysis and insight generation |
| `Cleaned_Airbnb_Dataset.zip`            | Cleaned Airbnb dataset                                        |
| `Airbnb_Market_Insights_Dashboard.twbx` | Tableau workbook                                              |
| `Airbnb_Market_Insights_Dashboard.png`  | Dashboard preview                                             |

---

## 📊 Tableau Dashboard

The interactive Tableau dashboard includes:

* Total Listings KPI
* Average Price KPI
* Average Rating KPI
* Average Availability KPI
* Top 10 Most Expensive Neighbourhoods
* Room Type Analysis
* Average Rating by Room Type
* Average Price by Neighbourhood Group
* Interactive filters for Room Type, Neighbourhood, and Neighbourhood Group

---

## 📸 Dashboard Preview

<p align="center">
  <img src="Airbnb_Market_Insights_Dashboard.png" width="850">
</p>

---

## 🔍 Key Takeaway

The analysis shows a market characterized by a strong presence of **entire-home and private-room listings, short-stay properties, and relatively high listing prices**. Neighbourhood-level pricing, availability, room type, and booking-policy patterns provide useful dimensions for comparing listing characteristics and identifying opportunities for more informed pricing and listing strategies.

---

## 🧠 Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* SQL Querying
* Business Analysis
* Data Visualization
* Tableau Dashboard Development
* KPI Development
* Business Insight Generation
* Data-Driven Recommendations

---

## 📌 Conclusion

This project demonstrates an end-to-end data analytics workflow, from cleaning and preparing raw Airbnb listing data in Excel to performing SQL-based analysis and developing an interactive Tableau dashboard.

The analysis highlights key patterns in pricing, accommodation types, availability, booking policies, and customer ratings. These insights can help support more informed pricing, listing, and operational decisions within the short-term rental market.

---

## 🔗 Repository

This repository contains the cleaned dataset, SQL analysis, Tableau workbook, and dashboard preview for the Airbnb Market Insights project.

### Clone the Repository

To clone this repository locally, run:

```bash
git clone YOUR_REPOSITORY_URL
