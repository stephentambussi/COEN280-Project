/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 9: Show the average rent for properties managed by this Rental Management System. 
    You can take the average of all the properties that are rented out and those available for 
    rent in that town.
*/

SET VERIFY OFF

ACCEPT city CHAR FORMAT 'A20' PROMPT 'Enter City: '

PROMPT "Average Rent for all properties in &city"

COLUMN AverageRent FORMAT $99,999.99 JUSTIFY center HEADING 'Average Rent'

SELECT TO_CHAR(AVG(MonthlyRent), 'L9,999.99') AS AverageRent
FROM RentalProperty
WHERE RentalProperty.City = '&city';