/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 2: Generate a list of managers and for each manager, 
    a list of supervisors under the manager and supervisors and the 
    properties (with addresses) the supervisors supervise.
*/

SELECT Manager.EmpName AS ManagerName, Supervisor.EmpName AS SupervisorName, RentalProperty.PropertyNumber, RentalProperty.Street, RentalProperty.City, RentalProperty.ZipCode
FROM Manager
LEFT JOIN Supervisor ON Manager.EmployeeID = Supervisor.ManagerID
LEFT JOIN RentalProperty ON Supervisor.EmployeeID = RentalProperty.SupervisorID
ORDER BY ManagerName, SupervisorName;
