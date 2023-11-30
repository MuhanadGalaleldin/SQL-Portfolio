
-- Selecting UK's Companies

SELECT Company, [Global Rank], [Sales ($billion)], [Profits ($billion)]
from Top_Companies
WHERE Country = 'UK'

-- The Total Sales (UK Companies) Globally--
SELECT SUM([Sales ($billion)])
FROM Top_Companies
WHERE Country = 'UK'
SELECT * FROM dbo.Top_Companies
SELECT SUM([Profits ($billion)]) as UK_Profits
FROM Top_Companies
WHERE Country = 'UK'

-- The Percentage Of UK Coumpanies Profits Globally--
SELECT SUM([Profits ($billion)]) as UK_Profits, 
       SUM([Profits ($billion)]) / (SELECT SUM([Profits ($billion)]) FROM Top_Companies) * 100 as Percentage_UK_Profits
FROM Top_Companies
WHERE Country = 'UK';

-- The Total Profits In Europe--
SELECT SUM([Profits ($billion)]) AS Europe_Profits
FROM Top_Companies
WHERE Continent = 'EUROPE'

-- Selecting The Percentage OF Profits Of UK Companies In The Continent--
SELECT SUM([Profits ($billion)]) as UK_Profits,
  (SUM([Profits ($billion)]) / (SELECT SUM([Profits ($billion)]) FROM Top_Companies WHERE Continent = 'Europe')) * 100 as Percentage_UK_Profits
FROM Top_Companies
WHERE Country = 'UK';

--Top 100 UK Companies--
SELECT TOP 100 *
FROM Top_Companies
WHERE Country = 'UK'

-- Total Sales And Total Profits (UK Companies)--
SELECT Country, SUM([Sales ($billion)]) AS Total_Sales, SUM([Profits ($billion)]) AS Total_Profits
FROM Top_Companies
WHERE Country = 'UK'
GROUP BY Country;

--Rank UK companies based on sales or profits--
SELECT Company, [Global Rank], [Sales ($billion)], [Profits ($billion)]
FROM Top_Companies
WHERE Country = 'UK'
ORDER BY [Sales ($billion)] DESC;
-- the distribution of UK companies by continent--
SELECT Continent, COUNT(*) AS Number_of_Companies
FROM Top_Companies
WHERE Country = 'UK'
GROUP BY Continent;
--Compare the performance of UK companies with those in other countries or continents.--

SELECT Country, AVG([Sales ($billion)]) AS Avg_Sales
FROM Top_Companies
GROUP BY Country
ORDER BY Avg_Sales DESC;














