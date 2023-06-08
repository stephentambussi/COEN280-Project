/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 4: Show a listing of properties available, where the properties 
    should satisfy the criteria (city, no of rooms and/or range for rent given as input).
*/

SET VERIFY OFF

ACCEPT city CHAR FORMAT 'A20' PROMPT 'Enter City: '
ACCEPT numOfRooms NUMBER FORMAT '99' PROMPT 'Enter Number of Rooms: '
ACCEPT lowRent NUMBER FORMAT '99999' PROMPT 'Enter minimum of Rent: '
ACCEPT highRent NUMBER FORMAT '99999' PROMPT 'Enter maximum of Rent: '

PROMPT "Available Properties in &city with &numOfRooms Rooms and Rent Range: $&lowRent-$&highRent"

SELECT PropertyNumber AS "Property Number", 
Street || ', ' || City || ', ' || ZipCode AS "Address", 
NumOfRooms AS "Number of Rooms", TO_CHAR(MonthlyRent, 'L9,999.99') AS "Monthly Rent", 
TO_CHAR(DateAvailable, 'DD-MON-YYYY') AS "Date Available", SupervisorID AS "Supervisor ID", 
OwnerName AS "Owner's Name"
FROM RentalProperty
WHERE RentalProperty.City = '&city' AND RentalProperty.NumOfRooms = &numOfRooms 
AND RentalProperty.MonthlyRent >= &lowRent AND RentalProperty.MonthlyRent <= &highRent
AND RentalProperty.Status = 'available';