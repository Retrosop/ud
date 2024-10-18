CREATE TABLE LB_3.orders (
  order_id int NOT NULL AUTO_INCREMENT,
  customer_name varchar(100) NOT NULL,
  product_name varchar(100) NOT NULL,
  quantity int NOT NULL,
  order_date date NOT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;