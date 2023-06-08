/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 1: Generate a list of rental properties available for a specific branch (where the name of 
    the branch is entered as input).
*/

SET VERIFY OFF

ACCEPT branchNum NUMBER FORMAT '9999' PROMPT 'Enter Branch Number: '

PROMPT "List of Available Properties for Branch &branchNum"

SELECT RentalProperty.PropertyNumber AS "Property Number", 
    RentalProperty.Street || ', ' || RentalProperty.City || ', ' || RentalProperty.ZipCode AS "Address", 
    RentalProperty.NumOfRooms AS "Number of Rooms", TO_CHAR(RentalProperty.MonthlyRent, 'L9,999.99') AS "Monthly Rent", 
    TO_CHAR(RentalProperty.DateAvailable, 'DD-MON-YYYY') AS "Date Available"
FROM Branch
INNER JOIN Supervisor ON Branch.BranchNumber = Supervisor.BranchNumber
INNER JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
WHERE Branch.BranchNumber = &branchNum and RentalProperty.Status = 'available';
