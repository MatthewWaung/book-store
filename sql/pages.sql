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

 Date: 11/11/2020 05:40:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `page_no` bigint(20) DEFAULT NULL,
  `page_size` bigint(20) DEFAULT NULL,
  `total_page_no` bigint(20) DEFAULT NULL,
  `total_record` bigint(20) DEFAULT NULL,
  `min_price` varchar(255) DEFAULT NULL,
  `max_price` varchar(255) DEFAULT NULL,
  `is_login` tinyint(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
