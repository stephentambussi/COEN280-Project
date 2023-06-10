/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    Transaction 6: Create a lease agreement (See section 1.1). The information to be 
    entered into this agreement can be input via a Graphical User interface (See section 2.1)
    or from the command line.
    NOTE: this script is simply for capturing the output for the spool file.
    The GUI implements the same functionality.
*/

SET VERIFY OFF

ACCEPT propertyNumber NUMBER FORMAT '9999' PROMPT 'Enter Property Number for Lease: '
ACCEPT renterName CHAR FORMAT 'A20' PROMPT 'Enter your Name for the Lease: '
ACCEPT leaseStart DATE FORMAT 'DD-MON-YY' PROMPT 'Enter Start Date for Lease: '
ACCEPT leaseEnd DATE FORMAT 'DD-MON-YY' PROMPT 'Enter End Date for Lease: '
ACCEPT renterHomePhone NUMBER FORMAT '9999999999' PROMPT 'Enter your Home Phone Number: '
ACCEPT renterWorkPhone NUMBER FORMAT '9999999999' PROMPT 'Enter your Work Phone Number: '
ACCEPT depositAmount NUMBER FORMAT '9999' PROMPT 'Enter the Deposit Amount for the Lease: '

INSERT INTO LeaseAgreement VALUES(&propertyNumber, '&renterName', '&leaseStart', '&leaseEnd', &renterHomePhone,
&renterWorkPhone, &depositAmount);

PROMPT "Lease Agreement Successfully Created"