CREATE SCHEMA ⁠ OnlineStockManagementSystem ⁠ ;


CREATE TABLE `Stock_Items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `item_model` varchar(100) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `unit_cost` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`item_id`)
)



