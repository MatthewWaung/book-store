/*
 Navicat Premium Data Transfer

 Source Server         : shuwenshop
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 62.234.11.179:3306
 Source Schema         : shuwenshop

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 17/01/2021 16:22:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` varchar(45) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
