/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 2: Generate a list of managers and for each manager, 
    a list of supervisors under the manager and supervisors and the 
    properties (with addresses) the supervisors supervise.
*/

SET VERIFY OFF

PROMPT "List of Managers, Supervisors, and Properties"

SELECT Manager.EmpName AS "Manager Name", Supervisor.EmpName AS "Supervisor Name", RentalProperty.PropertyNumber AS "Property Number", 
RentalProperty.Street || ', ' || RentalProperty.City || ', ' || RentalProperty.ZipCode AS "Address"
FROM Manager
LEFT JOIN Supervisor ON Manager.EmployeeID = Supervisor.ManagerID
LEFT JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
ORDER BY Manager.EmpName, Supervisor.EmpName;
