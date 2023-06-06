/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 10: Show the names and addresses of properties whose leases will expire in the next two 
    months (from the current date).
*/

SELECT p.PropertyNumber, p.Street || ', ' || p.City || ', ' || p.ZipCode AS Address,
       l.RenterName,
       TO_CHAR(l.LeaseEnd, 'DD-MON-YYYY') AS LeaseEnd
FROM LeaseAgreement l
JOIN RentalProperty p ON l.PropertyNumber = p.PropertyNumber
WHERE MONTHS_BETWEEN(SYSDATE, l.LeaseEnd) <= 2 and MONTHS_BETWEEN(l.LeaseEnd, SYSDATE) >= 0;