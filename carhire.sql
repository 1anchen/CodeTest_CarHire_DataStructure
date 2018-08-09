DROP TABLE reservation;
DROP TABLE car_dealer;
DROP TABLE car_repair;;
DROP TABLE car;
DROP TABLE location;
DROP TABLE customer;
DROP TABLE rental_payment;
DROP TABLE staff;

CREATE TABLE staff(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE rental_payment(
  id SERIAL4 PRIMARY KEY,
  fee INT4,
  deposit INT4,
  charge INT4
);

CREATE TABLE customer(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  driver_license_no INT4,
  email VARCHAR(255),
  mobile INT4,
  payment INT4
);

CREATE TABLE location(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  capacity INT4
);

CREATE TABLE car(
  id SERIAL4 PRIMARY KEY,
  brand VARCHAR(255),
  type VARCHAR(255),
  availbility BOOLEAN,
  description VARCHAR(255),
  condition_before_hire VARCHAR(255),
  condition_after_hire VARCHAR(255),
  accessorise VARCHAR(255)
);

CREATE TABLE car_repair(
  id SERIAL4 PRIMARY KEY,
  car_id INT4 REFERENCES car(id) ON DELETE CASCADE,
  repair_time TIME
);

CREATE TABLE car_dealer(
  id SERIAL4 PRIMARY KEY,
  car_id INT4 REFERENCES car(id) ON DELETE CASCADE,
  purchasing_price INT4
);

CREATE TABLE reservation(
  id SERIAL4 PRIMARY KEY,
  car_id INT4 REFERENCES car(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customer(id) ON DELETE CASCADE,
  staff_id INT4 REFERENCES staff(id) ON DELETE CASCADE,
  payment_id INT4 REFERENCES rental_payment(id) ON DELETE CASCADE,
  pickup_location_id INT4 REFERENCES location(id) ON DELETE CASCADE,
  return_location_id INT4 REFERENCES location(id) ON DELETE CASCADE,
  pickup_time TIME,
  return_time TIME
);
