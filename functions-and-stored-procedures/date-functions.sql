--Date Conversions

SELECT
  -- Select the date portion of StartDate
  CONVERT(DATE, StartDate) as StartDate,
  -- Measure how many records exist for each StartDate
  COUNT(StartDate) as CountOfRows 
FROM CapitalBikeShare 
-- Group by the date portion of StartDate
GROUP BY CONVERT(DATE, StartDate)
-- Sort the results by the date portion of StartDate
ORDER BY CONVERT(DATE, StartDate);

--Check for seconds in each records

SELECT
	-- Count the number of IDs
	COUNT(ID) AS Count,
    -- Use DATEPART() to evaluate the SECOND part of StartDate
    "StartDate" = CASE WHEN DATEPART(SECOND, StartDate) = 0 THEN 'SECONDS = 0'
					  WHEN DATEPART(SECOND, StartDate) > 0 THEN 'SECONDS > 0' END
FROM CapitalBikeShare
GROUP BY
    -- Complete the CASE statement
	CASE WHEN DATEPART(SECOND, StartDate) = 0 THEN 'SECONDS = 0'
		WHEN DATEPART(SECOND, StartDate) > 0 THEN 'SECONDS > 0' END ;
		
--Identify busiest day of week

SELECT
    -- Select the day of week value for StartDate
	DATENAME(WEEKDAY, StartDate) as DayOfWeek,
    -- Calculate TotalTripHours
	SUM(DATEDIFF(SECOND, StartDate, EndDate))/ 3600 as TotalTripHours 
FROM CapitalBikeShare 
-- Group by the day of week
GROUP BY DATENAME(WEEKDAY, StartDate)
-- Order TotalTripHours in descending order
ORDER BY TotalTripHours DESC

--Identify outliers for Saturdays

SELECT
	-- Calculate TotalRideHours using SUM() and DATEDIFF()
  	SUM(DATEDIFF(SECOND, StartDate, EndDate))/ 3600 AS TotalRideHours,
    -- Select the DATE portion of StartDate
  	CONVERT(DATE, StartDate) AS DateOnly,
    -- Select the WEEKDAY
  	DATENAME(WEEKDAY, CONVERT(DATE, StartDate)) AS DayOfWeek 
FROM CapitalBikeShare
-- Only include Saturday
WHERE DATENAME(WEEKDAY, StartDate) = 'Saturday' 
GROUP BY CONVERT(DATE, StartDate);

--Variables and casting

-- Create @ShiftStartTime
DECLARE @ShiftStartTime AS time = '08:00 AM'

-- Create @StartDate
DECLARE @StartDate AS date

-- Set StartDate to the first StartDate from CapitalBikeShare
SET 
	@StartDate = (
    	SELECT TOP 1 StartDate 
    	FROM CapitalBikeShare 
    	ORDER BY StartDate ASC
		)

-- Create ShiftStartDateTime
DECLARE @ShiftStartDateTime AS datetime

-- Cast StartDate and ShiftStartTime to datetime data types
SET @ShiftStartDateTime = CAST(@StartDate AS datetime) + CAST(@ShiftStartTime AS datetime) 

SELECT @ShiftStartDateTime


--Create a variable table

-- Create @Shifts
DECLARE @Shifts TABLE(
    -- Create StartDateTime column
	StartDateTime datetime,
    -- Create EndDateTime column
	EndDateTime datetime)
-- Populate @Shifts
INSERT INTO @Shifts VALUES(
	'3/1/2018 8:00 AM',
	'3/1/2018 4:00 PM') 
SELECT * 
FROM @Shifts


--Populate a variable table with query results

-- Create @RideDates
DECLARE @RideDates TABLE(
    -- Create RideStart
	RideStart date,
    -- Create RideEnd
	RideEnd date)
-- Populate @RideDates
INSERT INTO @RideDates(RideStart, RideEnd)
-- Select the unique date values of StartDate and EndDate
SELECT DISTINCT
    -- Cast StartDate as date
	CAST(StartDate AS date),
    -- Cast EndDate as date
	CAST(EndDate AS date) 
FROM CapitalBikeShare 
SELECT * 
FROM @RideDates;


--Valid datediff checks

SELECT DATEDIFF(day, '2/26/2018', '3/3/2018')
SELECT DATEDIFF(week, '2/26/2018', '3/3/2018')
SELECT DATEDIFF(month, '2/26/2018', '3/3/2018')

--First day of current

-- Find the first day of the current month
SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)
--Find the first day of the current week
SELECT DATEADD(week, DATEDIFF(week, 0, GETDATE()), 0)

