/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 5: Show the number of properties available for rent by branch.
*/

SET VERIFY OFF

PROMPT "Number of Available Properties for each Branch"

SELECT b.BranchNumber AS "Branch Number", b.City AS "Branch City",
COUNT(CASE WHEN rp.Status = 'available' THEN 1 END) AS "Number of Available Properties"
FROM Branch b
LEFT JOIN Supervisor s ON b.BranchNumber = s.BranchNumber
LEFT JOIN RentalProperty rp ON s.EmployeeID = rp.SupervisorID
GROUP BY b.BranchNumber, b.City;