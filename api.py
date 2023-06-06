from flask import Flask, request, jsonify
import oracledb

app = Flask(__name__)

# Database configuration
db_config = {
    "user": "your_username",
    "password": "your_password",
    "dsn": "localhost:1521/ORCL"
}

# Show Properties Available
@app.route('/properties-available', methods=['GET'])
def show_properties_available():
    with oracledb.connect(**db_config) as connection:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM RentalProperty WHERE Status = 'Available'")
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
    data = request.json

    with oracledb.connect(**db_config) as connection:
        cursor = connection.cursor()
        try:
            cursor.execute("""
                INSERT INTO LeaseAgreement 
                (PropertyNumber, RenterName, LeaseStart, LeaseEnd, RenterHomePhone, RenterWorkPhone, DepositAmount)
                VALUES (:propertyNumber, :renterName, :leaseStart, :leaseEnd, :renterHomePhone, :renterWorkPhone, :depositAmount)
            """, {
                "propertyNumber": data["propertyNumber"],
                "renterName": data["renterName"],
                "leaseStart": data["leaseStart"],
                "leaseEnd": data["leaseEnd"],
                "renterHomePhone": data["renterHomePhone"],
                "renterWorkPhone": data["renterWorkPhone"],
                "depositAmount": data["depositAmount"]
            })
            cursor.commit()
            return jsonify(success=True)
        except oracledb.DatabaseError as e:
            error = str(e)
            return jsonify(success=False, error=error)

# Show Lease Agreement
@app.route('/show-lease-agreement', methods=['POST'])
def show_lease_agreement():
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

if __name__ == '__main__':
    app.run()
