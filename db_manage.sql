/*
Navicat MySQL Data Transfer

Source Server         : gsm
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : db_manage

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-06-05 10:37:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `cid` int(11) NOT NULL,
  `cname` varchar(255) NOT NULL,
  `clianxi` varchar(255) NOT NULL COMMENT '联系人',
  `cphone` varchar(255) NOT NULL COMMENT '联系电话',
  `caddress` varchar(255) NOT NULL COMMENT '联系地址',
  `cbeijing` varchar(255) NOT NULL COMMENT '公司背景',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '思域有限集团', '张三', '123456789654', '北京市', '专注于服饰设计');

-- ----------------------------
-- Table structure for `mission`
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) NOT NULL,
  `mtime` int(11) NOT NULL,
  `mstime` varchar(255) NOT NULL,
  `metime` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '执行人',
  `cid` int(11) NOT NULL COMMENT '客户公司',
  `mjieshao` varchar(255) NOT NULL COMMENT '任务介绍',
  `fuid` int(11) NOT NULL COMMENT '发送者',
  `speed` varchar(255) NOT NULL COMMENT '优先级',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mission
-- ----------------------------
INSERT INTO `mission` VALUES ('6', '服装设计', '6', '2019-05-31', '2019-06-10', '2', '1', '设计十张图纸', '1', '需要');
INSERT INTO `mission` VALUES ('5', '部署项目', '5', '2019-06-13', '2019-06-19', '1', '1', '部署项目', '1', '暂不');
INSERT INTO `mission` VALUES ('8', '设计方案', '6', '2019-06-04', '2019-06-07', '2', '1', '设计方案', '1', '需要');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `upwd` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'byran', 'dcf32df7b79bd48f73030aa2f0916f36');
INSERT INTO `user` VALUES ('2', '小明', '4fd580bbc138f69bad585d430aa28991');
INSERT INTO `user` VALUES ('3', '小白', '3c1818841024bdaa842f0fccd2be8307');
INSERT INTO `user` VALUES ('4', '小红', 'a51af6468b1a9029617e89e3eb16e648');
