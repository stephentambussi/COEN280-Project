/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 1: Generate a list of rental properties available for a specific branch (where the name of 
    the branch is entered as input).
*/

-- Clear everything
CLEAR SCREEN
CLEAR BREAKS 
CLEAR COLUMNS

ACCEPT branchNum NUMBER FORMAT '9999' PROMPT 'Enter Branch Number: '

-- the size of one page
SET PAGESIZE 30
-- the size of a line
SET LINESIZE 150

SET HEADING ON

COLUMN PropertyNumber FORMAT 9999 JUSTIFY center HEADING 'Property Number'
COLUMN Address FORMAT A30 JUSTIFY center HEADING 'Address' WORD_WRAP
COLUMN NumOfRooms Format 99 JUSTIFY center HEADING 'Number of Rooms'
COLUMN MonthlyRent FORMAT $99,999.99 JUSTIFY center HEADING 'Monthly Rent'
COLUMN DateAvailable FORMAT A14 JUSTIFY center HEADING 'Date Available'

TTITLE CENTER 'Available Properties at Branch ' &branchNum SKIP 2

BTITLE CENTER 'StrawberryField Rental Management Inc.'

SPOOL available_properties.txt

SELECT RentalProperty.PropertyNumber, 
    RentalProperty.Street || ', ' || RentalProperty.City || ', ' || RentalProperty.ZipCode AS Address, 
    RentalProperty.NumOfRooms, RentalProperty.MonthlyRent, 
    TO_CHAR(RentalProperty.DateAvailable, 'DD-MON-YYYY') AS DateAvailable
FROM Branch
INNER JOIN Supervisor ON Branch.BranchNumber = Supervisor.BranchNumber
INNER JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
WHERE Branch.BranchNumber = &branchNum and RentalProperty.Status = 'available';

SET TERMOUT OFF
SET TRIMSPOOL ON
SET VERIFY OFF

SPOOL OFF