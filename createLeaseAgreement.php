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
// Collect the necessary lease agreement details from the form
$propertyNumber = $_POST['propertyNumber'];
$renterName = $_POST['renterName'];
$leaseStart = $_POST['leaseStart'];
$leaseEnd = $_POST['leaseEnd'];
$renterHomePhone = $_POST['renterHomePhone'];
$renterWorkPhone = $_POST['renterWorkPhone'];
$depositAmount = $_POST['depositAmount'];

// Insert the lease agreement details into the database
$sql = "INSERT INTO LeaseAgreement (PropertyNumber, RenterName, LeaseStart, LeaseEnd, RenterHomePhone, RenterWorkPhone, DepositAmount)
        VALUES ('$propertyNumber', '$renterName', '$leaseStart', '$leaseEnd', '$renterHomePhone', '$renterWorkPhone', '$depositAmount')";

if (mysqli_query($conn, $sql)) {
    // Set the response header to indicate JSON content
    header('Content-Type: application/json');

    // Return a JSON response indicating successful creation
    echo json_encode(array('message' => 'Lease agreement created successfully.'));
} else {
    // Set the response header to indicate JSON content
    header('Content-Type: application/json');

    // Return a JSON response indicating the error
    echo json_encode(array('message' => 'Error creating lease agreement: ' . mysqli_error($conn)));
}

// Close the database connection
mysqli_close($conn);
?>
