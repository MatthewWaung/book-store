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

 Date: 16/01/2021 18:47:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(100) NOT NULL,
  `create_time` varchar(100) NOT NULL COMMENT '购买时间',
  `total_count` int(11) NOT NULL COMMENT '总数量',
  `total_amount` double(11,2) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '快递信息快递表',
  PRIMARY KEY (`id`),
  KEY `user_id` (`state`,`user_id`),
  KEY `post_id_idx` (`user_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`user_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
