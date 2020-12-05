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

 Date: 14/11/2020 12:05:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '雇员编号',
  `first_name` varchar(20) DEFAULT NULL COMMENT '名',
  `last_name` varchar(25) DEFAULT NULL COMMENT '姓\nShuwenHe\nShuwen名first_name\nHe姓last_name',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `job_id` varchar(10) DEFAULT NULL COMMENT '工种编号',
  `salary` double(10,2) DEFAULT NULL COMMENT '月薪',
  `commission_pct` double(4,2) DEFAULT NULL COMMENT '奖金率，员工提成',
  `manager_id` int(6) DEFAULT NULL COMMENT 'leader上级领导的员工编号',
  `department_id` int(4) DEFAULT NULL COMMENT '部门编号',
  `hiredate` datetime DEFAULT NULL COMMENT '入职时间',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='员工表';

SET FOREIGN_KEY_CHECKS = 1;
