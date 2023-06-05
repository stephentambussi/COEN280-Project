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
// Collect the lease agreement details (property number and renter name) from the form
$propertyNumber = $_POST['propertyNumber'];
$renterName = $_POST['renterName'];

// Query to retrieve the lease agreement details
$sql = "SELECT * FROM LeaseAgreement WHERE PropertyNumber = '$propertyNumber' AND RenterName = '$renterName'";
$result = mysqli_query($conn, $sql);

// Check if a lease agreement exists
if (mysqli_num_rows($result) > 0) {
    // Fetch the lease agreement details
    $row = mysqli_fetch_assoc($result);

    // Set the response header to indicate JSON content
    header('Content-Type: application/json');

    // Return the JSON data
    echo json_encode($row);
} else {
    // Set the response header to indicate JSON content
    header('Content-Type: application/json');

    // Return a JSON response indicating lease agreement not found
    echo json_encode(array('message' => 'Lease agreement not found.'));
}

// Close the database connection
mysqli_close($conn);
?>
