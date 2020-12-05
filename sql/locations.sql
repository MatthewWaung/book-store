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

 Date: 14/11/2020 11:35:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '位置编号',
  `streat_address` varchar(45) DEFAULT NULL COMMENT '街道',
  `postal_code` varchar(45) DEFAULT NULL COMMENT '邮编',
  `city` varchar(45) DEFAULT NULL COMMENT '城市',
  `state_province` varchar(45) DEFAULT NULL COMMENT '州/省',
  `country_id` varchar(45) DEFAULT NULL COMMENT '国家编号',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='位置表';

SET FOREIGN_KEY_CHECKS = 1;
