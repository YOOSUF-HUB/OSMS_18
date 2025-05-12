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



CREATE TABLE `financialreport` (
  `rId` int NOT NULL AUTO_INCREMENT,
  `rName` varchar(45) NOT NULL,
  `rDate` date NOT NULL,
  `rCategory` varchar(100) NOT NULL,
  `rAuthor` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `rStatus` varchar(45) DEFAULT NULL,
  `rFilePath` varchar(455) DEFAULT NULL,
  `rContentType` varchar(545) DEFAULT NULL,
  `rContent` text,
  `rContentSummary` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`rId`),
  KEY `fk_user_report_idx` (`user_id`)
);


CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ;



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
=======



////////////////////////////////////

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

CREATE TABLE `Stock_Items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `quantity` int DEFAULT '0',
  `unit_cost` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    quantity INT NOT NULL,
    orderDate DATE NOT NULL,
    customer_id INT,
    
    FOREIGN KEY (item_id) REFERENCES Stock_Items(item_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `orderDate` date NOT NULL,
  `customer_id` int DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `item_id` (`item_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Stock_Items` (`item_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) 


