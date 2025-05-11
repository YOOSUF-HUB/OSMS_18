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

CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_city` varchar(100) DEFAULT NULL,
  `supplier_country` varchar(100) DEFAULT NULL,
  `supplier_website` varchar(255) DEFAULT NULL,
  `s_date_added` date DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
)



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

CREATE TABLE `stock_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` varchar(100) NOT NULL,
  `quantity_ordered` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `expected_delivery_date` varchar(100) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `notes` varchar(3000) DEFAULT NULL,
  `received_date` varchar(50) DEFAULT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
