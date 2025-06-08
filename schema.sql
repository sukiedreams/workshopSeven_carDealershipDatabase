# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealershipDatabase                           #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS cardealershipdatabase;

CREATE DATABASE IF NOT EXISTS cardealershipdatabase;

USE cardealershipdatabase;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "dealerships"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE dealerships (
	dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12));
 
# ---------------------------------------------------------------------- #
# Add table "vehicles"                                                   #
# ---------------------------------------------------------------------- #
    
    CREATE TABLE vehicles (
		VIN VARCHAR(17) PRIMARY KEY,
        make VARCHAR(30),
        model VARCHAR(30),
        color VARCHAR(20),
        year INT,
        price DECIMAL(10,2),
        SOLD BOOLEAN);
        
# ---------------------------------------------------------------------- #
# Add table "inventory"                                                  #
# ---------------------------------------------------------------------- #        
        
	CREATE TABLE inventory (
        dealership_id INT,
        VIN VARCHAR(17),
        FOREIGN KEY ( dealership_id) REFERENCES dealerships(dealership_id),
        FOREIGN KEY (VIN) REFERENCES vehicles(VIN));
            
# ---------------------------------------------------------------------- #
# Add table "salescontracts"                                             #
# ---------------------------------------------------------------------- #

	CREATE TABLE sales_contracts (
		contract_id INT AUTO_INCREMENT PRIMARY KEY,
        VIN VARCHAR(17),
        sale_date DATE,
        buyer_name VARCHAR(50),
        sale_price DECIMAL(10,2),
        FOREIGN KEY (VIN) REFERENCES vehicles(VIN));
        
# ---------------------------------------------------------------------- #
# Add table "leasecontracts"                                             #
# ---------------------------------------------------------------------- #

	CREATE TABLE lease_contracts (
		lease_id INT AUTO_INCREMENT PRIMARY KEY,
        VIN VARCHAR(17),
        lease_start DATE,
        lease_end DATE,
        monthly_payment DECIMAL(10,2),
        FOREIGN KEY (VIN) REFERENCES vehicles(VIN));
        

INSERT INTO dealerships (name, address, phone) VALUES 
('Sukies Auto', '123 main st', '555-123-4567'), 
('Kens Motors', '456 Center Blvd', '555-987-6543');

INSERT INTO vehicles (VIN, make, model, color, year, price, SOLD) VALUES 
('10112', 'Ford', 'Explorer', 'red', 1993, 995.00, FALSE),
('56233', 'Honda', 'Civic', 'Blue', 2015, 8500.00, TRUE),
('12874','Mazda', 'CX-5', 'White', 2011, 8495.00, FALSE),
('13985', 'BMW', '328i', 'Black', 2008, 7495.00, TRUE);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '10112'),
(1, '56233'),
(2, '12874'),
(2, '13985'); 

INSERT INTO sales_contracts (VIN, sale_date, buyer_name, sale_price) VALUES
('13985', '2025-06-07', 'Alice Jade', 7495.00);

INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment) VALUES
('12874', '2025-02-20', '2027-05-20', 312.29);