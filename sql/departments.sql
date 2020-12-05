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

 Date: 14/11/2020 11:34:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `department_name` varchar(45) DEFAULT NULL COMMENT '部门名称',
  `manager_id` int(6) DEFAULT NULL COMMENT '部门领导员工编号',
  `location_id` int(4) DEFAULT NULL COMMENT '位置编号',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

SET FOREIGN_KEY_CHECKS = 1;
