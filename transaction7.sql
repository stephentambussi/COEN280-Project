/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 7: Show a lease agreement for a renter (name or phone number is entered as input).
    NOTE: this script is simply for capturing the output for the spool file.
    The GUI implements the same functionality.
*/

SET VERIFY OFF

ACCEPT renterName CHAR FORMAT 'A20' PROMPT 'Enter your Name for the Lease: '
ACCEPT renterHomePhone NUMBER FORMAT '9999999999' PROMPT 'Enter your Home Phone Number: '

PROMPT "Lease(s) for &renterName"

COLUMN propertyNum FORMAT 9999 JUSTIFY CENTER HEADING 'Property Number'
COLUMN renterName FORMAT A20 JUSTIFY CENTER HEADING 'Name'
COLUMN homePhone FORMAT 9999999999 JUSTIFY CENTER HEADING 'Home Phone'
COLUMN workPhone FORMAT 9999999999 JUSTIFY CENTER HEADING 'Work Phone'
COLUMN startDate FORMAT A20 JUSTIFY CENTER HEADING 'Start Date'
COLUMN endDate FORMAT A20 JUSTIFY CENTER HEADING 'End Date'
COLUMN deposit FORMAT $9,999.99 JUSTIFY CENTER HEADING 'Deposit Amount'
COLUMN rent FORMAT $99,999.99 JUSTIFY CENTER HEADING 'Monthly Rent'

SELECT la.PropertyNumber AS propertyNum, la.RenterName AS renterName, la.RenterHomePhone AS homePhone, 
la.RenterWorkPhone AS workPhone, TO_CHAR(la.LeaseStart, 'DD-MON-YYYY') AS startDate, 
TO_CHAR(la.LeaseEnd, 'DD-MON-YYYY') AS endDate, la.DepositAmount AS deposit, rp.MonthlyRent AS rent
FROM LeaseAgreement la
LEFT JOIN RentalProperty rp ON la.PropertyNumber = rp.PropertyNumber
WHERE la.RenterName = '&renterName' AND la.RenterHomePhone = &renterHomePhone;