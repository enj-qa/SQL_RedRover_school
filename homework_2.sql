-- Showing clients with the name Frank.
SELECT * 
FROM customer
WHERE FirstName = 'Frank';

-- Show the last and first names of clients who have the first name Mark.
SELECT FirstName, LastName
FROM customer
WHERE FirstName = 'Mark';

-- Show the name and size of the tracks in Megabytes, rounded to 2 digits and sorted in descending order. Name the column MB.
SELECT Name, ROUND(Bytes / 1000000, 2) AS MB
FROM Track
ORDER BY ROUND(Bytes, 2) DESC;

-- Show the age of employees, at the time of onboarding. Display last name, first name, age. date of hire and birthday. Name the column age.
SELECT LastName, FirstName, BirthDate, HireDate,  
TRUNCATE((datediff(HireDate, BirthDate) / 365), 0) 
AS age 
FROM employee;

-- Show American buyers without a fax machine.
SELECT *
FROM customer
WHERE Fax IS NULL;

-- Show customer email addresses from the gmail.com domain.
SELECT Email
FROM customer
WHERE Email LIKE '%@gmail.com%'

-- Show in alphabetical order all the unique positions in the company.
SELECT DISTINCT(Title)
FROM employee
ORDER BY Title ASC;

-- Show the title of the shortest song.
SELECT name
FROM track
ORDER BY Milliseconds ASC
LIMIT 1;

-- Show the title and duration in seconds of the shortest song. Name the column sec.
SELECT name, (Milliseconds / 1000) AS sec
FROM track
ORDER BY Milliseconds ASC
LIMIT 1;

-- Show the average age of employees working in the company
SELECT TRUNCATE(AVG(datediff(NOW(), BirthDate) / 365), 0 ) 
AS avg_age
FROM employee

-- Write a query that determines the number of tracks where the playlist ID > 15
SELECT p.PlaylistId AS condit,
COUNT(t.TrackId) AS RESULT
FROM track t
JOIN playlisttrack pt
ON t.TrackId = pt.TrackId
JOIN playlist p
ON  pt.PlaylistId = p.PlaylistId
GROUP BY p.PlaylistId
HAVING p.PlaylistId > 15
ORDER BY p.PlaylistId ASC;

-- Find all invoice IDs where the number of items is greater than or equal to 6 and less than or equal to 9
SELECT i.InvoiceId
FROM invoice i
JOIN invoiceline il
ON i.InvoiceId = il.InvoiceId
GROUP BY i.InvoiceId
HAVING COUNT(il.TrackId) BETWEEN 6 AND 9;