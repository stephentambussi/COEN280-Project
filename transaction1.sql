/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 1: Generate a list of rental properties available for a specific branch (where the name of 
    the branch is entered as input).
*/

ACCEPT branchNum NUMBER FORMAT '9999' PROMPT 'Enter Branch Number: '

SELECT RentalProperty.PropertyNumber, 
    RentalProperty.Street || ', ' || RentalProperty.City || ', ' || RentalProperty.ZipCode AS Address, 
    RentalProperty.NumOfRooms, RentalProperty.MonthlyRent, 
    TO_CHAR(RentalProperty.DateAvailable, 'DD-MON-YYYY') AS DateAvailable
FROM Branch
INNER JOIN Supervisor ON Branch.BranchNumber = Supervisor.BranchNumber
INNER JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
WHERE Branch.BranchNumber = &branchNum and RentalProperty.Status = 'available';
