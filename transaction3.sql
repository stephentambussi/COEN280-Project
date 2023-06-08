/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 3: Generate a list of rental properties by a specific owner 
    (where the owner's name and phone number are entered as input), listed in 
    a StrawberryField branch (the branch name is input).
*/

SET VERIFY OFF

ACCEPT ownerName CHAR FORMAT 'A20' PROMPT 'Enter Property Owner''s Name: '
ACCEPT ownerPhone NUMBER FORMAT '9999999999' PROMPT 'Enter Property Owner''s Phone Number: '
ACCEPT branchNum NUMBER FORMAT '9999' PROMPT 'Enter Branch Number: '

PROMPT "Rental Properties owned by &ownerName in Branch &branchNum"

SELECT RentalProperty.PropertyNumber AS "Property Number", 
RentalProperty.Street || ', ' || RentalProperty.City || ', ' || RentalProperty.ZipCode AS "Address",
RentalProperty.NumOfRooms AS "Number of Rooms", TO_CHAR(RentalProperty.MonthlyRent, 'L9,999.99') AS "Monthly Rent", 
RentalProperty.Status AS "Availability Status", TO_CHAR(RentalProperty.DateAvailable, 'DD-MON-YYYY') AS "Date Available"
FROM Branch
INNER JOIN Supervisor ON Branch.BranchNumber = Supervisor.BranchNumber
INNER JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
INNER JOIN PropertyOwner ON RentalProperty.OwnerName = PropertyOwner.OwnerName
WHERE Branch.BranchNumber = &branchNum AND PropertyOwner.OwnerName = '&ownerName' AND PropertyOwner.PhoneNumber = &ownerPhone;