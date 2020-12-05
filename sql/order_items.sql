/*
 Navicat MySQL Data Transfer

 Source Server         : bookstore
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 62.234.11.179:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 11/11/2020 05:39:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` double(11,2) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
