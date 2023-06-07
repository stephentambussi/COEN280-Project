from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
from datetime import datetime
import oracledb

app = Flask(__name__)
CORS(app)

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

print(oracledb.is_thin_mode())

# Show Properties Available
@app.route('/properties-available', methods=['GET'])
# @cross_origin(supports_credentials=True)
def show_properties_available():
    with oracledb.connect(**db_config) as connection:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM RentalProperty WHERE Status = 'available'")
        properties_available = []
        for row in cursor:
            property_data = {
                "PropertyNumber": row[0],
                "Street": row[1],
                "City": row[2],
                "ZipCode": row[3],
                "NumOfRooms": row[4],
                "MonthlyRent": row[5],
                "Status": row[6],
                "DateAvailable": row[7].strftime("%Y-%m-%d")
            }
            properties_available.append(property_data)
        return jsonify(properties_available)

# Create Lease Agreement
@app.route('/create-lease-agreement', methods=['POST'])
def create_lease_agreement():
    if request.method =='POST':
        print("POST", request.json)
    data = request.json
    with oracledb.connect(**db_config) as connection:
        cursor = connection.cursor()
        try:
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
            connection.commit()
            return jsonify(showLeaseInfo(data["propertyNumber"], data["renterName"]))
        except oracledb.DatabaseError as e:
            error = str(e)
            return jsonify(success=False, error=error)

# Show Lease Agreement
@app.route('/show-lease-agreement', methods=['POST'])
def show_lease_agreement():
    if request.method =='POST':
        print("POST", request.json)
    data = request.json

    with oracledb.connect(**db_config) as connection:
        cursor = connection.cursor()
        cursor.execute("""
            SELECT * FROM LeaseAgreement WHERE PropertyNumber = :propertyNumber AND RenterName = :renterName
        """, {
            "propertyNumber": data["showPropertyNumber"],
            "renterName": data["showRenterName"]
        })
        row = cursor.fetchone()

    if row:
        lease_agreement = {
            "PropertyNumber": row[0],
            "RenterName": row[1],
            "LeaseStart": row[2].strftime("%Y-%m-%d"),
            "LeaseEnd": row[3].strftime("%Y-%m-%d"),
            "RenterHomePhone": row[4],
            "RenterWorkPhone": row[5],
            "DepositAmount": row[6]
        }
        return jsonify(lease_agreement)
    else:
        return jsonify(success=False, error="Lease agreement not found.")
    
def showLeaseInfo(propertyId, renterName):
    with oracledb.connect(**db_config) as connection:
        cursor = connection.cursor()
        cursor.execute("""
            SELECT * FROM LeaseAgreement WHERE PropertyNumber = :propertyNumber AND RenterName = :renterName
        """, {
            "propertyNumber": propertyId,
            "renterName": renterName
        })
        row = cursor.fetchone()

    if row:
        lease_agreement = {
            "PropertyNumber": row[0],
            "RenterName": row[1],
            "LeaseStart": row[2].strftime("%Y-%m-%d"),
            "LeaseEnd": row[3].strftime("%Y-%m-%d"),
            "RenterHomePhone": row[4],
            "RenterWorkPhone": row[5],
            "DepositAmount": row[6]
        }
        return lease_agreement
    else:
        return None

if __name__ == '__main__':
    app.run(host="localhost", port=8000)