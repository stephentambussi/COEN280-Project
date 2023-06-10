/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 9: Show the average rent for properties managed by this Rental Management System. 
    You can take the average of all the properties that are rented out and those available for 
    rent in that town.
*/

SET VERIFY OFF

PROMPT "Average Rent for all properties in each City"

COLUMN PropertyCity FORMAT A20 JUSTIFY CENTER HEADING 'City'
COLUMN AverageRent FORMAT $99,999.99 JUSTIFY CENTER HEADING 'Average Rent'

SELECT City AS PropertyCity, TO_CHAR(AVG(MonthlyRent), 'L9,999.99') AS AverageRent
FROM RentalProperty
GROUP BY City;

PROMPT "Average Rent across every City"

SELECT TO_CHAR(AVG(MonthlyRent), 'L9,999.99') AS AverageRent
FROM RentalProperty;