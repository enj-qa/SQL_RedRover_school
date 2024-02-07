--Show the contents of the table of performers (artists)
SELECT * FROM chinook.customer;

--Show the names of customers from the city of Paris
SELECT FirstName, LastName
FROM customer
WHERE City = 'Paris';

--Show sales for the year 2012, with a sales value of more than 4 dollars.
SELECT * 
FROM invoice
WHERE InvoiceDate LIKE '2012%'
AND Total > 4;

/*Show the date of the sale, the address of the sale, the city to which the sale was made and the purchase price of 16.86. 
Assign names to the columns InvoiceDate - Date_Sale, BillingAddress - Sale_Address, and BillingCity - Sale_City.*/
SELECT InvoiceDate AS Date_Sale, 
BillingAddress AS Sale_Address, 
BillingCity AS Sale_City, 
Total
FROM invoice
WHERE Total = 16.86;

--Show the names of company employees hired in 2004 who reside in the town of Lethbridge
SELECT LastName, FirstName 
FROM employee
WHERE HireDate LIKE '2004%'
AND City = 'Lethbridge';

--Show the Canadian cities to which sales were made in August 2009.
SELECT BillingCity
FROM invoice
WHERE BillingCountry = 'Canada'
AND InvoiceDate LIKE '2009-08%';

/*Show the Names of the employees hired in May. Solve in 2 ways:
using the like operator*/
SELECT LastName, FirstName
FROM employee
WHERE HireDate LIKE '%-05-%';

--using date formatting*.
SELECT LastName, FirstName
FROM employee
WHERE MONTH(HireDate) = 5; ;


/*Show the names of the employees who hold the positions of IT Staff and IT manager. Solve the problem in two ways: 
using the IN operator*/
SELECT LastName, FirstName
FROM employee
WHERE Title IN ('IT Manager', 'IT Staff');

--using logical operations
SELECT LastName, FirstName
FROM employee
WHERE Title = 'IT Manager' OR title = 'IT Staff';