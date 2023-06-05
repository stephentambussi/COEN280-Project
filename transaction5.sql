/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 5: Show the number of properties available for rent by branch.
*/

ACCEPT branchNum NUMBER FORMAT '9999' PROMPT 'Enter Branch Number: '

SELECT COUNT(CASE WHEN Status = 'available' THEN 1 END) AS AvailableProperties
FROM Branch
INNER JOIN Supervisor ON Branch.BranchNumber = Supervisor.BranchNumber
INNER JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
WHERE Branch.BranchNumber = &branchNum;