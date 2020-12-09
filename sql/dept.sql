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

 Date: 08/12/2020 14:47:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `DEPTNO` int(2) NOT NULL,
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO `dept` VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO `dept` VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO `dept` VALUES (40, 'OPERATIONS', 'BOSTON');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
