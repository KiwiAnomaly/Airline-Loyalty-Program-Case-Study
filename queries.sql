-- 1. Initial table audit and connection test
SELECT * FROM `project.Airline_Project.Customer Loyalty History`
    LIMIT 2000

-- 2. Checking record counts by year to verify data integrity
SELECT Enrollment_Year, COUNT(*) as record_count
    FROM `project.Airline_Project.Customer Loyalty History`
    GROUP BY Enrollment_Year
    ORDER BY Enrollment_Year
    
-- 3. Extracting demographic data for campaign success analysis
SELECT
        Enrollment_Month,
        Enrollment_Year,
        Education,
        Gender,
        Loyalty_Card,
        Marital_Status
    FROM `project.Airline_Project.Customer Loyalty History`
    
-- 4. Filtering summer flight activity for 2018
 SELECT * FROM `project.Airline_Project.Customer Flight Activity`
    WHERE Year = 2018 AND Month IN (6, 7, 8)

-- 5. Checking flight activity for the campaign peak month (April)
SELECT * FROM `project.Airline_Project.Customer Flight Activity`
    WHERE Year = 2018 AND Month IN (4)

-- 6. Year-over-Year flight comparison for seasonal impact analysis
SELECT Year, Month, SUM(Total_Flights) as Monthly_Flights
    FROM `project.Airline_Project.Customer Flight Activity`
    WHERE (Year = 2017 OR Year = 2018) AND Month IN (4, 6, 7, 8)
    GROUP BY Year, Month
    ORDER BY Month, Year

-- 7. Aggregating lifetime flights per customer for segmentation
SELECT Loyalty_Number, SUM(Total_Flights) as Lifetime_Flights
    FROM `project.Airline_Project.Customer Flight Activity`
    GROUP BY Loyalty_Number