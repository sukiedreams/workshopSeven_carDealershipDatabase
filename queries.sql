-- USE cardealershipdatabase;
-- SELECT * FROM dealerships;

-- USE cardealershipdatabase;
-- SELECT v.*
-- FROM vehicles v
-- JOIN inventory i ON v.VIN = i.VIN
-- WHERE i.dealership_id = 1;

-- USE cardealershipdatabase;
-- SELECT * FROM vehicles
-- WHERE VIN = '12874';

-- USE cardealershipdatabase;
-- SELECT d.*
-- FROM dealerships d
-- JOIN  inventory i ON d.dealership_id = i.dealership_id
-- WHERE i.VIN = '12874';

-- USE cardealershipdatabase;
-- SELECT DISTINCT d.*
-- FROM dealerships d
-- JOIN inventory i ON d.dealership_id = i.dealership_id
-- JOIN vehicles v ON v.VIN = i.VIN
-- WHERE v.make = 'Honda' AND v.model = 'Civic' AND v.color = 'Blue';

USE cardealershipdatabase;
SELECT s.*
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN;
-- I dont know what wrong i tried to ask chatgpt for some pointers but im a bit confused.