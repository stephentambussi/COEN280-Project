/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 11: Show the money that is earned by the rental agency per month. This is calculated as 
    10% of the rent of the properties that are currently rented.
*/

SELECT SUM(MonthlyRent * 0.1) AS MonthlyEarnings
FROM RentalProperty
WHERE Status = 'unavailable';