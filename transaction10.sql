/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 10: Show the names and addresses of properties whose leases will expire in the next two 
    months (from the current date).
*/

SET VERIFY OFF

PROMPT "List of Leases expiring in the next two months from today"

COLUMN TODAY NEW_VALUE report_date
SELECT TO_CHAR(SYSDATE, 'fmMonth DD, YYYY') AS "Today's Date"
FROM DUAL;

SELECT p.PropertyNumber AS "Property Number", p.Street || ', ' || p.City || ', ' || p.ZipCode AS "Address",
       l.RenterName AS "Renter's Name",
       TO_CHAR(l.LeaseEnd, 'DD-MON-YYYY') AS "Lease End Date"
FROM LeaseAgreement l
JOIN RentalProperty p ON l.PropertyNumber = p.PropertyNumber
WHERE MONTHS_BETWEEN(SYSDATE, l.LeaseEnd) <= 2 and MONTHS_BETWEEN(l.LeaseEnd, SYSDATE) >= 0;