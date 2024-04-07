CREATE USER rentaluser WITH PASSWORD 'rentalpassword';
GRANT SELECT ON customer TO rentaluser;
SELECT * FROM customer;

CREATE GROUP rental;
GRANT rental TO rentaluser;

GRANT INSERT, UPDATE ON rental TO rental;
INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id) 
VALUES (777, '2006-05-25 00:54:33.000 +0500', 777, 777, '2006-05-28 21:40:33.000 +0500', 2);
UPDATE rental 
SET staff_id = 2;
WHERE rental.rental_id ='77';
REVOKE INSERT ON rental FROM rental;
INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id) 
VALUES (777, '2006-05-25 00:54:33.000 +0500', 777, 777, '2006-05-28 21:40:33.000 +0500', 2);

CREATE ROLE client_jane_bennet;
GRANT SELECT ON rental_info TO client_jane_bennet;
GRANT SELECT ON payment_info TO client_jane_bennet;

CREATE VIEW rental_info AS
SELECT *
FROM rental
WHERE rental.customer_id = '77' AND rental.customer_id IS NOT NULL; 

CREATE VIEW payment_info AS
SELECT *
FROM payment
WHERE customer_id = '77' AND payment.customer_id IS NOT NULL;