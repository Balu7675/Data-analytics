SELECT * FROM session_results_data_final;
--List all drivers with their team and final position
SELECT "FullName", "TeamName", "Position"
FROM session_results_data_final
ORDER BY "Position";

-- Count how many drivers are in each team
SELECT "TeamName", COUNT(*) AS DriverCount
FROM session_results_data_final
GROUP BY "TeamName";

--Find the top 5 fastest Q3 lap times with driver details
SELECT "FullName", "TeamName", "Q3"
FROM session_results_data_final
ORDER BY "Q3" ASC
LIMIT 5;

--Average qualifying position per team
SELECT "TeamName", AVG("Position") AS AvgPosition
FROM session_results_data_final
GROUP BY "TeamName"
ORDER BY AvgPosition;

--Drivers whose Q3 was faster than their Q2
SELECT "FullName", "Q2", "Q3"
FROM session_results_data_final
WHERE "Q3" < "Q2";

--Teams with both drivers inside the top 10
SELECT "TeamName"
FROM session_results_data_final
WHERE "Position" <= 10
GROUP BY "TeamName"
HAVING COUNT(*) >= 2;

--Rank drivers by Q1 performance
SELECT "FullName", "TeamName", "Q1",
       RANK() OVER (ORDER BY "Q1" ASC) AS Q1_Rank
FROM session_results_data_final;

--Find the slowest Q2 time and the driver who set it
SELECT "FullName", "TeamName", "Q2"
FROM session_results_data_final
ORDER BY "Q2" DESC
LIMIT 1;
