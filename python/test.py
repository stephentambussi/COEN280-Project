from datetime import datetime
import oracledb


#an oracle instant client is needed to connect to the database and run in thick mode
oracledb.init_oracle_client(lib_dir=r"C:\oracle\instantclient_19_19", config_dir=None, error_url=None, driver_name=None)

# Database configuration
db_config = {
    "user": "c##dylan",
    "password": "novation",
    "dsn": "10.0.0.87:1523/XE"
}

con = oracledb.connect(**db_config)

cursor = con.cursor()

data = {
    "propertyNumber": 1,
    "renterName": "joe",
    "leaseStart": "2023-01-01",
    "leaseEnd": "2023-10-01",
    "renterHomePhone": 1,
    "renterWorkPhone": 1,
    "depositAmount": 1
}

cursor.execute("""
            INSERT INTO LeaseAgreement 
            (PropertyNumber, RenterName, LeaseStart, LeaseEnd, RenterHomePhone, RenterWorkPhone, DepositAmount)
            VALUES (:propertyNumber, :renterName, :leaseStart, :leaseEnd, :renterHomePhone, :renterWorkPhone, :depositAmount)
        """, {
            "propertyNumber": int(data["propertyNumber"]),
            "renterName": data["renterName"],
            "leaseStart": datetime.strptime(data["leaseStart"], "%Y-%m-%d"),
            # "leaseStart": data["leaseStart"],
            "leaseEnd": datetime.strptime(data["leaseEnd"], "%Y-%m-%d"),
            # "leaseEnd": data["leaseEnd"],
            "renterHomePhone": int(data["renterHomePhone"]),
            "renterWorkPhone": int(data["renterWorkPhone"]),
            "depositAmount": int(data["depositAmount"])
        })
con.commit()