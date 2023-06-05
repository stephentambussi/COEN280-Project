/*  Stephen Tambussi
    COEN280 - Spring 2023
    Transaction 4: Show a listing of properties available, where the properties 
    should satisfy the criteria (city, no of rooms and/or range for rent given as input).
*/

ACCEPT city CHAR FORMAT 'A20' PROMPT 'Enter City: '
ACCEPT numOfRooms NUMBER FORMAT '99' PROMPT 'Enter Number of Rooms: '
ACCEPT lowRent NUMBER FORMAT '99999' PROMPT 'Enter minimum of Rent: '
ACCEPT highRent NUMBER FORMAT '99999' PROMPT 'Enter maximum of Rent: '

SELECT PropertyNumber, Street, City, ZipCode, NumOfRooms, MonthlyRent, DateAvailable, SupervisorID, OwnerName
FROM RentalProperty
WHERE RentalProperty.City = '&city' AND RentalProperty.NumOfRooms = &numOfRooms 
AND RentalProperty.MonthlyRent >= &lowRent AND RentalProperty.MonthlyRent <= &highRent
AND RentalProperty.Status = 'available';