CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `mobilenum` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_FK` (`address_id`),
  CONSTRAINT `user_FK` FOREIGN KEY (`address_id`) REFERENCES `address`(`adress_id`)
);


CREATE TABLE `address` (
  `adress_id` int NOT NULL,
  `colony` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postalcode` INT DEFAULT NULL,
  PRIMARY KEY (`adress_id`)
);

CREATE TABLE `shopping` (
  `id` int NOT NULL,
  `session_started timestamp DEFAULT NULL,
  `session_ended timestamp DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_FK` (`userid`),
  CONSTRAINT `shopping_FK` FOREIGN KEY (`userid`) REFERENCES `user` (`user_id`)
);


CREATE TABLE `cart1` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `sessionid` int DEFAULT NULL,
  `total cost` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart1_FK` (`userid`),
  KEY `cart1_FK_2` (`sessionid`),
  KEY `cart1_FK11` (`product_id`),
  CONSTRAINT `cart1_FK` FOREIGN KEY (`userid`) REFERENCES `user` (`user_id`),
  CONSTRAINT `cart1_FK_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `cart1_FK_2` FOREIGN KEY (`sessionid`) REFERENCES `shopping` (`id`) 
);

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discountid` int DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_fk1` (`discountid`),
  KEY `product_FK33` (`categoryid`),
  CONSTRAINT `product_FK` FOREIGN KEY (`discountid`) REFERENCES `discount` (`id`),
  CONSTRAINT `product_fk2` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`)
);


CREATE TABLE `discount` (
  `id` int NOT NULL,
  `dis_percent` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `categories` (
  `categoryid` int NOT NULL,
  `categorytype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
);


CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `cart_id` int DEFAULT NULL,
  `total cost` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `orders_FK11` (`cart_id`),
  CONSTRAINT `orders_FK11` FOREIGN KEY (`cart_id`) REFERENCES `cart1` (`id`)
);

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `payment_optionid` int DEFAULT NULL,
  `orderid` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_FK11` (`orderid`),
  KEY `payment_FK13` (`payment_optionid`),
  CONSTRAINT `payment_FK` FOREIGN KEY (`orderid`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `payment_FK13` FOREIGN KEY (`payment_optionid`) REFERENCES `paymentoptions` (`paymenttype_id`)
);

CREATE TABLE `paymentoptions` (
  `paymenttype_id` int NOT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`paymenttype_id`)
);

INSERT INTO USER values(1,"kategar","sandhya","6300631755","kategarsandhya@gmail.com",1);
INSERT INTO USER values(2,"devasani","manisha","6300631688","devasanimanisha@gmail.com",2);
INSERT INTO USER values(3,"gujja","rishika","6300631753","gujjarishika@gmail.com",1);
INSERT INTO USER values(4,"sandu","pravalika","6300631907","sandupravalika@gmail.com",2);
INSERT INTO USER values(5,"kavya","gaddam","6300631065","kavyagaddam@gmail.com",1);


INSERT INTO address VALUES (1,"old postal colony","kurnool","Andhra pradesh","India",509126);
INSERT INTO address VALUES (2,"new postal colony","kurnool","Andhra pradesh","India",509125);
INSERT INTO address VALUES (3,"Ragendranagar","gadwal","Telangana","India",509132);
INSERT INTO address VALUES (4,"venkatnagar","anantapur","Andhra pradesh","India",509121);
INSERT INTO address VALUES (5,"srisainagar","anantpur","Andhra pradesh","India",509176);

INSERT INTO shopping values(1,2023-10-10 02:30:30,2023-10-10 05:00:30,1);
INSERT INTO shopping values(2,2023-05-10 01:25:30,2023-05-10 01:58:14,2);
INSERT INTO shopping values(3,2023-02-05 12:30:30,2023-02-05 01:12:43,1);
INSERT INTO shopping values(4,2023-01-10 08:14:27,2023-01-10 08:29:30,3);
INSERT INTO shopping values(5,2023-04-11 06:30:15,2023-04-11 07:00:18,5);


INSERT INTO cart1 values(1,1,1,1,800,2);
INSERT INTO cart1 VALUES(2,2,2,2,6000,1);
INSERT INTO cart1 VALUES(3,1,2,3,800,2);
INSERT INTO cart1 VALUES(4,2,3,2,6000,1);
INSERT INTO cart1 VALUES(5,3,1,2,1200,1);

INSERT INTO product VALUES(1,"track pants",400,10,1);
INSERT INTO product VALUES(2,"samsung mobile",6000,12,2);
INSERT INTO product VALUES(3,"earphones",1200,5,2);
INSERT INTO product VALUES(4,"flour",200,20,3);
INSERT INTO product VALUES(5,"refridgerator",10000,15,5);

INSERT INTO discount values(1,10);
INSERT INTO discount VALUES(2,20);
INSERT INTO discount VALUES(3,30);

INSERT INTO categories values(1,"Fashion");
INSERT INTO categories VALUES(2,"Electronic gadgets");
INSERT INTO categories VALUES(3,"Grocery");
INSERT INTO categories VALUES(4,"kitchen ware");
INSERT INTO categories VALUES(5,"Furniture");

INSERT INTO orders values(1,1,400);
INSERT INTO orders VALUES(2,2,6000);
INSERT INTO orders VALUES(3,3,12000);


INSERT INTO payment values(1,1,1,400,"success");
INSERT INTO payment VALUES(2,2,2,6000,"failure");
INSERT INTO payment VALUES(3,1,1,1200,"success");

INSERT INTO paymentoptions values(1,"UPI");
INSERT INTO paymentoptions VALUES(2,"CCV");
INSERT INTO paymentoptions VALUES(3,"netbanking");
INSERT INTO paymentoptions VALUES(4,"Cash");
