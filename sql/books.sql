/*
 Navicat Premium Data Transfer

 Source Server         : bookstore
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 62.234.11.179:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 21/11/2020 17:52:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` double(11,2) NOT NULL,
  `sales` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `img_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
BEGIN;
INSERT INTO `books` VALUES (1, '边城', '50', 27.20, 211, 92, 'static/img/default.jpg');
INSERT INTO `books` VALUES (122, '我们仨', '杨绛', 11.30, 103, 97, 'static/img/default.jpg');
INSERT INTO `books` VALUES (150, '活着', '余华', 11.00, 112, 88, 'static/img/default.jpg');
INSERT INTO `books` VALUES (151, '小王子', '安托万', 19.20, 102, 98, 'static/img/default.jpg');
INSERT INTO `books` VALUES (164, '中国哲学史', '冯友兰', 44.50, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (165, '忽然七日', ' 劳伦', 19.33, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (166, '苏东坡传', '林语堂', 19.30, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (167, '百年孤独', '马尔克斯', 29.50, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (168, '扶桑', '严歌苓', 19.80, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (169, '给孩子的诗', '北岛', 22.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (170, '为奴十二年', '所罗门', 16.50, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (171, '平凡的世界', '路遥', 55.00, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (172, '悟空传', '今何在', 14.00, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (173, '硬派健身', '斌卡', 31.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (174, '从晚清到民国', '唐德刚', 39.90, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (175, '三体', '刘慈欣', 56.50, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (176, '看见', '柴静', 19.50, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (177, '活着', '余华', 11.00, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (178, '小王子', '安托万', 19.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (179, '我们仨', '杨绛', 11.30, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (180, '生命不息,折腾不止', '罗永浩', 25.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (181, '皮囊', '蔡崇达', 23.90, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (182, '恰到好处的幸福', '毕淑敏', 16.40, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (183, '大数据预测', '埃里克', 37.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (184, '人月神话', '布鲁克斯', 55.90, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (185, 'C语言入门经典', '霍尔顿', 45.00, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (186, '数学之美', '吴军', 29.90, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (187, 'Java编程思想', '埃史尔', 70.50, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (188, '设计模式之禅', '秦小波', 20.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (189, '图解机器学习', '杉山将', 33.80, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (190, '艾伦图灵传', '安德鲁', 47.20, 100, 100, 'static/img/default.jpg');
INSERT INTO `books` VALUES (191, '教父', '马里奥普佐', 29.00, 100, 100, 'static/img/default.jpg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
