<?php
// Assuming you have established a database connection
$host = 'your_host';
$username = 'your_username';
$password = 'your_password';
$database = 'your_database';

// Create a database connection
$conn = mysqli_connect($host, $username, $password, $database);

// Check if the connection was successful
if (!$conn) {
    die('Database connection failed: ' . mysqli_connect_error());
}
// Query to retrieve available properties
$sql = "SELECT * FROM RentalProperty WHERE Status = 'available'";
$result = mysqli_query($conn, $sql);

// Check if any properties are available
if (mysqli_num_rows($result) > 0) {
    // Create an empty array to store the properties
    $properties = array();

    // Fetch and add each property to the array
    while ($row = mysqli_fetch_assoc($result)) {
        $property = array(
            'PropertyNumber' => $row['PropertyNumber'],
            'Street' => $row['Street'],
            'City' => $row['City'],
            'ZipCode' => $row['ZipCode'],
            'NumOfRooms' => $row['NumOfRooms'],
            'MonthlyRent' => $row['MonthlyRent']
        );

        $properties[] = $property;
    }

    // Set the response header to indicate JSON content
    header('Content-Type: application/json');

    // Return the JSON data
    echo json_encode($properties);
} else {
    // Set the response header to indicate JSON content
    header('Content-Type: application/json');

    // Return a JSON response indicating no properties available
    echo json_encode(array('message' => 'No properties are currently available.'));
}

// Close the database connection
mysqli_close($conn);
?>
