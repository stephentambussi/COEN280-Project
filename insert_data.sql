/*  Stephen Tambussi & Dylan Hoover
    COEN280 - Spring 2023
    This script inserts data for testing.
*/

INSERT INTO Branch VALUES(1, 5556781821, '269 Washington St', 'Santa Clara', 95050);
INSERT INTO Branch VALUES(2, 5556661001, '98 Westmont Ave', 'Haddon Heights', 08050);
INSERT INTO Branch VALUES(3, 6071231051, '67 Ranger Road', 'Dallas', 75001);

-- Branch 1 Managers
INSERT INTO Manager VALUES(100, 'Dan', 8005002000, '19-AUG-10', 'Manager', 1);
INSERT INTO Manager VALUES(101, 'Dave', 8005002001, '19-AUG-13', 'Manager', 1);

-- Branch 2 Managers
INSERT INTO Manager VALUES(200, 'Jack', 8005002002, '19-FEB-15', 'Manager', 2);

-- Branch 3 Managers
INSERT INTO Manager VALUES(300, 'Alex', 8005002003, '19-JUL-10', 'Manager', 3);
INSERT INTO Manager VALUES(301, 'Will', 8005002004, '19-SEP-12', 'Manager', 3);

-- Branch 1 Supervisors & Staff
INSERT INTO Supervisor VALUES(110, 'Joe', 8005002005, '19-AUG-11', 'Supervisor', 1, 100);
INSERT INTO Supervisor VALUES(111, 'David', 8005002006, '19-JUN-11', 'Supervisor', 1, 100);
INSERT INTO Supervisor VALUES(112, 'Sarah', 8005002007, '19-JUN-17', 'Supervisor', 1, 101);
INSERT INTO Staff VALUES(113, 'Julia', 8005002007, '19-JUN-18', 'Staff', 1);

-- Branch 2 Supervisors & Staff
INSERT INTO Supervisor VALUES(210, 'Jeff', 8005002008, '20-JUN-20', 'Supervisor', 2, 200);
INSERT INTO Supervisor VALUES(211, 'Patrick', 8005002009, '19-JUN-21', 'Supervisor', 2, 200);

-- Branch 3 Supervisors & Staff
INSERT INTO Supervisor VALUES(310, 'Jim', 8005002010, '20-MAY-20', 'Supervisor', 3, 300);
INSERT INTO Supervisor VALUES(311, 'Patricia', 8005002011, '19-MAY-21', 'Supervisor', 3, 301);

INSERT INTO PropertyOwner VALUES('Bill', '101 Elm Street', 'Santa Clara', 95050, 8002005000);
INSERT INTO PropertyOwner VALUES('Tim', '333 Elk Ave', 'San Jose', 95055, 8002005001);
INSERT INTO PropertyOwner VALUES('Mac', '821 Mount Vernon', 'Haddon Heights', 08051, 8002005002);
INSERT INTO PropertyOwner VALUES('Eustace', '67 Star Ave', 'Dallas', 75001, 8002005003);
INSERT INTO PropertyOwner VALUES('Isabelle', '60 Texas Road', 'Austin', 75020, 8002005004);


-- Branch 1 Properties
INSERT INTO RentalProperty VALUES(1, '500 El Camino Real', 'Santa Clara', 95050,
                            2, 5000, 'available', '19-AUG-22', 110, 'Bill');
INSERT INTO RentalProperty VALUES(2, '505 El Camino Real', 'Santa Clara', 95050,
                            3, 5500, 'available', '10-MAY-23', 110, 'Bill');
INSERT INTO RentalProperty VALUES(3, '102 Lafayette', 'San Jose', 95030,
                            3, 4500, 'available', '10-JUN-23', 110, 'Tim');
INSERT INTO RentalProperty VALUES(4, '103 Lafayette', 'San Jose', 95030,
                            2, 3000, 'available', '10-JUL-23', 111, 'Tim');
INSERT INTO RentalProperty VALUES(5, '104 Lafayette', 'San Jose', 95030,
                            2, 3000, 'available', '11-JUL-23', 112, 'Tim');

-- Branch 2 Properties
INSERT INTO RentalProperty VALUES(6, '104 Mount Vernon', 'Haddon Heights', 08051,
                            5, 3000, 'available', '11-MAY-23', 210, 'Mac');
INSERT INTO RentalProperty VALUES(7, '108 Mount Vernon', 'Haddon Heights', 08051,
                            3, 2500, 'available', '14-MAY-23', 211, 'Mac');

-- Branch 3 Properties
INSERT INTO RentalProperty VALUES(8, '1 Ranger Road', 'Dallas', 75001,
                            3, 2500, 'available', '13-MAY-23', 310, 'Eustace');
INSERT INTO RentalProperty VALUES(9, '2 Ranger Road', 'Dallas', 75001,
                            4, 3200, 'available', '13-MAY-23', 310, 'Eustace');
INSERT INTO RentalProperty VALUES(10, '41 Texas Road', 'Austin', 75021,
                            4, 4100, 'available', '20-MAY-23', 311, 'Isabelle');

-- Lease Agreements
INSERT INTO LeaseAgreement VALUES(1, 'Steve', '20-SEP-21', '15-AUG-22', 8512987340, 2003004000, 500);
INSERT INTO LeaseAgreement VALUES(2, 'Steve', '20-SEP-22', '09-MAY-23', 8512987340, 2003004000, 600);
INSERT INTO LeaseAgreement VALUES(5, 'Kevin', '10-OCT-22', '10-JUL-23', 8512987350, 2003001000, 600);

INSERT INTO LeaseAgreement VALUES(6, 'Brandon', '29-SEP-22', '10-MAY-23', 8512987341, 2003005000, 600);

INSERT INTO LeaseAgreement VALUES(9, 'Dylan', '29-SEP-22', '12-MAY-23', 8512987342, 2003006000, 700);

-- CONSTRAINT/TRIGGER TESTING
-- INSERT INTO LeaseAgreement VALUES(3, 'FakeName', '10-JUN-23', '11-JUN-23', 0000000000, 0000000000, 100);
-- INSERT INTO RentalProperty VALUES(11, '33 Fake Road', 'Fake City', 11111,
--                             1, 1000, 'available', '10-JUN-23', 110, 'Isabelle');