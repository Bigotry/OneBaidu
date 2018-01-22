/*
Navicat MySQL Data Transfer

Source Server         : localhost_link
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : baidu

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-01-22 14:21:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ob_baidu`
-- ----------------------------
DROP TABLE IF EXISTS `ob_baidu`;
CREATE TABLE `ob_baidu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `picture_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片ID',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '点击后跳转的URL',
  `show_url` varchar(255) NOT NULL DEFAULT '' COMMENT '显示URL',
  `snapshoot_url` varchar(255) NOT NULL DEFAULT '' COMMENT '百度快照URL',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '位置，0顶部  1底部',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='seo表';

-- ----------------------------
-- Records of ob_baidu
-- ----------------------------
INSERT INTO `ob_baidu` VALUES ('43', 'OneBase开源系统|ThinkPHP', '17', '一款基于ThinkPHP5研发的开源免费基础架构，使用OneBase可以快速的研发各类应用。OneBase遵循Apache2开源协议，并提供免费使用。但不能未经授权抹除产品标志再次用于开源。', 'http://onebase.org', 'http://onebase.org', 'http://onebase.org', '0', '0', '1', '1516600012', '1516600144');
INSERT INTO `ob_baidu` VALUES ('44', 'OneBase', '0', '测试一下', 'http://onebase.org', 'http://onebase.org', 'http://onebase.org', '1', '0', '1', '1516600802', '1516601642');
