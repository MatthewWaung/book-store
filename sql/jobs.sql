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

 Date: 14/11/2020 11:45:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工种编号',
  `job_title` varchar(45) DEFAULT NULL COMMENT '工种名称',
  `min_salary` int(6) DEFAULT NULL COMMENT '最低工资',
  `max_salary` int(6) DEFAULT NULL COMMENT '最高工资',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工种表';

SET FOREIGN_KEY_CHECKS = 1;
