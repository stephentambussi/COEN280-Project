/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 8: Show the renters who rented more than one rental property.
*/

SELECT RenterName
FROM LeaseAgreement
GROUP BY RenterName
HAVING COUNT(DISTINCT PropertyNumber) > 1;