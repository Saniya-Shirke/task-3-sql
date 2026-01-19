-- ORDER BY
SELECT * 
FROM Invoice 
ORDER BY Total DESC;

-- GROUP BY + SUM
SELECT BillingCountry, SUM(Total) AS Total_Sales
FROM Invoice
GROUP BY BillingCountry;

-- GROUP BY + COUNT
SELECT Country, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY Country;

-- HAVING
SELECT BillingCountry, SUM(Total) AS Total_Sales
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 5;

-- JOIN (Top 5 customers by total spend)
SELECT 
    c.CustomerId,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    SUM(i.Total) AS Total_Spend
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, Customer_Name
ORDER BY Total_Spend DESC
LIMIT 5;
