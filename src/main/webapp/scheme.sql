CREATE SCHEMA ⁠ OnlineStockManagementSystem ⁠ ;


CREATE TABLE `Stock_Items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `item_model` varchar(100) DEFAULT NULL,
  `item_manufacturer` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `unit_cost` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
)



CREATE TABLE financialreport (
    rID INT NOT NULL AUTO_INCREMENT,      -- Unique report ID
    rName VARCHAR(45) NOT NULL,           -- Report name
    rDate DATE NOT NULL,                  -- Report date
    rContent TEXT,                        -- Report content
    PRIMARY KEY (rID)                     -- Primary key declaration
);


CREATE TABLE OnlineStockManagementSystem.supplier (
    supplier_id INT NOT NULL AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    website VARCHAR(255),
    date_added date DEFAULT NULL,
    PRIMARY KEY (supplier_id)
);




CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    business_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    province VARCHAR(100),
    zip_code VARCHAR(20)
);