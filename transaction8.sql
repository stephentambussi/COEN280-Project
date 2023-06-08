/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 8: Show the renters who rented more than one rental property.
*/

SET VERIFY OFF

PROMPT "List of Renters who have rented more than one property"

SELECT RenterName AS "Renter's Name"
FROM LeaseAgreement
GROUP BY RenterName
HAVING COUNT(DISTINCT PropertyNumber) > 1;