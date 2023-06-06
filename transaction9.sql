/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 9: Show the average rent for properties managed by this Rental Management System. 
    You can take the average of all the properties that are rented out and those available for 
    rent in that town.
*/

ACCEPT city CHAR FORMAT 'A20' PROMPT 'Enter City: '

SELECT AVG(MonthlyRent) AS AverageRent
FROM RentalProperty
WHERE RentalProperty.City = '&city';