# Airbnb Price & Location Analysis — Data Analyst Portfolio Project
This project explores Airbnb listings in New York City to uncover pricing patterns, room type distributions, host behaviors, and listing availability. It was completed as a self-initiated, unguided project to demonstrate my skills in SQL, Power BI, Excel, and business data analysis.


## Project Overview
The goal of the project is to draw **business insights from Airbnb data** that can benefit:
- Hosts (for pricing and visibility)
- Customers (for better value)
- The platform (Airbnb) itself

The analysis was done in the following stages:
1. Cleaned raw data in Excel (handled outliers, nulls, created new columns)
2. Loaded into SQL to run analytical queries
3. Visualized findings in an interactive Power BI dashboard
4. Generated insights and recommendations from results
   

## Business Problem
With thousands of listings across NYC, Airbnb faces challenges in:
- Helping hosts price competitively without underpricing
- Helping customers identify high-value and reliable listings
- Maintaining listing activity and accuracy

- 
## Tools & Technologies Used

| Tool          | Purpose                                          |
|---------------|--------------------------------------------------|
| **Excel**     | Initial cleaning, formatting, Outlier tagging    |
| **MySQL**     | Data exploration and business logic (SQL queries)|
| **Power BI**  | Dashboard creation and visual storytelling       |
| **Power Query**| Data cleaning inside Power BI                   |
| **DAX**       | Calculated columns, KPIs, conditional logic      |


## Data Cleaning Highlights
- **Price Outliers** were detected using both Z-Score and IQR methods.  
  Due to the **right-skewed distribution**, IQR was used as the final method, flagging **2,070 rows (~5% of data)**. These were removed only for **average price calculations and trend visuals**.
  
- **Status Column** was created to label listings:
   "Inactive"` → if `availability_365 = 0`
   "Active"` → otherwise  
  This allowed for segmentation without deleting any data.

*[Full cleaning logic in `Data_Cleaning.md`](https://github.com/prachisaladiya/Airbnb-analysis/blob/main/Data_cleaning.md.txt)*


## Dashboard Preview
![Airbnb Dashboard](https://github.com/prachisaladiya/Airbnb-analysis/blob/main/Dashboard.png)

The interactive Power BI dashboard includes:
- Avg price by borough
- Listing count by room type
- Top 10 hosts by number of listings
- Distribution of inactive listings


## Key Insights
1. Manhattan has the highest average listing price, followed by Brooklyn
2. Entire homes/apartments dominate listings, followed by private rooms
3. Most listings fall into the budget category, even in premium boroughs
4. Top 10 hosts own 696 listings, showing significant power-user presence
5. Around 15k listings are underpriced but have 100+ reviews, suggesting pricing gaps
6. Among the top 5 expensive listings with >100 reviews, 4 are Entire Homes, showing strong demand for privacy


## Recommendations
### For Hosts
- Use dynamic pricing tools for listings with high reviews but low prices
- Compete with top hosts through better guest experience and review focus

### For Customers
- Filter by `100+ reviews` + `low price` to find trusted, affordable stays
- Entire homes are best for long stays or group trips
- Avoid inactive listings by checking host activity and availability

### For Airbnb Platform
- Flag underpriced top-reviewed listings to recommend price optimization
- Identify and clean inactive listings (especially in Manhattan, Brooklyn)
- Add smart filters like **“Best Value for Money”** using review-to-price ratios


## Learnings & Takeaways
- Gained hands-on experience in SQL-based exploration and dashboard building
- Learned how to handle outliers logically without deleting data
- Understood the impact of room type and location on pricing behavior
- Developed a structured, business-focused approach to analysis
- Practiced presenting insights that are useful for multiple stakeholders


## Project Structure

 Airbnb_Price_Analysis/
├──  Airbnb cleaned data.xlsx
├──  Airbnb Queries.sql
├──  Airbnb report.pbix
├──  Dashboard.png
├──  README.md
└──  Data_Cleaning.md
