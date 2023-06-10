/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    This script runs all the transaction scripts to generate the spool file.
*/

SPOOL project_output.txt

PROMPT "Start of Output File"
/

SET ECHO ON

@create_relations.sql
/

@insert_data.sql
/

@transaction1.sql
/

@transaction2.sql
/

@transaction3.sql
/

@transaction4.sql
/

@transaction5.sql
/

@transaction6.sql
/

@transaction7.sql
/

@transaction8.sql
/

@transaction9.sql
/

@transaction10.sql
/

@transaction11.sql
/

SET ECHO OFF

PROMPT "End of Output File"
/

SPOOL off