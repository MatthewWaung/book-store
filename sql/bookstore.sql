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

 Date: 21/11/2020 18:02:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_content
-- ----------------------------
DROP TABLE IF EXISTS `admin_content`;
CREATE TABLE `admin_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) DEFAULT NULL COMMENT '标题描述',
  `url` varchar(500) DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) DEFAULT NULL COMMENT '图片2',
  `content` text COMMENT '内容',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容分类表';

-- ----------------------------
-- Records of admin_content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_content_category
-- ----------------------------
DROP TABLE IF EXISTS `admin_content_category`;
CREATE TABLE `admin_content_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值1-正常，2-删除。',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列，取值范围：大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容分类';

-- ----------------------------
-- Records of admin_content_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_item
-- ----------------------------
DROP TABLE IF EXISTS `admin_item`;
CREATE TABLE `admin_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id,同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` bigint(20) NOT NULL COMMENT '商品价格,单位为分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态：1-正常,2-下架,3-删除',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of admin_item
-- ----------------------------
BEGIN;
INSERT INTO `admin_item` VALUES (1, 'mathematics', 'good', 666, 0, NULL, NULL, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_item` VALUES (2, 'algorithm', NULL, 888, 0, NULL, NULL, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_item` VALUES (3, 'english', NULL, 999, 0, NULL, NULL, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for admin_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `admin_item_cat`;
CREATE TABLE `admin_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级类目',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `status` int(1) DEFAULT '1' COMMENT '状态，可选值：1（正常），2（删除）',
  `sort_order` int(4) DEFAULT NULL COMMENT '排序序号,表示同级类目的展现次序，如数值相等则按名称次序排列，取值范围：大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true,0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- ----------------------------
-- Records of admin_item_cat
-- ----------------------------
BEGIN;
INSERT INTO `admin_item_cat` VALUES (1, 1, 'mathematics', 11, 1, 1, NULL, NULL);
INSERT INTO `admin_item_cat` VALUES (2, 2, 'algorithm', 1, 2, 1, NULL, NULL);
INSERT INTO `admin_item_cat` VALUES (3, 1, 'english', 1, 1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_item_desc
-- ----------------------------
DROP TABLE IF EXISTS `admin_item_desc`;
CREATE TABLE `admin_item_desc` (
  `item_id` bigint(20) NOT NULL COMMENT '商品ID',
  `item_desc` text COMMENT '商品描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of admin_item_desc
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_item_param
-- ----------------------------
DROP TABLE IF EXISTS `admin_item_param`;
CREATE TABLE `admin_item_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_cat_id` bigint(20) DEFAULT NULL COMMENT '商品类目',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `item_cat_id` (`item_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格参数';

-- ----------------------------
-- Records of admin_item_param
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_item_param_item
-- ----------------------------
DROP TABLE IF EXISTS `admin_item_param_item`;
CREATE TABLE `admin_item_param_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格和商品的关系表';

-- ----------------------------
-- Records of admin_item_param_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码，加密保存',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (37, 'shuwen', '123456', '15010729356', '1201220707@pku.edu.cn', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

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

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `book_id` int(11) NOT NULL,
  `cart_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
BEGIN;
INSERT INTO `cart_items` VALUES (80, 1, 27.20, 1, 'e574b0ad-530a-4d2f-7f4d-da30b886f101');
INSERT INTO `cart_items` VALUES (128, 1, 19.20, 151, '7923181f-c8f8-4037-5f8f-265754d0b493');
INSERT INTO `cart_items` VALUES (129, 1, 11.00, 150, '7923181f-c8f8-4037-5f8f-265754d0b493');
INSERT INTO `cart_items` VALUES (130, 2, 22.60, 122, '7923181f-c8f8-4037-5f8f-265754d0b493');
INSERT INTO `cart_items` VALUES (134, 4, 44.00, 150, '7d02a80f-fb8b-42e8-5713-d28be590d851');
INSERT INTO `cart_items` VALUES (135, 5, 56.50, 122, '7d02a80f-fb8b-42e8-5713-d28be590d851');
INSERT INTO `cart_items` VALUES (136, 3, 57.60, 151, '7d02a80f-fb8b-42e8-5713-d28be590d851');
COMMIT;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` varchar(100) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` double(11,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
INSERT INTO `carts` VALUES ('7923181f-c8f8-4037-5f8f-265754d0b493', 4, 52.80, 22);
INSERT INTO `carts` VALUES ('7d02a80f-fb8b-42e8-5713-d28be590d851', 12, 158.10, 33);
INSERT INTO `carts` VALUES ('e574b0ad-530a-4d2f-7f4d-da30b886f101', 1, 27.20, 1);
COMMIT;

-- ----------------------------
-- Table structure for datas
-- ----------------------------
DROP TABLE IF EXISTS `datas`;
CREATE TABLE `datas` (
  `amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `total_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas
-- ----------------------------
BEGIN;
COMMIT;

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

-- ----------------------------
-- Records of departments
-- ----------------------------
BEGIN;
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of employees
-- ----------------------------
BEGIN;
INSERT INTO `employees` VALUES (1, 'shuwen', 'he', '1201220707@pku.edu.cn', '15010729356', 'AD_PRES', 71000.00, 0.50, 105, 30, '2020-11-15 15:32:57');
INSERT INTO `employees` VALUES (2, 'Richard', 'He', 'richard@pku.edu.cn', '15010729357', 'AD_VP', 61000.00, 0.70, 103, 90, '2020-11-14 15:32:57');
INSERT INTO `employees` VALUES (3, 'Ritchie', 'He', 'ritchie@pku.edu.cn', '15010729359', 'AD_VP', 51000.00, 0.90, 307, 103, '2020-11-13 15:32:57');
INSERT INTO `employees` VALUES (4, 'S_ophie', 'Lei', 'sophie@qq.com', '13811457256', 'IT_PROG', 41000.00, 0.00, 2, 30, '2020-11-12 15:32:57');
INSERT INTO `employees` VALUES (5, 'Jack', 'J', 'Jack@qq.com', '13811457257', 'AD_PRES', 31000.00, NULL, 1, 40, '2020-11-11 15:32:57');
INSERT INTO `employees` VALUES (6, 'Musk', 'M', 'Musk@qq.com', '13811457259', 'AD_PRES', 21000.00, NULL, 1, 50, '2020-11-10 15:32:57');
INSERT INTO `employees` VALUES (7, 'Bill', 'Gace', 'BIll@qq.com', '13811457250', 'AD_PRES', 11000.00, NULL, 11, 30, '2020-11-10 15:32:59');
COMMIT;

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

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

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

-- ----------------------------
-- Records of locations
-- ----------------------------
BEGIN;
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` VALUES (22, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', '942e5255-edad-4ffe-4921-ed468c84069d');
INSERT INTO `order_items` VALUES (23, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '942e5255-edad-4ffe-4921-ed468c84069d');
INSERT INTO `order_items` VALUES (24, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '942e5255-edad-4ffe-4921-ed468c84069d');
INSERT INTO `order_items` VALUES (25, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', '77ffdd3d-a51f-4e7b-425b-c1c628847d2e');
INSERT INTO `order_items` VALUES (26, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '77ffdd3d-a51f-4e7b-425b-c1c628847d2e');
INSERT INTO `order_items` VALUES (27, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '77ffdd3d-a51f-4e7b-425b-c1c628847d2e');
INSERT INTO `order_items` VALUES (28, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '5162a7d5-9f80-4e48-76bd-e6f573baf45b');
INSERT INTO `order_items` VALUES (29, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '5162a7d5-9f80-4e48-76bd-e6f573baf45b');
INSERT INTO `order_items` VALUES (30, 1, 29.90, '七体', '王武', 29.90, 'static/img/default.jpg', '5162a7d5-9f80-4e48-76bd-e6f573baf45b');
INSERT INTO `order_items` VALUES (31, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', 'bdfdbe10-3fcf-45dd-4dad-f7689e9310cc');
INSERT INTO `order_items` VALUES (32, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', 'bdfdbe10-3fcf-45dd-4dad-f7689e9310cc');
INSERT INTO `order_items` VALUES (33, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', 'bdfdbe10-3fcf-45dd-4dad-f7689e9310cc');
INSERT INTO `order_items` VALUES (34, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', 'd5160044-3f42-47ea-605b-1a63393a69a8');
INSERT INTO `order_items` VALUES (35, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', 'd5160044-3f42-47ea-605b-1a63393a69a8');
INSERT INTO `order_items` VALUES (36, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', 'd5160044-3f42-47ea-605b-1a63393a69a8');
INSERT INTO `order_items` VALUES (37, 20, 396.00, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '776c532a-e251-49a6-6bea-e5296ed3b0b0');
INSERT INTO `order_items` VALUES (38, 20, 624.00, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '776c532a-e251-49a6-6bea-e5296ed3b0b0');
INSERT INTO `order_items` VALUES (40, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '32b5737a-1f77-48f1-4a6c-f2df3cb12b8c');
INSERT INTO `order_items` VALUES (41, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', '32b5737a-1f77-48f1-4a6c-f2df3cb12b8c');
INSERT INTO `order_items` VALUES (42, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '5ca19aca-2e0c-4082-4e00-34ed1f975e5c');
INSERT INTO `order_items` VALUES (43, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '5ca19aca-2e0c-4082-4e00-34ed1f975e5c');
INSERT INTO `order_items` VALUES (44, 11, 328.90, '七体', '王武', 29.90, 'static/img/default.jpg', '5ca19aca-2e0c-4082-4e00-34ed1f975e5c');
INSERT INTO `order_items` VALUES (45, 10, 500.00, '西游记', '吴承恩', 50.00, '/static/img/default.jpg', '5ca19aca-2e0c-4082-4e00-34ed1f975e5c');
INSERT INTO `order_items` VALUES (46, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '87e99053-3fea-4aff-618c-8318acb505c7');
INSERT INTO `order_items` VALUES (47, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', 'aa4a10e5-aa77-46b9-6d68-be7c73767a95');
INSERT INTO `order_items` VALUES (48, 1, 29.90, '七体', '王武', 29.90, 'static/img/default.jpg', 'd2343c16-d8b5-4093-47e2-0607ea70e9de');
INSERT INTO `order_items` VALUES (49, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '2e300e00-2242-4eef-57cd-a8425c9895c0');
INSERT INTO `order_items` VALUES (50, 1, 59.31, '三国演义456', '罗贯中', 59.31, '/static/img/default.jpg', 'f473fe35-8d70-40e6-5569-7185693446ae');
INSERT INTO `order_items` VALUES (51, 1, 59.31, '三国演义123', '罗贯中', 59.31, '/static/img/default.jpg', '59b09969-2b89-4099-7f86-da4e32eb0e54');
INSERT INTO `order_items` VALUES (52, 1, 98.00, 'unix', 'ken', 98.00, '/static/img/default.jpg', 'e1788222-1500-40c7-46c6-6c7892467903');
INSERT INTO `order_items` VALUES (53, 1, 59.31, '三国演义123', '罗贯中', 59.31, '/static/img/default.jpg', 'e1788222-1500-40c7-46c6-6c7892467903');
INSERT INTO `order_items` VALUES (54, 1, 98.00, 'unix', 'ken', 98.00, '/static/img/default.jpg', '592e31c4-251b-40f4-738b-9a395d4aca67');
INSERT INTO `order_items` VALUES (55, 1, 50.00, '西游记', '吴承恩', 50.00, '/static/img/default.jpg', '592e31c4-251b-40f4-738b-9a395d4aca67');
INSERT INTO `order_items` VALUES (56, 1, 98.00, 'unix', 'ken', 98.00, '/static/img/default.jpg', 'a65dac6e-60e7-44ac-702b-4753f24d9067');
INSERT INTO `order_items` VALUES (57, 1, 50.00, '西游记', '吴承恩', 50.00, '/static/img/default.jpg', 'a65dac6e-60e7-44ac-702b-4753f24d9067');
INSERT INTO `order_items` VALUES (58, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', 'b945eb97-c716-4f17-6d8d-e7936a5a5a8f');
INSERT INTO `order_items` VALUES (59, 1, 98.00, 'unix', 'ken', 98.00, '/static/img/default.jpg', 'b945eb97-c716-4f17-6d8d-e7936a5a5a8f');
INSERT INTO `order_items` VALUES (60, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', '8761bc57-9498-44b7-483e-0c2fa50e6224');
INSERT INTO `order_items` VALUES (61, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', 'da61237d-52e0-4967-4d8f-6cd3b6a77658');
INSERT INTO `order_items` VALUES (62, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', 'da61237d-52e0-4967-4d8f-6cd3b6a77658');
INSERT INTO `order_items` VALUES (63, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '26d88769-5f5f-4625-722e-63fa0349be9b');
INSERT INTO `order_items` VALUES (64, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', 'bcaba17a-c3ff-465e-6573-45c49b149573');
INSERT INTO `order_items` VALUES (65, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', 'bcaba17a-c3ff-465e-6573-45c49b149573');
INSERT INTO `order_items` VALUES (66, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', '58e58254-74e4-4f89-701e-cf4d623f6816');
INSERT INTO `order_items` VALUES (67, 1, 19.80, '百年孤独', '张三', 19.80, 'static/img/default.jpg', '3d9e3f31-6aa9-4002-59d3-f7f1af59766e');
INSERT INTO `order_items` VALUES (68, 1, 31.20, '给孩子的诗', '李斯', 31.20, 'static/img/default.jpg', 'b12dcc91-1c29-4197-7530-683a319985e7');
INSERT INTO `order_items` VALUES (69, 1, 27.20, '边城', '沈从文', 27.20, 'static/img/default.jpg', '3204c609-4364-4ee4-4940-2587ed9e9561');
INSERT INTO `order_items` VALUES (70, 1, 19.30, '苏东坡传', '林语堂', 19.30, 'static/img/default.jpg', '3204c609-4364-4ee4-4940-2587ed9e9561');
INSERT INTO `order_items` VALUES (71, 1, 29.50, '百年孤独', '马尔克斯', 29.50, 'static/img/default.jpg', '3204c609-4364-4ee4-4940-2587ed9e9561');
INSERT INTO `order_items` VALUES (72, 1, 25.20, '生命不息,折腾不止', '罗永浩', 25.20, 'static/img/default.jpg', 'c211737a-db73-4c26-474c-d14c65c233a9');
INSERT INTO `order_items` VALUES (73, 1, 23.90, '皮囊', '蔡崇达', 23.90, 'static/img/default.jpg', 'c211737a-db73-4c26-474c-d14c65c233a9');
INSERT INTO `order_items` VALUES (74, 1, 16.40, '恰到好处的幸福', '毕淑敏', 16.40, 'static/img/default.jpg', 'c211737a-db73-4c26-474c-d14c65c233a9');
INSERT INTO `order_items` VALUES (75, 1, 27.20, '边城', '0', 27.20, 'static/img/default.jpg', '22d605d4-cccb-43bf-54f0-0351af9c0a45');
INSERT INTO `order_items` VALUES (76, 1, 11.30, '我们仨', '杨绛', 11.30, 'static/img/default.jpg', '22d605d4-cccb-43bf-54f0-0351af9c0a45');
INSERT INTO `order_items` VALUES (77, 10, 110.00, '活着', '余华', 11.00, 'static/img/default.jpg', '22d605d4-cccb-43bf-54f0-0351af9c0a45');
INSERT INTO `order_items` VALUES (78, 1, 11.30, '我们仨', '杨绛', 11.30, 'static/img/default.jpg', 'c4eb1a9c-5050-48b7-47ce-4f5d38241186');
INSERT INTO `order_items` VALUES (79, 1, 11.00, '活着', '余华', 11.00, 'static/img/default.jpg', 'c4eb1a9c-5050-48b7-47ce-4f5d38241186');
INSERT INTO `order_items` VALUES (80, 1, 19.20, '小王子', '安托万', 19.20, 'static/img/default.jpg', 'c4eb1a9c-5050-48b7-47ce-4f5d38241186');
INSERT INTO `order_items` VALUES (81, 1, 27.20, '边城', '0', 27.20, 'static/img/default.jpg', '7307386d-81b2-45df-665b-7372736cb44a');
INSERT INTO `order_items` VALUES (82, 1, 11.30, '我们仨', '杨绛', 11.30, 'static/img/default.jpg', '7307386d-81b2-45df-665b-7372736cb44a');
INSERT INTO `order_items` VALUES (83, 1, 11.00, '活着', '余华', 11.00, 'static/img/default.jpg', '7307386d-81b2-45df-665b-7372736cb44a');
INSERT INTO `order_items` VALUES (84, 1, 19.20, '小王子', '安托万', 19.20, 'static/img/default.jpg', '7307386d-81b2-45df-665b-7372736cb44a');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `create_time` varchar(100) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` double(11,2) NOT NULL,
  `state` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('22d605d4-cccb-43bf-54f0-0351af9c0a45', '2020-11-11 05:29:37', 12, 148.50, 2, 22);
INSERT INTO `orders` VALUES ('26d88769-5f5f-4625-722e-63fa0349be9b', '2020-11-05 09:34:23', 1, 31.20, 2, 22);
INSERT INTO `orders` VALUES ('2e300e00-2242-4eef-57cd-a8425c9895c0', '2020-11-04 22:45:21', 1, 31.20, 2, 22);
INSERT INTO `orders` VALUES ('3204c609-4364-4ee4-4940-2587ed9e9561', '2020-11-07 09:20:15', 3, 76.00, 1, 22);
INSERT INTO `orders` VALUES ('32b5737a-1f77-48f1-4a6c-f2df3cb12b8c', '2020-11-04 20:38:53', 2, 47.00, 2, 22);
INSERT INTO `orders` VALUES ('3d9e3f31-6aa9-4002-59d3-f7f1af59766e', '2020-11-05 12:28:43', 1, 19.80, 1, 22);
INSERT INTO `orders` VALUES ('5162a7d5-9f80-4e48-76bd-e6f573baf45b', '2020-10-11 16:12:05', 3, 80.90, 1, 4);
INSERT INTO `orders` VALUES ('58e58254-74e4-4f89-701e-cf4d623f6816', '2020-11-05 12:26:45', 1, 31.20, 1, 22);
INSERT INTO `orders` VALUES ('592e31c4-251b-40f4-738b-9a395d4aca67', '2020-11-04 23:14:00', 2, 148.00, 1, 22);
INSERT INTO `orders` VALUES ('59b09969-2b89-4099-7f86-da4e32eb0e54', '2020-11-04 22:50:49', 1, 59.31, 1, 22);
INSERT INTO `orders` VALUES ('5ca19aca-2e0c-4082-4e00-34ed1f975e5c', '2020-11-04 21:42:58', 23, 879.90, 2, 22);
INSERT INTO `orders` VALUES ('7307386d-81b2-45df-665b-7372736cb44a', '2020-11-16 17:54:18', 4, 68.70, 1, 34);
INSERT INTO `orders` VALUES ('776c532a-e251-49a6-6bea-e5296ed3b0b0', '2020-10-31 09:42:20', 40, 1020.00, 1, 1);
INSERT INTO `orders` VALUES ('77ffdd3d-a51f-4e7b-425b-c1c628847d2e', '2020-10-11 16:07:38', 3, 78.20, 1, 2);
INSERT INTO `orders` VALUES ('8761bc57-9498-44b7-483e-0c2fa50e6224', '2020-11-05 08:41:47', 1, 27.20, 1, 23);
INSERT INTO `orders` VALUES ('87e99053-3fea-4aff-618c-8318acb505c7', '2020-11-04 22:40:11', 1, 19.80, 1, 22);
INSERT INTO `orders` VALUES ('942e5255-edad-4ffe-4921-ed468c84069d', '2020-10-11 14:03:19', 3, 78.20, 1, 1);
INSERT INTO `orders` VALUES ('a65dac6e-60e7-44ac-702b-4753f24d9067', '2020-11-04 23:26:08', 2, 148.00, 1, 22);
INSERT INTO `orders` VALUES ('aa4a10e5-aa77-46b9-6d68-be7c73767a95', '2020-11-04 22:44:39', 1, 31.20, 1, 22);
INSERT INTO `orders` VALUES ('b12dcc91-1c29-4197-7530-683a319985e7', '2020-11-05 12:37:46', 1, 31.20, 1, 22);
INSERT INTO `orders` VALUES ('b945eb97-c716-4f17-6d8d-e7936a5a5a8f', '2020-11-04 23:44:52', 2, 117.80, 1, 22);
INSERT INTO `orders` VALUES ('bcaba17a-c3ff-465e-6573-45c49b149573', '2020-11-05 12:21:55', 2, 51.00, 1, 22);
INSERT INTO `orders` VALUES ('bdfdbe10-3fcf-45dd-4dad-f7689e9310cc', '2020-10-11 18:24:40', 3, 78.20, 2, 1);
INSERT INTO `orders` VALUES ('c211737a-db73-4c26-474c-d14c65c233a9', '2020-11-11 05:21:53', 3, 65.50, 1, 22);
INSERT INTO `orders` VALUES ('c4eb1a9c-5050-48b7-47ce-4f5d38241186', '2020-11-11 10:09:19', 3, 41.50, 1, 32);
INSERT INTO `orders` VALUES ('d2343c16-d8b5-4093-47e2-0607ea70e9de', '2020-11-04 22:45:00', 1, 29.90, 1, 22);
INSERT INTO `orders` VALUES ('d5160044-3f42-47ea-605b-1a63393a69a8', '2020-10-11 21:24:04', 3, 78.20, 2, 1);
INSERT INTO `orders` VALUES ('da61237d-52e0-4967-4d8f-6cd3b6a77658', '2020-11-05 08:42:52', 2, 47.00, 1, 23);
INSERT INTO `orders` VALUES ('e1788222-1500-40c7-46c6-6c7892467903', '2020-11-04 22:53:31', 2, 157.31, 1, 22);
INSERT INTO `orders` VALUES ('f473fe35-8d70-40e6-5569-7185693446ae', '2020-11-04 22:49:33', 1, 59.31, 1, 22);
COMMIT;

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

-- ----------------------------
-- Records of pages
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` VALUES ('0050a5f2-28ec-4c86-4154-8b2937f3e8e3', 'yaorui', 34);
INSERT INTO `sessions` VALUES ('0a3405fd-d4d1-4be4-6d88-48042489aa81', 'shuwen', 22);
INSERT INTO `sessions` VALUES ('7a3f3269-2003-458b-42aa-7db87a6dfaa2', 'china', 35);
INSERT INTO `sessions` VALUES ('7c0f9ef0-7308-44d3-604f-07df9e08af97', 'shuwen', 22);
INSERT INTO `sessions` VALUES ('a122c1ae-d343-4dd8-6b25-3c93c44d7e9e', 'shuwen', 22);
INSERT INTO `sessions` VALUES ('d7609b18-b0bc-43a6-4efa-b4fc4de5579a', 'jack', 32);
INSERT INTO `sessions` VALUES ('e46c736f-faf3-4530-5115-3bd96752ed6a', 'hello', 33);
INSERT INTO `sessions` VALUES ('fa03e226-038e-486f-7605-615bd97b1d15', 'shuwen', 22);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', '123456', '1201220707@pku.edu.cn');
INSERT INTO `users` VALUES (2, 'admin2', '123456', 'admin2@qq.com');
INSERT INTO `users` VALUES (4, 'admin3', '123456', 'admin3@qq.com');
INSERT INTO `users` VALUES (5, 'admin4', '123456', 'admin4@qq.com');
INSERT INTO `users` VALUES (6, 'admin5', '123456', 'admin5@qq.com');
INSERT INTO `users` VALUES (7, 'admin55', '123456', 'admin55@qq.com');
INSERT INTO `users` VALUES (22, 'shuwen', '123456', '1201220707@pku.edu.cn');
INSERT INTO `users` VALUES (23, 'Sophie', 'vance_info', 'jeeny520@126.com');
INSERT INTO `users` VALUES (24, 'richard', '123456', 'richard@pku.edu.cn');
INSERT INTO `users` VALUES (25, 'ritchie', '$2a$10$4Og8xFgF1vB6dHtREWgh3.2zThJyQOx1vegjRU3wRM4WZ32NZ47Y.', 'ritchie@pku.edu.cn');
INSERT INTO `users` VALUES (26, 'lMkiBCLjGrVw', '31uNqBI8R2jX!', 'michaelcampbell7281@gmail.com');
INSERT INTO `users` VALUES (27, 'YjbvktRuMwVzx', 'JmtvE6dqNHYP!', 'michaelcampbell7281@gmail.com');
INSERT INTO `users` VALUES (28, 'JRWnojAlOxN', 'BzcHdgAKmuMy!', 'barnettpeter551@gmail.com');
INSERT INTO `users` VALUES (29, 'smFbzOUJqGn', 'UeNMPt7G0lkB!', 'barnettpeter551@gmail.com');
INSERT INTO `users` VALUES (30, 'zhangsan', '123456', 'zhangsan@qq.com');
INSERT INTO `users` VALUES (31, 'lisi', '123456', 'lisi@qq.com');
INSERT INTO `users` VALUES (32, 'jack', '123456', 'jack@qq.com');
INSERT INTO `users` VALUES (33, 'hello', '123456', 'hello@qq.com');
INSERT INTO `users` VALUES (34, 'yaorui', 'yaorui', 'yaorui@qq.com');
INSERT INTO `users` VALUES (35, 'china', '123456', 'china@qq.com');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
