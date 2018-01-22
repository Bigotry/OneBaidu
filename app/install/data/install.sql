/*
Navicat MySQL Data Transfer

Source Server         : localhost_link
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : onebase

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-12-11 17:06:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ob_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `ob_action_log`;
CREATE TABLE `ob_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行会员id',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT '执行行为者ip',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '行为名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '执行的URL',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1263 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of ob_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_addon`
-- ----------------------------
DROP TABLE IF EXISTS `ob_addon`;
CREATE TABLE `ob_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '插件描述',
  `config` text NOT NULL COMMENT '配置',
  `author` varchar(40) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ob_addon
-- ----------------------------
INSERT INTO `ob_addon` VALUES ('3', 'File', '文件上传', '文件上传插件', '', 'Jack', '1.0', '1', '0', '0');
INSERT INTO `ob_addon` VALUES ('4', 'Icon', '图标选择', '图标选择插件', '', 'Bigotry', '1.0', '1', '0', '0');
INSERT INTO `ob_addon` VALUES ('5', 'Editor', '文本编辑器', '富文本编辑器', '', 'Bigotry', '1.0', '1', '0', '0');

-- ----------------------------
-- Table structure for `ob_api`
-- ----------------------------
DROP TABLE IF EXISTS `ob_api`;
CREATE TABLE `ob_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL DEFAULT '' COMMENT '接口名称',
  `group_id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '接口分组',
  `request_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '请求类型 0:POST  1:GET',
  `api_url` char(50) NOT NULL DEFAULT '' COMMENT '请求路径',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '接口描述',
  `describe_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接口富文本描述',
  `is_request_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要请求数据',
  `request_data` text NOT NULL COMMENT '请求数据',
  `response_data` text NOT NULL COMMENT '响应数据',
  `is_response_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要响应数据',
  `is_user_token` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要用户token',
  `is_response_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否返回数据签名',
  `is_request_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证请求数据签名',
  `response_examples` text NOT NULL COMMENT '响应栗子',
  `developer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '研发者',
  `api_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口状态（0:待研发，1:研发中，2:测试中，3:已完成）',
  `is_page` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为分页接口 0：否  1：是',
  `sort` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COMMENT='API表';

-- ----------------------------
-- Records of ob_api
-- ----------------------------
INSERT INTO `ob_api` VALUES ('186', '登录或注册', '34', '0', 'common/login', '系统登录注册接口，若用户名存在则验证密码正确性，若用户名不存在则注册新用户，返回 user_token 用于操作需验证身份的接口', '', '1', '[{\"field_name\":\"username\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u7528\\u6237\\u540d\"},{\"field_name\":\"password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u5bc6\\u7801\"}]', '[{\"field_name\":\"data\",\"data_type\":\"2\",\"field_describe\":\"\\u4f1a\\u5458\\u6570\\u636e\\u53causer_token\"}]', '1', '0', '1', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;member_id&quot;: 51,\r\n        &quot;nickname&quot;: &quot;sadasdas&quot;,\r\n        &quot;username&quot;: &quot;sadasdas&quot;,\r\n        &quot;create_time&quot;: &quot;2017-09-09 13:40:17&quot;,\r\n        &quot;user_token&quot;: &quot;eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmVCYXNlIEpXVCIsImlhdCI6MTUwNDkzNTYxNywiZXhwIjoxNTA0OTM2NjE3LCJhdWQiOiJPbmVCYXNlIiwic3ViIjoiT25lQmFzZSIsImRhdGEiOnsibWVtYmVyX2lkIjo1MSwibmlja25hbWUiOiJzYWRhc2RhcyIsInVzZXJuYW1lIjoic2FkYXNkYXMiLCJjcmVhdGVfdGltZSI6IjIwMTctMDktMDkgMTM6NDA6MTcifX0.6PEShODuifNsa-x1TumLoEaR2TCXpUEYgjpD3Mz3GRM&quot;\r\n    }\r\n}', '0', '1', '0', '0', '1', '1504501410', '1504949075');
INSERT INTO `ob_api` VALUES ('187', '文章分类列表', '44', '0', 'article/categorylist', '文章分类列表接口', '', '0', '', '[{\"field_name\":\"id\",\"data_type\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\"},{\"field_name\":\"name\",\"data_type\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u540d\\u79f0\"}]', '1', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: [\r\n        {\r\n            &quot;id&quot;: 2,\r\n            &quot;name&quot;: &quot;测试文章分类2&quot;\r\n        },\r\n        {\r\n            &quot;id&quot;: 1,\r\n            &quot;name&quot;: &quot;测试文章分类1&quot;\r\n        }\r\n    ]\r\n}', '0', '0', '0', '2', '1', '1504765581', '1507366297');
INSERT INTO `ob_api` VALUES ('188', '文章列表', '44', '0', 'article/articlelist', '文章列表接口', '', '1', '[{\"field_name\":\"category_id\",\"data_type\":\"0\",\"is_require\":\"0\",\"field_describe\":\"\\u82e5\\u4e0d\\u4f20\\u9012\\u6b64\\u53c2\\u6570\\u5219\\u4e3a\\u6240\\u6709\\u5206\\u7c7b\"}]', '', '0', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;total&quot;: 9,\r\n        &quot;per_page&quot;: &quot;10&quot;,\r\n        &quot;current_page&quot;: 1,\r\n        &quot;last_page&quot;: 1,\r\n        &quot;data&quot;: [\r\n            {\r\n                &quot;id&quot;: 16,\r\n                &quot;name&quot;: &quot;11111111&quot;,\r\n                &quot;category_id&quot;: 2,\r\n                &quot;describe&quot;: &quot;22222222&quot;,\r\n                &quot;create_time&quot;: &quot;2017-08-07 13:58:37&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 15,\r\n                &quot;name&quot;: &quot;tttttt&quot;,\r\n                &quot;category_id&quot;: 1,\r\n                &quot;describe&quot;: &quot;sddd&quot;,\r\n                &quot;create_time&quot;: &quot;2017-08-07 13:24:46&quot;\r\n            }\r\n        ]\r\n    }\r\n}', '0', '0', '1', '1', '1', '1504779780', '1507366268');
INSERT INTO `ob_api` VALUES ('189', '首页接口', '45', '0', 'combination/index', '首页聚合接口', '', '1', '[{\"field_name\":\"category_id\",\"data_type\":\"0\",\"is_require\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\"}]', '[{\"field_name\":\"article_category_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u6570\\u636e\"},{\"field_name\":\"article_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u6570\\u636e\"}]', '1', '0', '1', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;article_category_list&quot;: [\r\n            {\r\n                &quot;id&quot;: 2,\r\n                &quot;name&quot;: &quot;测试文章分类2&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 1,\r\n                &quot;name&quot;: &quot;测试文章分类1&quot;\r\n            }\r\n        ],\r\n        &quot;article_list&quot;: {\r\n            &quot;total&quot;: 8,\r\n            &quot;per_page&quot;: &quot;2&quot;,\r\n            &quot;current_page&quot;: &quot;1&quot;,\r\n            &quot;last_page&quot;: 4,\r\n            &quot;data&quot;: [\r\n                {\r\n                    &quot;id&quot;: 15,\r\n                    &quot;name&quot;: &quot;tttttt&quot;,\r\n                    &quot;category_id&quot;: 1,\r\n                    &quot;describe&quot;: &quot;sddd&quot;,\r\n                    &quot;create_time&quot;: &quot;2017-08-07 13:24:46&quot;\r\n                },\r\n                {\r\n                    &quot;id&quot;: 14,\r\n                    &quot;name&quot;: &quot;1111111111111111111&quot;,\r\n                    &quot;category_id&quot;: 1,\r\n                    &quot;describe&quot;: &quot;123123&quot;,\r\n                    &quot;create_time&quot;: &quot;2017-08-04 15:37:20&quot;\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '0', '0', '1', '0', '1', '1504785072', '1504948716');
INSERT INTO `ob_api` VALUES ('190', '详情页接口', '45', '0', 'combination/details', '详情页接口', '', '1', '[{\"field_name\":\"article_id\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u6587\\u7ae0ID\"}]', '[{\"field_name\":\"article_category_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u6570\\u636e\"},{\"field_name\":\"article_details\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u8be6\\u60c5\\u6570\\u636e\"}]', '1', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;article_category_list&quot;: [\r\n            {\r\n                &quot;id&quot;: 2,\r\n                &quot;name&quot;: &quot;测试文章分类2&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 1,\r\n                &quot;name&quot;: &quot;测试文章分类1&quot;\r\n            }\r\n        ],\r\n        &quot;article_details&quot;: {\r\n            &quot;id&quot;: 1,\r\n            &quot;name&quot;: &quot;213&quot;,\r\n            &quot;category_id&quot;: 1,\r\n            &quot;describe&quot;: &quot;test001&quot;,\r\n            &quot;content&quot;: &quot;第三方发送到&quot;&quot;&quot;,\r\n            &quot;create_time&quot;: &quot;2014-07-22 11:56:53&quot;\r\n        }\r\n    }\r\n}', '0', '0', '0', '0', '1', '1504922092', '1504923179');
INSERT INTO `ob_api` VALUES ('191', '修改密码', '34', '0', 'common/changepassword', '修改密码接口', '', '1', '[{\"field_name\":\"old_password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u65e7\\u5bc6\\u7801\"},{\"field_name\":\"new_password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u65b0\\u5bc6\\u7801\"}]', '', '0', '1', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;exe_time&quot;: &quot;0.037002&quot;\r\n}', '0', '0', '0', '0', '1', '1504941496', '1512981460');

-- ----------------------------
-- Table structure for `ob_api_group`
-- ----------------------------
DROP TABLE IF EXISTS `ob_api_group`;
CREATE TABLE `ob_api_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(120) NOT NULL DEFAULT '' COMMENT 'aip分组名称',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='api分组表';

-- ----------------------------
-- Records of ob_api_group
-- ----------------------------
INSERT INTO `ob_api_group` VALUES ('34', '基础接口', '0', '1504501195', '0', '1');
INSERT INTO `ob_api_group` VALUES ('44', '文章接口', '1', '1504765319', '1504765319', '1');
INSERT INTO `ob_api_group` VALUES ('45', '聚合接口', '0', '1504784149', '1504784149', '1');

-- ----------------------------
-- Table structure for `ob_article`
-- ----------------------------
DROP TABLE IF EXISTS `ob_article`;
CREATE TABLE `ob_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '文章名称',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '文章内容',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面图片id',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件id',
  `img_ids` varchar(200) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
-- Records of ob_article
-- ----------------------------
INSERT INTO `ob_article` VALUES ('23', '1', '序言', '7', 'OneBase 是什么？', '&lt;h3 class=&quot;line&quot;&gt;\r\n	ThinkPHP -&amp;gt; OneBase -&amp;gt; 产品\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	OneBase是一个免费开源的，快速、简单的面向对象的应用研发架构，是为了快速研发应用而诞生的。在保持出色的性能和新颖设计思想同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用OneBase，允许把您基于OneBase研发的应用开源或商业产品发布/销售。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	主要特性\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;规范&lt;/strong&gt;： OneBase 提供一套编码规范，可使团队研发协作事半功倍。&lt;br /&gt;\r\n&lt;strong&gt;严谨&lt;/strong&gt;： 异常严谨的错误检测和安全机制，详细的日志信息，为您的研发保驾护航。&lt;br /&gt;\r\n&lt;strong&gt;灵活&lt;/strong&gt;： 分层，服务，插件等合理的解耦合设计使您升级框架或需求变更得心应手。&lt;br /&gt;\r\n&lt;strong&gt;接口&lt;/strong&gt;： 完善的接口研发架构，使您只需关注业务逻辑研发，省心省力。&lt;br /&gt;\r\n&lt;strong&gt;高效&lt;/strong&gt;： 自动缓存设计，抛弃了处处判断的尴尬，使您不知不觉中已经使用了缓存。&lt;br /&gt;\r\n&lt;strong&gt;特色&lt;/strong&gt;： 无限级权限控制，垃圾资源回收，系统通用回收站，SEO变量支持，性能与操作监控，等各种脑洞大开的设计思想。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	捐赠我们\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	OneBase致力于简化企业和个人应用研发，您的帮助是对我们最大的支持和动力！\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase团队一直在坚持不懈地努力，并坚持开源和免费提供使用，帮助开发人员更加方便的进行应用快速研发，如果您对我们的成果表示认同并且觉得对您有所帮助我们愿意接受来自各方面的捐赠^_^。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	************ &lt;strong&gt;微信捐赠&lt;/strong&gt; ************************* &lt;strong&gt;支付宝捐赠&lt;/strong&gt; ************\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/6640ec28b9701a85b8a970e53b870da3_265x265.png&quot; alt=&quot;&quot; /&gt;&lt;img src=&quot;https://box.kancloud.cn/b63395ec098a6e3c823825167bd6ffd7_265x265.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n************************* &lt;strong&gt;QQ交流群：477824874&lt;/strong&gt; *********************\r\n&lt;/p&gt;', '0', '0', '', '1509620805', '1509762405', '1');
INSERT INTO `ob_article` VALUES ('24', '1', '安装OneBase', '7', 'OneBase安装环境要求', '&lt;h1 class=&quot;line&quot;&gt;\r\n	OneBase安装环境要求\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;pre&gt;PHP &amp;gt;= &lt;span class=&quot;hljs-number&quot;&gt;7.0&lt;/span&gt;&lt;span class=&quot;hljs-number&quot;&gt;.0&lt;/span&gt; PDO PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; MBstring PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; CURL PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; &lt;/pre&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	开始安装\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;下载源码&lt;/strong&gt;：&lt;a href=&quot;https://gitee.com/Bigotry/OneBase&quot;&gt;https://gitee.com/Bigotry/OneBase&lt;/a&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1.下载源码后解压至Web目录。&lt;br /&gt;\r\n2.配置虚拟主机指向源码public目录。&lt;br /&gt;\r\n3.一切就绪后访问域名会看到引导安装界面。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	若安装流程正常执行完毕会跳转至系统首页，此时OneBase已经安装完成啦 ^_^\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;常见安装问题：&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;1. No input file specified&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;解决办法 （.htaccess 文件 RewriteRule 改成这句 ^(.*)$ index.php [L,E=PATH_INFO:$1]）&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;2. 某些Nginx版本下出现，控制器不存在问题，参考以下配置文件&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/picture/20171206/a770f61efb2ce03d85bb4bff7a8c70d7.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	演示系统配置文件参考 &lt;a href=&quot;https://www.kancloud.cn/onebase/onebase/441504&quot;&gt;https://www.kancloud.cn/onebase/onebase/441504&lt;/a&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span id=&quot;__kindeditor_bookmark_start_0__&quot;&gt;&lt;/span&gt; \r\n&lt;/p&gt;', '0', '0', '', '1509762474', '1512538659', '1');
INSERT INTO `ob_article` VALUES ('25', '1', '研发规范', '7', '团队研发事半功倍', '&lt;h1 class=&quot;line&quot;&gt;\r\n	研发规范\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	目录和文件命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		目录命令使用小写加下划线。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类库、函数文件统一以.php为后缀。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类文件采用驼峰法命名（首字母大写），其它文件采用小写加下划线命名。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	函数和类、属性命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		类的命名采用驼峰法（首字母大写），例如 User。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		函数的命名使用小写字母和下划线（小写字母开头）的方式，例如 get_client_ip。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		方法的命名使用驼峰法（首字母小写），例如 getUserName。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		属性的命名使用驼峰法（首字母小写），例如 tableName、instance。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	常量和配置命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		常量以大写字母和下划线命名，例如 APP_PATH。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		配置参数以小写字母和下划线命名，例如 url_route_on。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据表和字段命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		数据表和字段采用小写加下划线方式命名，并注意字段名不要以下划线开头，例如 think_user 表和 user_name字段，不建议使用驼峰和中文作为数据表字段命名。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	编码建议\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		每个类（不含注释）代码应在200行以内，每个方法（不含注释）代码应在20行以内。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		控制器层（controller）中，尽量不出现 if else switch 等流程分支语句。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		业务逻辑尽量封装在逻辑层（logic）中，供控制器调用。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		数据模型层（model）尽量在逻辑层 logic 中使用，尽量不要再控制器中直接使用model。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		数据验证尽量写在验证层（validate）中，供逻辑层调用，尽量不要在控制器中进行数据验证。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		支付|短信 等尽量封装为服务便于后续扩展，图标选择|省市县联动 等尽量封装为插件便于后续复用。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		API接口尽量根据APP界面实现组合接口，减少APP接口请求。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		其他文档中遗漏项，尽量参考OneBase编码与命名。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;', '0', '0', '', '1509762507', '1509763729', '1');
INSERT INTO `ob_article` VALUES ('26', '1', '目录结构', '7', 'OneBase目录结构', '&lt;img src=&quot;/upload/picture/20171206/e49c32fb18c336cf8706e81c704e6774.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;', '0', '0', '', '1509762529', '1512538717', '1');
INSERT INTO `ob_article` VALUES ('27', '1', '首页介绍', '8', '后台登录与首页介绍', '&lt;h3 class=&quot;line&quot;&gt;\r\n	后台首页\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	安装完成以后输入 &lt;a href=&quot;http://xn--eqrt2g04jtsx/admin.php&quot;&gt;http://您的域名/admin.php&lt;/a&gt; 即可进入后台页面，若没有登录则会跳转登录页面。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/fcea4ef525c3d80d03acf8c94e4149f8_1920x1000.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	登录完成后即可进入后台首页\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/8f67981df66d26204af877e920d7e15a_1920x1002.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台分四个区域 顶部，左侧，内容，底部。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;顶部&lt;/strong&gt;：左侧为产品名称，旁边小图标可控制左侧是否展开，顶部右侧齿轮按钮可设置后台皮肤与布局，点击昵称区域可显示上次登录时间，时间下方左侧为 清空系统缓存按钮，右侧为退出系统按钮。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;左侧&lt;/strong&gt;：左侧为系统的菜单区域，左侧菜单为无限级菜单，后台的菜单管理中可控制左侧菜单与上面的图标和链接。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;内容&lt;/strong&gt;：内容区域分左右布局，左侧为系统信息，显示了系统的版本与依赖框架的版本包括运行环境，右侧为产品信息，值得注意的是右侧下方两项，缓存量与命中率只有后台开启自动缓存的情况下才会统计，缓存量是自动缓存的key数量，命中率为\r\n 查询次数与读取缓存次数计算出来的，比如  查询了 2次，第一次查询了数据库，第二次直接从缓存中读取，那么命中率为50%。&lt;br /&gt;\r\n系统信息与产品信息上方左侧为当前操作的标题信息，默认读取菜单名称，也可以控制器中使用 setTitle 方法设置，右侧为面包屑，可标识当前页面的位置结构。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;底部&lt;/strong&gt;：底部分左右布局，左侧为OneBase的版权信息，右侧为版本号，浮动在右下角的是TP5的调试信息，可在配置文件中关闭，研发阶段建议开启。\r\n&lt;/p&gt;', '0', '0', '', '1509792865', '1509792865', '1');
INSERT INTO `ob_article` VALUES ('28', '1', '会员管理', '8', '会员管理及无限级权限介绍', '&lt;h1 class=&quot;line&quot;&gt;\r\n	会员管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	会员列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/98ae6e56979ef99082e34b3855c2d2b8_1920x1005.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase的会员列表是带继承关系的，超级管理员查看可看到所有的会员数据，上方有两个按钮，新增与导出，导出功能为演示系统导出功能的用法，数据列表中的操作按钮有授权与删除，授权可设置会员所在权限组，删除为软删除，需要彻底删除后面介绍回收站时会讲解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：新增会员时表单中有一项 &ldquo;是否共享会员&rdquo;， 若选择共享会员自己的会员则会继承给添加的会员，添加的会员就可以在会员列表中查看到自己的会员数据，若不共享则添加的会员就没有权限查看自己的会员数据。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	权限管理\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ab02d0de03680b08ff9bf439608836e1_1903x945.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	权限管理点开默认为权限组列表页，可新增，删除，编辑 权限组信息。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：每个会员的权限组都是独立的，菜单授权功能也是带继承关系的，超级管理员拥有所有添加在菜单中的节点权限，比如：超级管理员添加\r\n 权限组 A， 并设置权限组A的菜单权限为 a1 a2 a3 a4 a5，然后添加一个会员 张三，将张三授权到权限组 A \r\n中，张三登录进来后，点击权限管理 是看不到 超级管理员的权限组信息的，张三此时可添加自己的权限组 B，然后给 B权限组设置 菜单权限，此时 \r\n张三可设置的菜单节点为 A 组 的最大权限 a1 a2 a3 a4 a5，那么 张三给B组的菜单权限设置为 a1 a2 a3权限， \r\n并添加李四进B组，李四 添加自己的权限组，可分配的最大权限即为 a1 a2 a3，OneBase的权限是可以这样无限的继承分配下去 ^_^。\r\n&lt;/p&gt;', '0', '0', '', '1509792935', '1509792935', '1');
INSERT INTO `ob_article` VALUES ('29', '1', '系统设置与配置管理', '8', '设置系统中需要使用的信息，在系统中通过 config 函数取值使用', '&lt;h1 class=&quot;line&quot; style=&quot;font-size:2.25em;font-family:&amp;quot;font-weight:200;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置与配置管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot; style=&quot;font-family:&amp;quot;font-weight:200;font-size:1.5em;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置\r\n&lt;/h3&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/1bf57e33aa50f1a5ced8cb49638a20fa_1920x947.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置是设置系统中需要使用的字符串，数组，文本 等信息，在系统中通过 config 函数取值使用。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	OneBase 默认支持 数字，字符，文本，枚举，数组 5种配置类型，如有需要可自行扩展，后续手册中也会演示扩展配置类型的教程。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置值之前需要先添加系统配置，下面看下如何添加系统配置。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot; style=&quot;font-family:&amp;quot;font-weight:200;font-size:1.5em;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	配置列表与配置新增\r\n&lt;/h3&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/f993980d47992aee3b1bb7aafa079243_1917x945.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/2aa1a9ed50c0b7c1dbe093adaceb09a2_1918x943.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：系统设置与配置列表 上面的 基础，数据，系统，API 四项 也属于系统配置，在配置列表中是可以找到的，若需要添加新的配置分组可直接在系统设置中进行设置。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	下面咱们演示添加一个枚举与一个字符配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加一个客服电话字符配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/c6a21953d9548a2e588c25e02736454d_1920x730.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加一个语言枚举配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/92d4f8fbeb0dadd88ddc5cbb325210f7_1919x811.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加了两个配置后，咱们来看一下系统设置。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/461df4a992ddd491056d49afc03a0fce_1917x820.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	发现多出了 两个设置选项，显示顺序可在添加配置时根据排序值控制，这里不再叙述。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	客服电话 是字符类型的配置，所以设置时 可以直接输入字符串值。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	枚举类型是单选择框只能选择一个值，因为咱们添加时配置值默认输入的是0，所以此时默认的是 PHP，默认选择值也就是 配置项 中 冒号 : 之前的内容，注意冒号是英文冒号，前后值不要包含空格，一个选项独占一行。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	下面咱们看看 在程序中如何使用\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/e6c3550fc71329855a9f53f3165c78fc_722x599.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	在代码中咱们通过 config函数获取了 刚才的配置标识对应的值，下面看下输出结果。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b28fb82d6ec4f7cf59e5c13754431310_692x111.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	输出了 刚才配置的客服电话 与 语言选项，若咱们在设置中将 客服电话修改为 18521353332 将 语言选项设置为 C#，那么 输出结果将变成 18521353332 与 2 。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	^_^。 理解了吧，是不是很简单。 至于OneBase默认自带的配置 后续章节会介绍蛤~\r\n&lt;/p&gt;', '0', '0', '', '1509966353', '1509966399', '1');
INSERT INTO `ob_article` VALUES ('30', '1', '菜单管理', '8', 'OneBase 后台菜单是无限级的，意味着您的后台菜单可以无限制的往下层添加', '&lt;h1 class=&quot;line&quot;&gt;\r\n	菜单管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	菜单列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/cae5ec29ba13bd71a1db0aaab597481c_1919x942.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 后台菜单是无限级的，意味着您的后台菜单可以无限制的往下层添加。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台查看下级菜单可点击菜单名称或右侧子菜单按钮，此处使用的是递归遍历，所以点进去后模板与外层模板是一样的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	初学者添加后台菜单建议参考OneBase现有的菜单数据添加。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	菜单添加\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/8e68f8eec7b630965f564095edf30820_1905x666.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	菜单名称是用于后台显示的和用户识别的，排序值是控制菜单后台显示顺序的（同级有效），链接是指点击菜单后跳转的页面语法（控制器/方法），上级菜单是指当前添加菜单属于某个菜单下级，是否隐藏是控制是否出现在后台菜单中的（隐藏菜单也会进行权限验证），图标是后台菜单名称前面的小图标，此处小图标选择已经封装成了插件需要使用小图标选择时参考菜单添加与编辑这里，小图标库也可以进行扩展（参考\r\n font-awesome）。\r\n&lt;/p&gt;', '0', '0', '', '1510137834', '1510137842', '1');
INSERT INTO `ob_article` VALUES ('31', '1', '系统回收站', '8', 'OneBase 的回收站不是其他产品那种 某个表（如：订单或文章）的回收站喔，而是整个系统所有数据的回收站喔~', '&lt;h1 class=&quot;line&quot;&gt;\r\n	系统回收站\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	回收站\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/1025ac572b017963b83ad26b9c6cb517_1914x699.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 的回收站不是其他产品那种 某个表（如：订单或文章）的回收站喔，而是整个系统所有数据的回收站喔~\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	下面咱们介绍一下回收站列表页面，上图中 第一列是 数据模型名称，第二列是 数据模型路径，第三列是指 此模型下面被删除数据的数量，第四列是操作列，点击数据可查看此模型被删除的数据。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	小伙伴们看到这里有列表 但是没有新增是不是很好奇数据从哪里来的丫 ^_^。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/058e92152bfb5296e58bf16c663fdb96_1918x783.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	就是这里。。系统设置里面的系统分组中有个回收站配置，key为模型名称，值为显示列。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	意思就是 冒号前面是 模型的名称 如：用户模型（Member），冒号后面是 回收站数据 页面中显示的名称。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	腻害吧，在这里配置完成后 咱们的回收站就会自动显示对应的模型，查看被删除的数据，还可以还原和彻底干掉喔~\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	回收站数据\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ee37aaf33b7b5080c2fcfe7a6365a1de_1918x698.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	比如上图中就是点击菜单模型旁边的数据看到的页面，里面这些数据 都是被删除的数据，点击彻底删除就可以彻底的让Ta消失。。再也找不回来了。所以要慎重(⊙o⊙)&hellip; ，点击恢复正常 可以 把删除状态恢复为正常数据状态，在菜单管理中就可以看到啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	系统回收站就介绍到这里咯，还有疑问可加入QQ交流群：477824874 交流蛤~期待您的光临。\r\n&lt;/p&gt;', '0', '0', '', '1510218109', '1510218109', '1');
INSERT INTO `ob_article` VALUES ('32', '1', '服务管理', '8', 'OneBase 已经集成了 支付服务和云存储服务，OneBase 追求的不是服务有多少，插件有多少，而是给开发者们一套可扩展性强，适合用来二次研发的架构', '&lt;h1 class=&quot;line&quot;&gt;\r\n	服务管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	系统服务列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/05df6205da557c801dd1d061d27317a9_1917x650.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图中可以看到OneBase 已经集成了 支付服务和云存储服务，OneBase \r\n追求的不是服务有多少，插件有多少，而是给开发者们一套可扩展性强，适合用来二次研发的架构，所以OneBase 自带的服务、驱动、插件 \r\n主要是起一个引导作用，实际研发中根据实际情况分析，然后进行服务、驱动、插件、函数 等封装。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	服务驱动列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/75855cf08e4d06f5b94ac91fd278cc97_1915x679.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	点开支付服务右侧的驱动，可以看到已经存在支付宝、微信支付、易宝支付 的驱动，由此处就可以看到 想扩展其他支付驱动很方便，至于服务和驱动 如果进行编码及研发，可参考后续章节的服务研发及使用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/46d13fa1b8d41e0f5596932434a78ad4_1915x731.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/68456ee3cee2ebedb4a9b86a571ccdc1_1915x736.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为 点开 微信驱动安装与支付宝驱动安装的效果，细心的小伙伴会发现 浏览器上的URL并没有变化，而是参数在变化。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	此处使用了多态性的设计，使不同的驱动安装 展示不同的表单录入项，至于需要录入的录入项则是由驱动研发时进行控制的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	这里只是介绍，具体研发及扩展 请阅读后续章节蛤。^_^。\r\n&lt;/p&gt;', '0', '0', '', '1510307288', '1510307288', '1');
INSERT INTO `ob_article` VALUES ('33', '1', '插件管理', '8', 'OneBase 可以自己扩展插件哦', '&lt;h1 class=&quot;line&quot;&gt;\r\n	插件管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	钩子列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/232758b9b204a053cd07634fa33a47ce_1918x703.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	插件列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b7406939a59699f894e653fe95eeaf17_1920x737.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为 咱们的插件列表，右侧按钮 有 安装 与 卸载，但是每次只会出现一个，未安装状态下出现的是安装按钮，安装状态下出现的是卸载按钮。\r\n&lt;/p&gt;', '0', '0', '', '1510393207', '1510393207', '1');
INSERT INTO `ob_article` VALUES ('34', '1', '文章管理', '8', 'OneBase 文章管理可谓简单粗暴', '&lt;h1 class=&quot;line&quot;&gt;\r\n	文章管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文章分类列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/93e990d2063204f7171aaaee1e8cb319_1915x568.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	文章是很常见的功能模块，也是一套系统经常会操作的功能，所以必须要简单易用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 考虑到文章编辑人员可能存在使用上的障碍，所以默认使用了最常见的结构，一级文章分类，此处抛弃了 无限级分类的文章架构，因为实际情况下运营人员常常要求很简单，不希望常用功能过于复杂难于理解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	当然也不排除有些项目的需求从架构上 就必须要求 多级分类，所以此处谈下 扩展文章分类的做法，OneBase扩展多级分类建议从文章分类上 向上扩展，比如添加文章分类上 加一项顶级分类选择。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文章列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/e03831ec9865bfa3520b59ff68025fec_1913x688.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/800dd3be11a94330050a5cb1f3575512_1903x940.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为文章列表与文章编辑， 可以看到列表页和编辑页有些数据是咱们OneBase前端没有看到的数据，OneBase \r\n是一套研发应用解决方案，文章上的 附件，单图上传，多图上传 等 包括其他模块没有用到的一些功能存在是为了展示研发及使用上的技巧，所以 \r\n作为OneBase的使用者，是需要具备二次研发能力的。\r\n&lt;/p&gt;', '0', '0', '', '1510393374', '1510393406', '1');
INSERT INTO `ob_article` VALUES ('35', '1', '接口管理', '8', '接口管理看完后再也不用和APP研发工程师撕逼啦~自己去看文档吧，哈哈', '&lt;h1 class=&quot;line&quot;&gt;\r\n	接口管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	接口分组管理这里就不在叙述，就是为了给接口归类。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/5f5267b6d4fee4a47c9f7d8e29e88ecc_1919x738.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为接口列表页，左上角有两个按钮，一个是新增接口，一个是接口文档跳转按钮。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	数据列表中 第1列为 接口名称，第2列为接口分组，第3列为接口请求类型，OneBase默认统一POST类型，当然需要其他类型如GET \r\n可自行扩展，第4列为接口地址也就是 \r\n（控制器/方法），第5列是接口目前的状态，接口状态中的选项在系统设置的API栏目下可进行配置，第6列为研发者，研发者成员也在系统设置的API栏目下配置，后面两列为接口排序与操作，接口排序为同级有效。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口新增\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/c425bef34644d08f110f9e10e3a794e1_1900x945.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	^_^。  虽然表单数据数据有点多，但是不要怕蛤，咱们来一个一个讲解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们按从左往右，从上往下进行编号讲解，比如 1 2 3 4 对应的是 接口名称，接口排序值，请求地址，请求类型。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1：API接口名称，就是用来看滴。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	2：接口排序值，用来进行接口显示排序，这些都很好理解啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	3：请求地址，接口访问地址格式（控制器/方法）。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	4：请求类型，默认为POST，需要其他类型可自己扩展。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	5：是否为分页接口，意思就是这个接口是否需要分页功能，如果需要分页功能可传递相关参数，如：list_rows 每页显示的数据量，page 查询的页码。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	6：研发者，此接口的研发人员，选项中的可选值可在系统设置的API分组下进行配置。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	7：请求数据，意思就是执行此接口是否需要带请求参数，默认为否不带请求数据，此处的请求数据控制的为接口所依赖的请求参数，大家可以打开 &lt;a href=&quot;/api.php&quot;&gt;https://onebase.org/api.php&lt;/a&gt; 看到里面这些接口 下面有个测试接口功能，此处测试接口功能的表单就是根据这里请求数据设置自动生成的，Token与分页参数是不受此处控制的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	8：响应数据，意思就是接口执行成功后返回的数据，默认为否不带返回数据，为是 则可添加接口返回的数据，当然也会有特殊数据 如 分页数据及后面将介绍的数据签名 等。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	9：接口分组，这个就不介绍啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	10：接口状态，这个也飘过吧。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	11：接口响应示例，这个是用来给接口调用者看的，方便接口调用者可一眼看清数据结构，提升团队研发效率。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	12：接口简介，用来看滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	13：是否验证用户令牌：user_token， 用来做身份验证滴，比如 \r\n文章列表接口，所有的访问者不需要登录也可以看到，就设置为否，这样接口调用就不需要带user_token，若 为需要身份验证的接口，如 \r\n订单列表，某个会员只能查看自己的订单，就需要用到user_token啦，所以 像 订单管理，个人中心等 这些接口是需要带 \r\nuser_token的。user_token 是调用登录接口后返回的，所以若终端想调用需要身份验证的接口，则需要 先调用登录接口后将接口中返回的\r\n user_token 保存下来，在后续接口调用过程中使用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	14：是否响应数据签名：data_sign，此处是用于做数据安全验证的，比如咱们服务器给终端返回了数据，但是 \r\n终端那边怎么知道真滴是咱们返回的呢。。此时 data_sign 就派上用场啦。 返回的数据中带上了 data_sign \r\n字段，终端根据服务器返回的数据进行与服务器端相同的算法，计算出 终端的  data_sign，然后两端的  data_sign \r\n进行比对，若一模一样，则说明 数据是一模一样滴，这样就很安全啦，别人想改也不行，嘿嘿。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	15：是否验证请求数据签名：data_sign，原理是一样滴，意思就是 终端像接口提交数据时，咱们服务器端也得知道提交的数据是否安全，所以\r\n 咱们也要根据提交上来的数据 生成 \r\ndata_sign，与提交数据中带的data_sign，进行比对，不一样的话就不执行操作，接口返回数据签名不对，一样的话就放行。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	16：这个是备用的。。担心服务端人员太腻害，研发出来的接口实在是用言语无法表达。。就可以用富文本进行图文描述。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	好啦，输入选项介绍完了，咱们看下登录接口的编辑数据页面，看看是咋输入滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b66298b92545f3cc1b2c22d886a68f4f_1900x947.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台接口管理功能就介绍到这里，更深一步将在接口研发中讲解。\r\n&lt;/p&gt;', '0', '0', '', '1510646369', '1510646369', '1');
INSERT INTO `ob_article` VALUES ('36', '1', '优化维护-SEO管理', '8', 'OneBase中的SEO信息可是支持变量滴~', '&lt;h1 class=&quot;line&quot;&gt;\r\n	SEO管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	SEO管理列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/4065235f0baa9f04351aa5dfda0a7590_1920x562.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为SEO管理数据列表，可以看到标题和关键词里面有变量，OneBase中的这些变量可不是固定的喔~\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	SEO变量\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	至于新增和编辑这里就不在叙述啦~太简单咯，咱们直接看看SEO中的这些变量是从哪里来滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/6f2c5cf3484b2768324f2409ca84accb_1915x786.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们点开首页的SEO配置信息编辑页面，看到里面用到这些变量，{$category_name}，{$article_title}，{$article_describe}\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	这些变量是从哪里来的？ 请看下图\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/a805e5dee7706276a304787f2ee31194_1031x930.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	细心的观众能看出来，都是 assign 方法中的变量，如果 assign 不知道是干啥的。。那么请移步至ThinkPHP5的手册 看完再来蛤。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	SEO中的变量支持 所有在控制器中 assign 给模板赋值的变量，这意味着您想添加或减少很简单。。前提是您是开发者。当然，开发者开发完成后建议把此处所支持的变量录入到 可用变量 的输入框中 方便 非开发者知道可支持的有哪些变量蛤。\r\n&lt;/p&gt;', '0', '0', '', '1512096686', '1512096686', '1');
INSERT INTO `ob_article` VALUES ('37', '1', '优化维护-数据库', '8', '此处可以备份和还原数据库', '&lt;h1 class=&quot;line&quot;&gt;\r\n	数据库\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据备份\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/fca84a3b960b8d65dfe2896bab3de32d_1912x873.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图是数据备份页面，列表中是数据库表信息，点击左上角的按钮备份数据，可实现数据库的备份，旁边的 优化和修复是执行的MySql内置的优化与修复，如需了解请自行搜索蛤。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据还原\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/a939e0e84d1a25952e619e7beaff76ad_1916x788.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图是数据还原的界面，列表中为之前备份的记录，点击右侧的还原可还原到当时备份的数据库，若系统已经上线此功能要慎重使用。\r\n&lt;/p&gt;', '0', '0', '', '1512096775', '1512096775', '1');
INSERT INTO `ob_article` VALUES ('38', '1', '优化维护-文件清理', '8', '自动清理系统辣鸡文件和辣鸡数据，维护系统健康', '&lt;h1 class=&quot;line&quot;&gt;\r\n	文件清理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文件清理列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/2cbbad1d7df01f67406b189a057e4a2a_1918x609.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	点击文件清理后发现没有数据，说明系统很健康喔~木有辣鸡文件需要清理，下面咱们人工制造两个无用的图片试试。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/d42b3147c268615b37e5275c57cc5344_561x798.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图中咱们 制造了 辣鸡1 和 辣鸡2，再来看看后台。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ded6f545da29c4ddada686a061e93568_1917x764.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	发现辣鸡了。。腻害吧。嘿嘿。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	然后咱们点击开始清理，然后就会自动干掉 系统中没有引用的文件，这里不光是干掉没有使用的辣鸡文件哦，还隐式的干掉了 数据库中记录的文件记录但是在文件中又不存在的，是双向检索蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	那么问题来了， 系统怎么知道咱们哪些需要检索为辣鸡数据 哪些不需要检索呢？\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/0e48380b13dda40e59223ed21ab18d05_1918x845.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图上就是配置检索字段的地方啦。: 冒号前面为 模型名称，后面为 需要检索的字段名称，但是 \r\n冒号前面的模型前咋还有下划线呢？下划线是用来区分key标识的，因为 如果没有下划线前面的 0 和 1 系统就没办法知道 这两个 key \r\n有啥区别，就理解成了 只有 1个key ， 就会造成系统清理的时候 有遗漏蛤，所以 需要添加清理配置列就参考此处喔。\r\n&lt;/p&gt;', '0', '0', '', '1512096869', '1512096869', '1');
INSERT INTO `ob_article` VALUES ('39', '1', '优化维护-行为日志', '8', '后台操作行为一目了然', '&lt;h3 class=&quot;line&quot;&gt;\r\n	行为日志列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ace534fc77ad7137c1eb21c2679d287b_1917x855.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图上是系统的行为日志，此处的行为日志是指后台的操作行为记录，不涉及其他模块，后台研发过程中需要记录行为日志则使用  action_log 函数记录，清空与删除日志此处就不说啦。\r\n&lt;/p&gt;', '0', '0', '', '1512471084', '1512471100', '1');
INSERT INTO `ob_article` VALUES ('40', '1', '优化维护-执行记录', '8', '监控系统执行记录，让系统随时处于最佳状态', '&lt;h1 class=&quot;line&quot;&gt;\r\n	执行记录\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	全局范围\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/5cbb0f2cb8e55ef6593668299a67022a_1916x732.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口范围\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/10f2ec0dfb638c81b70016e7359c51ac_1914x725.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;p&gt;\r\n	这功能就有点腻害啦，是压轴滴蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们第一张图是 全局范围，意思就是 咱们整套系统的任何模块所有的操作记录。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	第二张图是 接口范围，意思就是 咱们接口模块所有的执行操作记录。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	至于数据列表上面的列就不介绍啦~相信能来到这里的小伙伴都可以看懂喔。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	看到全局范围 1200多页。。。会不会影响系统速度呢？\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	看看咱们执行记录的流程就知道咯\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1.访问系统 -&amp;gt; 2.记录文件 -&amp;gt; 3.后台手动批量入库 -&amp;gt;  4.干掉已入库文件记录\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	清空日志是指软删除咱们全局范围中所有的数据库记录，全局范围包含了接口范围喔~\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	之前就说过咯，咱们所有的数据删除都是软删除，想要彻底干掉就去回收站介绍里面看看蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们后台功能介绍就到此为止咯，相信童鞋们已经看到OneBase的腻害之处了吧，下面咱们来看看如何研发后台功能吧。 ^_^。\r\n&lt;/p&gt;', '0', '0', '', '1512471194', '1512471194', '1');

-- ----------------------------
-- Table structure for `ob_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `ob_article_category`;
CREATE TABLE `ob_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `icon` char(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of ob_article_category
-- ----------------------------
INSERT INTO `ob_article_category` VALUES ('7', '基础', '基础内容', '1509620712', '1509620712', '1', 'fa-street-view');
INSERT INTO `ob_article_category` VALUES ('8', '后台介绍', '后台功能介绍', '1509792822', '1509792822', '1', 'fa-user');

-- ----------------------------
-- Table structure for `ob_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_group`;
CREATE TABLE `ob_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `describe` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(1000) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of ob_auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_group_access`;
CREATE TABLE `ob_auth_group_access` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组授权表';

-- ----------------------------
-- Records of ob_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_blogroll`
-- ----------------------------
DROP TABLE IF EXISTS `ob_blogroll`;
CREATE TABLE `ob_blogroll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '' COMMENT '链接名称',
  `img_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '链接图片封面',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ob_blogroll
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_config`
-- ----------------------------
DROP TABLE IF EXISTS `ob_config`;
CREATE TABLE `ob_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置选项',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of ob_config
-- ----------------------------
INSERT INTO `ob_config` VALUES ('1', 'seo_title', '1', '网站标题', '1', '', '网站标题前台显示标题，优先级低于SEO模块', '1378898976', '1512555314', '1', 'OneBase免费开源架构', '3');
INSERT INTO `ob_config` VALUES ('2', 'seo_description', '2', '网站描述', '1', '', '网站搜索引擎描述，优先级低于SEO模块', '1378898976', '1512555314', '1', 'OneBase|ThinkPHP5', '100');
INSERT INTO `ob_config` VALUES ('3', 'seo_keywords', '2', '网站关键字', '1', '', '网站搜索引擎关键字，优先级低于SEO模块', '1378898976', '1512555314', '1', 'OneBase|ThinkPHP5', '99');
INSERT INTO `ob_config` VALUES ('9', 'config_type_list', '3', '配置类型列表', '3', '', '主要用于数据解析和页面表单的生成', '1378898976', '1512982406', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n5:图片\r\n6:文件\r\n7:富文本\r\n8:单选\r\n9:多选\r\n10:日期\r\n11:时间\r\n12:颜色', '100');
INSERT INTO `ob_config` VALUES ('20', 'config_group_list', '3', '配置分组', '3', '', '配置分组', '1379228036', '1512982406', '1', '1:基础\r\n2:数据\r\n3:系统\r\n4:API', '100');
INSERT INTO `ob_config` VALUES ('25', 'list_rows', '0', '每页数据记录数', '2', '', '数据每页显示记录数', '1379503896', '1507197630', '1', '10', '10');
INSERT INTO `ob_config` VALUES ('29', 'data_backup_part_size', '0', '数据库备份卷大小', '2', '', '该值用于限制压缩后的分卷最大长度。单位：B', '1381482488', '1507197630', '1', '52428800', '7');
INSERT INTO `ob_config` VALUES ('30', 'data_backup_compress', '4', '数据库备份文件是否启用压缩', '2', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1507197630', '1', '1', '9');
INSERT INTO `ob_config` VALUES ('31', 'data_backup_compress_level', '4', '数据库备份文件压缩级别', '2', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1507197630', '1', '9', '10');
INSERT INTO `ob_config` VALUES ('33', 'allow_url', '3', '不受权限验证的url', '3', '', '', '1386644047', '1512982406', '1', '0:file/pictureupload\r\n1:addon/execute', '100');
INSERT INTO `ob_config` VALUES ('43', 'empty_list_describe', '1', '数据列表为空时的描述信息', '2', '', '', '1492278127', '1507197630', '1', 'aOh! 暂时还没有数据~', '0');
INSERT INTO `ob_config` VALUES ('44', 'trash_config', '3', '回收站配置', '3', '', 'key为模型名称，值为显示列。', '1492312698', '1512982406', '1', 'Config:name\r\nAuthGroup:name\r\nMember:nickname\r\nMenu:name\r\nArticle:name\r\nArticleCategory:name\r\nAddon:name\r\nPicture:name\r\nFile:name\r\nActionLog:describe\r\nApi:name\r\nApiGroup:name\r\nBlogroll:name\r\nExeLog:exe_url\r\nSeo:name', '0');
INSERT INTO `ob_config` VALUES ('49', 'static_domain', '1', '静态资源域名', '1', '', '若静态资源为本地资源则此项为空，若为外部资源则为存放静态资源的域名', '1502430387', '1512555314', '1', '', '0');
INSERT INTO `ob_config` VALUES ('52', 'team_developer', '3', '研发团队人员', '4', '', '', '1504236453', '1510894595', '1', '0:Bigotry\r\n1:扫地僧', '0');
INSERT INTO `ob_config` VALUES ('53', 'api_status_option', '3', 'API接口状态', '4', '', '', '1504242433', '1510894595', '1', '0:待研发\r\n1:研发中\r\n2:测试中\r\n3:已完成', '0');
INSERT INTO `ob_config` VALUES ('54', 'api_data_type_option', '3', 'API数据类型', '4', '', '', '1504328208', '1510894595', '1', '0:字符\r\n1:文本\r\n2:数组\r\n3:文件', '0');
INSERT INTO `ob_config` VALUES ('55', 'frontend_theme', '1', '前端主题', '1', '', '', '1504762360', '1512555314', '1', 'default', '0');
INSERT INTO `ob_config` VALUES ('56', 'api_domain', '1', 'API部署域名', '4', '', '', '1504779094', '1510894595', '1', 'https://demo.onebase.org', '0');
INSERT INTO `ob_config` VALUES ('57', 'api_key', '1', 'API加密KEY', '4', '', '泄露后API将存在安全隐患', '1505302112', '1510894595', '1', 'l2V|gfZp{8`;jzR~6Y1_', '0');
INSERT INTO `ob_config` VALUES ('58', 'loading_icon', '4', '页面Loading图标设置', '1', '1:图标1\r\n2:图标2\r\n3:图标3\r\n4:图标4\r\n5:图标5\r\n6:图标6\r\n7:图标7', '页面Loading图标支持7种图标切换', '1505377202', '1512983062', '1', '7', '80');
INSERT INTO `ob_config` VALUES ('59', 'sys_file_field', '3', '文件字段配置', '3', '', 'key为模型名，值为文件列名。', '1505799386', '1512982406', '1', '0_article:file_id', '0');
INSERT INTO `ob_config` VALUES ('60', 'sys_picture_field', '3', '图片字段配置', '3', '', 'key为模型名，值为图片列名。', '1506315422', '1512982406', '1', '0_article:cover_id\r\n1_article:img_ids', '0');
INSERT INTO `ob_config` VALUES ('61', 'jwt_key', '1', 'JWT加密KEY', '4', '', '', '1506748805', '1510894595', '1', 'l2V|DSFXXXgfZp{8`;FjzR~6Y1_', '0');
INSERT INTO `ob_config` VALUES ('64', 'is_write_exe_log', '4', '是否写入执行记录', '3', '0:否\r\n1:是', '', '1510544340', '1512982406', '1', '0', '101');
INSERT INTO `ob_config` VALUES ('65', 'admin_allow_ip', '3', '超级管理员登录IP', '3', '', '后台超级管理员登录IP限制，其他角色不受限。', '1510995580', '1512982406', '1', '0:27.22.112.250', '0');
INSERT INTO `ob_config` VALUES ('66', 'pjax_mode', '8', 'PJAX模式', '3', '0:否\r\n1:是', '若为PJAX模式则浏览器不会刷新，若为常规模式则为AJAX+刷新', '1512370397', '1512982406', '1', '1', '120');

-- ----------------------------
-- Table structure for `ob_driver`
-- ----------------------------
DROP TABLE IF EXISTS `ob_driver`;
CREATE TABLE `ob_driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_name` varchar(40) NOT NULL DEFAULT '' COMMENT '服务标识',
  `driver_name` varchar(20) NOT NULL DEFAULT '' COMMENT '驱动标识',
  `config` text NOT NULL COMMENT '配置',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ob_driver
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_exe_log`
-- ----------------------------
DROP TABLE IF EXISTS `ob_exe_log`;
CREATE TABLE `ob_exe_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `ip` char(50) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `exe_url` varchar(2000) NOT NULL DEFAULT '' COMMENT '执行URL',
  `exe_time` float(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '执行时间 单位 秒',
  `exe_memory` char(20) NOT NULL DEFAULT '' COMMENT '内存占用KB',
  `exe_os` char(30) NOT NULL DEFAULT '' COMMENT '操作系统',
  `source_url` varchar(2000) NOT NULL DEFAULT '' COMMENT '来源URL',
  `session_id` char(32) NOT NULL DEFAULT '' COMMENT 'session_id',
  `browser` char(30) NOT NULL DEFAULT '' COMMENT '浏览器',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `login_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行者ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型  0 ： 应用范围 ， 1：API 范围 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17222 DEFAULT CHARSET=utf8 COMMENT='执行记录表';

-- ----------------------------
-- Records of ob_exe_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_file`
-- ----------------------------
DROP TABLE IF EXISTS `ob_file`;
CREATE TABLE `ob_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '保存名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件表';

-- ----------------------------
-- Records of ob_file
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_hook`
-- ----------------------------
DROP TABLE IF EXISTS `ob_hook`;
CREATE TABLE `ob_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `addon_list` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of ob_hook
-- ----------------------------
INSERT INTO `ob_hook` VALUES ('36', 'File', '文件上传钩子', 'File', '1', '0', '0');
INSERT INTO `ob_hook` VALUES ('37', 'Icon', '图标选择钩子', 'Icon', '1', '0', '0');
INSERT INTO `ob_hook` VALUES ('38', 'ArticleEditor', '富文本编辑器', 'Editor', '1', '0', '0');

-- ----------------------------
-- Table structure for `ob_member`
-- ----------------------------
DROP TABLE IF EXISTS `ob_member`;
CREATE TABLE `ob_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` char(16) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `leader_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '上级会员ID',
  `is_share_member` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否共享会员',
  `is_inside` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为后台使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ob_member
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ob_menu`;
CREATE TABLE `ob_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `icon` char(30) NOT NULL DEFAULT '' COMMENT '图标',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of ob_menu
-- ----------------------------
INSERT INTO `ob_menu` VALUES ('1', '系统首页', '0', '6', 'admin', 'index/index', '0', 'fa-home', '1', '1512371955', '0');
INSERT INTO `ob_menu` VALUES ('16', '会员管理', '0', '3', 'admin', 'member/index', '0', 'fa-users', '1', '1501928389', '0');
INSERT INTO `ob_menu` VALUES ('17', '会员列表', '16', '1', 'admin', 'member/memberlist', '0', 'fa-list', '1', '1495272875', '0');
INSERT INTO `ob_menu` VALUES ('18', '会员添加', '16', '0', 'admin', 'member/memberadd', '0', 'fa-user-plus', '1', '1491837324', '0');
INSERT INTO `ob_menu` VALUES ('27', '权限管理', '16', '0', 'admin', 'auth/grouplist', '0', 'fa-key', '1', '1492000451', '0');
INSERT INTO `ob_menu` VALUES ('32', '权限组编辑', '27', '0', 'admin', 'auth/groupedit', '1', '', '1', '1492002620', '0');
INSERT INTO `ob_menu` VALUES ('34', '授权', '27', '0', 'admin', 'auth_manager/group', '1', '', '1', '0', '0');
INSERT INTO `ob_menu` VALUES ('35', '菜单授权', '27', '0', 'admin', 'auth/menuauth', '1', '', '1', '1492095653', '0');
INSERT INTO `ob_menu` VALUES ('36', '会员授权', '27', '0', 'admin', 'auth_manager/memberaccess', '1', '', '1', '0', '0');
INSERT INTO `ob_menu` VALUES ('68', '系统管理', '0', '4', 'admin', 'config/group', '0', 'fa-wrench', '1', '1501928397', '0');
INSERT INTO `ob_menu` VALUES ('69', '系统设置', '68', '1', 'admin', 'config/setting', '0', 'fa-cogs', '1', '1491748512', '0');
INSERT INTO `ob_menu` VALUES ('70', '配置管理', '68', '4', 'admin', 'config/index', '0', 'fa-cog', '1', '1491668183', '0');
INSERT INTO `ob_menu` VALUES ('71', '配置编辑', '70', '0', 'admin', 'config/configedit', '1', '', '1', '1491674180', '0');
INSERT INTO `ob_menu` VALUES ('72', '配置删除', '70', '0', 'admin', 'config/configDel', '1', '', '1', '1491674201', '0');
INSERT INTO `ob_menu` VALUES ('73', '配置添加', '70', '0', 'admin', 'config/configadd', '0', 'fa-plus', '1', '1491666947', '0');
INSERT INTO `ob_menu` VALUES ('75', '菜单管理', '68', '5', 'admin', 'menu/index', '0', 'fa-th-large', '1', '1491318724', '0');
INSERT INTO `ob_menu` VALUES ('98', '菜单编辑', '75', '0', 'admin', 'menu/menuedit', '1', '', '1', '1512459021', '0');
INSERT INTO `ob_menu` VALUES ('108', '修改密码', '17', '0', 'admin', 'user/update_password', '1', '', '1', '0', '0');
INSERT INTO `ob_menu` VALUES ('109', '修改昵称', '17', '0', 'admin', 'user/update_nickname', '1', '', '1', '1491578211', '0');
INSERT INTO `ob_menu` VALUES ('124', '菜单列表', '75', '0', 'admin', 'menu/menulist', '0', 'fa-list', '1', '1491318271', '0');
INSERT INTO `ob_menu` VALUES ('125', '菜单添加', '75', '0', 'admin', 'menu/menuadd', '0', 'fa-plus', '1', '1491318307', '0');
INSERT INTO `ob_menu` VALUES ('126', '配置列表', '70', '0', 'admin', 'config/configlist', '0', 'fa-list', '1', '1491666890', '1491666890');
INSERT INTO `ob_menu` VALUES ('127', '菜单删除', '75', '0', 'admin', 'menu/menuDel', '1', '', '1', '1491674128', '1491674128');
INSERT INTO `ob_menu` VALUES ('128', '权限组添加', '27', '0', 'admin', 'auth/groupadd', '1', '', '1', '1492002635', '1492002635');
INSERT INTO `ob_menu` VALUES ('134', '授权', '17', '0', 'admin', 'member/memberauth', '1', '', '1', '1492238568', '1492101426');
INSERT INTO `ob_menu` VALUES ('135', '回收站', '68', '0', 'admin', 'trash/trashlist', '0', ' fa-recycle', '1', '1492320214', '1492311462');
INSERT INTO `ob_menu` VALUES ('136', '回收站数据', '135', '0', 'admin', 'trash/trashdatalist', '1', 'fa-database', '1', '1492319477', '1492319392');
INSERT INTO `ob_menu` VALUES ('140', '服务管理', '68', '0', 'admin', 'service/servicelist', '0', 'fa-server', '1', '1492359063', '1492352972');
INSERT INTO `ob_menu` VALUES ('141', '插件管理', '68', '0', 'admin', 'addon/index', '0', 'fa-puzzle-piece', '1', '1492428072', '1492427605');
INSERT INTO `ob_menu` VALUES ('142', '钩子列表', '141', '0', 'admin', 'addon/hooklist', '0', 'fa-anchor', '1', '1492427665', '1492427665');
INSERT INTO `ob_menu` VALUES ('143', '插件列表', '141', '0', 'admin', 'addon/addonlist', '0', 'fa-list', '1', '1492428116', '1492427838');
INSERT INTO `ob_menu` VALUES ('144', '文章管理', '0', '0', 'admin', 'article/index', '0', 'fa-edit', '1', '1501928404', '1492480187');
INSERT INTO `ob_menu` VALUES ('145', '文章列表', '144', '0', 'admin', 'article/articlelist', '0', 'fa-list', '1', '1492480245', '1492480245');
INSERT INTO `ob_menu` VALUES ('146', '文章分类', '144', '0', 'admin', 'article/articlecategorylist', '0', 'fa-list', '1', '1492480359', '1492480342');
INSERT INTO `ob_menu` VALUES ('147', '文章分类编辑', '146', '0', 'admin', 'article/articlecategoryedit', '1', '', '1', '1492485294', '1492485294');
INSERT INTO `ob_menu` VALUES ('148', '分类添加', '144', '0', 'admin', 'article/articlecategoryadd', '0', 'fa-plus', '1', '1492486590', '1492486576');
INSERT INTO `ob_menu` VALUES ('149', '文章添加', '144', '0', 'admin', 'article/articleadd', '0', 'fa-plus', '1', '1492518453', '1492518453');
INSERT INTO `ob_menu` VALUES ('150', '文章编辑', '145', '0', 'admin', 'article/articleedit', '1', '', '1', '1492879589', '1492879589');
INSERT INTO `ob_menu` VALUES ('151', '插件安装', '143', '0', 'admin', 'addon/addoninstall', '1', '', '1', '1492879763', '1492879763');
INSERT INTO `ob_menu` VALUES ('152', '插件卸载', '143', '0', 'admin', 'addon/addonuninstall', '1', '', '1', '1492879789', '1492879789');
INSERT INTO `ob_menu` VALUES ('153', '文章删除', '145', '0', 'admin', 'article/articledel', '1', '', '1', '1492879960', '1492879960');
INSERT INTO `ob_menu` VALUES ('154', '文章分类删除', '146', '0', 'admin', 'article/articlecategorydel', '1', '', '1', '1492879995', '1492879995');
INSERT INTO `ob_menu` VALUES ('156', '驱动安装', '140', '0', 'admin', 'service/driverinstall', '1', '', '1', '1502267009', '1502267009');
INSERT INTO `ob_menu` VALUES ('157', '接口管理', '0', '0', 'admin', 'api/index', '0', 'fa fa-book', '1', '1504000462', '1504000434');
INSERT INTO `ob_menu` VALUES ('158', '分组管理', '157', '0', 'admin', 'api/apigrouplist', '0', 'fa fa-fw fa-th-list', '1', '1504000977', '1504000723');
INSERT INTO `ob_menu` VALUES ('159', '分组添加', '157', '0', 'admin', 'api/apigroupadd', '0', 'fa fa-fw fa-plus', '1', '1504004646', '1504004646');
INSERT INTO `ob_menu` VALUES ('160', '分组编辑', '157', '0', 'admin', 'api/apigroupedit', '1', '', '1', '1504004710', '1504004710');
INSERT INTO `ob_menu` VALUES ('161', '分组删除', '157', '0', 'admin', 'api/apigroupdel', '1', '', '1', '1504004732', '1504004732');
INSERT INTO `ob_menu` VALUES ('162', '接口列表', '157', '0', 'admin', 'api/apilist', '0', 'fa fa-fw fa-th-list', '1', '1504172326', '1504172326');
INSERT INTO `ob_menu` VALUES ('163', '接口添加', '157', '0', 'admin', 'api/apiadd', '0', 'fa fa-fw fa-plus', '1', '1504172352', '1504172352');
INSERT INTO `ob_menu` VALUES ('164', '接口编辑', '157', '0', 'admin', 'api/apiedit', '1', '', '1', '1504172414', '1504172414');
INSERT INTO `ob_menu` VALUES ('165', '接口删除', '157', '0', 'admin', 'api/apidel', '1', '', '1', '1504172435', '1504172435');
INSERT INTO `ob_menu` VALUES ('166', '优化维护', '0', '0', 'admin', 'maintain/index', '0', 'fa-legal', '1', '1509364516', '1505387256');
INSERT INTO `ob_menu` VALUES ('167', 'SEO管理', '166', '0', 'admin', 'seo/seolist', '0', 'fa-list', '1', '1506309608', '1505387303');
INSERT INTO `ob_menu` VALUES ('168', '数据库', '166', '0', 'admin', 'maintain/database', '0', 'fa-database', '1', '1505539670', '1505539394');
INSERT INTO `ob_menu` VALUES ('169', '数据备份', '168', '0', 'admin', 'database/databackup', '0', 'fa-download', '1', '1506309900', '1505539428');
INSERT INTO `ob_menu` VALUES ('170', '数据还原', '168', '0', 'admin', 'database/datarestore', '0', 'fa-exchange', '1', '1506309911', '1505539492');
INSERT INTO `ob_menu` VALUES ('171', '文件清理', '166', '0', 'admin', 'fileclean/cleanlist', '0', 'fa-file', '1', '1506310152', '1505788517');
INSERT INTO `ob_menu` VALUES ('174', '行为日志', '166', '0', 'admin', 'log/loglist', '0', 'fa-street-view', '1', '1507201516', '1507200836');
INSERT INTO `ob_menu` VALUES ('176', '执行记录', '166', '0', 'admin', 'exelog/index', '0', 'fa-list-alt', '1', '1509433351', '1509433351');
INSERT INTO `ob_menu` VALUES ('177', '全局范围', '176', '0', 'admin', 'exelog/applist', '0', 'fa-tags', '1', '1509433570', '1509433570');
INSERT INTO `ob_menu` VALUES ('178', '接口范围', '176', '0', 'admin', 'exelog/apilist', '0', 'fa-tag', '1', '1509433591', '1509433591');
INSERT INTO `ob_menu` VALUES ('198', '统计分析', '0', '0', 'admin', 'statistic/index', '0', 'fa-connectdevelop', '1', '1512638014', '1512638014');
INSERT INTO `ob_menu` VALUES ('199', '权限等级', '198', '0', 'admin', 'statistic/membertree', '0', 'fa-users', '1', '1512638868', '1512638868');
INSERT INTO `ob_menu` VALUES ('200', '浏览器统计', '198', '0', 'admin', 'statistic/performerfacility', '0', 'fa-edge', '1', '1512727672', '1512727672');
INSERT INTO `ob_menu` VALUES ('201', '执行速度', '198', '0', 'admin', 'statistic/exespeed', '0', 'fa-fighter-jet', '1', '1512787226', '1512787226');
INSERT INTO `ob_menu` VALUES ('202', '会员增长', '198', '0', 'admin', 'statistic/membergrowth', '0', 'fa-line-chart', '1', '1512801997', '1512801997');

-- ----------------------------
-- Table structure for `ob_picture`
-- ----------------------------
DROP TABLE IF EXISTS `ob_picture`;
CREATE TABLE `ob_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片表';

-- ----------------------------
-- Records of ob_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `ob_seo`
-- ----------------------------
DROP TABLE IF EXISTS `ob_seo`;
CREATE TABLE `ob_seo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(40) NOT NULL DEFAULT '' COMMENT '模块',
  `seo_title` text NOT NULL COMMENT '标题',
  `seo_keywords` text NOT NULL COMMENT '关键字',
  `seo_description` text NOT NULL COMMENT '描述',
  `usable_val` varchar(255) NOT NULL DEFAULT '' COMMENT '可用变量',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='seo表';

-- ----------------------------
-- Records of ob_seo
-- ----------------------------
INSERT INTO `ob_seo` VALUES ('40', '首页SEO信息', 'index/index/index', 'OneBase 开发架构{$category_name}{$article_title}', 'OneBase,PHP,{$category_name},{$article_title}', '一款基于ThinkPHP5研发的开源免费基础架构，基于OneBase可以快速的研发各类Web应用。{$article_describe}', '{$category_name}，{$article_title}，{$article_describe}', '0', '1', '1505445912', '1505470293');
INSERT INTO `ob_seo` VALUES ('41', 'OneBase-系统登录', 'index/index/login', 'OneBase', 'OneBase', 'OneBase', '', '0', '1', '1505538002', '1505538026');
