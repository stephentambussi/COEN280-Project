/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 5: Show the number of properties available for rent by branch.
*/

SET VERIFY OFF

ACCEPT branchNum NUMBER FORMAT '9999' PROMPT 'Enter Branch Number: '

PROMPT "Number of Available Properties for Branch &branchNum"

SELECT COUNT(CASE WHEN Status = 'available' THEN 1 END) AS "Number of Available Properties"
FROM Branch
INNER JOIN Supervisor ON Branch.BranchNumber = Supervisor.BranchNumber
INNER JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
WHERE Branch.BranchNumber = &branchNum;