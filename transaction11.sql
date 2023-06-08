/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 11: Show the money that is earned by the rental agency per month. This is calculated as 
    10% of the rent of the properties that are currently rented.
*/

SET VERIFY OFF

PROMPT "StrawberryField Rental Management Monthly Profits"

COLUMN MonthlyProfit FORMAT $99,999.99 JUSTIFY center HEADING 'Monthly Profit from Rented Properties'

SELECT TO_CHAR(SUM(MonthlyRent * 0.1), 'L9,999.99') AS MonthlyProfit
FROM RentalProperty
WHERE Status = 'unavailable';