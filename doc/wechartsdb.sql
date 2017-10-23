/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : wechartsdb

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-10-23 23:32:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_nav
-- ----------------------------
DROP TABLE IF EXISTS `admin_nav`;
CREATE TABLE `admin_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单表',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '所属菜单',
  `name` varchar(15) DEFAULT '' COMMENT '菜单名称',
  `mca` varchar(255) DEFAULT '' COMMENT '模块、控制器、方法',
  `ico` varchar(20) DEFAULT '' COMMENT 'font-awesome图标',
  `order_number` int(11) unsigned DEFAULT NULL COMMENT '排序',
  `iseffictive` int(11) DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='系统模块信息表';

-- ----------------------------
-- Records of admin_nav
-- ----------------------------
INSERT INTO `admin_nav` VALUES ('1', '0', '系统设置', 'Admin/ShowNav/config', 'cog', '1', '0');
INSERT INTO `admin_nav` VALUES ('2', '1', '模块管理', 'Admin/Nav/index', 'th-list', '1', '0');
INSERT INTO `admin_nav` VALUES ('7', '4', '权限管理', 'Admin/Rule/index', 'glass', '1', '0');
INSERT INTO `admin_nav` VALUES ('4', '0', '权限控制', 'Admin/ShowNav/rule', 'expeditedssl', '2', '0');
INSERT INTO `admin_nav` VALUES ('8', '4', '用户组管理', 'Admin/Rule/group', 'pencil', '2', '0');
INSERT INTO `admin_nav` VALUES ('9', '4', '管理员列表', 'Admin/Rule/admin_user_list', 'user', '3', '0');
INSERT INTO `admin_nav` VALUES ('16', '0', '基本信息管理', 'Admin/ShowNav/BasicInfo', 'gift', '4', '0');
INSERT INTO `admin_nav` VALUES ('17', '16', '组织机构', 'Admin/Orgnazation/index', 'bookmark', '1', '0');
INSERT INTO `admin_nav` VALUES ('36', '0', '信息发布管理', 'Admin/ShowNav/posts', 'th', '13', '0');
INSERT INTO `admin_nav` VALUES ('37', '36', '便签列表', 'Admin/Posts/index', 'tags', '1', '0');
INSERT INTO `admin_nav` VALUES ('38', '1', '系统信息', 'Admin/SysInfo/index', 'list-alt', '99', '0');
INSERT INTO `admin_nav` VALUES ('39', '1', '系统日志', 'Admin/SysLog/index', 'file', '98', '0');
INSERT INTO `admin_nav` VALUES ('41', '1', '系统字典管理', 'Admin/DicData/index', 'book', '2', '0');
INSERT INTO `admin_nav` VALUES ('42', '1', '地区信息管理', 'Admin/ProvinceCityArea/index', 'flag', '3', '0');
INSERT INTO `admin_nav` VALUES ('56', '16', '机构部门', 'Admin/Department/index', 'road', '2', '0');
INSERT INTO `admin_nav` VALUES ('57', '16', '岗位', 'Admin/Position/index', 'align-left', '3', '0');
INSERT INTO `admin_nav` VALUES ('58', '16', '员工', 'Admin/Employee/index', 'align-center', '4', '0');
INSERT INTO `admin_nav` VALUES ('59', '0', '样例管理', 'Admin/Sample/index', 'random', '14', '0');
INSERT INTO `admin_nav` VALUES ('60', '59', '二维码生成', 'Admin/Sample/QRcode', 'qrcode', '1', '0');
INSERT INTO `admin_nav` VALUES ('61', '0', '数据管理', 'Admin/ShowNav/DataInfo', 'fire', '3', '0');
INSERT INTO `admin_nav` VALUES ('62', '61', '数据表管理', 'Admin/DataManage/index', 'film', '1', '0');
INSERT INTO `admin_nav` VALUES ('63', '61', '数据备份', 'Admin/DataBackup/index', 'inbox', '2', '0');
INSERT INTO `admin_nav` VALUES ('64', '59', '生成pdf', 'Admin/Sample/Pdf', 'folder-open', '2', '0');
INSERT INTO `admin_nav` VALUES ('65', '59', 'Excel表格处理', 'Admin/Sample/Excel', 'folder', '3', '0');
INSERT INTO `admin_nav` VALUES ('66', '61', '数据还原', 'Admin/DataBackup/Recover', 'repeat', '3', '0');
INSERT INTO `admin_nav` VALUES ('71', '16', '渠道管理', 'Admin/Channel/index', 'tags', '5', '0');
INSERT INTO `admin_nav` VALUES ('72', '16', '白名单管理', 'Admin/WhiteList/index', 'align-center', '6', '0');
INSERT INTO `admin_nav` VALUES ('73', '16', '客运站管理', 'Admin/Station/index', 'road', '7', '0');
INSERT INTO `admin_nav` VALUES ('74', '0', '数据录入管理', 'Admin/ShowNav/SalesFlow', 'tags', '6', '0');
INSERT INTO `admin_nav` VALUES ('75', '74', '售票信息', 'Admin/SalesFlow/index', 'tags', '1', '0');
INSERT INTO `admin_nav` VALUES ('76', '74', '保险信息', 'Admin/Insurance/index', 'tags', '2', '0');
INSERT INTO `admin_nav` VALUES ('77', '0', '数据统计', 'Admin/ShowNav/Statistics', 'book', '7', '0');
INSERT INTO `admin_nav` VALUES ('78', '77', '图表统计', 'Admin/Statistics/index', 'tags', '1', '0');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组编码',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '分组名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `rules` text COMMENT '规则id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '6,96,200,20,1,2,3,4,5,64,263,128,129,130,133,134,135,136,185,137,138,139,140,141,142,21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,169,104,105,106,107,108,118,126,152,127,143,144,145,146,159,184,190,195,216,224,225,226,227,228,229,257,217,230,231,232,233,234,235,258,218,236,237,238,239,240,241,259,164,165,174,171,173,175,176,177,178,179,166,167,208,210,211,168,201,202,203,205,206,207,219,220,242,243,244,245,246,247,254,256,261,262,264,265,221,248,249,250,251,252,253,255,260,266,222,223');
INSERT INTO `auth_group` VALUES ('2', '产品管理员', '1', '6,96,1,2,3,4,56,57,60,61,63,71,72,65,67,74,75,66,68,69,70,73,77,78,82,83,88,89,90,99,91,92,97,98,104,105,106,107,108,118,109,110,111,112,117,113,114');
INSERT INTO `auth_group` VALUES ('4', '文章编辑', '1', '6,96,185,142,169,104,105,106,107,108,118,146,184');
INSERT INTO `auth_group` VALUES ('6', '采购', '1', '104,105,106,107,108,118,109,110,111,112,117,148,154');
INSERT INTO `auth_group` VALUES ('7', '销售', '1', '');
INSERT INTO `auth_group` VALUES ('8', '库存管理', '1', '');
INSERT INTO `auth_group` VALUES ('9', '产品管理', '1', '');
INSERT INTO `auth_group` VALUES ('10', '财务管理', '1', '');
INSERT INTO `auth_group` VALUES ('11', '店铺管理员', '1', '6,96,200,185,142,169,152,127,143,144,145,146,153,212,213,184,190,195,208');
INSERT INTO `auth_group` VALUES ('12', '零售员工', '1', '');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('88', '1');
INSERT INTO `auth_group_access` VALUES ('89', '2');
INSERT INTO `auth_group_access` VALUES ('89', '4');
INSERT INTO `auth_group_access` VALUES ('90', '1');
INSERT INTO `auth_group_access` VALUES ('91', '11');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类别 1一般权限 2 Ajax请求权限',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `ispublic` int(11) NOT NULL DEFAULT '0' COMMENT '是否全局权限，如Ajax请求 0不是 1是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', '20', 'Admin/ShowNav/nav', '模块管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('2', '1', 'Admin/Nav/index', '模块列表', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('3', '1', 'Admin/Nav/add', '添加模块', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('4', '1', 'Admin/Nav/edit', '修改模块', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('5', '1', 'Admin/Nav/delete', '删除模块', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('21', '0', 'Admin/ShowNav/rule', '权限控制', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('7', '21', 'Admin/Rule/index', '权限管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('8', '7', 'Admin/Rule/add', '添加权限', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('9', '7', 'Admin/Rule/edit', '修改权限', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('10', '7', 'Admin/Rule/delete', '删除权限', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('11', '21', 'Admin/Rule/group', '用户组管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('12', '11', 'Admin/Rule/add_group', '添加用户组', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('13', '11', 'Admin/Rule/edit_group', '修改用户组', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('14', '11', 'Admin/Rule/delete_group', '删除用户组', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('15', '11', 'Admin/Rule/rule_group', '分配权限', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('16', '11', 'Admin/Rule/check_user', '添加成员', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('19', '21', 'Admin/Rule/admin_user_list', '管理员列表', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('20', '0', 'Admin/ShowNav/config', '系统设置', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('6', '0', 'Admin/Index/index', '后台首页', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('64', '1', 'Admin/Nav/order', '模块排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('96', '6', 'Admin/Index/welcome', '欢迎界面', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('104', '0', 'Admin/ShowNav/posts', '便签管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('105', '104', 'Admin/Posts/index', '便签列表', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('106', '105', 'Admin/Posts/add_posts', '添加便签', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('107', '105', 'Admin/Posts/edit_posts', '修改便签', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('108', '105', 'Admin/Posts/delete_posts', '删除便签', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('166', '0', 'Admin/ShowNav/DataInfo', '数据管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('167', '166', 'Admin/DataManage/index', '数据表管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('168', '166', 'Admin/DataBackup/index', '数据备份', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('169', '19', 'Admin/User/GetUserInfo', '异步用户信息查询', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('174', '165', 'Admin/Sample/c_qrcode', '生成二维码方法', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('118', '105', 'Admin/Posts/order_posts', '便签排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('123', '11', 'Admin/Rule/add_user_to_group', '设置为管理员', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('124', '11', 'Admin/Rule/add_admin', '添加管理员', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('125', '11', 'Admin/Rule/edit_admin', '修改管理员', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('126', '0', 'Shop/ShowNav/CustomUser', '会员管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('127', '152', 'Shop/CustomUser/index', '会员列表', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('128', '20', 'Admin/SysInfo/index', '系统信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('129', '20', 'Admin/SysLog/index', '系统日志', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('130', '20', 'Admin/DicData/index', '字典管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('133', '130', 'Admin/DicData/add', '字典添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('134', '130', 'Admin/DicData/edit', '字典修改', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('135', '130', 'Admin/DicData/delete', '字典删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('136', '130', 'Admin/DicData/order', '排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('137', '20', 'Admin/ShowNav/ProvinceCityArea', '地区信息管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('138', '137', 'Admin/ProvinceCityArea/index', '地区信息列表', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('139', '137', 'Admin/ProvinceCityArea/add', '地区信息添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('140', '137', 'Admin/ProvinceCityArea/edit', '地区信息修改', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('141', '137', 'Admin/ProvinceCityArea/delete', '地区信息删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('142', '137', 'Admin/ProvinceCityArea/GetAreaChildItems', '异步请求地区列表', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('143', '127', 'Shop/CustomUser/add', '会员添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('144', '127', 'Shop/CustomUser/edit', '会员修改', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('145', '127', 'Shop/CustomUser/delete', '会员删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('146', '127', 'Shop/CustomUser/GetDicItems', '异步会员类别查询', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('152', '0', 'Shop/Show/index', '店铺管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('159', '0', 'Admin/ShowNav/BasicInfo', '基本信息管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('160', '159', 'Admin/Orgnazation/index', '组织机构管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('161', '159', 'Admin/Department/index', '机构部门', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('162', '159', 'Admin/Position/index', '岗位', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('163', '159', 'Admin/Employee/index', '人员', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('164', '0', 'Admin/Sample/index', '样例管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('165', '164', 'Admin/Sample/QRcode', '二维码生成', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('171', '164', 'Admin/Sample/Pdf', '生成pdf', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('173', '171', 'Admin/Sample/c_pdf', '生成pdf方法', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('175', '164', 'Admin/Sample/Excel', '表格处理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('176', '175', 'Admin/Sample/xls', '生成xls文件', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('177', '175', 'Admin/Sample/csv', '生成csv文件', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('178', '175', 'Admin/Sample/import_xls', '导入xls数据', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('179', '175', 'Admin/Sample/import_csv', '导入csv格式数据', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('180', '160', 'Admin/Orgnazation/add', '添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('181', '160', 'Admin/Orgnazation/edit', '修改', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('182', '160', 'Admin/Orgnazation/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('183', '160', 'Admin/Orgnazation/order', '排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('184', '160', 'Admin/Orgnazation/GetOrgJsonData', '异步-依据pid获得机构信息', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('185', '130', 'Admin/DicData/GetDicJsonData', '依据key查询字典项目', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('186', '161', 'Admin/Department/add', '添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('187', '161', 'Admin/Department/edit', '修改', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('188', '161', 'Admin/Department/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('189', '161', 'Admin/Department/order', '排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('190', '161', 'Admin/Department/GetDeptJsonData', '依据pid获得部门信息（异步）', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('191', '162', 'Admin/Position/add', '添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('192', '162', 'Admin/Position/edit', '修改', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('193', '162', 'Admin/Position/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('194', '162', 'Admin/Position/order', '排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('195', '162', 'Admin/Position/GetPositionJsonData', '依据id查询岗位信息（异步）', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('196', '163', 'Admin/Employee/add', '添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('197', '163', 'Admin/Employee/edit', '修改（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('198', '163', 'Admin/Employee/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('199', '163', 'Admin/Employee/order', '排序', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('200', '6', 'Admin/Index/SetMenu', '设置菜单情况Session', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('201', '168', 'Admin/DataBackup/optimize', '优化', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('202', '168', 'Admin/DataBackup/repair', '修复', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('203', '168', 'Admin/DataBackup/export', '备份', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('206', '205', 'Admin/DataBackup/import', '还原', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('205', '166', 'Admin/DataBackup/Recover', '数据还原', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('207', '205', 'Admin/DataBackup/del', '删除备份', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('208', '167', 'Admin/DataManage/QuickLook', '查看表数据（异步）', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('210', '167', 'Admin/DataManage/DataEdit', '表数据编辑', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('211', '167', 'Admin/DataManage/DataDel', '数据表删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('216', '159', 'Admin/Channel/index', '渠道管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('217', '159', 'Admin/WhiteList/index', '白名单管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('218', '159', 'Admin/Station/index', '客运站管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('219', '0', 'Admin/ShowNav/SalesFlow', '信息录入管理', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('220', '219', 'Admin/SalesFlow/index', '售票信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('221', '219', 'Admin/Insurance/index', '保险信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('222', '0', 'Admin/ShowNav/Statistics', '数据统计', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('223', '222', 'Admin/Statistics/index', '图表信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('224', '216', 'Admin/Channel/add', '添加（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('225', '216', 'Admin/Channel/edit', '编辑(视图)', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('226', '216', 'Admin/Channel/detail', '详细（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('227', '216', 'Admin/Channel/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('228', '216', 'Admin/Channel/GetDetail', '依据id获得信息（异步）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('229', '216', 'Admin/Channel/editdata', '异步修改数据', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('230', '217', 'Admin/WhiteList/add', '添加（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('231', '217', 'Admin/WhiteList/edit', '编辑（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('232', '217', 'Admin/WhiteList/detail', '详细（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('233', '217', 'Admin/WhiteList/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('234', '217', 'Admin/WhiteList/GetDetail', '依据id获得详细信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('235', '217', 'Admin/WhiteList/editdata', '修改数据', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('236', '218', 'Admin/Station/add', '添加（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('237', '218', 'Admin/Station/edit', '编辑（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('238', '218', 'Admin/Station/detail', '详细（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('239', '218', 'Admin/Station/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('240', '218', 'Admin/Station/GetDetail', '依据id获得详细', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('241', '218', 'Admin/Station/editdata', '修改数据', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('242', '220', 'Admin/SalesFlow/add', '添加（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('243', '220', 'Admin/SalesFlow/edit', '编辑（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('244', '220', 'Admin/SalesFlow/detail', '详细（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('245', '220', 'Admin/SalesFlow/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('246', '220', 'Admin/SalesFlow/GetDetail', '依据id获得信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('247', '220', 'Admin/SalesFlow/editdata', '修改信息异步', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('248', '221', 'Admin/Insurance/add', '添加（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('249', '221', 'Admin/Insurance/edit', '编辑（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('250', '221', 'Admin/Insurance/detail', '详细（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('251', '221', 'Admin/Insurance/delete', '删除', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('252', '221', 'Admin/Insurance/GetDetail', '依据id获得信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('253', '221', 'Admin/Insurance/editdata', '异步修改记录', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('254', '220', 'Admin/SalesFlow/adddata', '添加方法', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('255', '221', 'Admin/Insurance/adddata', '添加方法', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('256', '220', 'Admin/SalesFlow/initItems', '获取初始化数据', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('257', '216', 'Admin/Channel/adddata', '数据添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('258', '217', 'Admin/WhiteList/adddata', '数据添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('259', '218', 'Admin/Station/adddata', '数据添加', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('260', '221', 'Admin/Insurance/findInfoByNum', '依据分组编码查询信息', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('261', '220', 'Admin/SalesFlow/findInfoByNum', '依据分组编码etc查询信息', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('262', '220', 'Admin/SalesFlow/iadd', 'I-添加（视图）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('263', '1', 'Admin/Nav/ForBidden', '菜单（启用，禁止）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('264', '220', 'Admin/SalesFlow/addlistdata', '添加多条数据（业务）', '1', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('265', '220', 'Admin/SalesFlow/GetProcess', '进度信息查询', '1', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('266', '219', 'Admin/SalesFlow/findInfoByNum_', '查询信息（综合添加）', '1', '1', '', '1');

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '渠道主键',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '渠道编码',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道名称（微信，窗口，其他）',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '渠道描述',
  `iseffective` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否有效',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='卖票渠道类别';

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('1', '1010', '窗口售票', '窗口售票分类信息', '0', '88', '2017-10-19 13:57:14', '88', '2017-10-19 14:12:08', '88', '2017-10-19 16:09:56', '0');
INSERT INTO `channel` VALUES ('2', '2010', '微信售票', '微信端售票分类', '0', '88', '2017-10-19 14:00:49', '88', '2017-10-19 15:05:16', null, null, '0');
INSERT INTO `channel` VALUES ('3', '2020', '自助机售票', '自主售票机分类', '0', '88', '2017-10-19 14:02:27', '88', '2017-10-19 15:37:39', null, null, '0');
INSERT INTO `channel` VALUES ('4', '2030', '其他网销售票', '其他网销渠道售票分类', '0', '88', '2017-10-19 14:03:40', '88', '2017-10-23 11:52:08', null, null, '0');
INSERT INTO `channel` VALUES ('5', '1', '1', '1', '1', '88', '2017-10-19 15:37:47', null, null, '88', '2017-10-19 15:48:54', '1');
INSERT INTO `channel` VALUES ('6', '052104', '快速客运站', '02', '1', '88', '2017-10-19 16:01:53', null, null, '88', '2017-10-19 16:04:22', '1');
INSERT INTO `channel` VALUES ('7', '1', '1', '1', '1', '88', '2017-10-19 16:02:21', null, null, '88', '2017-10-19 16:04:15', '1');
INSERT INTO `channel` VALUES ('8', '1', '1', '1', '1', '88', '2017-10-19 16:03:00', null, null, '88', '2017-10-19 16:04:19', '1');
INSERT INTO `channel` VALUES ('9', '1', '1', '1', '1', '88', '2017-10-20 08:54:25', null, null, '88', '2017-10-20 08:54:29', '1');
INSERT INTO `channel` VALUES ('10', '1', '1', '1', '0', '88', '2017-10-20 13:09:34', null, null, '88', '2017-10-20 13:10:25', '1');
INSERT INTO `channel` VALUES ('11', '1', '1', '1', '0', '88', '2017-10-20 13:09:37', null, null, '88', '2017-10-20 13:10:29', '1');
INSERT INTO `channel` VALUES ('12', '1', '1', '1', '0', '88', '2017-10-20 13:09:43', null, null, '88', '2017-10-20 13:10:32', '1');

-- ----------------------------
-- Table structure for custom_user
-- ----------------------------
DROP TABLE IF EXISTS `custom_user`;
CREATE TABLE `custom_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员列表主键',
  `memberclass` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '会员类别，对应系统字典表',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `gender` varchar(2) COLLATE utf8_unicode_ci DEFAULT '男' COMMENT '性别',
  `phonenum` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住址',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `totalpay` decimal(10,0) DEFAULT NULL COMMENT '消费金额',
  `nmoney` decimal(10,0) DEFAULT NULL COMMENT '折扣金额',
  `isuse` int(11) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员信息';

-- ----------------------------
-- Records of custom_user
-- ----------------------------
INSERT INTO `custom_user` VALUES ('1', '0101', '李丽云', '女', '45821548741', '1111', '400', '400', '40', '1');
INSERT INTO `custom_user` VALUES ('2', '0101', '丽丽', '女', '12032651254', '昆明', '100', '100', '0', '1');
INSERT INTO `custom_user` VALUES ('3', '0101', '哥哥', '男', '12532652014', '昆明市锡山区', '500', '500', '50', '1');
INSERT INTO `custom_user` VALUES ('5', '0102', '丽卡也', '女', '12032651254', '昆明', '200', '200', '10', '1');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门主键',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '所属上级部门',
  `org_id` int(11) NOT NULL COMMENT '部门所属机构编码',
  `dept_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '部门名称',
  `dept_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门描述',
  `dept_man` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门负责人',
  `dept_man_tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门负责人电话',
  `sortnum` int(11) DEFAULT NULL COMMENT '排序键',
  `isuse` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门信息表';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '0', '1', '部门一', '部门职责。。。。', '李玉途', '13625125487', '1', '1');
INSERT INTO `department` VALUES ('3', '1', '1', '信息处', '的身份的股份', '于特特', '13625125487', '1', '1');
INSERT INTO `department` VALUES ('4', '0', '2', '技术部', '的人得分', '里卡特', '13625145789', '2', '1');
INSERT INTO `department` VALUES ('5', '0', '1', '默认部门', '职责......', '李', '13625124157', '0', '1');

-- ----------------------------
-- Table structure for dic_data
-- ----------------------------
DROP TABLE IF EXISTS `dic_data`;
CREATE TABLE `dic_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `pid` int(11) DEFAULT NULL COMMENT '父节点编码',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `dickey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字典主键',
  `dicvalue` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字典项对应值',
  `dicdescription` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字典描述',
  `sortnum` int(11) DEFAULT '1' COMMENT '排序键',
  `isuse` int(11) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典表';

-- ----------------------------
-- Records of dic_data
-- ----------------------------
INSERT INTO `dic_data` VALUES ('1', '0', '币种', 'BZ', '01', '币种类别：美元，人民币，日元', '1', '1');
INSERT INTO `dic_data` VALUES ('2', '0', '计量单位', 'Units', '01', '计量单位：米，尺等。', '2', '1');
INSERT INTO `dic_data` VALUES ('3', '2', '米', 'm', 'm', '计量单位米', '1', '1');
INSERT INTO `dic_data` VALUES ('4', '0', '文章类别', 'ArticleType', '01', '文章的类别：图文，文字等', '3', '1');
INSERT INTO `dic_data` VALUES ('5', '4', '纯文字', 'TextOnly', '0101', '纯文字', '1', '1');
INSERT INTO `dic_data` VALUES ('8', '0', '会员类别', 'MemberClass', '01', '会员类别', '4', '1');
INSERT INTO `dic_data` VALUES ('9', '8', '临时会员', 'temp', '0101', '临时会员', '1', '1');
INSERT INTO `dic_data` VALUES ('10', '8', '普通会员', 'comm', '0102', '普通会员', '2', '1');
INSERT INTO `dic_data` VALUES ('11', '8', '高级会员', 'serni', '0103', '高级会员', '3', '1');
INSERT INTO `dic_data` VALUES ('12', '8', 'VIP会员', 'vip', '0104', 'VIP会员', '4', '1');
INSERT INTO `dic_data` VALUES ('13', '1', '人民币', 'RMB', '0101', '人民币', '1', '1');
INSERT INTO `dic_data` VALUES ('14', '0', '企业类别', 'OrgClass', '01', '企业类别', '5', '1');
INSERT INTO `dic_data` VALUES ('15', '14', '民营企业', 'SelfOrg', '0101', '民营企业', '1', '1');
INSERT INTO `dic_data` VALUES ('20', '14', '国有企业', 'GYQY', '0102', '国有企业', '2', '1');
INSERT INTO `dic_data` VALUES ('22', '14', '其他企业', 'Other', '0199', '其他企业', '99', '1');
INSERT INTO `dic_data` VALUES ('25', '0', '岗位级别', 'PositionLevel', '06', '岗位等级', '6', '1');
INSERT INTO `dic_data` VALUES ('26', '25', '初级（一等）', '0601', '0601', '初级', '1', '1');
INSERT INTO `dic_data` VALUES ('27', '25', '初级（二等）', '0602', '0602', '初级', '2', '1');
INSERT INTO `dic_data` VALUES ('28', '25', '中级（一等）', '0604', '0604', '中级', '4', '1');
INSERT INTO `dic_data` VALUES ('29', '25', '初级（三等）', '0603', '0603', '初级', '3', '1');
INSERT INTO `dic_data` VALUES ('30', '0', '金额单位', 'MONEYUNIT', '10', '金额单位', '7', '1');
INSERT INTO `dic_data` VALUES ('31', '30', '元', 'YUAN', '1010', '单位（元）', '1', '1');
INSERT INTO `dic_data` VALUES ('32', '30', '万元', 'WANYUAN', '1011', '单位（万元）', '2', '1');
INSERT INTO `dic_data` VALUES ('33', '30', '百万', 'BAIWAN', '1012', '单位（百万）', '3', '1');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工主键',
  `org_id` int(11) NOT NULL COMMENT '所属机构',
  `dept_id` int(11) NOT NULL COMMENT '所属部门',
  `p_id` int(11) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `gender` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `mobile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `indate` datetime DEFAULT NULL COMMENT '入职日期',
  `outdate` datetime DEFAULT NULL COMMENT '离职日期',
  `education` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学历（字典）',
  `sortnum` int(11) DEFAULT '0' COMMENT '排序键',
  `isuse` int(11) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='员工信息';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '2', '4', '3', '小鱼', '男', '13625154257', '123@111.cc', '无', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '大专', '1', '1');
INSERT INTO `employee` VALUES ('2', '1', '5', '0', '管理员', '男', '13621542154', '123@111.cc', '无', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '本科', '2', '1');

-- ----------------------------
-- Table structure for insurance
-- ----------------------------
DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键-购保险信息',
  `groupnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组编码',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '保险数目',
  `indate` datetime NOT NULL COMMENT '录入日期',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保险信息';

-- ----------------------------
-- Records of insurance
-- ----------------------------
INSERT INTO `insurance` VALUES ('1', '20171013', '111', '2017-10-13 00:00:00', '11', '88', '2017-10-19 17:51:43', null, null, '88', '2017-10-19 17:53:47', '1');
INSERT INTO `insurance` VALUES ('2', '20171011', '3333', '2017-10-11 00:00:00', '123124', '88', '2017-10-19 17:52:17', null, null, '88', '2017-10-20 09:08:00', '1');
INSERT INTO `insurance` VALUES ('3', '20171019', '1243254', '2017-10-19 00:00:00', '1', '88', '2017-10-19 17:54:00', null, null, '88', '2017-10-20 11:38:02', '1');
INSERT INTO `insurance` VALUES ('4', '20171004', '34343', '2017-10-04 00:00:00', 'xdgdf', '88', '2017-10-20 08:25:00', null, null, '88', '2017-10-20 11:38:07', '1');
INSERT INTO `insurance` VALUES ('5', '20171006', '2423', '2017-10-06 00:00:00', '阅历', '88', '2017-10-20 09:01:58', '88', '2017-10-22 14:12:51', null, null, '0');
INSERT INTO `insurance` VALUES ('6', '20171003', '436546', '2017-10-03 00:00:00', '历史', '88', '2017-10-20 09:06:23', '88', '2017-10-22 15:50:00', null, null, '0');
INSERT INTO `insurance` VALUES ('7', '20171017', '2342354', '2017-10-17 00:00:00', '34546', '88', '2017-10-20 09:06:40', null, null, '88', '2017-10-20 09:07:54', '1');
INSERT INTO `insurance` VALUES ('8', '20171003', '10004', '2017-10-04 00:00:00', '属于', '88', '2017-10-20 09:18:33', '88', '2017-10-20 09:28:54', '88', '2017-10-22 15:49:46', '1');
INSERT INTO `insurance` VALUES ('9', '20171020', '24352', '2017-10-20 00:00:00', '到底', '88', '2017-10-20 09:29:53', '88', '2017-10-22 14:19:14', null, null, '0');
INSERT INTO `insurance` VALUES ('10', '20171003', '0', '2017-10-03 00:00:00', 'qq', '88', '2017-10-20 14:02:37', null, null, '88', '2017-10-20 14:02:49', '1');
INSERT INTO `insurance` VALUES ('11', '20171003', '1245', '2017-10-03 00:00:00', '看剧吐', '88', '2017-10-20 14:03:12', null, null, '88', '2017-10-22 15:49:52', '1');
INSERT INTO `insurance` VALUES ('12', '20171019', '11111', '2017-10-19 00:00:00', '2', '88', '2017-10-22 15:50:19', '88', '2017-10-23 08:12:04', null, null, '0');
INSERT INTO `insurance` VALUES ('13', '20171018', '2222', '2017-10-18 00:00:00', '1', '88', '2017-10-22 15:50:31', '88', '2017-10-23 08:11:59', null, null, '0');
INSERT INTO `insurance` VALUES ('14', '20171017', '33', '2017-10-17 00:00:00', '3', '88', '2017-10-22 15:50:48', null, null, null, null, '0');
INSERT INTO `insurance` VALUES ('15', '20171021', '2423423', '2017-10-21 00:00:00', '3', '88', '2017-10-22 15:51:01', null, null, null, null, '0');
INSERT INTO `insurance` VALUES ('16', '20171022', '234234', '2017-10-22 00:00:00', '234', '88', '2017-10-22 15:51:16', null, null, null, null, '0');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `user_name` varchar(32) NOT NULL COMMENT '操作人',
  `action` varchar(255) NOT NULL COMMENT '操作动作',
  `class_name` varchar(255) NOT NULL COMMENT '操作了哪个类的对象',
  `class_obj` varchar(32) NOT NULL COMMENT '操作的对象是谁，可能为对象的ID',
  `result` text NOT NULL COMMENT '操作的结果',
  `OldData` text COMMENT '旧数据',
  `op_time` int(11) NOT NULL COMMENT '操作时间',
  `action_from` varchar(20) DEFAULT '' COMMENT '日志产生于（微信，手机，PC）',
  PRIMARY KEY (`id`),
  KEY `op_time` (`op_time`),
  KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508752732', '');
INSERT INTO `log` VALUES ('2', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"1\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2030\",\"stationcode\":\"1010\",\"ticketnum\":\"5\",\"moneynum\":\"7\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\"},\"IP::\":\"0.0.0.0\"}', '', '1508752768', '');
INSERT INTO `log` VALUES ('3', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"2\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2020\",\"stationcode\":\"1010\",\"ticketnum\":\"6\",\"moneynum\":\"8\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\"},\"IP::\":\"0.0.0.0\"}', '', '1508752768', '');
INSERT INTO `log` VALUES ('4', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"3\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2010\",\"stationcode\":\"1010\",\"ticketnum\":\"7\",\"moneynum\":\"78\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\"},\"IP::\":\"0.0.0.0\"}', '', '1508752768', '');
INSERT INTO `log` VALUES ('5', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"4\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"1010\",\"stationcode\":\"1010\",\"ticketnum\":\"1216\",\"moneynum\":\"678586.00\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\"},\"IP::\":\"0.0.0.0\"}', '', '1508752768', '');
INSERT INTO `log` VALUES ('6', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508752773', '');
INSERT INTO `log` VALUES ('7', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508761817', '');
INSERT INTO `log` VALUES ('8', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508763895', '');
INSERT INTO `log` VALUES ('9', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764357', '');
INSERT INTO `log` VALUES ('10', 'admin', 'ACSESS', 'AuthRule', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764385', '');
INSERT INTO `log` VALUES ('11', 'admin', 'ACSESS', 'AuthRule', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764389', '');
INSERT INTO `log` VALUES ('12', 'admin', 'ADD', 'AuthRule', '88', '{\"Result::\":\"265\",\"Data::\":{\"pid\":\"220\",\"title\":\"\\u8fdb\\u5ea6\\u4fe1\\u606f\\u67e5\\u8be2\",\"name\":\"Admin\\/SalesFlow\\/GetProcess\",\"ispublic\":\"1\"},\"IP::\":\"0.0.0.0\"}', '', '1508764420', '');
INSERT INTO `log` VALUES ('13', 'admin', 'ACSESS', 'AuthRule', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764421', '');
INSERT INTO `log` VALUES ('14', 'admin', 'ACSESS', 'AuthGroup', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764424', '');
INSERT INTO `log` VALUES ('15', 'admin', 'MODIFY', 'AuthGroup', '88', '{\"Result::\":1,\"Data::\":{\"id\":\"1\",\"rule_ids\":null,\"rules\":\"6,96,200,20,1,2,3,4,5,64,263,128,129,130,133,134,135,136,185,137,138,139,140,141,142,21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,169,104,105,106,107,108,118,126,152,127,143,144,145,146,159,184,190,195,216,224,225,226,227,228,229,257,217,230,231,232,233,234,235,258,218,236,237,238,239,240,241,259,164,165,174,171,173,175,176,177,178,179,166,167,208,210,211,168,201,202,203,205,206,207,219,220,242,243,244,245,246,247,254,256,261,262,264,265,221,248,249,250,251,252,253,255,260,222,223\"},\"IP::\":\"0.0.0.0\"}', '[{\"id\":\"1\",\"title\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"1\",\"rules\":\"6,96,200,20,1,2,3,4,5,64,263,128,129,130,133,134,135,136,185,137,138,139,140,141,142,21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,169,104,105,106,107,108,118,126,152,127,143,144,145,146,159,184,190,195,216,224,225,226,227,228,229,257,217,230,231,232,233,234,235,258,218,236,237,238,239,240,241,259,164,165,174,171,173,175,176,177,178,179,166,167,208,210,211,168,201,202,203,205,206,207,219,220,242,243,244,245,246,247,254,256,261,262,264,221,248,249,250,251,252,253,255,260,222,223\"}]', '1508764440', '');
INSERT INTO `log` VALUES ('16', 'admin', 'Log', 'Channel', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764446', '');
INSERT INTO `log` VALUES ('17', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764450', '');
INSERT INTO `log` VALUES ('18', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764534', '');
INSERT INTO `log` VALUES ('19', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764591', '');
INSERT INTO `log` VALUES ('20', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764637', '');
INSERT INTO `log` VALUES ('21', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508764679', '');
INSERT INTO `log` VALUES ('22', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508765766', '');
INSERT INTO `log` VALUES ('23', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508766098', '');
INSERT INTO `log` VALUES ('24', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508766861', '');
INSERT INTO `log` VALUES ('25', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508767196', '');
INSERT INTO `log` VALUES ('26', 'admin', 'ACSESS', 'AuthRule', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508768456', '');
INSERT INTO `log` VALUES ('27', 'admin', 'ACSESS', 'AuthRule', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508768460', '');
INSERT INTO `log` VALUES ('28', 'admin', 'ADD', 'AuthRule', '88', '{\"Result::\":\"266\",\"Data::\":{\"pid\":\"219\",\"title\":\"\\u67e5\\u8be2\\u4fe1\\u606f\\uff08\\u7efc\\u5408\\u6dfb\\u52a0\\uff09\",\"name\":\"Admin\\/SalesFlow\\/findInfoByNum_\",\"ispublic\":\"1\"},\"IP::\":\"0.0.0.0\"}', '', '1508768619', '');
INSERT INTO `log` VALUES ('29', 'admin', 'ACSESS', 'AuthRule', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508768621', '');
INSERT INTO `log` VALUES ('30', 'admin', 'ACSESS', 'AuthGroup', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508768627', '');
INSERT INTO `log` VALUES ('31', 'admin', 'MODIFY', 'AuthGroup', '88', '{\"Result::\":1,\"Data::\":{\"id\":\"1\",\"rule_ids\":null,\"rules\":\"6,96,200,20,1,2,3,4,5,64,263,128,129,130,133,134,135,136,185,137,138,139,140,141,142,21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,169,104,105,106,107,108,118,126,152,127,143,144,145,146,159,184,190,195,216,224,225,226,227,228,229,257,217,230,231,232,233,234,235,258,218,236,237,238,239,240,241,259,164,165,174,171,173,175,176,177,178,179,166,167,208,210,211,168,201,202,203,205,206,207,219,220,242,243,244,245,246,247,254,256,261,262,264,265,221,248,249,250,251,252,253,255,260,266,222,223\"},\"IP::\":\"0.0.0.0\"}', '[{\"id\":\"1\",\"title\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"1\",\"rules\":\"6,96,200,20,1,2,3,4,5,64,263,128,129,130,133,134,135,136,185,137,138,139,140,141,142,21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,169,104,105,106,107,108,118,126,152,127,143,144,145,146,159,184,190,195,216,224,225,226,227,228,229,257,217,230,231,232,233,234,235,258,218,236,237,238,239,240,241,259,164,165,174,171,173,175,176,177,178,179,166,167,208,210,211,168,201,202,203,205,206,207,219,220,242,243,244,245,246,247,254,256,261,262,264,265,221,248,249,250,251,252,253,255,260,222,223\"}]', '1508768634', '');
INSERT INTO `log` VALUES ('32', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508768641', '');
INSERT INTO `log` VALUES ('33', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508769232', '');
INSERT INTO `log` VALUES ('34', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508769258', '');
INSERT INTO `log` VALUES ('35', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508770094', '');
INSERT INTO `log` VALUES ('36', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508770784', '');
INSERT INTO `log` VALUES ('37', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508771169', '');
INSERT INTO `log` VALUES ('38', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772044', '');
INSERT INTO `log` VALUES ('39', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772046', '');
INSERT INTO `log` VALUES ('40', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"5\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2030\",\"stationcode\":\"1010\",\"_id\":\"1\",\"ticketnum\":\"5\",\"moneynum\":\"7\",\"unit\":\"1010\",\"description\":\"\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\"},\"IP::\":\"0.0.0.0\"}', '', '1508772072', '');
INSERT INTO `log` VALUES ('41', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"6\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2020\",\"stationcode\":\"1010\",\"_id\":\"2\",\"ticketnum\":\"6\",\"moneynum\":\"8\",\"unit\":\"1010\",\"description\":\"\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\"},\"IP::\":\"0.0.0.0\"}', '', '1508772072', '');
INSERT INTO `log` VALUES ('42', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"7\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2010\",\"stationcode\":\"1010\",\"_id\":\"3\",\"ticketnum\":\"7\",\"moneynum\":\"78\",\"unit\":\"1010\",\"description\":\"\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\"},\"IP::\":\"0.0.0.0\"}', '', '1508772072', '');
INSERT INTO `log` VALUES ('43', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"8\",\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"1010\",\"stationcode\":\"1010\",\"_id\":\"4\",\"ticketnum\":\"82\",\"moneynum\":\"678586.00\",\"unit\":\"1010\",\"description\":\"\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\"},\"IP::\":\"0.0.0.0\"}', '', '1508772072', '');
INSERT INTO `log` VALUES ('44', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772072', '');
INSERT INTO `log` VALUES ('45', 'admin', 'DELETE', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"0\":{\"id\":\"8\",\"channelcode\":\"1010\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"82\",\"moneynum\":\"678586\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"},\"isdel\":1,\"deluserid\":\"88\",\"deldate\":\"2017-10-23 23:21:50\"},\"IP::\":\"0.0.0.0\"}', '', '1508772110', '');
INSERT INTO `log` VALUES ('46', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772111', '');
INSERT INTO `log` VALUES ('47', 'admin', 'DELETE', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"0\":{\"id\":\"7\",\"channelcode\":\"2010\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"7\",\"moneynum\":\"78\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"},\"isdel\":1,\"deluserid\":\"88\",\"deldate\":\"2017-10-23 23:22:02\"},\"IP::\":\"0.0.0.0\"}', '', '1508772122', '');
INSERT INTO `log` VALUES ('48', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772122', '');
INSERT INTO `log` VALUES ('49', 'admin', 'DELETE', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"0\":{\"id\":\"6\",\"channelcode\":\"2020\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"6\",\"moneynum\":\"8\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"},\"isdel\":1,\"deluserid\":\"88\",\"deldate\":\"2017-10-23 23:22:06\"},\"IP::\":\"0.0.0.0\"}', '', '1508772126', '');
INSERT INTO `log` VALUES ('50', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772127', '');
INSERT INTO `log` VALUES ('51', 'admin', 'DELETE', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"0\":{\"id\":\"5\",\"channelcode\":\"2030\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"5\",\"moneynum\":\"7\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:21:12\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"},\"isdel\":1,\"deluserid\":\"88\",\"deldate\":\"2017-10-23 23:22:10\"},\"IP::\":\"0.0.0.0\"}', '', '1508772130', '');
INSERT INTO `log` VALUES ('52', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772130', '');
INSERT INTO `log` VALUES ('53', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772305', '');
INSERT INTO `log` VALUES ('54', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772389', '');
INSERT INTO `log` VALUES ('55', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772391', '');
INSERT INTO `log` VALUES ('56', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772441', '');
INSERT INTO `log` VALUES ('57', 'admin', 'MODIFY', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2030\",\"stationcode\":\"1010\",\"id\":\"1\",\"ticketnum\":\"6\",\"moneynum\":\"7\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5111\",\"updateuserid\":\"88\",\"updatedate\":\"2017-10-23 23:27:53\"},\"IP::\":\"0.0.0.0\"}', '[{\"id\":\"1\",\"channelcode\":\"2030\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"5\",\"moneynum\":\"7\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"}]', '1508772473', '');
INSERT INTO `log` VALUES ('58', 'admin', 'MODIFY', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2020\",\"stationcode\":\"1010\",\"id\":\"2\",\"ticketnum\":\"6\",\"moneynum\":\"8\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5111\",\"updateuserid\":\"88\",\"updatedate\":\"2017-10-23 23:27:53\"},\"IP::\":\"0.0.0.0\"}', '[{\"id\":\"2\",\"channelcode\":\"2020\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"6\",\"moneynum\":\"8\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"}]', '1508772473', '');
INSERT INTO `log` VALUES ('59', 'admin', 'MODIFY', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"2010\",\"stationcode\":\"1010\",\"id\":\"3\",\"ticketnum\":\"6\",\"moneynum\":\"78\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5111\",\"updateuserid\":\"88\",\"updatedate\":\"2017-10-23 23:27:53\"},\"IP::\":\"0.0.0.0\"}', '[{\"id\":\"3\",\"channelcode\":\"2010\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"7\",\"moneynum\":\"78\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"}]', '1508772473', '');
INSERT INTO `log` VALUES ('60', 'admin', 'MODIFY', 'SalesFlow', '88', '{\"Result::\":1,\"Data::\":{\"flowdate\":\"2017-10-23\",\"groupnum\":\"20171023\",\"channelcode\":\"1010\",\"stationcode\":\"1010\",\"id\":\"4\",\"ticketnum\":\"123481\",\"moneynum\":\"678586.00\",\"unit\":\"1010\",\"description\":\"\\u6d4b\\u8bd5111\",\"updateuserid\":\"88\",\"updatedate\":\"2017-10-23 23:27:53\"},\"IP::\":\"0.0.0.0\"}', '[{\"id\":\"4\",\"channelcode\":\"1010\",\"stationcode\":\"1010\",\"groupnum\":\"20171023\",\"ticketnum\":\"1216\",\"moneynum\":\"678586\",\"unit\":\"1010\",\"flowdate\":\"2017-10-23 00:00:00\",\"description\":\"\\u6d4b\\u8bd5\\uff01\",\"createuserid\":\"88\",\"createdate\":\"2017-10-23 17:59:28\",\"updateuserid\":null,\"updatedate\":null,\"deluserid\":null,\"deldate\":null,\"isdel\":\"0\"}]', '1508772473', '');
INSERT INTO `log` VALUES ('61', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772473', '');
INSERT INTO `log` VALUES ('62', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"9\",\"Data::\":{\"flowdate\":\"2017-10-01\",\"groupnum\":\"20171001\",\"channelcode\":\"2030\",\"stationcode\":\"1010\",\"ticketnum\":\"6\",\"moneynum\":\"1\",\"unit\":\"1010\",\"description\":\".\\u3002\\u3002\\u3002\\u3002\\u3002\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:30:59\"},\"IP::\":\"0.0.0.0\"}', '', '1508772659', '');
INSERT INTO `log` VALUES ('63', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"10\",\"Data::\":{\"flowdate\":\"2017-10-01\",\"groupnum\":\"20171001\",\"channelcode\":\"2020\",\"stationcode\":\"1010\",\"ticketnum\":\"7\",\"moneynum\":\"2\",\"unit\":\"1010\",\"description\":\".\\u3002\\u3002\\u3002\\u3002\\u3002\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:30:59\"},\"IP::\":\"0.0.0.0\"}', '', '1508772659', '');
INSERT INTO `log` VALUES ('64', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"11\",\"Data::\":{\"flowdate\":\"2017-10-01\",\"groupnum\":\"20171001\",\"channelcode\":\"2010\",\"stationcode\":\"1010\",\"ticketnum\":\"8\",\"moneynum\":\"3\",\"unit\":\"1010\",\"description\":\".\\u3002\\u3002\\u3002\\u3002\\u3002\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:30:59\"},\"IP::\":\"0.0.0.0\"}', '', '1508772659', '');
INSERT INTO `log` VALUES ('65', 'admin', 'ADD', 'SalesFlow', '88', '{\"Result::\":\"12\",\"Data::\":{\"flowdate\":\"2017-10-01\",\"groupnum\":\"20171001\",\"channelcode\":\"1010\",\"stationcode\":\"1010\",\"ticketnum\":\"23435\",\"moneynum\":\"56783.00\",\"unit\":\"1010\",\"description\":\".\\u3002\\u3002\\u3002\\u3002\\u3002\",\"isdel\":0,\"createuserid\":\"88\",\"createdate\":\"2017-10-23 23:30:59\"},\"IP::\":\"0.0.0.0\"}', '', '1508772659', '');
INSERT INTO `log` VALUES ('66', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772659', '');
INSERT INTO `log` VALUES ('67', 'admin', 'Log', 'SalesFlow', '88', '{\"Result::\":true,\"Data::\":\"\",\"IP::\":\"0.0.0.0\"}', '', '1508772750', '');

-- ----------------------------
-- Table structure for oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user`;
CREATE TABLE `oauth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的本站用户id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1：融云   2：友盟',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'access_token token',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8 COMMENT='第三方用户关联表（未使用）';

-- ----------------------------
-- Records of oauth_user
-- ----------------------------
INSERT INTO `oauth_user` VALUES ('671', '88', '2', '白俊遥', '', '', 'k2232R1tBYJ232XJQelszNuV2tlzgsdj9m8A6JtRJXMtM2tfOffQP3U0qNG5zL2qnw9Envm4TqeJtIbMjwAZYMaLjnXw==', '1457693930', '1457693930');
INSERT INTO `oauth_user` VALUES ('682', '88', '1', 'admin', 'http://bjyadmin.com/Upload/avatar/user1.jpg', '', 'U8IQ2WNHEO2GWUI5DBKrdSQmKe0yMO+J4U8bCkk5sypUTfI76qou2KKL6uzeqp+0KfzWsqxlwp+yjyGI3e3g6w==', '1469453417', '1469453417');

-- ----------------------------
-- Table structure for orgnazation
-- ----------------------------
DROP TABLE IF EXISTS `orgnazation`;
CREATE TABLE `orgnazation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织机构主键',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父节点编码',
  `org_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构名称',
  `org_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构编码（系统）',
  `org_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构代码',
  `org_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构类别（关联字典表）',
  `org_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构描述',
  `org_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构住址',
  `org_tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `org_man` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `sortnum` int(11) DEFAULT NULL COMMENT '排序',
  `isuse` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='机构信息表';

-- ----------------------------
-- Records of orgnazation
-- ----------------------------
INSERT INTO `orgnazation` VALUES ('1', '0', '默认机构', '01', '5665321-84', '0101', '系统默认机构', '昆明市北市区', '0871-65322222', '杨', '1', '1');
INSERT INTO `orgnazation` VALUES ('2', '0', 'XXX科技公司', '02', '3465468-8', '0101', 'xxxxx', 'XXXXX', '24123534656', '乌特热', '2', '1');
INSERT INTO `orgnazation` VALUES ('4', '1', '机构一', '01001', '2342345345', '0102', '23534', '34534', '3452345', '3245345', '1', '1');
INSERT INTO `orgnazation` VALUES ('5', '1', '机构二', '01002', '234234235', '0199', '345345', '345345', '65768', '礼金卡', '2', '1');
INSERT INTO `orgnazation` VALUES ('6', '1', '机构三', '01003', '870980890', '0101', '346546', '096723', '35435646', '户籍科', '3', '1');
INSERT INTO `orgnazation` VALUES ('7', '0', '大理XXX科技', '03', '5765878', '0101', '规划局规划局', '法规监管和', '165437438', '风格化', '3', '1');
INSERT INTO `orgnazation` VALUES ('8', '2', '昆明分公司', '02001', '7484564654', '0101', '是多个地方', '的非官方', '68763545643646', '复旦光华', '1', '1');
INSERT INTO `orgnazation` VALUES ('9', '7', '大理XXX科技分公司一', '03001', '434354365', '0101', '三大股东分红的', '艰苦劳动投入', '2635465465', 'ioip', '1', '1');
INSERT INTO `orgnazation` VALUES ('10', '1', '机构四', '01004', '046464654', '0101', '手段', '的速度发货', '1654654654654', '微软', '4', '1');
INSERT INTO `orgnazation` VALUES ('11', '2', '玉溪分公司', '02002', '1354645', '0101', '额太惹眼', '图样图', '146546546546', '规划他', '2', '1');
INSERT INTO `orgnazation` VALUES ('12', '0', '昆明WWW集团', '04', '56542546356', '0199', '头发都很高', '哦i；了，表vj', '135464564165456', '法德图', '4', '1');
INSERT INTO `orgnazation` VALUES ('13', '0', '你看啊集团', '05', '436464654654', '0101', '啦开机动画', '快递员', '16543487897485', '啊上的肥肉', '5', '1');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位主键',
  `org_id` int(11) NOT NULL COMMENT '所属机构编码',
  `dept_id` int(11) NOT NULL COMMENT '所属部门编码',
  `p_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `p_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '岗位描述',
  `p_level` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '岗位级别（字典表）',
  `sortnum` int(11) DEFAULT NULL COMMENT '排序键',
  `isuse` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '1', '1', '人事专员', '人事职责', '0601', '1', '1');
INSERT INTO `position` VALUES ('2', '1', '0', '默认岗位', '职责......', '0601', '0', '1');
INSERT INTO `position` VALUES ('3', '2', '4', '初级程序员A', '代码/项目/文档', '0601', '1', '1');
INSERT INTO `position` VALUES ('4', '2', '4', '初级程序员B', 'B', '0602', '2', '1');

-- ----------------------------
-- Table structure for province_city_area
-- ----------------------------
DROP TABLE IF EXISTS `province_city_area`;
CREATE TABLE `province_city_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '城市名',
  `areacode` varchar(50) DEFAULT NULL COMMENT '行政区划代码',
  `sortnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3511 DEFAULT CHARSET=utf8 COMMENT='城市信息';

-- ----------------------------
-- Records of province_city_area
-- ----------------------------
INSERT INTO `province_city_area` VALUES ('1', '0', '北京', null, null);
INSERT INTO `province_city_area` VALUES ('2', '1', '北京市辖', null, null);
INSERT INTO `province_city_area` VALUES ('3', '2', '东城区', null, null);
INSERT INTO `province_city_area` VALUES ('4', '2', '西城区', null, null);
INSERT INTO `province_city_area` VALUES ('5', '2', '崇文区', null, null);
INSERT INTO `province_city_area` VALUES ('6', '2', '宣武区', null, null);
INSERT INTO `province_city_area` VALUES ('7', '2', '朝阳区', null, null);
INSERT INTO `province_city_area` VALUES ('8', '2', '丰台区', null, null);
INSERT INTO `province_city_area` VALUES ('9', '2', '石景山区', null, null);
INSERT INTO `province_city_area` VALUES ('10', '2', '海淀区', null, null);
INSERT INTO `province_city_area` VALUES ('11', '2', '门头沟区', null, null);
INSERT INTO `province_city_area` VALUES ('12', '2', '房山区', null, null);
INSERT INTO `province_city_area` VALUES ('13', '2', '通州区', null, null);
INSERT INTO `province_city_area` VALUES ('14', '2', '顺义区', null, null);
INSERT INTO `province_city_area` VALUES ('15', '2', '昌平区', null, null);
INSERT INTO `province_city_area` VALUES ('16', '1', '北京县辖', null, null);
INSERT INTO `province_city_area` VALUES ('17', '16', '大兴县', null, null);
INSERT INTO `province_city_area` VALUES ('18', '16', '平谷县', null, null);
INSERT INTO `province_city_area` VALUES ('19', '16', '怀柔县', null, null);
INSERT INTO `province_city_area` VALUES ('20', '16', '密云县', null, null);
INSERT INTO `province_city_area` VALUES ('21', '16', '延庆县', null, null);
INSERT INTO `province_city_area` VALUES ('22', '0', '天津', null, null);
INSERT INTO `province_city_area` VALUES ('23', '22', '天津市辖', null, null);
INSERT INTO `province_city_area` VALUES ('24', '23', '和平区', null, null);
INSERT INTO `province_city_area` VALUES ('25', '23', '河东区', null, null);
INSERT INTO `province_city_area` VALUES ('26', '23', '河西区', null, null);
INSERT INTO `province_city_area` VALUES ('27', '23', '南开区', null, null);
INSERT INTO `province_city_area` VALUES ('28', '23', '河北区', null, null);
INSERT INTO `province_city_area` VALUES ('29', '23', '红桥区', null, null);
INSERT INTO `province_city_area` VALUES ('30', '23', '塘沽区', null, null);
INSERT INTO `province_city_area` VALUES ('31', '23', '汉沽区', null, null);
INSERT INTO `province_city_area` VALUES ('32', '23', '大港区', null, null);
INSERT INTO `province_city_area` VALUES ('33', '23', '东丽区', null, null);
INSERT INTO `province_city_area` VALUES ('34', '23', '西青区', null, null);
INSERT INTO `province_city_area` VALUES ('35', '23', '津南区', null, null);
INSERT INTO `province_city_area` VALUES ('36', '23', '北辰区', null, null);
INSERT INTO `province_city_area` VALUES ('37', '23', '武清区', null, null);
INSERT INTO `province_city_area` VALUES ('38', '22', '天津县辖', null, null);
INSERT INTO `province_city_area` VALUES ('39', '38', '宁河县', null, null);
INSERT INTO `province_city_area` VALUES ('40', '38', '静海县', null, null);
INSERT INTO `province_city_area` VALUES ('41', '38', '宝坻县', null, null);
INSERT INTO `province_city_area` VALUES ('42', '38', '蓟  县', null, null);
INSERT INTO `province_city_area` VALUES ('43', '0', '河北', null, null);
INSERT INTO `province_city_area` VALUES ('44', '43', '石家庄', null, null);
INSERT INTO `province_city_area` VALUES ('45', '44', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('46', '44', '长安区', null, null);
INSERT INTO `province_city_area` VALUES ('47', '44', '桥东区', null, null);
INSERT INTO `province_city_area` VALUES ('48', '44', '桥西区', null, null);
INSERT INTO `province_city_area` VALUES ('49', '44', '新华区', null, null);
INSERT INTO `province_city_area` VALUES ('50', '44', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('51', '44', '井陉矿区', null, null);
INSERT INTO `province_city_area` VALUES ('52', '44', '井陉县', null, null);
INSERT INTO `province_city_area` VALUES ('53', '44', '正定县', null, null);
INSERT INTO `province_city_area` VALUES ('54', '44', '栾城县', null, null);
INSERT INTO `province_city_area` VALUES ('55', '44', '行唐县', null, null);
INSERT INTO `province_city_area` VALUES ('56', '44', '灵寿县', null, null);
INSERT INTO `province_city_area` VALUES ('57', '44', '高邑县', null, null);
INSERT INTO `province_city_area` VALUES ('58', '44', '深泽县', null, null);
INSERT INTO `province_city_area` VALUES ('59', '44', '赞皇县', null, null);
INSERT INTO `province_city_area` VALUES ('60', '44', '无极县', null, null);
INSERT INTO `province_city_area` VALUES ('61', '44', '平山县', null, null);
INSERT INTO `province_city_area` VALUES ('62', '44', '元氏县', null, null);
INSERT INTO `province_city_area` VALUES ('63', '44', '赵  县', null, null);
INSERT INTO `province_city_area` VALUES ('64', '44', '辛集市', null, null);
INSERT INTO `province_city_area` VALUES ('65', '44', '藁城市', null, null);
INSERT INTO `province_city_area` VALUES ('66', '44', '晋州市', null, null);
INSERT INTO `province_city_area` VALUES ('67', '44', '新乐市', null, null);
INSERT INTO `province_city_area` VALUES ('68', '44', '鹿泉市', null, null);
INSERT INTO `province_city_area` VALUES ('69', '43', '唐山', null, null);
INSERT INTO `province_city_area` VALUES ('70', '69', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('71', '69', '路南区', null, null);
INSERT INTO `province_city_area` VALUES ('72', '69', '路北区', null, null);
INSERT INTO `province_city_area` VALUES ('73', '69', '古冶区', null, null);
INSERT INTO `province_city_area` VALUES ('74', '69', '开平区', null, null);
INSERT INTO `province_city_area` VALUES ('75', '69', '新  区', null, null);
INSERT INTO `province_city_area` VALUES ('76', '69', '丰润县', null, null);
INSERT INTO `province_city_area` VALUES ('77', '69', '滦  县', null, null);
INSERT INTO `province_city_area` VALUES ('78', '69', '滦南县', null, null);
INSERT INTO `province_city_area` VALUES ('79', '69', '乐亭县', null, null);
INSERT INTO `province_city_area` VALUES ('80', '69', '迁西县', null, null);
INSERT INTO `province_city_area` VALUES ('81', '69', '玉田县', null, null);
INSERT INTO `province_city_area` VALUES ('82', '69', '唐海县', null, null);
INSERT INTO `province_city_area` VALUES ('83', '69', '遵化市', null, null);
INSERT INTO `province_city_area` VALUES ('84', '69', '丰南市', null, null);
INSERT INTO `province_city_area` VALUES ('85', '69', '迁安市', null, null);
INSERT INTO `province_city_area` VALUES ('86', '43', '秦皇岛', null, null);
INSERT INTO `province_city_area` VALUES ('87', '86', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('88', '86', '海港区', null, null);
INSERT INTO `province_city_area` VALUES ('89', '86', '山海关区', null, null);
INSERT INTO `province_city_area` VALUES ('90', '86', '北戴河区', null, null);
INSERT INTO `province_city_area` VALUES ('91', '86', '青龙满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('92', '86', '昌黎县', null, null);
INSERT INTO `province_city_area` VALUES ('93', '86', '抚宁县', null, null);
INSERT INTO `province_city_area` VALUES ('94', '86', '卢龙县', null, null);
INSERT INTO `province_city_area` VALUES ('95', '43', '邯郸', null, null);
INSERT INTO `province_city_area` VALUES ('96', '95', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('97', '95', '邯山区', null, null);
INSERT INTO `province_city_area` VALUES ('98', '95', '丛台区', null, null);
INSERT INTO `province_city_area` VALUES ('99', '95', '复兴区', null, null);
INSERT INTO `province_city_area` VALUES ('100', '95', '峰峰矿区', null, null);
INSERT INTO `province_city_area` VALUES ('101', '95', '邯郸县', null, null);
INSERT INTO `province_city_area` VALUES ('102', '95', '临漳县', null, null);
INSERT INTO `province_city_area` VALUES ('103', '95', '成安县', null, null);
INSERT INTO `province_city_area` VALUES ('104', '95', '大名县', null, null);
INSERT INTO `province_city_area` VALUES ('105', '95', '涉  县', null, null);
INSERT INTO `province_city_area` VALUES ('106', '95', '磁  县', null, null);
INSERT INTO `province_city_area` VALUES ('107', '95', '肥乡县', null, null);
INSERT INTO `province_city_area` VALUES ('108', '95', '永年县', null, null);
INSERT INTO `province_city_area` VALUES ('109', '95', '邱  县', null, null);
INSERT INTO `province_city_area` VALUES ('110', '95', '鸡泽县', null, null);
INSERT INTO `province_city_area` VALUES ('111', '95', '广平县', null, null);
INSERT INTO `province_city_area` VALUES ('112', '95', '馆陶县', null, null);
INSERT INTO `province_city_area` VALUES ('113', '95', '魏  县', null, null);
INSERT INTO `province_city_area` VALUES ('114', '95', '曲周县', null, null);
INSERT INTO `province_city_area` VALUES ('115', '95', '武安市', null, null);
INSERT INTO `province_city_area` VALUES ('116', '43', '邢台', null, null);
INSERT INTO `province_city_area` VALUES ('117', '116', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('118', '116', '桥东区', null, null);
INSERT INTO `province_city_area` VALUES ('119', '116', '桥西区', null, null);
INSERT INTO `province_city_area` VALUES ('120', '116', '邢台县', null, null);
INSERT INTO `province_city_area` VALUES ('121', '116', '临城县', null, null);
INSERT INTO `province_city_area` VALUES ('122', '116', '内丘县', null, null);
INSERT INTO `province_city_area` VALUES ('123', '116', '柏乡县', null, null);
INSERT INTO `province_city_area` VALUES ('124', '116', '隆尧县', null, null);
INSERT INTO `province_city_area` VALUES ('125', '116', '任  县', null, null);
INSERT INTO `province_city_area` VALUES ('126', '116', '南和县', null, null);
INSERT INTO `province_city_area` VALUES ('127', '116', '宁晋县', null, null);
INSERT INTO `province_city_area` VALUES ('128', '116', '巨鹿县', null, null);
INSERT INTO `province_city_area` VALUES ('129', '116', '新河县', null, null);
INSERT INTO `province_city_area` VALUES ('130', '116', '广宗县', null, null);
INSERT INTO `province_city_area` VALUES ('131', '116', '平乡县', null, null);
INSERT INTO `province_city_area` VALUES ('132', '116', '威  县', null, null);
INSERT INTO `province_city_area` VALUES ('133', '116', '清河县', null, null);
INSERT INTO `province_city_area` VALUES ('134', '116', '临西县', null, null);
INSERT INTO `province_city_area` VALUES ('135', '116', '南宫市', null, null);
INSERT INTO `province_city_area` VALUES ('136', '116', '沙河市', null, null);
INSERT INTO `province_city_area` VALUES ('137', '43', '保定', null, null);
INSERT INTO `province_city_area` VALUES ('138', '137', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('139', '137', '新市区', null, null);
INSERT INTO `province_city_area` VALUES ('140', '137', '北市区', null, null);
INSERT INTO `province_city_area` VALUES ('141', '137', '南市区', null, null);
INSERT INTO `province_city_area` VALUES ('142', '137', '满城县', null, null);
INSERT INTO `province_city_area` VALUES ('143', '137', '清苑县', null, null);
INSERT INTO `province_city_area` VALUES ('144', '137', '涞水县', null, null);
INSERT INTO `province_city_area` VALUES ('145', '137', '阜平县', null, null);
INSERT INTO `province_city_area` VALUES ('146', '137', '徐水县', null, null);
INSERT INTO `province_city_area` VALUES ('147', '137', '定兴县', null, null);
INSERT INTO `province_city_area` VALUES ('148', '137', '唐  县', null, null);
INSERT INTO `province_city_area` VALUES ('149', '137', '高阳县', null, null);
INSERT INTO `province_city_area` VALUES ('150', '137', '容城县', null, null);
INSERT INTO `province_city_area` VALUES ('151', '137', '涞源县', null, null);
INSERT INTO `province_city_area` VALUES ('152', '137', '望都县', null, null);
INSERT INTO `province_city_area` VALUES ('153', '137', '安新县', null, null);
INSERT INTO `province_city_area` VALUES ('154', '137', '易  县', null, null);
INSERT INTO `province_city_area` VALUES ('155', '137', '曲阳县', null, null);
INSERT INTO `province_city_area` VALUES ('156', '137', '蠡  县', null, null);
INSERT INTO `province_city_area` VALUES ('157', '137', '顺平县', null, null);
INSERT INTO `province_city_area` VALUES ('158', '137', '博野县', null, null);
INSERT INTO `province_city_area` VALUES ('159', '137', '雄  县', null, null);
INSERT INTO `province_city_area` VALUES ('160', '137', '涿州市', null, null);
INSERT INTO `province_city_area` VALUES ('161', '137', '定州市', null, null);
INSERT INTO `province_city_area` VALUES ('162', '137', '安国市', null, null);
INSERT INTO `province_city_area` VALUES ('163', '137', '高碑店市', null, null);
INSERT INTO `province_city_area` VALUES ('164', '43', '张家口', null, null);
INSERT INTO `province_city_area` VALUES ('165', '164', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('166', '164', '桥东区', null, null);
INSERT INTO `province_city_area` VALUES ('167', '164', '桥西区', null, null);
INSERT INTO `province_city_area` VALUES ('168', '164', '宣化区', null, null);
INSERT INTO `province_city_area` VALUES ('169', '164', '下花园区', null, null);
INSERT INTO `province_city_area` VALUES ('170', '164', '宣化县', null, null);
INSERT INTO `province_city_area` VALUES ('171', '164', '张北县', null, null);
INSERT INTO `province_city_area` VALUES ('172', '164', '康保县', null, null);
INSERT INTO `province_city_area` VALUES ('173', '164', '沽源县', null, null);
INSERT INTO `province_city_area` VALUES ('174', '164', '尚义县', null, null);
INSERT INTO `province_city_area` VALUES ('175', '164', '蔚  县', null, null);
INSERT INTO `province_city_area` VALUES ('176', '164', '阳原县', null, null);
INSERT INTO `province_city_area` VALUES ('177', '164', '怀安县', null, null);
INSERT INTO `province_city_area` VALUES ('178', '164', '万全县', null, null);
INSERT INTO `province_city_area` VALUES ('179', '164', '怀来县', null, null);
INSERT INTO `province_city_area` VALUES ('180', '164', '涿鹿县', null, null);
INSERT INTO `province_city_area` VALUES ('181', '164', '赤城县', null, null);
INSERT INTO `province_city_area` VALUES ('182', '164', '崇礼县', null, null);
INSERT INTO `province_city_area` VALUES ('183', '43', '承德', null, null);
INSERT INTO `province_city_area` VALUES ('184', '183', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('185', '183', '双桥区', null, null);
INSERT INTO `province_city_area` VALUES ('186', '183', '双滦区', null, null);
INSERT INTO `province_city_area` VALUES ('187', '183', '鹰手营子矿区', null, null);
INSERT INTO `province_city_area` VALUES ('188', '183', '承德县', null, null);
INSERT INTO `province_city_area` VALUES ('189', '183', '兴隆县', null, null);
INSERT INTO `province_city_area` VALUES ('190', '183', '平泉县', null, null);
INSERT INTO `province_city_area` VALUES ('191', '183', '滦平县', null, null);
INSERT INTO `province_city_area` VALUES ('192', '183', '隆化县', null, null);
INSERT INTO `province_city_area` VALUES ('193', '183', '丰宁满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('194', '183', '宽城满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('196', '43', '沧州', null, null);
INSERT INTO `province_city_area` VALUES ('197', '196', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('198', '196', '新华区', null, null);
INSERT INTO `province_city_area` VALUES ('199', '196', '运河区', null, null);
INSERT INTO `province_city_area` VALUES ('200', '196', '沧  县', null, null);
INSERT INTO `province_city_area` VALUES ('201', '196', '青  县', null, null);
INSERT INTO `province_city_area` VALUES ('202', '196', '东光县', null, null);
INSERT INTO `province_city_area` VALUES ('203', '196', '海兴县', null, null);
INSERT INTO `province_city_area` VALUES ('204', '196', '盐山县', null, null);
INSERT INTO `province_city_area` VALUES ('205', '196', '肃宁县', null, null);
INSERT INTO `province_city_area` VALUES ('206', '196', '南皮县', null, null);
INSERT INTO `province_city_area` VALUES ('207', '196', '吴桥县', null, null);
INSERT INTO `province_city_area` VALUES ('208', '196', '献  县', null, null);
INSERT INTO `province_city_area` VALUES ('209', '196', '孟村回族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('210', '196', '泊头市', null, null);
INSERT INTO `province_city_area` VALUES ('211', '196', '任丘市', null, null);
INSERT INTO `province_city_area` VALUES ('212', '196', '黄骅市', null, null);
INSERT INTO `province_city_area` VALUES ('213', '196', '河间市', null, null);
INSERT INTO `province_city_area` VALUES ('214', '43', '廊坊', null, null);
INSERT INTO `province_city_area` VALUES ('215', '214', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('216', '214', '安次区', null, null);
INSERT INTO `province_city_area` VALUES ('217', '214', '廊坊市广阳区', null, null);
INSERT INTO `province_city_area` VALUES ('218', '214', '固安县', null, null);
INSERT INTO `province_city_area` VALUES ('219', '214', '永清县', null, null);
INSERT INTO `province_city_area` VALUES ('220', '214', '香河县', null, null);
INSERT INTO `province_city_area` VALUES ('221', '214', '大城县', null, null);
INSERT INTO `province_city_area` VALUES ('222', '214', '文安县', null, null);
INSERT INTO `province_city_area` VALUES ('223', '214', '大厂回族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('224', '214', '霸州市', null, null);
INSERT INTO `province_city_area` VALUES ('225', '214', '三河市', null, null);
INSERT INTO `province_city_area` VALUES ('226', '43', '衡水', null, null);
INSERT INTO `province_city_area` VALUES ('227', '226', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('228', '226', '桃城区', null, null);
INSERT INTO `province_city_area` VALUES ('229', '226', '枣强县', null, null);
INSERT INTO `province_city_area` VALUES ('230', '226', '武邑县', null, null);
INSERT INTO `province_city_area` VALUES ('231', '226', '武强县', null, null);
INSERT INTO `province_city_area` VALUES ('232', '226', '饶阳县', null, null);
INSERT INTO `province_city_area` VALUES ('233', '226', '安平县', null, null);
INSERT INTO `province_city_area` VALUES ('234', '226', '故城县', null, null);
INSERT INTO `province_city_area` VALUES ('235', '226', '景  县', null, null);
INSERT INTO `province_city_area` VALUES ('236', '226', '阜城县', null, null);
INSERT INTO `province_city_area` VALUES ('237', '226', '冀州市', null, null);
INSERT INTO `province_city_area` VALUES ('238', '226', '深州市', null, null);
INSERT INTO `province_city_area` VALUES ('239', '0', '山西', null, null);
INSERT INTO `province_city_area` VALUES ('240', '239', '太原', null, null);
INSERT INTO `province_city_area` VALUES ('241', '240', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('242', '240', '小店区', null, null);
INSERT INTO `province_city_area` VALUES ('243', '240', '迎泽区', null, null);
INSERT INTO `province_city_area` VALUES ('244', '240', '杏花岭区', null, null);
INSERT INTO `province_city_area` VALUES ('245', '240', '尖草坪区', null, null);
INSERT INTO `province_city_area` VALUES ('246', '240', '万柏林区', null, null);
INSERT INTO `province_city_area` VALUES ('247', '240', '晋源区', null, null);
INSERT INTO `province_city_area` VALUES ('248', '240', '清徐县', null, null);
INSERT INTO `province_city_area` VALUES ('249', '240', '阳曲县', null, null);
INSERT INTO `province_city_area` VALUES ('250', '240', '娄烦县', null, null);
INSERT INTO `province_city_area` VALUES ('251', '240', '古交市', null, null);
INSERT INTO `province_city_area` VALUES ('252', '239', '大同', null, null);
INSERT INTO `province_city_area` VALUES ('253', '252', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('254', '252', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('255', '252', '矿  区', null, null);
INSERT INTO `province_city_area` VALUES ('256', '252', '南郊区', null, null);
INSERT INTO `province_city_area` VALUES ('257', '252', '新荣区', null, null);
INSERT INTO `province_city_area` VALUES ('258', '252', '阳高县', null, null);
INSERT INTO `province_city_area` VALUES ('259', '252', '天镇县', null, null);
INSERT INTO `province_city_area` VALUES ('260', '252', '广灵县', null, null);
INSERT INTO `province_city_area` VALUES ('261', '252', '灵丘县', null, null);
INSERT INTO `province_city_area` VALUES ('262', '252', '浑源县', null, null);
INSERT INTO `province_city_area` VALUES ('263', '252', '左云县', null, null);
INSERT INTO `province_city_area` VALUES ('264', '252', '大同县', null, null);
INSERT INTO `province_city_area` VALUES ('265', '239', '阳泉', null, null);
INSERT INTO `province_city_area` VALUES ('266', '265', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('267', '265', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('268', '265', '矿  区', null, null);
INSERT INTO `province_city_area` VALUES ('269', '265', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('270', '265', '平定县', null, null);
INSERT INTO `province_city_area` VALUES ('271', '265', '盂  县', null, null);
INSERT INTO `province_city_area` VALUES ('272', '239', '长治', null, null);
INSERT INTO `province_city_area` VALUES ('273', '272', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('274', '272', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('275', '272', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('276', '272', '长治县', null, null);
INSERT INTO `province_city_area` VALUES ('277', '272', '襄垣县', null, null);
INSERT INTO `province_city_area` VALUES ('278', '272', '屯留县', null, null);
INSERT INTO `province_city_area` VALUES ('279', '272', '平顺县', null, null);
INSERT INTO `province_city_area` VALUES ('280', '272', '黎城县', null, null);
INSERT INTO `province_city_area` VALUES ('281', '272', '壶关县', null, null);
INSERT INTO `province_city_area` VALUES ('282', '272', '长子县', null, null);
INSERT INTO `province_city_area` VALUES ('283', '272', '武乡县', null, null);
INSERT INTO `province_city_area` VALUES ('284', '272', '沁  县', null, null);
INSERT INTO `province_city_area` VALUES ('285', '272', '沁源县', null, null);
INSERT INTO `province_city_area` VALUES ('286', '272', '潞城市', null, null);
INSERT INTO `province_city_area` VALUES ('287', '239', '晋城', null, null);
INSERT INTO `province_city_area` VALUES ('288', '287', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('289', '287', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('290', '287', '沁水县', null, null);
INSERT INTO `province_city_area` VALUES ('291', '287', '阳城县', null, null);
INSERT INTO `province_city_area` VALUES ('292', '287', '陵川县', null, null);
INSERT INTO `province_city_area` VALUES ('293', '287', '泽州县', null, null);
INSERT INTO `province_city_area` VALUES ('294', '287', '高平市', null, null);
INSERT INTO `province_city_area` VALUES ('295', '239', '朔州', null, null);
INSERT INTO `province_city_area` VALUES ('296', '295', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('297', '295', '朔城区', null, null);
INSERT INTO `province_city_area` VALUES ('298', '295', '平鲁区', null, null);
INSERT INTO `province_city_area` VALUES ('299', '295', '山阴县', null, null);
INSERT INTO `province_city_area` VALUES ('300', '295', '应  县', null, null);
INSERT INTO `province_city_area` VALUES ('301', '295', '右玉县', null, null);
INSERT INTO `province_city_area` VALUES ('302', '295', '怀仁县', null, null);
INSERT INTO `province_city_area` VALUES ('303', '239', '晋中', null, null);
INSERT INTO `province_city_area` VALUES ('304', '303', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('305', '303', '榆次区', null, null);
INSERT INTO `province_city_area` VALUES ('306', '303', '榆社县', null, null);
INSERT INTO `province_city_area` VALUES ('307', '303', '左权县', null, null);
INSERT INTO `province_city_area` VALUES ('308', '303', '和顺县', null, null);
INSERT INTO `province_city_area` VALUES ('309', '303', '昔阳县', null, null);
INSERT INTO `province_city_area` VALUES ('310', '303', '寿阳县', null, null);
INSERT INTO `province_city_area` VALUES ('311', '303', '太谷县', null, null);
INSERT INTO `province_city_area` VALUES ('312', '303', '祁  县', null, null);
INSERT INTO `province_city_area` VALUES ('313', '303', '平遥县', null, null);
INSERT INTO `province_city_area` VALUES ('314', '303', '灵石县', null, null);
INSERT INTO `province_city_area` VALUES ('315', '303', '介休市', null, null);
INSERT INTO `province_city_area` VALUES ('316', '239', '运城', null, null);
INSERT INTO `province_city_area` VALUES ('317', '316', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('318', '316', '盐湖区', null, null);
INSERT INTO `province_city_area` VALUES ('319', '316', '临猗县', null, null);
INSERT INTO `province_city_area` VALUES ('320', '316', '万荣县', null, null);
INSERT INTO `province_city_area` VALUES ('321', '316', '闻喜县', null, null);
INSERT INTO `province_city_area` VALUES ('322', '316', '稷山县', null, null);
INSERT INTO `province_city_area` VALUES ('323', '316', '新绛县', null, null);
INSERT INTO `province_city_area` VALUES ('324', '316', '绛  县', null, null);
INSERT INTO `province_city_area` VALUES ('325', '316', '垣曲县', null, null);
INSERT INTO `province_city_area` VALUES ('326', '316', '夏  县', null, null);
INSERT INTO `province_city_area` VALUES ('327', '316', '平陆县', null, null);
INSERT INTO `province_city_area` VALUES ('328', '316', '芮城县', null, null);
INSERT INTO `province_city_area` VALUES ('329', '316', '永济市', null, null);
INSERT INTO `province_city_area` VALUES ('330', '316', '河津市', null, null);
INSERT INTO `province_city_area` VALUES ('331', '239', '忻州', null, null);
INSERT INTO `province_city_area` VALUES ('332', '331', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('333', '331', '忻府区', null, null);
INSERT INTO `province_city_area` VALUES ('334', '331', '定襄县', null, null);
INSERT INTO `province_city_area` VALUES ('335', '331', '五台县', null, null);
INSERT INTO `province_city_area` VALUES ('336', '331', '代  县', null, null);
INSERT INTO `province_city_area` VALUES ('337', '331', '繁峙县', null, null);
INSERT INTO `province_city_area` VALUES ('338', '331', '宁武县', null, null);
INSERT INTO `province_city_area` VALUES ('339', '331', '静乐县', null, null);
INSERT INTO `province_city_area` VALUES ('340', '331', '神池县', null, null);
INSERT INTO `province_city_area` VALUES ('341', '331', '五寨县', null, null);
INSERT INTO `province_city_area` VALUES ('342', '331', '岢岚县', null, null);
INSERT INTO `province_city_area` VALUES ('343', '331', '河曲县', null, null);
INSERT INTO `province_city_area` VALUES ('344', '331', '保德县', null, null);
INSERT INTO `province_city_area` VALUES ('345', '331', '偏关县', null, null);
INSERT INTO `province_city_area` VALUES ('346', '331', '原平市', null, null);
INSERT INTO `province_city_area` VALUES ('347', '239', '临汾', null, null);
INSERT INTO `province_city_area` VALUES ('348', '347', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('349', '347', '尧都区', null, null);
INSERT INTO `province_city_area` VALUES ('350', '347', '曲沃县', null, null);
INSERT INTO `province_city_area` VALUES ('351', '347', '翼城县', null, null);
INSERT INTO `province_city_area` VALUES ('352', '347', '襄汾县', null, null);
INSERT INTO `province_city_area` VALUES ('353', '347', '洪洞县', null, null);
INSERT INTO `province_city_area` VALUES ('354', '347', '古  县', null, null);
INSERT INTO `province_city_area` VALUES ('355', '347', '安泽县', null, null);
INSERT INTO `province_city_area` VALUES ('356', '347', '浮山县', null, null);
INSERT INTO `province_city_area` VALUES ('357', '347', '吉  县', null, null);
INSERT INTO `province_city_area` VALUES ('358', '347', '乡宁县', null, null);
INSERT INTO `province_city_area` VALUES ('359', '347', '大宁县', null, null);
INSERT INTO `province_city_area` VALUES ('360', '347', '隰  县', null, null);
INSERT INTO `province_city_area` VALUES ('361', '347', '永和县', null, null);
INSERT INTO `province_city_area` VALUES ('362', '347', '蒲  县', null, null);
INSERT INTO `province_city_area` VALUES ('363', '347', '汾西县', null, null);
INSERT INTO `province_city_area` VALUES ('364', '347', '侯马市', null, null);
INSERT INTO `province_city_area` VALUES ('365', '347', '霍州市', null, null);
INSERT INTO `province_city_area` VALUES ('366', '239', '吕梁地区', null, null);
INSERT INTO `province_city_area` VALUES ('367', '366', '孝义市', null, null);
INSERT INTO `province_city_area` VALUES ('368', '366', '离石市', null, null);
INSERT INTO `province_city_area` VALUES ('369', '366', '汾阳市', null, null);
INSERT INTO `province_city_area` VALUES ('370', '366', '文水县', null, null);
INSERT INTO `province_city_area` VALUES ('371', '366', '交城县', null, null);
INSERT INTO `province_city_area` VALUES ('372', '366', '兴  县', null, null);
INSERT INTO `province_city_area` VALUES ('373', '366', '临  县', null, null);
INSERT INTO `province_city_area` VALUES ('374', '366', '柳林县', null, null);
INSERT INTO `province_city_area` VALUES ('375', '366', '石楼县', null, null);
INSERT INTO `province_city_area` VALUES ('376', '366', '岚  县', null, null);
INSERT INTO `province_city_area` VALUES ('377', '366', '方山县', null, null);
INSERT INTO `province_city_area` VALUES ('378', '366', '中阳县', null, null);
INSERT INTO `province_city_area` VALUES ('379', '366', '交口县', null, null);
INSERT INTO `province_city_area` VALUES ('380', '0', '内蒙古', null, null);
INSERT INTO `province_city_area` VALUES ('381', '380', '呼和浩特', null, null);
INSERT INTO `province_city_area` VALUES ('382', '381', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('383', '381', '新城区', null, null);
INSERT INTO `province_city_area` VALUES ('384', '381', '回民区', null, null);
INSERT INTO `province_city_area` VALUES ('385', '381', '玉泉区', null, null);
INSERT INTO `province_city_area` VALUES ('386', '381', '赛罕区', null, null);
INSERT INTO `province_city_area` VALUES ('387', '381', '土默特左旗', null, null);
INSERT INTO `province_city_area` VALUES ('388', '381', '托克托县', null, null);
INSERT INTO `province_city_area` VALUES ('389', '381', '和林格尔县', null, null);
INSERT INTO `province_city_area` VALUES ('390', '381', '清水河县', null, null);
INSERT INTO `province_city_area` VALUES ('391', '381', '武川县', null, null);
INSERT INTO `province_city_area` VALUES ('392', '380', '包头', null, null);
INSERT INTO `province_city_area` VALUES ('393', '392', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('394', '392', '东河区', null, null);
INSERT INTO `province_city_area` VALUES ('395', '392', '昆都伦区', null, null);
INSERT INTO `province_city_area` VALUES ('396', '392', '青山区', null, null);
INSERT INTO `province_city_area` VALUES ('397', '392', '石拐区', null, null);
INSERT INTO `province_city_area` VALUES ('398', '392', '白云矿区', null, null);
INSERT INTO `province_city_area` VALUES ('399', '392', '九原区', null, null);
INSERT INTO `province_city_area` VALUES ('400', '392', '土默特右旗', null, null);
INSERT INTO `province_city_area` VALUES ('401', '392', '固阳县', null, null);
INSERT INTO `province_city_area` VALUES ('403', '380', '乌海', null, null);
INSERT INTO `province_city_area` VALUES ('404', '403', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('405', '403', '海勃湾区', null, null);
INSERT INTO `province_city_area` VALUES ('406', '403', '海南区', null, null);
INSERT INTO `province_city_area` VALUES ('407', '403', '乌达区', null, null);
INSERT INTO `province_city_area` VALUES ('408', '380', '赤峰', null, null);
INSERT INTO `province_city_area` VALUES ('409', '408', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('410', '408', '红山区', null, null);
INSERT INTO `province_city_area` VALUES ('411', '408', '元宝山区', null, null);
INSERT INTO `province_city_area` VALUES ('412', '408', '松山区', null, null);
INSERT INTO `province_city_area` VALUES ('413', '408', '阿鲁科尔沁旗', null, null);
INSERT INTO `province_city_area` VALUES ('414', '408', '巴林左旗', null, null);
INSERT INTO `province_city_area` VALUES ('415', '408', '巴林右旗', null, null);
INSERT INTO `province_city_area` VALUES ('416', '408', '林西县', null, null);
INSERT INTO `province_city_area` VALUES ('417', '408', '克什克腾旗', null, null);
INSERT INTO `province_city_area` VALUES ('418', '408', '翁牛特旗', null, null);
INSERT INTO `province_city_area` VALUES ('419', '408', '喀喇沁旗', null, null);
INSERT INTO `province_city_area` VALUES ('420', '408', '宁城县', null, null);
INSERT INTO `province_city_area` VALUES ('421', '408', '敖汉旗', null, null);
INSERT INTO `province_city_area` VALUES ('422', '380', '通辽', null, null);
INSERT INTO `province_city_area` VALUES ('423', '422', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('424', '422', '科尔沁区', null, null);
INSERT INTO `province_city_area` VALUES ('425', '422', '科尔沁左翼中旗', null, null);
INSERT INTO `province_city_area` VALUES ('426', '422', '科尔沁左翼后旗', null, null);
INSERT INTO `province_city_area` VALUES ('427', '422', '开鲁县', null, null);
INSERT INTO `province_city_area` VALUES ('428', '422', '库伦旗', null, null);
INSERT INTO `province_city_area` VALUES ('429', '422', '奈曼旗', null, null);
INSERT INTO `province_city_area` VALUES ('430', '422', '扎鲁特旗', null, null);
INSERT INTO `province_city_area` VALUES ('431', '422', '霍林郭勒市', null, null);
INSERT INTO `province_city_area` VALUES ('432', '380', '呼伦贝尔盟', null, null);
INSERT INTO `province_city_area` VALUES ('433', '432', '海拉尔市', null, null);
INSERT INTO `province_city_area` VALUES ('434', '432', '满洲里市', null, null);
INSERT INTO `province_city_area` VALUES ('435', '432', '扎兰屯市', null, null);
INSERT INTO `province_city_area` VALUES ('436', '432', '牙克石市', null, null);
INSERT INTO `province_city_area` VALUES ('437', '432', '根河市', null, null);
INSERT INTO `province_city_area` VALUES ('438', '432', '额尔古纳市', null, null);
INSERT INTO `province_city_area` VALUES ('439', '432', '阿荣旗', null, null);
INSERT INTO `province_city_area` VALUES ('441', '432', '鄂伦春自治旗', null, null);
INSERT INTO `province_city_area` VALUES ('442', '432', '鄂温克族自治旗', null, null);
INSERT INTO `province_city_area` VALUES ('443', '432', '新巴尔虎右旗', null, null);
INSERT INTO `province_city_area` VALUES ('444', '432', '新巴尔虎左旗', null, null);
INSERT INTO `province_city_area` VALUES ('445', '432', '陈巴尔虎旗', null, null);
INSERT INTO `province_city_area` VALUES ('446', '380', '兴安盟', null, null);
INSERT INTO `province_city_area` VALUES ('447', '446', '乌兰浩特市', null, null);
INSERT INTO `province_city_area` VALUES ('448', '446', '阿尔山市', null, null);
INSERT INTO `province_city_area` VALUES ('449', '446', '科尔沁右翼前旗', null, null);
INSERT INTO `province_city_area` VALUES ('450', '446', '科尔沁右翼中旗', null, null);
INSERT INTO `province_city_area` VALUES ('451', '446', '扎赉特旗', null, null);
INSERT INTO `province_city_area` VALUES ('452', '446', '突泉县', null, null);
INSERT INTO `province_city_area` VALUES ('453', '380', '锡林郭勒盟', null, null);
INSERT INTO `province_city_area` VALUES ('454', '453', '二连浩特市', null, null);
INSERT INTO `province_city_area` VALUES ('455', '453', '锡林浩特市', null, null);
INSERT INTO `province_city_area` VALUES ('456', '453', '阿巴嘎旗', null, null);
INSERT INTO `province_city_area` VALUES ('457', '453', '苏尼特左旗', null, null);
INSERT INTO `province_city_area` VALUES ('458', '453', '苏尼特右旗', null, null);
INSERT INTO `province_city_area` VALUES ('459', '453', '东乌珠穆沁旗', null, null);
INSERT INTO `province_city_area` VALUES ('460', '453', '西乌珠穆沁旗', null, null);
INSERT INTO `province_city_area` VALUES ('461', '453', '太仆寺旗', null, null);
INSERT INTO `province_city_area` VALUES ('462', '453', '镶黄旗', null, null);
INSERT INTO `province_city_area` VALUES ('463', '453', '正镶白旗', null, null);
INSERT INTO `province_city_area` VALUES ('464', '453', '正蓝旗', null, null);
INSERT INTO `province_city_area` VALUES ('465', '453', '多伦县', null, null);
INSERT INTO `province_city_area` VALUES ('466', '380', '乌兰察布盟', null, null);
INSERT INTO `province_city_area` VALUES ('467', '466', '集宁市', null, null);
INSERT INTO `province_city_area` VALUES ('468', '466', '丰镇市', null, null);
INSERT INTO `province_city_area` VALUES ('469', '466', '卓资县', null, null);
INSERT INTO `province_city_area` VALUES ('470', '466', '化德县', null, null);
INSERT INTO `province_city_area` VALUES ('471', '466', '商都县', null, null);
INSERT INTO `province_city_area` VALUES ('472', '466', '兴和县', null, null);
INSERT INTO `province_city_area` VALUES ('473', '466', '凉城县', null, null);
INSERT INTO `province_city_area` VALUES ('474', '466', '察哈尔右翼前旗', null, null);
INSERT INTO `province_city_area` VALUES ('475', '466', '察哈尔右翼中旗', null, null);
INSERT INTO `province_city_area` VALUES ('476', '466', '察哈尔右翼后旗', null, null);
INSERT INTO `province_city_area` VALUES ('477', '466', '四子王旗', null, null);
INSERT INTO `province_city_area` VALUES ('478', '380', '伊克昭盟', null, null);
INSERT INTO `province_city_area` VALUES ('479', '478', '东胜市', null, null);
INSERT INTO `province_city_area` VALUES ('480', '478', '达拉特旗', null, null);
INSERT INTO `province_city_area` VALUES ('481', '478', '准格尔旗', null, null);
INSERT INTO `province_city_area` VALUES ('482', '478', '鄂托克前旗', null, null);
INSERT INTO `province_city_area` VALUES ('483', '478', '鄂托克旗', null, null);
INSERT INTO `province_city_area` VALUES ('484', '478', '杭锦旗', null, null);
INSERT INTO `province_city_area` VALUES ('485', '478', '乌审旗', null, null);
INSERT INTO `province_city_area` VALUES ('486', '478', '伊金霍洛旗', null, null);
INSERT INTO `province_city_area` VALUES ('487', '380', '巴彦淖尔盟', null, null);
INSERT INTO `province_city_area` VALUES ('488', '487', '临河市', null, null);
INSERT INTO `province_city_area` VALUES ('489', '487', '五原县', null, null);
INSERT INTO `province_city_area` VALUES ('490', '487', '磴口县', null, null);
INSERT INTO `province_city_area` VALUES ('491', '487', '乌拉特前旗', null, null);
INSERT INTO `province_city_area` VALUES ('492', '487', '乌拉特中旗', null, null);
INSERT INTO `province_city_area` VALUES ('493', '487', '乌拉特后旗', null, null);
INSERT INTO `province_city_area` VALUES ('494', '487', '杭锦后旗', null, null);
INSERT INTO `province_city_area` VALUES ('495', '380', '阿拉善盟', null, null);
INSERT INTO `province_city_area` VALUES ('496', '495', '阿拉善左旗', null, null);
INSERT INTO `province_city_area` VALUES ('497', '495', '阿拉善右旗', null, null);
INSERT INTO `province_city_area` VALUES ('498', '495', '额济纳旗', null, null);
INSERT INTO `province_city_area` VALUES ('499', '0', '辽宁', null, null);
INSERT INTO `province_city_area` VALUES ('500', '499', '沈阳', null, null);
INSERT INTO `province_city_area` VALUES ('501', '500', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('502', '500', '和平区', null, null);
INSERT INTO `province_city_area` VALUES ('503', '500', '沈河区', null, null);
INSERT INTO `province_city_area` VALUES ('504', '500', '大东区', null, null);
INSERT INTO `province_city_area` VALUES ('505', '500', '皇姑区', null, null);
INSERT INTO `province_city_area` VALUES ('506', '500', '铁西区', null, null);
INSERT INTO `province_city_area` VALUES ('507', '500', '苏家屯区', null, null);
INSERT INTO `province_city_area` VALUES ('508', '500', '东陵区', null, null);
INSERT INTO `province_city_area` VALUES ('509', '500', '新城子区', null, null);
INSERT INTO `province_city_area` VALUES ('510', '500', '于洪区', null, null);
INSERT INTO `province_city_area` VALUES ('511', '500', '辽中县', null, null);
INSERT INTO `province_city_area` VALUES ('512', '500', '康平县', null, null);
INSERT INTO `province_city_area` VALUES ('513', '500', '法库县', null, null);
INSERT INTO `province_city_area` VALUES ('514', '500', '新民市', null, null);
INSERT INTO `province_city_area` VALUES ('515', '499', '大连', null, null);
INSERT INTO `province_city_area` VALUES ('516', '515', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('517', '515', '中山区', null, null);
INSERT INTO `province_city_area` VALUES ('518', '515', '西岗区', null, null);
INSERT INTO `province_city_area` VALUES ('519', '515', '沙河口区', null, null);
INSERT INTO `province_city_area` VALUES ('520', '515', '甘井子区', null, null);
INSERT INTO `province_city_area` VALUES ('521', '515', '旅顺口区', null, null);
INSERT INTO `province_city_area` VALUES ('522', '515', '金州区', null, null);
INSERT INTO `province_city_area` VALUES ('523', '515', '长海县', null, null);
INSERT INTO `province_city_area` VALUES ('524', '515', '瓦房店市', null, null);
INSERT INTO `province_city_area` VALUES ('525', '515', '普兰店市', null, null);
INSERT INTO `province_city_area` VALUES ('526', '515', '庄河市', null, null);
INSERT INTO `province_city_area` VALUES ('527', '499', '鞍山', null, null);
INSERT INTO `province_city_area` VALUES ('528', '527', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('529', '527', '铁东区', null, null);
INSERT INTO `province_city_area` VALUES ('530', '527', '铁西区', null, null);
INSERT INTO `province_city_area` VALUES ('531', '527', '立山区', null, null);
INSERT INTO `province_city_area` VALUES ('532', '527', '千山区', null, null);
INSERT INTO `province_city_area` VALUES ('533', '527', '台安县', null, null);
INSERT INTO `province_city_area` VALUES ('534', '527', '岫岩满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('535', '527', '海城市', null, null);
INSERT INTO `province_city_area` VALUES ('536', '499', '抚顺', null, null);
INSERT INTO `province_city_area` VALUES ('537', '536', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('538', '536', '新抚区', null, null);
INSERT INTO `province_city_area` VALUES ('539', '536', '东洲区', null, null);
INSERT INTO `province_city_area` VALUES ('540', '536', '望花区', null, null);
INSERT INTO `province_city_area` VALUES ('541', '536', '顺城区', null, null);
INSERT INTO `province_city_area` VALUES ('542', '536', '抚顺县', null, null);
INSERT INTO `province_city_area` VALUES ('543', '536', '新宾满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('544', '536', '清原满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('545', '499', '本溪', null, null);
INSERT INTO `province_city_area` VALUES ('546', '545', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('547', '545', '平山区', null, null);
INSERT INTO `province_city_area` VALUES ('548', '545', '溪湖区', null, null);
INSERT INTO `province_city_area` VALUES ('549', '545', '明山区', null, null);
INSERT INTO `province_city_area` VALUES ('550', '545', '南芬区', null, null);
INSERT INTO `province_city_area` VALUES ('551', '545', '本溪满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('552', '545', '桓仁满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('553', '499', '丹东', null, null);
INSERT INTO `province_city_area` VALUES ('554', '553', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('555', '553', '元宝区', null, null);
INSERT INTO `province_city_area` VALUES ('556', '553', '振兴区', null, null);
INSERT INTO `province_city_area` VALUES ('557', '553', '振安区', null, null);
INSERT INTO `province_city_area` VALUES ('558', '553', '宽甸满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('559', '553', '东港市', null, null);
INSERT INTO `province_city_area` VALUES ('560', '553', '凤城市', null, null);
INSERT INTO `province_city_area` VALUES ('561', '499', '锦州', null, null);
INSERT INTO `province_city_area` VALUES ('562', '561', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('563', '561', '古塔区', null, null);
INSERT INTO `province_city_area` VALUES ('564', '561', '凌河区', null, null);
INSERT INTO `province_city_area` VALUES ('565', '561', '太和区', null, null);
INSERT INTO `province_city_area` VALUES ('566', '561', '黑山县', null, null);
INSERT INTO `province_city_area` VALUES ('567', '561', '义  县', null, null);
INSERT INTO `province_city_area` VALUES ('568', '561', '凌海市', null, null);
INSERT INTO `province_city_area` VALUES ('569', '561', '北宁市', null, null);
INSERT INTO `province_city_area` VALUES ('570', '499', '营口', null, null);
INSERT INTO `province_city_area` VALUES ('571', '570', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('572', '570', '站前区', null, null);
INSERT INTO `province_city_area` VALUES ('573', '570', '西市区', null, null);
INSERT INTO `province_city_area` VALUES ('574', '570', '鲅鱼圈区', null, null);
INSERT INTO `province_city_area` VALUES ('575', '570', '老边区', null, null);
INSERT INTO `province_city_area` VALUES ('576', '570', '盖州市', null, null);
INSERT INTO `province_city_area` VALUES ('577', '570', '大石桥市', null, null);
INSERT INTO `province_city_area` VALUES ('578', '499', '阜新', null, null);
INSERT INTO `province_city_area` VALUES ('579', '578', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('580', '578', '海州区', null, null);
INSERT INTO `province_city_area` VALUES ('581', '578', '新邱区', null, null);
INSERT INTO `province_city_area` VALUES ('582', '578', '太平区', null, null);
INSERT INTO `province_city_area` VALUES ('583', '578', '清河门区', null, null);
INSERT INTO `province_city_area` VALUES ('584', '578', '细河区', null, null);
INSERT INTO `province_city_area` VALUES ('585', '578', '阜新蒙古族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('586', '578', '彰武县', null, null);
INSERT INTO `province_city_area` VALUES ('587', '499', '辽阳', null, null);
INSERT INTO `province_city_area` VALUES ('588', '587', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('589', '587', '白塔区', null, null);
INSERT INTO `province_city_area` VALUES ('590', '587', '文圣区', null, null);
INSERT INTO `province_city_area` VALUES ('591', '587', '宏伟区', null, null);
INSERT INTO `province_city_area` VALUES ('592', '587', '弓长岭区', null, null);
INSERT INTO `province_city_area` VALUES ('593', '587', '太子河区', null, null);
INSERT INTO `province_city_area` VALUES ('594', '587', '辽阳县', null, null);
INSERT INTO `province_city_area` VALUES ('595', '587', '灯塔市', null, null);
INSERT INTO `province_city_area` VALUES ('596', '499', '盘锦', null, null);
INSERT INTO `province_city_area` VALUES ('597', '596', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('598', '596', '双台子区', null, null);
INSERT INTO `province_city_area` VALUES ('599', '596', '兴隆台区', null, null);
INSERT INTO `province_city_area` VALUES ('600', '596', '大洼县', null, null);
INSERT INTO `province_city_area` VALUES ('601', '596', '盘山县', null, null);
INSERT INTO `province_city_area` VALUES ('602', '499', '铁岭', null, null);
INSERT INTO `province_city_area` VALUES ('603', '602', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('604', '602', '银州区', null, null);
INSERT INTO `province_city_area` VALUES ('605', '602', '清河区', null, null);
INSERT INTO `province_city_area` VALUES ('606', '602', '铁岭县', null, null);
INSERT INTO `province_city_area` VALUES ('607', '602', '西丰县', null, null);
INSERT INTO `province_city_area` VALUES ('608', '602', '昌图县', null, null);
INSERT INTO `province_city_area` VALUES ('609', '602', '铁法市', null, null);
INSERT INTO `province_city_area` VALUES ('610', '602', '开原市', null, null);
INSERT INTO `province_city_area` VALUES ('611', '499', '朝阳', null, null);
INSERT INTO `province_city_area` VALUES ('612', '611', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('613', '611', '双塔区', null, null);
INSERT INTO `province_city_area` VALUES ('614', '611', '龙城区', null, null);
INSERT INTO `province_city_area` VALUES ('615', '611', '朝阳县', null, null);
INSERT INTO `province_city_area` VALUES ('616', '611', '建平县', null, null);
INSERT INTO `province_city_area` VALUES ('618', '611', '北票市', null, null);
INSERT INTO `province_city_area` VALUES ('619', '611', '凌源市', null, null);
INSERT INTO `province_city_area` VALUES ('620', '499', '葫芦岛', null, null);
INSERT INTO `province_city_area` VALUES ('621', '620', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('622', '620', '连山区', null, null);
INSERT INTO `province_city_area` VALUES ('623', '620', '龙港区', null, null);
INSERT INTO `province_city_area` VALUES ('624', '620', '南票区', null, null);
INSERT INTO `province_city_area` VALUES ('625', '620', '绥中县', null, null);
INSERT INTO `province_city_area` VALUES ('626', '620', '建昌县', null, null);
INSERT INTO `province_city_area` VALUES ('627', '620', '兴城市', null, null);
INSERT INTO `province_city_area` VALUES ('628', '0', '吉林', null, null);
INSERT INTO `province_city_area` VALUES ('629', '628', '长春', null, null);
INSERT INTO `province_city_area` VALUES ('630', '629', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('631', '629', '南关区', null, null);
INSERT INTO `province_city_area` VALUES ('632', '629', '宽城区', null, null);
INSERT INTO `province_city_area` VALUES ('633', '629', '朝阳区', null, null);
INSERT INTO `province_city_area` VALUES ('634', '629', '二道区', null, null);
INSERT INTO `province_city_area` VALUES ('635', '629', '绿园区', null, null);
INSERT INTO `province_city_area` VALUES ('636', '629', '双阳区', null, null);
INSERT INTO `province_city_area` VALUES ('637', '629', '农安县', null, null);
INSERT INTO `province_city_area` VALUES ('638', '629', '九台市', null, null);
INSERT INTO `province_city_area` VALUES ('639', '629', '榆树市', null, null);
INSERT INTO `province_city_area` VALUES ('640', '629', '德惠市', null, null);
INSERT INTO `province_city_area` VALUES ('641', '628', '吉林', null, null);
INSERT INTO `province_city_area` VALUES ('642', '641', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('643', '641', '昌邑区', null, null);
INSERT INTO `province_city_area` VALUES ('644', '641', '龙潭区', null, null);
INSERT INTO `province_city_area` VALUES ('645', '641', '船营区', null, null);
INSERT INTO `province_city_area` VALUES ('646', '641', '丰满区', null, null);
INSERT INTO `province_city_area` VALUES ('647', '641', '永吉县', null, null);
INSERT INTO `province_city_area` VALUES ('648', '641', '蛟河市', null, null);
INSERT INTO `province_city_area` VALUES ('649', '641', '桦甸市', null, null);
INSERT INTO `province_city_area` VALUES ('650', '641', '舒兰市', null, null);
INSERT INTO `province_city_area` VALUES ('651', '641', '磐石市', null, null);
INSERT INTO `province_city_area` VALUES ('652', '628', '四平', null, null);
INSERT INTO `province_city_area` VALUES ('653', '652', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('654', '652', '铁西区', null, null);
INSERT INTO `province_city_area` VALUES ('655', '652', '铁东区', null, null);
INSERT INTO `province_city_area` VALUES ('656', '652', '梨树县', null, null);
INSERT INTO `province_city_area` VALUES ('657', '652', '伊通满族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('658', '652', '公主岭市', null, null);
INSERT INTO `province_city_area` VALUES ('659', '652', '双辽市', null, null);
INSERT INTO `province_city_area` VALUES ('660', '628', '辽源', null, null);
INSERT INTO `province_city_area` VALUES ('661', '660', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('662', '660', '龙山区', null, null);
INSERT INTO `province_city_area` VALUES ('663', '660', '西安区', null, null);
INSERT INTO `province_city_area` VALUES ('664', '660', '东丰县', null, null);
INSERT INTO `province_city_area` VALUES ('665', '660', '东辽县', null, null);
INSERT INTO `province_city_area` VALUES ('666', '628', '通化', null, null);
INSERT INTO `province_city_area` VALUES ('667', '666', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('668', '666', '东昌区', null, null);
INSERT INTO `province_city_area` VALUES ('669', '666', '二道江区', null, null);
INSERT INTO `province_city_area` VALUES ('670', '666', '通化县', null, null);
INSERT INTO `province_city_area` VALUES ('671', '666', '辉南县', null, null);
INSERT INTO `province_city_area` VALUES ('672', '666', '柳河县', null, null);
INSERT INTO `province_city_area` VALUES ('673', '666', '梅河口市', null, null);
INSERT INTO `province_city_area` VALUES ('674', '666', '集安市', null, null);
INSERT INTO `province_city_area` VALUES ('675', '628', '白山', null, null);
INSERT INTO `province_city_area` VALUES ('676', '675', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('677', '675', '八道江区', null, null);
INSERT INTO `province_city_area` VALUES ('678', '675', '抚松县', null, null);
INSERT INTO `province_city_area` VALUES ('679', '675', '靖宇县', null, null);
INSERT INTO `province_city_area` VALUES ('680', '675', '长白朝鲜族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('681', '675', '江源县', null, null);
INSERT INTO `province_city_area` VALUES ('682', '675', '临江市', null, null);
INSERT INTO `province_city_area` VALUES ('683', '628', '松原', null, null);
INSERT INTO `province_city_area` VALUES ('684', '683', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('685', '683', '宁江区', null, null);
INSERT INTO `province_city_area` VALUES ('687', '683', '长岭县', null, null);
INSERT INTO `province_city_area` VALUES ('688', '683', '乾安县', null, null);
INSERT INTO `province_city_area` VALUES ('689', '683', '扶余县', null, null);
INSERT INTO `province_city_area` VALUES ('690', '628', '白城', null, null);
INSERT INTO `province_city_area` VALUES ('691', '690', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('692', '690', '洮北区', null, null);
INSERT INTO `province_city_area` VALUES ('693', '690', '镇赉县', null, null);
INSERT INTO `province_city_area` VALUES ('694', '690', '通榆县', null, null);
INSERT INTO `province_city_area` VALUES ('695', '690', '洮南市', null, null);
INSERT INTO `province_city_area` VALUES ('696', '690', '大安市', null, null);
INSERT INTO `province_city_area` VALUES ('697', '628', '延边朝鲜族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('698', '697', '延吉市', null, null);
INSERT INTO `province_city_area` VALUES ('699', '697', '图们市', null, null);
INSERT INTO `province_city_area` VALUES ('700', '697', '敦化市', null, null);
INSERT INTO `province_city_area` VALUES ('701', '697', '珲春市', null, null);
INSERT INTO `province_city_area` VALUES ('702', '697', '龙井市', null, null);
INSERT INTO `province_city_area` VALUES ('703', '697', '和龙市', null, null);
INSERT INTO `province_city_area` VALUES ('704', '697', '汪清县', null, null);
INSERT INTO `province_city_area` VALUES ('705', '697', '安图县', null, null);
INSERT INTO `province_city_area` VALUES ('706', '0', '黑龙江', null, null);
INSERT INTO `province_city_area` VALUES ('707', '706', '哈尔滨', null, null);
INSERT INTO `province_city_area` VALUES ('708', '707', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('709', '707', '道里区', null, null);
INSERT INTO `province_city_area` VALUES ('710', '707', '南岗区', null, null);
INSERT INTO `province_city_area` VALUES ('711', '707', '道外区', null, null);
INSERT INTO `province_city_area` VALUES ('712', '707', '太平区', null, null);
INSERT INTO `province_city_area` VALUES ('713', '707', '香坊区', null, null);
INSERT INTO `province_city_area` VALUES ('714', '707', '动力区', null, null);
INSERT INTO `province_city_area` VALUES ('715', '707', '平房区', null, null);
INSERT INTO `province_city_area` VALUES ('716', '707', '呼兰县', null, null);
INSERT INTO `province_city_area` VALUES ('717', '707', '依兰县', null, null);
INSERT INTO `province_city_area` VALUES ('718', '707', '方正县', null, null);
INSERT INTO `province_city_area` VALUES ('719', '707', '宾  县', null, null);
INSERT INTO `province_city_area` VALUES ('720', '707', '巴彦县', null, null);
INSERT INTO `province_city_area` VALUES ('721', '707', '木兰县', null, null);
INSERT INTO `province_city_area` VALUES ('722', '707', '通河县', null, null);
INSERT INTO `province_city_area` VALUES ('723', '707', '延寿县', null, null);
INSERT INTO `province_city_area` VALUES ('724', '707', '阿城市', null, null);
INSERT INTO `province_city_area` VALUES ('725', '707', '双城市', null, null);
INSERT INTO `province_city_area` VALUES ('726', '707', '尚志市', null, null);
INSERT INTO `province_city_area` VALUES ('727', '707', '五常市', null, null);
INSERT INTO `province_city_area` VALUES ('728', '706', '齐齐哈尔', null, null);
INSERT INTO `province_city_area` VALUES ('729', '728', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('730', '728', '龙沙区', null, null);
INSERT INTO `province_city_area` VALUES ('731', '728', '建华区', null, null);
INSERT INTO `province_city_area` VALUES ('732', '728', '铁锋区', null, null);
INSERT INTO `province_city_area` VALUES ('733', '728', '昂昂溪区', null, null);
INSERT INTO `province_city_area` VALUES ('734', '728', '富拉尔基区', null, null);
INSERT INTO `province_city_area` VALUES ('735', '728', '碾子山区', null, null);
INSERT INTO `province_city_area` VALUES ('736', '728', '梅里斯达斡尔族区', null, null);
INSERT INTO `province_city_area` VALUES ('737', '728', '龙江县', null, null);
INSERT INTO `province_city_area` VALUES ('738', '728', '依安县', null, null);
INSERT INTO `province_city_area` VALUES ('739', '728', '泰来县', null, null);
INSERT INTO `province_city_area` VALUES ('740', '728', '甘南县', null, null);
INSERT INTO `province_city_area` VALUES ('741', '728', '富裕县', null, null);
INSERT INTO `province_city_area` VALUES ('742', '728', '克山县', null, null);
INSERT INTO `province_city_area` VALUES ('743', '728', '克东县', null, null);
INSERT INTO `province_city_area` VALUES ('744', '728', '拜泉县', null, null);
INSERT INTO `province_city_area` VALUES ('745', '728', '讷河市', null, null);
INSERT INTO `province_city_area` VALUES ('746', '706', '鸡西', null, null);
INSERT INTO `province_city_area` VALUES ('747', '746', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('748', '746', '鸡冠区', null, null);
INSERT INTO `province_city_area` VALUES ('749', '746', '恒山区', null, null);
INSERT INTO `province_city_area` VALUES ('750', '746', '滴道区', null, null);
INSERT INTO `province_city_area` VALUES ('751', '746', '梨树区', null, null);
INSERT INTO `province_city_area` VALUES ('752', '746', '城子河区', null, null);
INSERT INTO `province_city_area` VALUES ('753', '746', '麻山区', null, null);
INSERT INTO `province_city_area` VALUES ('754', '746', '鸡东县', null, null);
INSERT INTO `province_city_area` VALUES ('755', '746', '虎林市', null, null);
INSERT INTO `province_city_area` VALUES ('756', '746', '密山市', null, null);
INSERT INTO `province_city_area` VALUES ('757', '706', '鹤岗', null, null);
INSERT INTO `province_city_area` VALUES ('758', '757', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('759', '757', '向阳区', null, null);
INSERT INTO `province_city_area` VALUES ('760', '757', '工农区', null, null);
INSERT INTO `province_city_area` VALUES ('761', '757', '南山区', null, null);
INSERT INTO `province_city_area` VALUES ('762', '757', '兴安区', null, null);
INSERT INTO `province_city_area` VALUES ('763', '757', '东山区', null, null);
INSERT INTO `province_city_area` VALUES ('764', '757', '兴山区', null, null);
INSERT INTO `province_city_area` VALUES ('765', '757', '萝北县', null, null);
INSERT INTO `province_city_area` VALUES ('766', '757', '绥滨县', null, null);
INSERT INTO `province_city_area` VALUES ('767', '706', '双鸭山', null, null);
INSERT INTO `province_city_area` VALUES ('768', '767', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('769', '767', '尖山区', null, null);
INSERT INTO `province_city_area` VALUES ('770', '767', '岭东区', null, null);
INSERT INTO `province_city_area` VALUES ('771', '767', '四方台区', null, null);
INSERT INTO `province_city_area` VALUES ('772', '767', '宝山区', null, null);
INSERT INTO `province_city_area` VALUES ('773', '767', '集贤县', null, null);
INSERT INTO `province_city_area` VALUES ('774', '767', '友谊县', null, null);
INSERT INTO `province_city_area` VALUES ('775', '767', '宝清县', null, null);
INSERT INTO `province_city_area` VALUES ('776', '767', '饶河县', null, null);
INSERT INTO `province_city_area` VALUES ('777', '706', '大庆', null, null);
INSERT INTO `province_city_area` VALUES ('778', '777', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('779', '777', '萨尔图区', null, null);
INSERT INTO `province_city_area` VALUES ('780', '777', '龙凤区', null, null);
INSERT INTO `province_city_area` VALUES ('781', '777', '让胡路区', null, null);
INSERT INTO `province_city_area` VALUES ('782', '777', '红岗区', null, null);
INSERT INTO `province_city_area` VALUES ('783', '777', '大同区', null, null);
INSERT INTO `province_city_area` VALUES ('784', '777', '肇州县', null, null);
INSERT INTO `province_city_area` VALUES ('785', '777', '肇源县', null, null);
INSERT INTO `province_city_area` VALUES ('786', '777', '林甸县', null, null);
INSERT INTO `province_city_area` VALUES ('788', '706', '伊春', null, null);
INSERT INTO `province_city_area` VALUES ('789', '788', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('790', '788', '伊春区', null, null);
INSERT INTO `province_city_area` VALUES ('791', '788', '南岔区', null, null);
INSERT INTO `province_city_area` VALUES ('792', '788', '友好区', null, null);
INSERT INTO `province_city_area` VALUES ('793', '788', '西林区', null, null);
INSERT INTO `province_city_area` VALUES ('794', '788', '翠峦区', null, null);
INSERT INTO `province_city_area` VALUES ('795', '788', '新青区', null, null);
INSERT INTO `province_city_area` VALUES ('796', '788', '美溪区', null, null);
INSERT INTO `province_city_area` VALUES ('797', '788', '金山屯区', null, null);
INSERT INTO `province_city_area` VALUES ('798', '788', '五营区', null, null);
INSERT INTO `province_city_area` VALUES ('799', '788', '乌马河区', null, null);
INSERT INTO `province_city_area` VALUES ('800', '788', '汤旺河区', null, null);
INSERT INTO `province_city_area` VALUES ('801', '788', '带岭区', null, null);
INSERT INTO `province_city_area` VALUES ('802', '788', '乌伊岭区', null, null);
INSERT INTO `province_city_area` VALUES ('803', '788', '红星区', null, null);
INSERT INTO `province_city_area` VALUES ('804', '788', '上甘岭区', null, null);
INSERT INTO `province_city_area` VALUES ('805', '788', '嘉荫县', null, null);
INSERT INTO `province_city_area` VALUES ('806', '788', '铁力市', null, null);
INSERT INTO `province_city_area` VALUES ('807', '706', '佳木斯', null, null);
INSERT INTO `province_city_area` VALUES ('808', '807', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('809', '807', '永红区', null, null);
INSERT INTO `province_city_area` VALUES ('810', '807', '向阳区', null, null);
INSERT INTO `province_city_area` VALUES ('811', '807', '前进区', null, null);
INSERT INTO `province_city_area` VALUES ('812', '807', '东风区', null, null);
INSERT INTO `province_city_area` VALUES ('813', '807', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('814', '807', '桦南县', null, null);
INSERT INTO `province_city_area` VALUES ('815', '807', '桦川县', null, null);
INSERT INTO `province_city_area` VALUES ('816', '807', '汤原县', null, null);
INSERT INTO `province_city_area` VALUES ('817', '807', '抚远县', null, null);
INSERT INTO `province_city_area` VALUES ('818', '807', '同江市', null, null);
INSERT INTO `province_city_area` VALUES ('819', '807', '富锦市', null, null);
INSERT INTO `province_city_area` VALUES ('820', '706', '七台河', null, null);
INSERT INTO `province_city_area` VALUES ('821', '820', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('822', '820', '新兴区', null, null);
INSERT INTO `province_city_area` VALUES ('823', '820', '桃山区', null, null);
INSERT INTO `province_city_area` VALUES ('824', '820', '茄子河区', null, null);
INSERT INTO `province_city_area` VALUES ('825', '820', '勃利县', null, null);
INSERT INTO `province_city_area` VALUES ('826', '706', '牡丹江', null, null);
INSERT INTO `province_city_area` VALUES ('827', '826', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('828', '826', '东安区', null, null);
INSERT INTO `province_city_area` VALUES ('829', '826', '阳明区', null, null);
INSERT INTO `province_city_area` VALUES ('830', '826', '爱民区', null, null);
INSERT INTO `province_city_area` VALUES ('831', '826', '西安区', null, null);
INSERT INTO `province_city_area` VALUES ('832', '826', '东宁县', null, null);
INSERT INTO `province_city_area` VALUES ('833', '826', '林口县', null, null);
INSERT INTO `province_city_area` VALUES ('834', '826', '绥芬河市', null, null);
INSERT INTO `province_city_area` VALUES ('835', '826', '海林市', null, null);
INSERT INTO `province_city_area` VALUES ('836', '826', '宁安市', null, null);
INSERT INTO `province_city_area` VALUES ('837', '826', '穆棱市', null, null);
INSERT INTO `province_city_area` VALUES ('838', '706', '黑河', null, null);
INSERT INTO `province_city_area` VALUES ('839', '838', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('840', '838', '爱辉区', null, null);
INSERT INTO `province_city_area` VALUES ('841', '838', '嫩江县', null, null);
INSERT INTO `province_city_area` VALUES ('842', '838', '逊克县', null, null);
INSERT INTO `province_city_area` VALUES ('843', '838', '孙吴县', null, null);
INSERT INTO `province_city_area` VALUES ('844', '838', '北安市', null, null);
INSERT INTO `province_city_area` VALUES ('845', '838', '五大连池市', null, null);
INSERT INTO `province_city_area` VALUES ('846', '706', '绥化', null, null);
INSERT INTO `province_city_area` VALUES ('847', '846', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('848', '846', '北林区', null, null);
INSERT INTO `province_city_area` VALUES ('849', '846', '望奎县', null, null);
INSERT INTO `province_city_area` VALUES ('850', '846', '兰西县', null, null);
INSERT INTO `province_city_area` VALUES ('851', '846', '青冈县', null, null);
INSERT INTO `province_city_area` VALUES ('852', '846', '庆安县', null, null);
INSERT INTO `province_city_area` VALUES ('853', '846', '明水县', null, null);
INSERT INTO `province_city_area` VALUES ('854', '846', '绥棱县', null, null);
INSERT INTO `province_city_area` VALUES ('855', '846', '安达市', null, null);
INSERT INTO `province_city_area` VALUES ('856', '846', '肇东市', null, null);
INSERT INTO `province_city_area` VALUES ('857', '846', '海伦市', null, null);
INSERT INTO `province_city_area` VALUES ('858', '706', '大兴安岭地区', null, null);
INSERT INTO `province_city_area` VALUES ('859', '858', '呼玛县', null, null);
INSERT INTO `province_city_area` VALUES ('860', '858', '塔河县', null, null);
INSERT INTO `province_city_area` VALUES ('861', '858', '漠河县', null, null);
INSERT INTO `province_city_area` VALUES ('862', '0', '上海', null, null);
INSERT INTO `province_city_area` VALUES ('863', '862', '上海市辖', null, null);
INSERT INTO `province_city_area` VALUES ('864', '863', '黄浦区', null, null);
INSERT INTO `province_city_area` VALUES ('865', '863', '卢湾区', null, null);
INSERT INTO `province_city_area` VALUES ('866', '863', '徐汇区', null, null);
INSERT INTO `province_city_area` VALUES ('867', '863', '长宁区', null, null);
INSERT INTO `province_city_area` VALUES ('868', '863', '静安区', null, null);
INSERT INTO `province_city_area` VALUES ('869', '863', '普陀区', null, null);
INSERT INTO `province_city_area` VALUES ('870', '863', '闸北区', null, null);
INSERT INTO `province_city_area` VALUES ('871', '863', '虹口区', null, null);
INSERT INTO `province_city_area` VALUES ('872', '863', '杨浦区', null, null);
INSERT INTO `province_city_area` VALUES ('873', '863', '闵行区', null, null);
INSERT INTO `province_city_area` VALUES ('874', '863', '宝山区', null, null);
INSERT INTO `province_city_area` VALUES ('875', '863', '嘉定区', null, null);
INSERT INTO `province_city_area` VALUES ('876', '863', '浦东新区', null, null);
INSERT INTO `province_city_area` VALUES ('877', '863', '金山区', null, null);
INSERT INTO `province_city_area` VALUES ('878', '863', '松江区', null, null);
INSERT INTO `province_city_area` VALUES ('879', '863', '青浦区', null, null);
INSERT INTO `province_city_area` VALUES ('880', '862', '上海县辖', null, null);
INSERT INTO `province_city_area` VALUES ('881', '880', '南汇县', null, null);
INSERT INTO `province_city_area` VALUES ('882', '880', '奉贤县', null, null);
INSERT INTO `province_city_area` VALUES ('883', '880', '崇明县', null, null);
INSERT INTO `province_city_area` VALUES ('884', '0', '江苏', null, null);
INSERT INTO `province_city_area` VALUES ('885', '884', '南京', null, null);
INSERT INTO `province_city_area` VALUES ('886', '885', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('887', '885', '玄武区', null, null);
INSERT INTO `province_city_area` VALUES ('888', '885', '白下区', null, null);
INSERT INTO `province_city_area` VALUES ('889', '885', '秦淮区', null, null);
INSERT INTO `province_city_area` VALUES ('890', '885', '建邺区', null, null);
INSERT INTO `province_city_area` VALUES ('891', '885', '鼓楼区', null, null);
INSERT INTO `province_city_area` VALUES ('892', '885', '下关区', null, null);
INSERT INTO `province_city_area` VALUES ('893', '885', '浦口区', null, null);
INSERT INTO `province_city_area` VALUES ('894', '885', '大厂区', null, null);
INSERT INTO `province_city_area` VALUES ('895', '885', '栖霞区', null, null);
INSERT INTO `province_city_area` VALUES ('896', '885', '雨花台区', null, null);
INSERT INTO `province_city_area` VALUES ('897', '885', '江宁区', null, null);
INSERT INTO `province_city_area` VALUES ('898', '885', '江浦县', null, null);
INSERT INTO `province_city_area` VALUES ('899', '885', '六合县', null, null);
INSERT INTO `province_city_area` VALUES ('900', '885', '溧水县', null, null);
INSERT INTO `province_city_area` VALUES ('901', '885', '高淳县', null, null);
INSERT INTO `province_city_area` VALUES ('902', '884', '无锡', null, null);
INSERT INTO `province_city_area` VALUES ('903', '902', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('904', '902', '崇安区', null, null);
INSERT INTO `province_city_area` VALUES ('905', '902', '南长区', null, null);
INSERT INTO `province_city_area` VALUES ('906', '902', '北塘区', null, null);
INSERT INTO `province_city_area` VALUES ('907', '902', '锡山区', null, null);
INSERT INTO `province_city_area` VALUES ('908', '902', '惠山区', null, null);
INSERT INTO `province_city_area` VALUES ('909', '902', '滨湖区', null, null);
INSERT INTO `province_city_area` VALUES ('910', '902', '江阴市', null, null);
INSERT INTO `province_city_area` VALUES ('911', '902', '宜兴市', null, null);
INSERT INTO `province_city_area` VALUES ('912', '884', '徐州', null, null);
INSERT INTO `province_city_area` VALUES ('913', '912', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('914', '912', '鼓楼区', null, null);
INSERT INTO `province_city_area` VALUES ('915', '912', '云龙区', null, null);
INSERT INTO `province_city_area` VALUES ('916', '912', '九里区', null, null);
INSERT INTO `province_city_area` VALUES ('917', '912', '贾汪区', null, null);
INSERT INTO `province_city_area` VALUES ('918', '912', '泉山区', null, null);
INSERT INTO `province_city_area` VALUES ('919', '912', '丰  县', null, null);
INSERT INTO `province_city_area` VALUES ('920', '912', '沛  县', null, null);
INSERT INTO `province_city_area` VALUES ('921', '912', '铜山县', null, null);
INSERT INTO `province_city_area` VALUES ('922', '912', '睢宁县', null, null);
INSERT INTO `province_city_area` VALUES ('923', '912', '新沂市', null, null);
INSERT INTO `province_city_area` VALUES ('924', '912', '邳州市', null, null);
INSERT INTO `province_city_area` VALUES ('925', '884', '常州', null, null);
INSERT INTO `province_city_area` VALUES ('926', '925', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('927', '925', '天宁区', null, null);
INSERT INTO `province_city_area` VALUES ('928', '925', '钟楼区', null, null);
INSERT INTO `province_city_area` VALUES ('929', '925', '戚墅堰区', null, null);
INSERT INTO `province_city_area` VALUES ('930', '925', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('931', '925', '溧阳市', null, null);
INSERT INTO `province_city_area` VALUES ('932', '925', '金坛市', null, null);
INSERT INTO `province_city_area` VALUES ('933', '925', '武进市', null, null);
INSERT INTO `province_city_area` VALUES ('934', '884', '苏州', null, null);
INSERT INTO `province_city_area` VALUES ('935', '934', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('936', '934', '沧浪区', null, null);
INSERT INTO `province_city_area` VALUES ('937', '934', '平江区', null, null);
INSERT INTO `province_city_area` VALUES ('938', '934', '金阊区', null, null);
INSERT INTO `province_city_area` VALUES ('939', '934', '虎丘区', null, null);
INSERT INTO `province_city_area` VALUES ('940', '934', '吴中区', null, null);
INSERT INTO `province_city_area` VALUES ('941', '934', '相城区', null, null);
INSERT INTO `province_city_area` VALUES ('942', '934', '常熟市', null, null);
INSERT INTO `province_city_area` VALUES ('943', '934', '张家港市', null, null);
INSERT INTO `province_city_area` VALUES ('944', '934', '昆山市', null, null);
INSERT INTO `province_city_area` VALUES ('945', '934', '吴江市', null, null);
INSERT INTO `province_city_area` VALUES ('946', '934', '太仓市', null, null);
INSERT INTO `province_city_area` VALUES ('947', '884', '南通', null, null);
INSERT INTO `province_city_area` VALUES ('948', '947', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('949', '947', '崇川区', null, null);
INSERT INTO `province_city_area` VALUES ('950', '947', '港闸区', null, null);
INSERT INTO `province_city_area` VALUES ('951', '947', '海安县', null, null);
INSERT INTO `province_city_area` VALUES ('952', '947', '如东县', null, null);
INSERT INTO `province_city_area` VALUES ('953', '947', '启东市', null, null);
INSERT INTO `province_city_area` VALUES ('954', '947', '如皋市', null, null);
INSERT INTO `province_city_area` VALUES ('955', '947', '通州市', null, null);
INSERT INTO `province_city_area` VALUES ('956', '947', '海门市', null, null);
INSERT INTO `province_city_area` VALUES ('957', '884', '连云港', null, null);
INSERT INTO `province_city_area` VALUES ('958', '957', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('959', '957', '连云区', null, null);
INSERT INTO `province_city_area` VALUES ('960', '957', '云台区', null, null);
INSERT INTO `province_city_area` VALUES ('961', '957', '新浦区', null, null);
INSERT INTO `province_city_area` VALUES ('962', '957', '海州区', null, null);
INSERT INTO `province_city_area` VALUES ('963', '957', '赣榆县', null, null);
INSERT INTO `province_city_area` VALUES ('964', '957', '东海县', null, null);
INSERT INTO `province_city_area` VALUES ('965', '957', '灌云县', null, null);
INSERT INTO `province_city_area` VALUES ('966', '957', '灌南县', null, null);
INSERT INTO `province_city_area` VALUES ('967', '884', '淮安', null, null);
INSERT INTO `province_city_area` VALUES ('968', '967', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('969', '967', '清河区', null, null);
INSERT INTO `province_city_area` VALUES ('970', '967', '楚州区', null, null);
INSERT INTO `province_city_area` VALUES ('971', '967', '淮阴区', null, null);
INSERT INTO `province_city_area` VALUES ('972', '967', '清浦区', null, null);
INSERT INTO `province_city_area` VALUES ('973', '967', '涟水县', null, null);
INSERT INTO `province_city_area` VALUES ('974', '967', '洪泽县', null, null);
INSERT INTO `province_city_area` VALUES ('975', '967', '盱眙县', null, null);
INSERT INTO `province_city_area` VALUES ('976', '967', '金湖县', null, null);
INSERT INTO `province_city_area` VALUES ('977', '884', '盐城', null, null);
INSERT INTO `province_city_area` VALUES ('978', '977', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('979', '977', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('980', '977', '响水县', null, null);
INSERT INTO `province_city_area` VALUES ('981', '977', '滨海县', null, null);
INSERT INTO `province_city_area` VALUES ('982', '977', '阜宁县', null, null);
INSERT INTO `province_city_area` VALUES ('983', '977', '射阳县', null, null);
INSERT INTO `province_city_area` VALUES ('984', '977', '建湖县', null, null);
INSERT INTO `province_city_area` VALUES ('985', '977', '盐都县', null, null);
INSERT INTO `province_city_area` VALUES ('986', '977', '东台市', null, null);
INSERT INTO `province_city_area` VALUES ('987', '977', '大丰市', null, null);
INSERT INTO `province_city_area` VALUES ('988', '884', '扬州', null, null);
INSERT INTO `province_city_area` VALUES ('989', '988', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('990', '988', '广陵区', null, null);
INSERT INTO `province_city_area` VALUES ('991', '988', '邗江区', null, null);
INSERT INTO `province_city_area` VALUES ('992', '988', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('993', '988', '宝应县', null, null);
INSERT INTO `province_city_area` VALUES ('994', '988', '仪征市', null, null);
INSERT INTO `province_city_area` VALUES ('995', '988', '高邮市', null, null);
INSERT INTO `province_city_area` VALUES ('996', '988', '江都市', null, null);
INSERT INTO `province_city_area` VALUES ('997', '884', '镇江', null, null);
INSERT INTO `province_city_area` VALUES ('998', '997', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('999', '997', '京口区', null, null);
INSERT INTO `province_city_area` VALUES ('1000', '997', '润州区', null, null);
INSERT INTO `province_city_area` VALUES ('1001', '997', '丹徒县', null, null);
INSERT INTO `province_city_area` VALUES ('1002', '997', '丹阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1003', '997', '扬中市', null, null);
INSERT INTO `province_city_area` VALUES ('1004', '997', '句容市', null, null);
INSERT INTO `province_city_area` VALUES ('1005', '884', '泰州', null, null);
INSERT INTO `province_city_area` VALUES ('1006', '1005', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1007', '1005', '海陵区', null, null);
INSERT INTO `province_city_area` VALUES ('1008', '1005', '高港区', null, null);
INSERT INTO `province_city_area` VALUES ('1009', '1005', '兴化市', null, null);
INSERT INTO `province_city_area` VALUES ('1010', '1005', '靖江市', null, null);
INSERT INTO `province_city_area` VALUES ('1011', '1005', '泰兴市', null, null);
INSERT INTO `province_city_area` VALUES ('1012', '1005', '姜堰市', null, null);
INSERT INTO `province_city_area` VALUES ('1013', '884', '宿迁', null, null);
INSERT INTO `province_city_area` VALUES ('1014', '1013', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1015', '1013', '宿城区', null, null);
INSERT INTO `province_city_area` VALUES ('1016', '1013', '宿豫县', null, null);
INSERT INTO `province_city_area` VALUES ('1017', '1013', '沭阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1018', '1013', '泗阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1019', '1013', '泗洪县', null, null);
INSERT INTO `province_city_area` VALUES ('1020', '0', '浙江', null, null);
INSERT INTO `province_city_area` VALUES ('1021', '1020', '杭州', null, null);
INSERT INTO `province_city_area` VALUES ('1022', '1021', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1023', '1021', '上城区', null, null);
INSERT INTO `province_city_area` VALUES ('1024', '1021', '下城区', null, null);
INSERT INTO `province_city_area` VALUES ('1025', '1021', '江干区', null, null);
INSERT INTO `province_city_area` VALUES ('1026', '1021', '拱墅区', null, null);
INSERT INTO `province_city_area` VALUES ('1027', '1021', '西湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1028', '1021', '滨江区', null, null);
INSERT INTO `province_city_area` VALUES ('1029', '1021', '桐庐县', null, null);
INSERT INTO `province_city_area` VALUES ('1030', '1021', '淳安县', null, null);
INSERT INTO `province_city_area` VALUES ('1031', '1021', '萧山市', null, null);
INSERT INTO `province_city_area` VALUES ('1032', '1021', '建德市', null, null);
INSERT INTO `province_city_area` VALUES ('1033', '1021', '富阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1034', '1021', '余杭市', null, null);
INSERT INTO `province_city_area` VALUES ('1035', '1021', '临安市', null, null);
INSERT INTO `province_city_area` VALUES ('1036', '1020', '宁波', null, null);
INSERT INTO `province_city_area` VALUES ('1037', '1036', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1038', '1036', '海曙区', null, null);
INSERT INTO `province_city_area` VALUES ('1039', '1036', '江东区', null, null);
INSERT INTO `province_city_area` VALUES ('1040', '1036', '江北区', null, null);
INSERT INTO `province_city_area` VALUES ('1041', '1036', '北仑区', null, null);
INSERT INTO `province_city_area` VALUES ('1042', '1036', '镇海区', null, null);
INSERT INTO `province_city_area` VALUES ('1043', '1036', '象山县', null, null);
INSERT INTO `province_city_area` VALUES ('1044', '1036', '宁海县', null, null);
INSERT INTO `province_city_area` VALUES ('1045', '1036', '鄞  县', null, null);
INSERT INTO `province_city_area` VALUES ('1046', '1036', '余姚市', null, null);
INSERT INTO `province_city_area` VALUES ('1047', '1036', '慈溪市', null, null);
INSERT INTO `province_city_area` VALUES ('1048', '1036', '奉化市', null, null);
INSERT INTO `province_city_area` VALUES ('1049', '1020', '温州', null, null);
INSERT INTO `province_city_area` VALUES ('1050', '1049', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1051', '1049', '鹿城区', null, null);
INSERT INTO `province_city_area` VALUES ('1052', '1049', '龙湾区', null, null);
INSERT INTO `province_city_area` VALUES ('1053', '1049', '瓯海区', null, null);
INSERT INTO `province_city_area` VALUES ('1054', '1049', '洞头县', null, null);
INSERT INTO `province_city_area` VALUES ('1055', '1049', '永嘉县', null, null);
INSERT INTO `province_city_area` VALUES ('1056', '1049', '平阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1057', '1049', '苍南县', null, null);
INSERT INTO `province_city_area` VALUES ('1058', '1049', '文成县', null, null);
INSERT INTO `province_city_area` VALUES ('1059', '1049', '泰顺县', null, null);
INSERT INTO `province_city_area` VALUES ('1060', '1049', '瑞安市', null, null);
INSERT INTO `province_city_area` VALUES ('1061', '1049', '乐清市', null, null);
INSERT INTO `province_city_area` VALUES ('1062', '1020', '嘉兴', null, null);
INSERT INTO `province_city_area` VALUES ('1063', '1062', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1064', '1062', '秀城区', null, null);
INSERT INTO `province_city_area` VALUES ('1065', '1062', '秀洲区', null, null);
INSERT INTO `province_city_area` VALUES ('1066', '1062', '嘉善县', null, null);
INSERT INTO `province_city_area` VALUES ('1067', '1062', '海盐县', null, null);
INSERT INTO `province_city_area` VALUES ('1068', '1062', '海宁市', null, null);
INSERT INTO `province_city_area` VALUES ('1069', '1062', '平湖市', null, null);
INSERT INTO `province_city_area` VALUES ('1070', '1062', '桐乡市', null, null);
INSERT INTO `province_city_area` VALUES ('1071', '1020', '湖州', null, null);
INSERT INTO `province_city_area` VALUES ('1072', '1071', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1073', '1071', '德清县', null, null);
INSERT INTO `province_city_area` VALUES ('1074', '1071', '长兴县', null, null);
INSERT INTO `province_city_area` VALUES ('1075', '1071', '安吉县', null, null);
INSERT INTO `province_city_area` VALUES ('1076', '1020', '绍兴', null, null);
INSERT INTO `province_city_area` VALUES ('1077', '1076', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1078', '1076', '越城区', null, null);
INSERT INTO `province_city_area` VALUES ('1079', '1076', '绍兴县', null, null);
INSERT INTO `province_city_area` VALUES ('1080', '1076', '新昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1081', '1076', '诸暨市', null, null);
INSERT INTO `province_city_area` VALUES ('1082', '1076', '上虞市', null, null);
INSERT INTO `province_city_area` VALUES ('1083', '1076', '嵊州市', null, null);
INSERT INTO `province_city_area` VALUES ('1084', '1020', '金华', null, null);
INSERT INTO `province_city_area` VALUES ('1085', '1084', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1086', '1084', '婺城区', null, null);
INSERT INTO `province_city_area` VALUES ('1087', '1084', '金东区', null, null);
INSERT INTO `province_city_area` VALUES ('1088', '1084', '武义县', null, null);
INSERT INTO `province_city_area` VALUES ('1089', '1084', '浦江县', null, null);
INSERT INTO `province_city_area` VALUES ('1090', '1084', '磐安县', null, null);
INSERT INTO `province_city_area` VALUES ('1091', '1084', '兰溪市', null, null);
INSERT INTO `province_city_area` VALUES ('1092', '1084', '义乌市', null, null);
INSERT INTO `province_city_area` VALUES ('1093', '1084', '东阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1094', '1084', '永康市', null, null);
INSERT INTO `province_city_area` VALUES ('1095', '1020', '衢州', null, null);
INSERT INTO `province_city_area` VALUES ('1096', '1095', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1097', '1095', '柯城区', null, null);
INSERT INTO `province_city_area` VALUES ('1098', '1095', '衢  县', null, null);
INSERT INTO `province_city_area` VALUES ('1099', '1095', '常山县', null, null);
INSERT INTO `province_city_area` VALUES ('1100', '1095', '开化县', null, null);
INSERT INTO `province_city_area` VALUES ('1101', '1095', '龙游县', null, null);
INSERT INTO `province_city_area` VALUES ('1102', '1095', '江山市', null, null);
INSERT INTO `province_city_area` VALUES ('1103', '1020', '舟山', null, null);
INSERT INTO `province_city_area` VALUES ('1104', '1103', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1105', '1103', '定海区', null, null);
INSERT INTO `province_city_area` VALUES ('1106', '1103', '普陀区', null, null);
INSERT INTO `province_city_area` VALUES ('1107', '1103', '岱山县', null, null);
INSERT INTO `province_city_area` VALUES ('1108', '1103', '嵊泗县', null, null);
INSERT INTO `province_city_area` VALUES ('1109', '1020', '台州', null, null);
INSERT INTO `province_city_area` VALUES ('1110', '1109', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1111', '1109', '椒江区', null, null);
INSERT INTO `province_city_area` VALUES ('1112', '1109', '黄岩区', null, null);
INSERT INTO `province_city_area` VALUES ('1113', '1109', '路桥区', null, null);
INSERT INTO `province_city_area` VALUES ('1114', '1109', '玉环县', null, null);
INSERT INTO `province_city_area` VALUES ('1115', '1109', '三门县', null, null);
INSERT INTO `province_city_area` VALUES ('1116', '1109', '天台县', null, null);
INSERT INTO `province_city_area` VALUES ('1117', '1109', '仙居县', null, null);
INSERT INTO `province_city_area` VALUES ('1118', '1109', '温岭市', null, null);
INSERT INTO `province_city_area` VALUES ('1119', '1109', '临海市', null, null);
INSERT INTO `province_city_area` VALUES ('1120', '1020', '丽水', null, null);
INSERT INTO `province_city_area` VALUES ('1121', '1120', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1122', '1120', '莲都区', null, null);
INSERT INTO `province_city_area` VALUES ('1123', '1120', '青田县', null, null);
INSERT INTO `province_city_area` VALUES ('1124', '1120', '缙云县', null, null);
INSERT INTO `province_city_area` VALUES ('1125', '1120', '遂昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1126', '1120', '松阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1127', '1120', '云和县', null, null);
INSERT INTO `province_city_area` VALUES ('1128', '1120', '庆元县', null, null);
INSERT INTO `province_city_area` VALUES ('1129', '1120', '景宁畲族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('1130', '1120', '龙泉市', null, null);
INSERT INTO `province_city_area` VALUES ('1131', '0', '安徽', null, null);
INSERT INTO `province_city_area` VALUES ('1132', '1131', '合肥', null, null);
INSERT INTO `province_city_area` VALUES ('1133', '1132', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1134', '1132', '东市区', null, null);
INSERT INTO `province_city_area` VALUES ('1135', '1132', '中市区', null, null);
INSERT INTO `province_city_area` VALUES ('1136', '1132', '西市区', null, null);
INSERT INTO `province_city_area` VALUES ('1137', '1132', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1138', '1132', '长丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1139', '1132', '肥东县', null, null);
INSERT INTO `province_city_area` VALUES ('1140', '1132', '肥西县', null, null);
INSERT INTO `province_city_area` VALUES ('1141', '1131', '芜湖', null, null);
INSERT INTO `province_city_area` VALUES ('1142', '1141', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1143', '1141', '镜湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1144', '1141', '马塘区', null, null);
INSERT INTO `province_city_area` VALUES ('1145', '1141', '新芜区', null, null);
INSERT INTO `province_city_area` VALUES ('1146', '1141', '鸠江区', null, null);
INSERT INTO `province_city_area` VALUES ('1147', '1141', '芜湖县', null, null);
INSERT INTO `province_city_area` VALUES ('1148', '1141', '繁昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1149', '1141', '南陵县', null, null);
INSERT INTO `province_city_area` VALUES ('1150', '1131', '蚌埠', null, null);
INSERT INTO `province_city_area` VALUES ('1151', '1150', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1152', '1150', '东市区', null, null);
INSERT INTO `province_city_area` VALUES ('1153', '1150', '中市区', null, null);
INSERT INTO `province_city_area` VALUES ('1154', '1150', '西市区', null, null);
INSERT INTO `province_city_area` VALUES ('1155', '1150', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1156', '1150', '怀远县', null, null);
INSERT INTO `province_city_area` VALUES ('1157', '1150', '五河县', null, null);
INSERT INTO `province_city_area` VALUES ('1158', '1150', '固镇县', null, null);
INSERT INTO `province_city_area` VALUES ('1159', '1131', '淮南', null, null);
INSERT INTO `province_city_area` VALUES ('1160', '1159', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1161', '1159', '大通区', null, null);
INSERT INTO `province_city_area` VALUES ('1162', '1159', '田家庵区', null, null);
INSERT INTO `province_city_area` VALUES ('1163', '1159', '谢家集区', null, null);
INSERT INTO `province_city_area` VALUES ('1164', '1159', '八公山区', null, null);
INSERT INTO `province_city_area` VALUES ('1165', '1159', '潘集区', null, null);
INSERT INTO `province_city_area` VALUES ('1166', '1159', '凤台县', null, null);
INSERT INTO `province_city_area` VALUES ('1167', '1131', '马鞍山', null, null);
INSERT INTO `province_city_area` VALUES ('1168', '1167', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1169', '1167', '金家庄区', null, null);
INSERT INTO `province_city_area` VALUES ('1170', '1167', '花山区', null, null);
INSERT INTO `province_city_area` VALUES ('1171', '1167', '雨山区', null, null);
INSERT INTO `province_city_area` VALUES ('1172', '1167', '向山区', null, null);
INSERT INTO `province_city_area` VALUES ('1173', '1167', '当涂县', null, null);
INSERT INTO `province_city_area` VALUES ('1174', '1131', '淮北', null, null);
INSERT INTO `province_city_area` VALUES ('1175', '1174', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1176', '1174', '杜集区', null, null);
INSERT INTO `province_city_area` VALUES ('1177', '1174', '相山区', null, null);
INSERT INTO `province_city_area` VALUES ('1178', '1174', '烈山区', null, null);
INSERT INTO `province_city_area` VALUES ('1179', '1174', '濉溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1180', '1131', '铜陵', null, null);
INSERT INTO `province_city_area` VALUES ('1181', '1180', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1182', '1180', '铜官山区', null, null);
INSERT INTO `province_city_area` VALUES ('1183', '1180', '狮子山区', null, null);
INSERT INTO `province_city_area` VALUES ('1184', '1180', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1185', '1180', '铜陵县', null, null);
INSERT INTO `province_city_area` VALUES ('1186', '1131', '安庆', null, null);
INSERT INTO `province_city_area` VALUES ('1187', '1186', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1188', '1186', '迎江区', null, null);
INSERT INTO `province_city_area` VALUES ('1189', '1186', '大观区', null, null);
INSERT INTO `province_city_area` VALUES ('1190', '1186', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1191', '1186', '怀宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1192', '1186', '枞阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1193', '1186', '潜山县', null, null);
INSERT INTO `province_city_area` VALUES ('1194', '1186', '太湖县', null, null);
INSERT INTO `province_city_area` VALUES ('1195', '1186', '宿松县', null, null);
INSERT INTO `province_city_area` VALUES ('1196', '1186', '望江县', null, null);
INSERT INTO `province_city_area` VALUES ('1197', '1186', '岳西县', null, null);
INSERT INTO `province_city_area` VALUES ('1198', '1186', '桐城市', null, null);
INSERT INTO `province_city_area` VALUES ('1199', '1131', '黄山', null, null);
INSERT INTO `province_city_area` VALUES ('1200', '1199', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1201', '1199', '屯溪区', null, null);
INSERT INTO `province_city_area` VALUES ('1202', '1199', '黄山区', null, null);
INSERT INTO `province_city_area` VALUES ('1203', '1199', '徽州区', null, null);
INSERT INTO `province_city_area` VALUES ('1204', '1199', '歙  县', null, null);
INSERT INTO `province_city_area` VALUES ('1205', '1199', '休宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1206', '1199', '黟  县', null, null);
INSERT INTO `province_city_area` VALUES ('1207', '1199', '祁门县', null, null);
INSERT INTO `province_city_area` VALUES ('1208', '1131', '滁州', null, null);
INSERT INTO `province_city_area` VALUES ('1209', '1208', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1210', '1208', '琅琊区', null, null);
INSERT INTO `province_city_area` VALUES ('1211', '1208', '南谯区', null, null);
INSERT INTO `province_city_area` VALUES ('1212', '1208', '来安县', null, null);
INSERT INTO `province_city_area` VALUES ('1213', '1208', '全椒县', null, null);
INSERT INTO `province_city_area` VALUES ('1214', '1208', '定远县', null, null);
INSERT INTO `province_city_area` VALUES ('1215', '1208', '凤阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1216', '1208', '天长市', null, null);
INSERT INTO `province_city_area` VALUES ('1217', '1208', '明光市', null, null);
INSERT INTO `province_city_area` VALUES ('1218', '1131', '阜阳', null, null);
INSERT INTO `province_city_area` VALUES ('1219', '1218', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1220', '1218', '颍州区', null, null);
INSERT INTO `province_city_area` VALUES ('1221', '1218', '颍东区', null, null);
INSERT INTO `province_city_area` VALUES ('1222', '1218', '颍泉区', null, null);
INSERT INTO `province_city_area` VALUES ('1223', '1218', '临泉县', null, null);
INSERT INTO `province_city_area` VALUES ('1224', '1218', '太和县', null, null);
INSERT INTO `province_city_area` VALUES ('1225', '1218', '阜南县', null, null);
INSERT INTO `province_city_area` VALUES ('1226', '1218', '颍上县', null, null);
INSERT INTO `province_city_area` VALUES ('1227', '1218', '界首市', null, null);
INSERT INTO `province_city_area` VALUES ('1228', '1131', '宿州', null, null);
INSERT INTO `province_city_area` VALUES ('1229', '1228', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1230', '1228', '墉桥区', null, null);
INSERT INTO `province_city_area` VALUES ('1231', '1228', '砀山县', null, null);
INSERT INTO `province_city_area` VALUES ('1232', '1228', '萧  县', null, null);
INSERT INTO `province_city_area` VALUES ('1233', '1228', '灵璧县', null, null);
INSERT INTO `province_city_area` VALUES ('1234', '1228', '泗  县', null, null);
INSERT INTO `province_city_area` VALUES ('1235', '1131', '巢湖', null, null);
INSERT INTO `province_city_area` VALUES ('1236', '1235', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1237', '1235', '居巢区', null, null);
INSERT INTO `province_city_area` VALUES ('1238', '1235', '庐江县', null, null);
INSERT INTO `province_city_area` VALUES ('1239', '1235', '无为县', null, null);
INSERT INTO `province_city_area` VALUES ('1240', '1235', '含山县', null, null);
INSERT INTO `province_city_area` VALUES ('1241', '1235', '和  县', null, null);
INSERT INTO `province_city_area` VALUES ('1242', '1131', '六安', null, null);
INSERT INTO `province_city_area` VALUES ('1243', '1242', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1244', '1242', '金安区', null, null);
INSERT INTO `province_city_area` VALUES ('1245', '1242', '裕安区', null, null);
INSERT INTO `province_city_area` VALUES ('1246', '1242', '寿  县', null, null);
INSERT INTO `province_city_area` VALUES ('1247', '1242', '霍邱县', null, null);
INSERT INTO `province_city_area` VALUES ('1248', '1242', '舒城县', null, null);
INSERT INTO `province_city_area` VALUES ('1249', '1242', '金寨县', null, null);
INSERT INTO `province_city_area` VALUES ('1250', '1242', '霍山县', null, null);
INSERT INTO `province_city_area` VALUES ('1251', '1131', '亳州', null, null);
INSERT INTO `province_city_area` VALUES ('1252', '1251', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1253', '1251', '谯城区', null, null);
INSERT INTO `province_city_area` VALUES ('1254', '1251', '涡阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1255', '1251', '蒙城县', null, null);
INSERT INTO `province_city_area` VALUES ('1256', '1251', '利辛县', null, null);
INSERT INTO `province_city_area` VALUES ('1257', '1131', '池州', null, null);
INSERT INTO `province_city_area` VALUES ('1258', '1257', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1259', '1257', '贵池区', null, null);
INSERT INTO `province_city_area` VALUES ('1260', '1257', '东至县', null, null);
INSERT INTO `province_city_area` VALUES ('1261', '1257', '石台县', null, null);
INSERT INTO `province_city_area` VALUES ('1262', '1257', '青阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1263', '1131', '宣城', null, null);
INSERT INTO `province_city_area` VALUES ('1264', '1263', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1265', '1263', '宣州区', null, null);
INSERT INTO `province_city_area` VALUES ('1266', '1263', '郎溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1267', '1263', '广德县', null, null);
INSERT INTO `province_city_area` VALUES ('1268', '1263', '泾  县', null, null);
INSERT INTO `province_city_area` VALUES ('1269', '1263', '绩溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1270', '1263', '旌德县', null, null);
INSERT INTO `province_city_area` VALUES ('1271', '1263', '宁国市', null, null);
INSERT INTO `province_city_area` VALUES ('1272', '0', '福建', null, null);
INSERT INTO `province_city_area` VALUES ('1273', '1272', '福州', null, null);
INSERT INTO `province_city_area` VALUES ('1274', '1273', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1275', '1273', '鼓楼区', null, null);
INSERT INTO `province_city_area` VALUES ('1276', '1273', '台江区', null, null);
INSERT INTO `province_city_area` VALUES ('1277', '1273', '仓山区', null, null);
INSERT INTO `province_city_area` VALUES ('1278', '1273', '马尾区', null, null);
INSERT INTO `province_city_area` VALUES ('1279', '1273', '晋安区', null, null);
INSERT INTO `province_city_area` VALUES ('1280', '1273', '闽侯县', null, null);
INSERT INTO `province_city_area` VALUES ('1281', '1273', '连江县', null, null);
INSERT INTO `province_city_area` VALUES ('1282', '1273', '罗源县', null, null);
INSERT INTO `province_city_area` VALUES ('1283', '1273', '闽清县', null, null);
INSERT INTO `province_city_area` VALUES ('1284', '1273', '永泰县', null, null);
INSERT INTO `province_city_area` VALUES ('1285', '1273', '平潭县', null, null);
INSERT INTO `province_city_area` VALUES ('1286', '1273', '福清市', null, null);
INSERT INTO `province_city_area` VALUES ('1287', '1273', '长乐市', null, null);
INSERT INTO `province_city_area` VALUES ('1288', '1272', '厦门', null, null);
INSERT INTO `province_city_area` VALUES ('1289', '1288', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1290', '1288', '鼓浪屿区', null, null);
INSERT INTO `province_city_area` VALUES ('1291', '1288', '思明区', null, null);
INSERT INTO `province_city_area` VALUES ('1292', '1288', '开元区', null, null);
INSERT INTO `province_city_area` VALUES ('1293', '1288', '杏林区', null, null);
INSERT INTO `province_city_area` VALUES ('1294', '1288', '湖里区', null, null);
INSERT INTO `province_city_area` VALUES ('1295', '1288', '集美区', null, null);
INSERT INTO `province_city_area` VALUES ('1296', '1288', '同安区', null, null);
INSERT INTO `province_city_area` VALUES ('1297', '1272', '莆田', null, null);
INSERT INTO `province_city_area` VALUES ('1298', '1297', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1299', '1297', '城厢区', null, null);
INSERT INTO `province_city_area` VALUES ('1300', '1297', '涵江区', null, null);
INSERT INTO `province_city_area` VALUES ('1301', '1297', '莆田县', null, null);
INSERT INTO `province_city_area` VALUES ('1302', '1297', '仙游县', null, null);
INSERT INTO `province_city_area` VALUES ('1303', '1272', '三明', null, null);
INSERT INTO `province_city_area` VALUES ('1304', '1303', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1305', '1303', '梅列区', null, null);
INSERT INTO `province_city_area` VALUES ('1306', '1303', '三元区', null, null);
INSERT INTO `province_city_area` VALUES ('1307', '1303', '明溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1308', '1303', '清流县', null, null);
INSERT INTO `province_city_area` VALUES ('1309', '1303', '宁化县', null, null);
INSERT INTO `province_city_area` VALUES ('1310', '1303', '大田县', null, null);
INSERT INTO `province_city_area` VALUES ('1311', '1303', '尤溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1312', '1303', '沙  县', null, null);
INSERT INTO `province_city_area` VALUES ('1313', '1303', '将乐县', null, null);
INSERT INTO `province_city_area` VALUES ('1314', '1303', '泰宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1315', '1303', '建宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1316', '1303', '永安市', null, null);
INSERT INTO `province_city_area` VALUES ('1317', '1272', '泉州', null, null);
INSERT INTO `province_city_area` VALUES ('1318', '1317', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1319', '1317', '鲤城区', null, null);
INSERT INTO `province_city_area` VALUES ('1320', '1317', '丰泽区', null, null);
INSERT INTO `province_city_area` VALUES ('1321', '1317', '洛江区', null, null);
INSERT INTO `province_city_area` VALUES ('1322', '1317', '泉港区', null, null);
INSERT INTO `province_city_area` VALUES ('1323', '1317', '惠安县', null, null);
INSERT INTO `province_city_area` VALUES ('1324', '1317', '安溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1325', '1317', '永春县', null, null);
INSERT INTO `province_city_area` VALUES ('1326', '1317', '德化县', null, null);
INSERT INTO `province_city_area` VALUES ('1327', '1317', '金门县', null, null);
INSERT INTO `province_city_area` VALUES ('1328', '1317', '石狮市', null, null);
INSERT INTO `province_city_area` VALUES ('1329', '1317', '晋江市', null, null);
INSERT INTO `province_city_area` VALUES ('1330', '1317', '南安市', null, null);
INSERT INTO `province_city_area` VALUES ('1331', '1272', '漳州', null, null);
INSERT INTO `province_city_area` VALUES ('1332', '1331', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1333', '1331', '芗城区', null, null);
INSERT INTO `province_city_area` VALUES ('1334', '1331', '龙文区', null, null);
INSERT INTO `province_city_area` VALUES ('1335', '1331', '云霄县', null, null);
INSERT INTO `province_city_area` VALUES ('1336', '1331', '漳浦县', null, null);
INSERT INTO `province_city_area` VALUES ('1337', '1331', '诏安县', null, null);
INSERT INTO `province_city_area` VALUES ('1338', '1331', '长泰县', null, null);
INSERT INTO `province_city_area` VALUES ('1339', '1331', '东山县', null, null);
INSERT INTO `province_city_area` VALUES ('1340', '1331', '南靖县', null, null);
INSERT INTO `province_city_area` VALUES ('1341', '1331', '平和县', null, null);
INSERT INTO `province_city_area` VALUES ('1342', '1331', '华安县', null, null);
INSERT INTO `province_city_area` VALUES ('1343', '1331', '龙海市', null, null);
INSERT INTO `province_city_area` VALUES ('1344', '1272', '南平', null, null);
INSERT INTO `province_city_area` VALUES ('1345', '1344', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1346', '1344', '延平区', null, null);
INSERT INTO `province_city_area` VALUES ('1347', '1344', '顺昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1348', '1344', '浦城县', null, null);
INSERT INTO `province_city_area` VALUES ('1349', '1344', '光泽县', null, null);
INSERT INTO `province_city_area` VALUES ('1350', '1344', '松溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1351', '1344', '政和县', null, null);
INSERT INTO `province_city_area` VALUES ('1352', '1344', '邵武市', null, null);
INSERT INTO `province_city_area` VALUES ('1353', '1344', '武夷山市', null, null);
INSERT INTO `province_city_area` VALUES ('1354', '1344', '建瓯市', null, null);
INSERT INTO `province_city_area` VALUES ('1355', '1344', '建阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1356', '1272', '龙岩', null, null);
INSERT INTO `province_city_area` VALUES ('1357', '1356', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1358', '1356', '新罗区', null, null);
INSERT INTO `province_city_area` VALUES ('1359', '1356', '长汀县', null, null);
INSERT INTO `province_city_area` VALUES ('1360', '1356', '永定县', null, null);
INSERT INTO `province_city_area` VALUES ('1361', '1356', '上杭县', null, null);
INSERT INTO `province_city_area` VALUES ('1362', '1356', '武平县', null, null);
INSERT INTO `province_city_area` VALUES ('1363', '1356', '连城县', null, null);
INSERT INTO `province_city_area` VALUES ('1364', '1356', '漳平市', null, null);
INSERT INTO `province_city_area` VALUES ('1365', '1272', '宁德', null, null);
INSERT INTO `province_city_area` VALUES ('1366', '1365', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1367', '1365', '蕉城区', null, null);
INSERT INTO `province_city_area` VALUES ('1368', '1365', '霞浦县', null, null);
INSERT INTO `province_city_area` VALUES ('1369', '1365', '古田县', null, null);
INSERT INTO `province_city_area` VALUES ('1370', '1365', '屏南县', null, null);
INSERT INTO `province_city_area` VALUES ('1371', '1365', '寿宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1372', '1365', '周宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1373', '1365', '柘荣县', null, null);
INSERT INTO `province_city_area` VALUES ('1374', '1365', '福安市', null, null);
INSERT INTO `province_city_area` VALUES ('1375', '1365', '福鼎市', null, null);
INSERT INTO `province_city_area` VALUES ('1376', '0', '江西', null, null);
INSERT INTO `province_city_area` VALUES ('1377', '1376', '南昌', null, null);
INSERT INTO `province_city_area` VALUES ('1378', '1377', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1379', '1377', '东湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1380', '1377', '西湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1381', '1377', '青云谱区', null, null);
INSERT INTO `province_city_area` VALUES ('1382', '1377', '湾里区', null, null);
INSERT INTO `province_city_area` VALUES ('1383', '1377', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1384', '1377', '南昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1385', '1377', '新建县', null, null);
INSERT INTO `province_city_area` VALUES ('1386', '1377', '安义县', null, null);
INSERT INTO `province_city_area` VALUES ('1387', '1377', '进贤县', null, null);
INSERT INTO `province_city_area` VALUES ('1388', '1376', '景德镇', null, null);
INSERT INTO `province_city_area` VALUES ('1389', '1388', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1390', '1388', '昌江区', null, null);
INSERT INTO `province_city_area` VALUES ('1391', '1388', '珠山区', null, null);
INSERT INTO `province_city_area` VALUES ('1392', '1388', '浮梁县', null, null);
INSERT INTO `province_city_area` VALUES ('1393', '1388', '乐平市', null, null);
INSERT INTO `province_city_area` VALUES ('1394', '1376', '萍乡', null, null);
INSERT INTO `province_city_area` VALUES ('1395', '1394', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1396', '1394', '安源区', null, null);
INSERT INTO `province_city_area` VALUES ('1397', '1394', '湘东区', null, null);
INSERT INTO `province_city_area` VALUES ('1398', '1394', '莲花县', null, null);
INSERT INTO `province_city_area` VALUES ('1399', '1394', '上栗县', null, null);
INSERT INTO `province_city_area` VALUES ('1400', '1394', '芦溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1401', '1376', '九江', null, null);
INSERT INTO `province_city_area` VALUES ('1402', '1401', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1403', '1401', '庐山区', null, null);
INSERT INTO `province_city_area` VALUES ('1404', '1401', '浔阳区', null, null);
INSERT INTO `province_city_area` VALUES ('1405', '1401', '九江县', null, null);
INSERT INTO `province_city_area` VALUES ('1406', '1401', '武宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1407', '1401', '修水县', null, null);
INSERT INTO `province_city_area` VALUES ('1408', '1401', '永修县', null, null);
INSERT INTO `province_city_area` VALUES ('1409', '1401', '德安县', null, null);
INSERT INTO `province_city_area` VALUES ('1410', '1401', '星子县', null, null);
INSERT INTO `province_city_area` VALUES ('1411', '1401', '都昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1412', '1401', '湖口县', null, null);
INSERT INTO `province_city_area` VALUES ('1413', '1401', '彭泽县', null, null);
INSERT INTO `province_city_area` VALUES ('1414', '1401', '瑞昌市', null, null);
INSERT INTO `province_city_area` VALUES ('1415', '1376', '新余', null, null);
INSERT INTO `province_city_area` VALUES ('1416', '1415', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1417', '1415', '渝水区', null, null);
INSERT INTO `province_city_area` VALUES ('1418', '1415', '分宜县', null, null);
INSERT INTO `province_city_area` VALUES ('1419', '1376', '鹰潭', null, null);
INSERT INTO `province_city_area` VALUES ('1420', '1419', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1421', '1419', '月湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1422', '1419', '余江县', null, null);
INSERT INTO `province_city_area` VALUES ('1423', '1419', '贵溪市', null, null);
INSERT INTO `province_city_area` VALUES ('1424', '1376', '赣州', null, null);
INSERT INTO `province_city_area` VALUES ('1425', '1424', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1426', '1424', '章贡区', null, null);
INSERT INTO `province_city_area` VALUES ('1427', '1424', '赣  县', null, null);
INSERT INTO `province_city_area` VALUES ('1428', '1424', '信丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1429', '1424', '大余县', null, null);
INSERT INTO `province_city_area` VALUES ('1430', '1424', '上犹县', null, null);
INSERT INTO `province_city_area` VALUES ('1431', '1424', '崇义县', null, null);
INSERT INTO `province_city_area` VALUES ('1432', '1424', '安远县', null, null);
INSERT INTO `province_city_area` VALUES ('1433', '1424', '龙南县', null, null);
INSERT INTO `province_city_area` VALUES ('1434', '1424', '定南县', null, null);
INSERT INTO `province_city_area` VALUES ('1435', '1424', '全南县', null, null);
INSERT INTO `province_city_area` VALUES ('1436', '1424', '宁都县', null, null);
INSERT INTO `province_city_area` VALUES ('1437', '1424', '于都县', null, null);
INSERT INTO `province_city_area` VALUES ('1438', '1424', '兴国县', null, null);
INSERT INTO `province_city_area` VALUES ('1439', '1424', '会昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1440', '1424', '寻乌县', null, null);
INSERT INTO `province_city_area` VALUES ('1441', '1424', '石城县', null, null);
INSERT INTO `province_city_area` VALUES ('1442', '1424', '瑞金市', null, null);
INSERT INTO `province_city_area` VALUES ('1443', '1424', '南康市', null, null);
INSERT INTO `province_city_area` VALUES ('1444', '1376', '吉安', null, null);
INSERT INTO `province_city_area` VALUES ('1445', '1444', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1446', '1444', '吉州区', null, null);
INSERT INTO `province_city_area` VALUES ('1447', '1444', '青原区', null, null);
INSERT INTO `province_city_area` VALUES ('1448', '1444', '吉安县', null, null);
INSERT INTO `province_city_area` VALUES ('1449', '1444', '吉水县', null, null);
INSERT INTO `province_city_area` VALUES ('1450', '1444', '峡江县', null, null);
INSERT INTO `province_city_area` VALUES ('1451', '1444', '新干县', null, null);
INSERT INTO `province_city_area` VALUES ('1452', '1444', '永丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1453', '1444', '泰和县', null, null);
INSERT INTO `province_city_area` VALUES ('1454', '1444', '遂川县', null, null);
INSERT INTO `province_city_area` VALUES ('1455', '1444', '万安县', null, null);
INSERT INTO `province_city_area` VALUES ('1456', '1444', '安福县', null, null);
INSERT INTO `province_city_area` VALUES ('1457', '1444', '永新县', null, null);
INSERT INTO `province_city_area` VALUES ('1458', '1444', '井冈山市', null, null);
INSERT INTO `province_city_area` VALUES ('1459', '1376', '宜春', null, null);
INSERT INTO `province_city_area` VALUES ('1460', '1459', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1461', '1459', '袁州区', null, null);
INSERT INTO `province_city_area` VALUES ('1462', '1459', '奉新县', null, null);
INSERT INTO `province_city_area` VALUES ('1463', '1459', '万载县', null, null);
INSERT INTO `province_city_area` VALUES ('1464', '1459', '上高县', null, null);
INSERT INTO `province_city_area` VALUES ('1465', '1459', '宜丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1466', '1459', '靖安县', null, null);
INSERT INTO `province_city_area` VALUES ('1467', '1459', '铜鼓县', null, null);
INSERT INTO `province_city_area` VALUES ('1468', '1459', '丰城市', null, null);
INSERT INTO `province_city_area` VALUES ('1469', '1459', '樟树市', null, null);
INSERT INTO `province_city_area` VALUES ('1470', '1459', '高安市', null, null);
INSERT INTO `province_city_area` VALUES ('1471', '1376', '抚州', null, null);
INSERT INTO `province_city_area` VALUES ('1472', '1471', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1473', '1471', '临川区', null, null);
INSERT INTO `province_city_area` VALUES ('1474', '1471', '南城县', null, null);
INSERT INTO `province_city_area` VALUES ('1475', '1471', '黎川县', null, null);
INSERT INTO `province_city_area` VALUES ('1476', '1471', '南丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1477', '1471', '崇仁县', null, null);
INSERT INTO `province_city_area` VALUES ('1478', '1471', '乐安县', null, null);
INSERT INTO `province_city_area` VALUES ('1479', '1471', '宜黄县', null, null);
INSERT INTO `province_city_area` VALUES ('1480', '1471', '金溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1481', '1471', '资溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1482', '1471', '东乡县', null, null);
INSERT INTO `province_city_area` VALUES ('1483', '1471', '广昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1484', '1376', '上饶', null, null);
INSERT INTO `province_city_area` VALUES ('1485', '1484', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1486', '1484', '信州区', null, null);
INSERT INTO `province_city_area` VALUES ('1487', '1484', '上饶县', null, null);
INSERT INTO `province_city_area` VALUES ('1488', '1484', '广丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1489', '1484', '玉山县', null, null);
INSERT INTO `province_city_area` VALUES ('1490', '1484', '铅山县', null, null);
INSERT INTO `province_city_area` VALUES ('1491', '1484', '横峰县', null, null);
INSERT INTO `province_city_area` VALUES ('1492', '1484', '弋阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1493', '1484', '余干县', null, null);
INSERT INTO `province_city_area` VALUES ('1494', '1484', '波阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1495', '1484', '万年县', null, null);
INSERT INTO `province_city_area` VALUES ('1496', '1484', '婺源县', null, null);
INSERT INTO `province_city_area` VALUES ('1497', '1484', '德兴市', null, null);
INSERT INTO `province_city_area` VALUES ('1498', '0', '山东', null, null);
INSERT INTO `province_city_area` VALUES ('1499', '1498', '济南', null, null);
INSERT INTO `province_city_area` VALUES ('1500', '1499', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1501', '1499', '历下区', null, null);
INSERT INTO `province_city_area` VALUES ('1502', '1499', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('1503', '1499', '槐荫区', null, null);
INSERT INTO `province_city_area` VALUES ('1504', '1499', '天桥区', null, null);
INSERT INTO `province_city_area` VALUES ('1505', '1499', '历城区', null, null);
INSERT INTO `province_city_area` VALUES ('1506', '1499', '长清县', null, null);
INSERT INTO `province_city_area` VALUES ('1507', '1499', '平阴县', null, null);
INSERT INTO `province_city_area` VALUES ('1508', '1499', '济阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1509', '1499', '商河县', null, null);
INSERT INTO `province_city_area` VALUES ('1510', '1499', '章丘市', null, null);
INSERT INTO `province_city_area` VALUES ('1511', '1498', '青岛', null, null);
INSERT INTO `province_city_area` VALUES ('1512', '1511', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1513', '1511', '市南区', null, null);
INSERT INTO `province_city_area` VALUES ('1514', '1511', '市北区', null, null);
INSERT INTO `province_city_area` VALUES ('1515', '1511', '四方区', null, null);
INSERT INTO `province_city_area` VALUES ('1516', '1511', '黄岛区', null, null);
INSERT INTO `province_city_area` VALUES ('1517', '1511', '崂山区', null, null);
INSERT INTO `province_city_area` VALUES ('1518', '1511', '李沧区', null, null);
INSERT INTO `province_city_area` VALUES ('1519', '1511', '城阳区', null, null);
INSERT INTO `province_city_area` VALUES ('1520', '1511', '胶州市', null, null);
INSERT INTO `province_city_area` VALUES ('1521', '1511', '即墨市', null, null);
INSERT INTO `province_city_area` VALUES ('1522', '1511', '平度市', null, null);
INSERT INTO `province_city_area` VALUES ('1523', '1511', '胶南市', null, null);
INSERT INTO `province_city_area` VALUES ('1524', '1511', '莱西市', null, null);
INSERT INTO `province_city_area` VALUES ('1525', '1498', '淄博', null, null);
INSERT INTO `province_city_area` VALUES ('1526', '1525', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1527', '1525', '淄川区', null, null);
INSERT INTO `province_city_area` VALUES ('1528', '1525', '张店区', null, null);
INSERT INTO `province_city_area` VALUES ('1529', '1525', '博山区', null, null);
INSERT INTO `province_city_area` VALUES ('1530', '1525', '临淄区', null, null);
INSERT INTO `province_city_area` VALUES ('1531', '1525', '周村区', null, null);
INSERT INTO `province_city_area` VALUES ('1532', '1525', '桓台县', null, null);
INSERT INTO `province_city_area` VALUES ('1533', '1525', '高青县', null, null);
INSERT INTO `province_city_area` VALUES ('1534', '1525', '沂源县', null, null);
INSERT INTO `province_city_area` VALUES ('1535', '1498', '枣庄', null, null);
INSERT INTO `province_city_area` VALUES ('1536', '1535', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1537', '1535', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('1538', '1535', '薛城区', null, null);
INSERT INTO `province_city_area` VALUES ('1539', '1535', '峄城区', null, null);
INSERT INTO `province_city_area` VALUES ('1540', '1535', '台儿庄区', null, null);
INSERT INTO `province_city_area` VALUES ('1541', '1535', '山亭区', null, null);
INSERT INTO `province_city_area` VALUES ('1542', '1535', '滕州市', null, null);
INSERT INTO `province_city_area` VALUES ('1543', '1498', '东营', null, null);
INSERT INTO `province_city_area` VALUES ('1544', '1543', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1545', '1543', '东营区', null, null);
INSERT INTO `province_city_area` VALUES ('1546', '1543', '河口区', null, null);
INSERT INTO `province_city_area` VALUES ('1547', '1543', '垦利县', null, null);
INSERT INTO `province_city_area` VALUES ('1548', '1543', '利津县', null, null);
INSERT INTO `province_city_area` VALUES ('1549', '1543', '广饶县', null, null);
INSERT INTO `province_city_area` VALUES ('1550', '1498', '烟台', null, null);
INSERT INTO `province_city_area` VALUES ('1551', '1550', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1552', '1550', '芝罘区', null, null);
INSERT INTO `province_city_area` VALUES ('1553', '1550', '福山区', null, null);
INSERT INTO `province_city_area` VALUES ('1554', '1550', '牟平区', null, null);
INSERT INTO `province_city_area` VALUES ('1555', '1550', '莱山区', null, null);
INSERT INTO `province_city_area` VALUES ('1556', '1550', '长岛县', null, null);
INSERT INTO `province_city_area` VALUES ('1557', '1550', '龙口市', null, null);
INSERT INTO `province_city_area` VALUES ('1558', '1550', '莱阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1559', '1550', '莱州市', null, null);
INSERT INTO `province_city_area` VALUES ('1560', '1550', '蓬莱市', null, null);
INSERT INTO `province_city_area` VALUES ('1561', '1550', '招远市', null, null);
INSERT INTO `province_city_area` VALUES ('1562', '1550', '栖霞市', null, null);
INSERT INTO `province_city_area` VALUES ('1563', '1550', '海阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1564', '1498', '潍坊', null, null);
INSERT INTO `province_city_area` VALUES ('1565', '1564', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1566', '1564', '潍城区', null, null);
INSERT INTO `province_city_area` VALUES ('1567', '1564', '寒亭区', null, null);
INSERT INTO `province_city_area` VALUES ('1568', '1564', '坊子区', null, null);
INSERT INTO `province_city_area` VALUES ('1569', '1564', '奎文区', null, null);
INSERT INTO `province_city_area` VALUES ('1570', '1564', '临朐县', null, null);
INSERT INTO `province_city_area` VALUES ('1571', '1564', '昌乐县', null, null);
INSERT INTO `province_city_area` VALUES ('1572', '1564', '青州市', null, null);
INSERT INTO `province_city_area` VALUES ('1573', '1564', '诸城市', null, null);
INSERT INTO `province_city_area` VALUES ('1574', '1564', '寿光市', null, null);
INSERT INTO `province_city_area` VALUES ('1575', '1564', '安丘市', null, null);
INSERT INTO `province_city_area` VALUES ('1576', '1564', '高密市', null, null);
INSERT INTO `province_city_area` VALUES ('1577', '1564', '昌邑市', null, null);
INSERT INTO `province_city_area` VALUES ('1578', '1498', '济宁', null, null);
INSERT INTO `province_city_area` VALUES ('1579', '1578', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1580', '1578', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('1581', '1578', '任城区', null, null);
INSERT INTO `province_city_area` VALUES ('1582', '1578', '微山县', null, null);
INSERT INTO `province_city_area` VALUES ('1583', '1578', '鱼台县', null, null);
INSERT INTO `province_city_area` VALUES ('1584', '1578', '金乡县', null, null);
INSERT INTO `province_city_area` VALUES ('1585', '1578', '嘉祥县', null, null);
INSERT INTO `province_city_area` VALUES ('1586', '1578', '汶上县', null, null);
INSERT INTO `province_city_area` VALUES ('1587', '1578', '泗水县', null, null);
INSERT INTO `province_city_area` VALUES ('1588', '1578', '梁山县', null, null);
INSERT INTO `province_city_area` VALUES ('1589', '1578', '曲阜市', null, null);
INSERT INTO `province_city_area` VALUES ('1590', '1578', '兖州市', null, null);
INSERT INTO `province_city_area` VALUES ('1591', '1578', '邹城市', null, null);
INSERT INTO `province_city_area` VALUES ('1592', '1498', '泰安', null, null);
INSERT INTO `province_city_area` VALUES ('1593', '1592', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1594', '1592', '泰山区', null, null);
INSERT INTO `province_city_area` VALUES ('1595', '1592', '岱岳区', null, null);
INSERT INTO `province_city_area` VALUES ('1596', '1592', '宁阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1597', '1592', '东平县', null, null);
INSERT INTO `province_city_area` VALUES ('1598', '1592', '新泰市', null, null);
INSERT INTO `province_city_area` VALUES ('1599', '1592', '肥城市', null, null);
INSERT INTO `province_city_area` VALUES ('1600', '1498', '威海', null, null);
INSERT INTO `province_city_area` VALUES ('1601', '1600', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1602', '1600', '环翠区', null, null);
INSERT INTO `province_city_area` VALUES ('1603', '1600', '文登市', null, null);
INSERT INTO `province_city_area` VALUES ('1604', '1600', '荣成市', null, null);
INSERT INTO `province_city_area` VALUES ('1605', '1600', '乳山市', null, null);
INSERT INTO `province_city_area` VALUES ('1606', '1498', '日照', null, null);
INSERT INTO `province_city_area` VALUES ('1607', '1606', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1608', '1606', '东港区', null, null);
INSERT INTO `province_city_area` VALUES ('1609', '1606', '五莲县', null, null);
INSERT INTO `province_city_area` VALUES ('1610', '1606', '莒  县', null, null);
INSERT INTO `province_city_area` VALUES ('1611', '1498', '莱芜', null, null);
INSERT INTO `province_city_area` VALUES ('1612', '1611', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1613', '1611', '莱城区', null, null);
INSERT INTO `province_city_area` VALUES ('1614', '1611', '钢城区', null, null);
INSERT INTO `province_city_area` VALUES ('1615', '1498', '临沂', null, null);
INSERT INTO `province_city_area` VALUES ('1616', '1615', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1617', '1615', '兰山区', null, null);
INSERT INTO `province_city_area` VALUES ('1618', '1615', '罗庄区', null, null);
INSERT INTO `province_city_area` VALUES ('1619', '1615', '河东区', null, null);
INSERT INTO `province_city_area` VALUES ('1620', '1615', '沂南县', null, null);
INSERT INTO `province_city_area` VALUES ('1621', '1615', '郯城县', null, null);
INSERT INTO `province_city_area` VALUES ('1622', '1615', '沂水县', null, null);
INSERT INTO `province_city_area` VALUES ('1623', '1615', '苍山县', null, null);
INSERT INTO `province_city_area` VALUES ('1624', '1615', '费  县', null, null);
INSERT INTO `province_city_area` VALUES ('1625', '1615', '平邑县', null, null);
INSERT INTO `province_city_area` VALUES ('1626', '1615', '莒南县', null, null);
INSERT INTO `province_city_area` VALUES ('1627', '1615', '蒙阴县', null, null);
INSERT INTO `province_city_area` VALUES ('1628', '1615', '临沭县', null, null);
INSERT INTO `province_city_area` VALUES ('1629', '1498', '德州', null, null);
INSERT INTO `province_city_area` VALUES ('1630', '1629', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1631', '1629', '德城区', null, null);
INSERT INTO `province_city_area` VALUES ('1632', '1629', '陵  县', null, null);
INSERT INTO `province_city_area` VALUES ('1633', '1629', '宁津县', null, null);
INSERT INTO `province_city_area` VALUES ('1634', '1629', '庆云县', null, null);
INSERT INTO `province_city_area` VALUES ('1635', '1629', '临邑县', null, null);
INSERT INTO `province_city_area` VALUES ('1636', '1629', '齐河县', null, null);
INSERT INTO `province_city_area` VALUES ('1637', '1629', '平原县', null, null);
INSERT INTO `province_city_area` VALUES ('1638', '1629', '夏津县', null, null);
INSERT INTO `province_city_area` VALUES ('1639', '1629', '武城县', null, null);
INSERT INTO `province_city_area` VALUES ('1640', '1629', '乐陵市', null, null);
INSERT INTO `province_city_area` VALUES ('1641', '1629', '禹城市', null, null);
INSERT INTO `province_city_area` VALUES ('1642', '1498', '聊城', null, null);
INSERT INTO `province_city_area` VALUES ('1643', '1642', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1644', '1642', '东昌府区', null, null);
INSERT INTO `province_city_area` VALUES ('1645', '1642', '阳谷县', null, null);
INSERT INTO `province_city_area` VALUES ('1646', '1642', '莘  县', null, null);
INSERT INTO `province_city_area` VALUES ('1647', '1642', '茌平县', null, null);
INSERT INTO `province_city_area` VALUES ('1648', '1642', '东阿县', null, null);
INSERT INTO `province_city_area` VALUES ('1649', '1642', '冠  县', null, null);
INSERT INTO `province_city_area` VALUES ('1650', '1642', '高唐县', null, null);
INSERT INTO `province_city_area` VALUES ('1651', '1642', '临清市', null, null);
INSERT INTO `province_city_area` VALUES ('1652', '1498', '滨州', null, null);
INSERT INTO `province_city_area` VALUES ('1653', '1652', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1654', '1652', '滨城区', null, null);
INSERT INTO `province_city_area` VALUES ('1655', '1652', '惠民县', null, null);
INSERT INTO `province_city_area` VALUES ('1656', '1652', '阳信县', null, null);
INSERT INTO `province_city_area` VALUES ('1657', '1652', '无棣县', null, null);
INSERT INTO `province_city_area` VALUES ('1658', '1652', '沾化县', null, null);
INSERT INTO `province_city_area` VALUES ('1659', '1652', '博兴县', null, null);
INSERT INTO `province_city_area` VALUES ('1660', '1652', '邹平县', null, null);
INSERT INTO `province_city_area` VALUES ('1661', '1498', '菏泽', null, null);
INSERT INTO `province_city_area` VALUES ('1662', '1661', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1663', '1661', '牡丹区', null, null);
INSERT INTO `province_city_area` VALUES ('1664', '1661', '曹  县', null, null);
INSERT INTO `province_city_area` VALUES ('1665', '1661', '单  县', null, null);
INSERT INTO `province_city_area` VALUES ('1666', '1661', '成武县', null, null);
INSERT INTO `province_city_area` VALUES ('1667', '1661', '巨野县', null, null);
INSERT INTO `province_city_area` VALUES ('1668', '1661', '郓城县', null, null);
INSERT INTO `province_city_area` VALUES ('1669', '1661', '鄄城县', null, null);
INSERT INTO `province_city_area` VALUES ('1670', '1661', '定陶县', null, null);
INSERT INTO `province_city_area` VALUES ('1671', '1661', '东明县', null, null);
INSERT INTO `province_city_area` VALUES ('1672', '0', '河南', null, null);
INSERT INTO `province_city_area` VALUES ('1673', '1672', '郑州', null, null);
INSERT INTO `province_city_area` VALUES ('1674', '1673', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1675', '1673', '中原区', null, null);
INSERT INTO `province_city_area` VALUES ('1676', '1673', '二七区', null, null);
INSERT INTO `province_city_area` VALUES ('1677', '1673', '管城回族区', null, null);
INSERT INTO `province_city_area` VALUES ('1678', '1673', '金水区', null, null);
INSERT INTO `province_city_area` VALUES ('1679', '1673', '上街区', null, null);
INSERT INTO `province_city_area` VALUES ('1680', '1673', '邙山区', null, null);
INSERT INTO `province_city_area` VALUES ('1681', '1673', '中牟县', null, null);
INSERT INTO `province_city_area` VALUES ('1682', '1673', '巩义市', null, null);
INSERT INTO `province_city_area` VALUES ('1683', '1673', '荥阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1684', '1673', '新密市', null, null);
INSERT INTO `province_city_area` VALUES ('1685', '1673', '新郑市', null, null);
INSERT INTO `province_city_area` VALUES ('1686', '1673', '登封市', null, null);
INSERT INTO `province_city_area` VALUES ('1687', '1672', '开封', null, null);
INSERT INTO `province_city_area` VALUES ('1688', '1687', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1689', '1687', '龙亭区', null, null);
INSERT INTO `province_city_area` VALUES ('1690', '1687', '顺河回族区', null, null);
INSERT INTO `province_city_area` VALUES ('1691', '1687', '鼓楼区', null, null);
INSERT INTO `province_city_area` VALUES ('1692', '1687', '南关区', null, null);
INSERT INTO `province_city_area` VALUES ('1693', '1687', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1694', '1687', '杞  县', null, null);
INSERT INTO `province_city_area` VALUES ('1695', '1687', '通许县', null, null);
INSERT INTO `province_city_area` VALUES ('1696', '1687', '尉氏县', null, null);
INSERT INTO `province_city_area` VALUES ('1697', '1687', '开封县', null, null);
INSERT INTO `province_city_area` VALUES ('1698', '1687', '兰考县', null, null);
INSERT INTO `province_city_area` VALUES ('1699', '1672', '洛阳', null, null);
INSERT INTO `province_city_area` VALUES ('1700', '1699', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1701', '1699', '老城区', null, null);
INSERT INTO `province_city_area` VALUES ('1702', '1699', '西工区', null, null);
INSERT INTO `province_city_area` VALUES ('1703', '1699', '廛河回族区', null, null);
INSERT INTO `province_city_area` VALUES ('1704', '1699', '涧西区', null, null);
INSERT INTO `province_city_area` VALUES ('1705', '1699', '吉利区', null, null);
INSERT INTO `province_city_area` VALUES ('1706', '1699', '洛龙区', null, null);
INSERT INTO `province_city_area` VALUES ('1707', '1699', '孟津县', null, null);
INSERT INTO `province_city_area` VALUES ('1708', '1699', '新安县', null, null);
INSERT INTO `province_city_area` VALUES ('1709', '1699', '栾川县', null, null);
INSERT INTO `province_city_area` VALUES ('1710', '1699', '嵩  县', null, null);
INSERT INTO `province_city_area` VALUES ('1711', '1699', '汝阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1712', '1699', '宜阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1713', '1699', '洛宁县', null, null);
INSERT INTO `province_city_area` VALUES ('1714', '1699', '伊川县', null, null);
INSERT INTO `province_city_area` VALUES ('1715', '1699', '偃师市', null, null);
INSERT INTO `province_city_area` VALUES ('1716', '1672', '平顶山', null, null);
INSERT INTO `province_city_area` VALUES ('1717', '1716', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1718', '1716', '新华区', null, null);
INSERT INTO `province_city_area` VALUES ('1719', '1716', '卫东区', null, null);
INSERT INTO `province_city_area` VALUES ('1720', '1716', '石龙区', null, null);
INSERT INTO `province_city_area` VALUES ('1721', '1716', '湛河区', null, null);
INSERT INTO `province_city_area` VALUES ('1722', '1716', '宝丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1723', '1716', '叶  县', null, null);
INSERT INTO `province_city_area` VALUES ('1724', '1716', '鲁山县', null, null);
INSERT INTO `province_city_area` VALUES ('1725', '1716', '郏  县', null, null);
INSERT INTO `province_city_area` VALUES ('1726', '1716', '舞钢市', null, null);
INSERT INTO `province_city_area` VALUES ('1727', '1716', '汝州市', null, null);
INSERT INTO `province_city_area` VALUES ('1728', '1672', '安阳', null, null);
INSERT INTO `province_city_area` VALUES ('1729', '1728', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1730', '1728', '文峰区', null, null);
INSERT INTO `province_city_area` VALUES ('1731', '1728', '北关区', null, null);
INSERT INTO `province_city_area` VALUES ('1732', '1728', '铁西区', null, null);
INSERT INTO `province_city_area` VALUES ('1733', '1728', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1734', '1728', '安阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1735', '1728', '汤阴县', null, null);
INSERT INTO `province_city_area` VALUES ('1736', '1728', '滑  县', null, null);
INSERT INTO `province_city_area` VALUES ('1737', '1728', '内黄县', null, null);
INSERT INTO `province_city_area` VALUES ('1738', '1728', '林州市', null, null);
INSERT INTO `province_city_area` VALUES ('1739', '1672', '鹤壁', null, null);
INSERT INTO `province_city_area` VALUES ('1740', '1739', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1741', '1739', '鹤山区', null, null);
INSERT INTO `province_city_area` VALUES ('1742', '1739', '山城区', null, null);
INSERT INTO `province_city_area` VALUES ('1743', '1739', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1744', '1739', '浚  县', null, null);
INSERT INTO `province_city_area` VALUES ('1745', '1739', '淇  县', null, null);
INSERT INTO `province_city_area` VALUES ('1746', '1672', '新乡', null, null);
INSERT INTO `province_city_area` VALUES ('1747', '1746', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1748', '1746', '红旗区', null, null);
INSERT INTO `province_city_area` VALUES ('1749', '1746', '新华区', null, null);
INSERT INTO `province_city_area` VALUES ('1750', '1746', '北站区', null, null);
INSERT INTO `province_city_area` VALUES ('1751', '1746', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('1752', '1746', '新乡县', null, null);
INSERT INTO `province_city_area` VALUES ('1753', '1746', '获嘉县', null, null);
INSERT INTO `province_city_area` VALUES ('1754', '1746', '原阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1755', '1746', '延津县', null, null);
INSERT INTO `province_city_area` VALUES ('1756', '1746', '封丘县', null, null);
INSERT INTO `province_city_area` VALUES ('1757', '1746', '长垣县', null, null);
INSERT INTO `province_city_area` VALUES ('1758', '1746', '卫辉市', null, null);
INSERT INTO `province_city_area` VALUES ('1759', '1746', '辉县市', null, null);
INSERT INTO `province_city_area` VALUES ('1760', '1672', '焦作', null, null);
INSERT INTO `province_city_area` VALUES ('1761', '1760', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1762', '1760', '解放区', null, null);
INSERT INTO `province_city_area` VALUES ('1763', '1760', '中站区', null, null);
INSERT INTO `province_city_area` VALUES ('1764', '1760', '马村区', null, null);
INSERT INTO `province_city_area` VALUES ('1765', '1760', '山阳区', null, null);
INSERT INTO `province_city_area` VALUES ('1766', '1760', '修武县', null, null);
INSERT INTO `province_city_area` VALUES ('1767', '1760', '博爱县', null, null);
INSERT INTO `province_city_area` VALUES ('1768', '1760', '武陟县', null, null);
INSERT INTO `province_city_area` VALUES ('1769', '1760', '温  县', null, null);
INSERT INTO `province_city_area` VALUES ('1770', '1760', '济源市', null, null);
INSERT INTO `province_city_area` VALUES ('1771', '1760', '沁阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1772', '1760', '孟州市', null, null);
INSERT INTO `province_city_area` VALUES ('1773', '1672', '濮阳', null, null);
INSERT INTO `province_city_area` VALUES ('1774', '1773', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1775', '1773', '市  区', null, null);
INSERT INTO `province_city_area` VALUES ('1776', '1773', '清丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1777', '1773', '南乐县', null, null);
INSERT INTO `province_city_area` VALUES ('1778', '1773', '范  县', null, null);
INSERT INTO `province_city_area` VALUES ('1779', '1773', '台前县', null, null);
INSERT INTO `province_city_area` VALUES ('1780', '1773', '濮阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1781', '1672', '许昌', null, null);
INSERT INTO `province_city_area` VALUES ('1782', '1781', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1783', '1781', '魏都区', null, null);
INSERT INTO `province_city_area` VALUES ('1784', '1781', '许昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1785', '1781', '鄢陵县', null, null);
INSERT INTO `province_city_area` VALUES ('1786', '1781', '襄城县', null, null);
INSERT INTO `province_city_area` VALUES ('1787', '1781', '禹州市', null, null);
INSERT INTO `province_city_area` VALUES ('1788', '1781', '长葛市', null, null);
INSERT INTO `province_city_area` VALUES ('1789', '1672', '漯河', null, null);
INSERT INTO `province_city_area` VALUES ('1790', '1789', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1791', '1789', '源汇区', null, null);
INSERT INTO `province_city_area` VALUES ('1792', '1789', '舞阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1793', '1789', '临颍县', null, null);
INSERT INTO `province_city_area` VALUES ('1794', '1789', '郾城县', null, null);
INSERT INTO `province_city_area` VALUES ('1795', '1672', '三门峡', null, null);
INSERT INTO `province_city_area` VALUES ('1796', '1795', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1797', '1795', '湖滨区', null, null);
INSERT INTO `province_city_area` VALUES ('1798', '1795', '渑池县', null, null);
INSERT INTO `province_city_area` VALUES ('1799', '1795', '陕  县', null, null);
INSERT INTO `province_city_area` VALUES ('1800', '1795', '卢氏县', null, null);
INSERT INTO `province_city_area` VALUES ('1801', '1795', '义马市', null, null);
INSERT INTO `province_city_area` VALUES ('1802', '1795', '灵宝市', null, null);
INSERT INTO `province_city_area` VALUES ('1803', '1672', '南阳', null, null);
INSERT INTO `province_city_area` VALUES ('1804', '1803', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1805', '1803', '宛城区', null, null);
INSERT INTO `province_city_area` VALUES ('1806', '1803', '卧龙区', null, null);
INSERT INTO `province_city_area` VALUES ('1807', '1803', '南召县', null, null);
INSERT INTO `province_city_area` VALUES ('1808', '1803', '方城县', null, null);
INSERT INTO `province_city_area` VALUES ('1809', '1803', '西峡县', null, null);
INSERT INTO `province_city_area` VALUES ('1810', '1803', '镇平县', null, null);
INSERT INTO `province_city_area` VALUES ('1811', '1803', '内乡县', null, null);
INSERT INTO `province_city_area` VALUES ('1812', '1803', '淅川县', null, null);
INSERT INTO `province_city_area` VALUES ('1813', '1803', '社旗县', null, null);
INSERT INTO `province_city_area` VALUES ('1814', '1803', '唐河县', null, null);
INSERT INTO `province_city_area` VALUES ('1815', '1803', '新野县', null, null);
INSERT INTO `province_city_area` VALUES ('1816', '1803', '桐柏县', null, null);
INSERT INTO `province_city_area` VALUES ('1817', '1803', '邓州市', null, null);
INSERT INTO `province_city_area` VALUES ('1818', '1672', '商丘', null, null);
INSERT INTO `province_city_area` VALUES ('1819', '1818', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1820', '1818', '梁园区', null, null);
INSERT INTO `province_city_area` VALUES ('1821', '1818', '睢阳区', null, null);
INSERT INTO `province_city_area` VALUES ('1822', '1818', '民权县', null, null);
INSERT INTO `province_city_area` VALUES ('1823', '1818', '睢  县', null, null);
INSERT INTO `province_city_area` VALUES ('1824', '1818', '宁陵县', null, null);
INSERT INTO `province_city_area` VALUES ('1825', '1818', '柘城县', null, null);
INSERT INTO `province_city_area` VALUES ('1826', '1818', '虞城县', null, null);
INSERT INTO `province_city_area` VALUES ('1827', '1818', '夏邑县', null, null);
INSERT INTO `province_city_area` VALUES ('1828', '1818', '永城市', null, null);
INSERT INTO `province_city_area` VALUES ('1829', '1672', '信阳', null, null);
INSERT INTO `province_city_area` VALUES ('1830', '1829', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1831', '1829', '师河区', null, null);
INSERT INTO `province_city_area` VALUES ('1832', '1829', '平桥区', null, null);
INSERT INTO `province_city_area` VALUES ('1833', '1829', '罗山县', null, null);
INSERT INTO `province_city_area` VALUES ('1834', '1829', '光山县', null, null);
INSERT INTO `province_city_area` VALUES ('1835', '1829', '新  县', null, null);
INSERT INTO `province_city_area` VALUES ('1836', '1829', '商城县', null, null);
INSERT INTO `province_city_area` VALUES ('1837', '1829', '固始县', null, null);
INSERT INTO `province_city_area` VALUES ('1838', '1829', '潢川县', null, null);
INSERT INTO `province_city_area` VALUES ('1839', '1829', '淮滨县', null, null);
INSERT INTO `province_city_area` VALUES ('1840', '1829', '息  县', null, null);
INSERT INTO `province_city_area` VALUES ('1841', '1672', '周口', null, null);
INSERT INTO `province_city_area` VALUES ('1842', '1841', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1843', '1841', '川汇区', null, null);
INSERT INTO `province_city_area` VALUES ('1844', '1841', '扶沟县', null, null);
INSERT INTO `province_city_area` VALUES ('1845', '1841', '西华县', null, null);
INSERT INTO `province_city_area` VALUES ('1846', '1841', '商水县', null, null);
INSERT INTO `province_city_area` VALUES ('1847', '1841', '沈丘县', null, null);
INSERT INTO `province_city_area` VALUES ('1848', '1841', '郸城县', null, null);
INSERT INTO `province_city_area` VALUES ('1849', '1841', '淮阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1850', '1841', '太康县', null, null);
INSERT INTO `province_city_area` VALUES ('1851', '1841', '鹿邑县', null, null);
INSERT INTO `province_city_area` VALUES ('1852', '1841', '项城市', null, null);
INSERT INTO `province_city_area` VALUES ('1853', '1672', '驻马店', null, null);
INSERT INTO `province_city_area` VALUES ('1854', '1853', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1855', '1853', '驿城区', null, null);
INSERT INTO `province_city_area` VALUES ('1856', '1853', '西平县', null, null);
INSERT INTO `province_city_area` VALUES ('1857', '1853', '上蔡县', null, null);
INSERT INTO `province_city_area` VALUES ('1858', '1853', '平舆县', null, null);
INSERT INTO `province_city_area` VALUES ('1859', '1853', '正阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1860', '1853', '确山县', null, null);
INSERT INTO `province_city_area` VALUES ('1861', '1853', '泌阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1862', '1853', '汝南县', null, null);
INSERT INTO `province_city_area` VALUES ('1863', '1853', '遂平县', null, null);
INSERT INTO `province_city_area` VALUES ('1864', '1853', '新蔡县', null, null);
INSERT INTO `province_city_area` VALUES ('1865', '0', '湖北', null, null);
INSERT INTO `province_city_area` VALUES ('1866', '1865', '武汉', null, null);
INSERT INTO `province_city_area` VALUES ('1867', '1866', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1868', '1866', '江岸区', null, null);
INSERT INTO `province_city_area` VALUES ('1869', '1866', '江汉区', null, null);
INSERT INTO `province_city_area` VALUES ('1870', '1866', '乔口区', null, null);
INSERT INTO `province_city_area` VALUES ('1871', '1866', '汉阳区', null, null);
INSERT INTO `province_city_area` VALUES ('1872', '1866', '武昌区', null, null);
INSERT INTO `province_city_area` VALUES ('1873', '1866', '青山区', null, null);
INSERT INTO `province_city_area` VALUES ('1874', '1866', '洪山区', null, null);
INSERT INTO `province_city_area` VALUES ('1875', '1866', '东西湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1876', '1866', '汉南区', null, null);
INSERT INTO `province_city_area` VALUES ('1877', '1866', '蔡甸区', null, null);
INSERT INTO `province_city_area` VALUES ('1878', '1866', '江夏区', null, null);
INSERT INTO `province_city_area` VALUES ('1879', '1866', '黄陂区', null, null);
INSERT INTO `province_city_area` VALUES ('1880', '1866', '新洲区', null, null);
INSERT INTO `province_city_area` VALUES ('1881', '1865', '黄石', null, null);
INSERT INTO `province_city_area` VALUES ('1882', '1881', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1883', '1881', '黄石港区', null, null);
INSERT INTO `province_city_area` VALUES ('1884', '1881', '石灰窑区', null, null);
INSERT INTO `province_city_area` VALUES ('1885', '1881', '下陆区', null, null);
INSERT INTO `province_city_area` VALUES ('1886', '1881', '铁山区', null, null);
INSERT INTO `province_city_area` VALUES ('1887', '1881', '阳新县', null, null);
INSERT INTO `province_city_area` VALUES ('1888', '1881', '大冶市', null, null);
INSERT INTO `province_city_area` VALUES ('1889', '1865', '十堰', null, null);
INSERT INTO `province_city_area` VALUES ('1890', '1889', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1891', '1889', '茅箭区', null, null);
INSERT INTO `province_city_area` VALUES ('1892', '1889', '张湾区', null, null);
INSERT INTO `province_city_area` VALUES ('1893', '1889', '郧  县', null, null);
INSERT INTO `province_city_area` VALUES ('1894', '1889', '郧西县', null, null);
INSERT INTO `province_city_area` VALUES ('1895', '1889', '竹山县', null, null);
INSERT INTO `province_city_area` VALUES ('1896', '1889', '竹溪县', null, null);
INSERT INTO `province_city_area` VALUES ('1897', '1889', '房  县', null, null);
INSERT INTO `province_city_area` VALUES ('1898', '1889', '丹江口市', null, null);
INSERT INTO `province_city_area` VALUES ('1899', '1865', '宜昌', null, null);
INSERT INTO `province_city_area` VALUES ('1900', '1899', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1901', '1899', '西陵区', null, null);
INSERT INTO `province_city_area` VALUES ('1902', '1899', '伍家岗区', null, null);
INSERT INTO `province_city_area` VALUES ('1903', '1899', '点军区', null, null);
INSERT INTO `province_city_area` VALUES ('1904', '1899', '虎亭区', null, null);
INSERT INTO `province_city_area` VALUES ('1905', '1899', '宜昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1906', '1899', '远安县', null, null);
INSERT INTO `province_city_area` VALUES ('1907', '1899', '兴山县', null, null);
INSERT INTO `province_city_area` VALUES ('1908', '1899', '秭归县', null, null);
INSERT INTO `province_city_area` VALUES ('1909', '1899', '长阳土家族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('1910', '1899', '五峰土家族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('1911', '1899', '宜都市', null, null);
INSERT INTO `province_city_area` VALUES ('1912', '1899', '当阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1913', '1899', '枝江市', null, null);
INSERT INTO `province_city_area` VALUES ('1914', '1865', '襄樊', null, null);
INSERT INTO `province_city_area` VALUES ('1915', '1914', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1916', '1914', '襄城区', null, null);
INSERT INTO `province_city_area` VALUES ('1917', '1914', '樊城区', null, null);
INSERT INTO `province_city_area` VALUES ('1918', '1914', '襄阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1919', '1914', '南漳县', null, null);
INSERT INTO `province_city_area` VALUES ('1920', '1914', '谷城县', null, null);
INSERT INTO `province_city_area` VALUES ('1921', '1914', '保康县', null, null);
INSERT INTO `province_city_area` VALUES ('1922', '1914', '老河口市', null, null);
INSERT INTO `province_city_area` VALUES ('1923', '1914', '枣阳市', null, null);
INSERT INTO `province_city_area` VALUES ('1924', '1914', '宜城市', null, null);
INSERT INTO `province_city_area` VALUES ('1925', '1865', '鄂州', null, null);
INSERT INTO `province_city_area` VALUES ('1926', '1925', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1927', '1925', '梁子湖区', null, null);
INSERT INTO `province_city_area` VALUES ('1928', '1925', '华容区', null, null);
INSERT INTO `province_city_area` VALUES ('1929', '1925', '鄂城区', null, null);
INSERT INTO `province_city_area` VALUES ('1930', '1865', '荆门', null, null);
INSERT INTO `province_city_area` VALUES ('1931', '1930', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1932', '1930', '东宝区', null, null);
INSERT INTO `province_city_area` VALUES ('1933', '1930', '京山县', null, null);
INSERT INTO `province_city_area` VALUES ('1934', '1930', '沙洋县', null, null);
INSERT INTO `province_city_area` VALUES ('1935', '1930', '钟祥市', null, null);
INSERT INTO `province_city_area` VALUES ('1936', '1865', '孝感', null, null);
INSERT INTO `province_city_area` VALUES ('1937', '1936', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1938', '1936', '孝南区', null, null);
INSERT INTO `province_city_area` VALUES ('1939', '1936', '孝昌县', null, null);
INSERT INTO `province_city_area` VALUES ('1940', '1936', '大悟县', null, null);
INSERT INTO `province_city_area` VALUES ('1941', '1936', '云梦县', null, null);
INSERT INTO `province_city_area` VALUES ('1942', '1936', '应城市', null, null);
INSERT INTO `province_city_area` VALUES ('1943', '1936', '安陆市', null, null);
INSERT INTO `province_city_area` VALUES ('1944', '1936', '汉川市', null, null);
INSERT INTO `province_city_area` VALUES ('1945', '1865', '荆州', null, null);
INSERT INTO `province_city_area` VALUES ('1946', '1945', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1947', '1945', '沙市区', null, null);
INSERT INTO `province_city_area` VALUES ('1948', '1945', '荆州区', null, null);
INSERT INTO `province_city_area` VALUES ('1949', '1945', '公安县', null, null);
INSERT INTO `province_city_area` VALUES ('1950', '1945', '监利县', null, null);
INSERT INTO `province_city_area` VALUES ('1951', '1945', '江陵县', null, null);
INSERT INTO `province_city_area` VALUES ('1952', '1945', '石首市', null, null);
INSERT INTO `province_city_area` VALUES ('1953', '1945', '洪湖市', null, null);
INSERT INTO `province_city_area` VALUES ('1954', '1945', '松滋市', null, null);
INSERT INTO `province_city_area` VALUES ('1955', '1865', '黄冈', null, null);
INSERT INTO `province_city_area` VALUES ('1956', '1955', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1957', '1955', '黄州区', null, null);
INSERT INTO `province_city_area` VALUES ('1958', '1955', '团风县', null, null);
INSERT INTO `province_city_area` VALUES ('1959', '1955', '红安县', null, null);
INSERT INTO `province_city_area` VALUES ('1960', '1955', '罗田县', null, null);
INSERT INTO `province_city_area` VALUES ('1961', '1955', '英山县', null, null);
INSERT INTO `province_city_area` VALUES ('1962', '1955', '浠水县', null, null);
INSERT INTO `province_city_area` VALUES ('1963', '1955', '蕲春县', null, null);
INSERT INTO `province_city_area` VALUES ('1964', '1955', '黄梅县', null, null);
INSERT INTO `province_city_area` VALUES ('1965', '1955', '麻城市', null, null);
INSERT INTO `province_city_area` VALUES ('1966', '1955', '武穴市', null, null);
INSERT INTO `province_city_area` VALUES ('1967', '1865', '咸宁', null, null);
INSERT INTO `province_city_area` VALUES ('1968', '1967', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1969', '1967', '咸安区', null, null);
INSERT INTO `province_city_area` VALUES ('1970', '1967', '嘉鱼县', null, null);
INSERT INTO `province_city_area` VALUES ('1971', '1967', '通城县', null, null);
INSERT INTO `province_city_area` VALUES ('1972', '1967', '崇阳县', null, null);
INSERT INTO `province_city_area` VALUES ('1973', '1967', '通山县', null, null);
INSERT INTO `province_city_area` VALUES ('1974', '1967', '赤壁市', null, null);
INSERT INTO `province_city_area` VALUES ('1975', '1865', '随州', null, null);
INSERT INTO `province_city_area` VALUES ('1976', '1975', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1977', '1975', '曾都区', null, null);
INSERT INTO `province_city_area` VALUES ('1978', '1975', '广水市', null, null);
INSERT INTO `province_city_area` VALUES ('1980', '1979', '恩施市', null, null);
INSERT INTO `province_city_area` VALUES ('1981', '1979', '利川市', null, null);
INSERT INTO `province_city_area` VALUES ('1982', '1979', '建始县', null, null);
INSERT INTO `province_city_area` VALUES ('1983', '1979', '巴东县', null, null);
INSERT INTO `province_city_area` VALUES ('1984', '1979', '宣恩县', null, null);
INSERT INTO `province_city_area` VALUES ('1985', '1979', '咸丰县', null, null);
INSERT INTO `province_city_area` VALUES ('1986', '1979', '来凤县', null, null);
INSERT INTO `province_city_area` VALUES ('1987', '1979', '鹤峰县', null, null);
INSERT INTO `province_city_area` VALUES ('1988', '1865', '省直辖行政单位', null, null);
INSERT INTO `province_city_area` VALUES ('1989', '1988', '仙桃市', null, null);
INSERT INTO `province_city_area` VALUES ('1990', '1988', '潜江市', null, null);
INSERT INTO `province_city_area` VALUES ('1991', '1988', '天门市', null, null);
INSERT INTO `province_city_area` VALUES ('1992', '1988', '神农架林区', null, null);
INSERT INTO `province_city_area` VALUES ('1993', '0', '湖南', null, null);
INSERT INTO `province_city_area` VALUES ('1994', '1993', '长沙', null, null);
INSERT INTO `province_city_area` VALUES ('1995', '1994', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('1996', '1994', '芙蓉区', null, null);
INSERT INTO `province_city_area` VALUES ('1997', '1994', '天心区', null, null);
INSERT INTO `province_city_area` VALUES ('1998', '1994', '岳麓区', null, null);
INSERT INTO `province_city_area` VALUES ('1999', '1994', '开福区', null, null);
INSERT INTO `province_city_area` VALUES ('2000', '1994', '雨花区', null, null);
INSERT INTO `province_city_area` VALUES ('2001', '1994', '长沙县', null, null);
INSERT INTO `province_city_area` VALUES ('2002', '1994', '望城县', null, null);
INSERT INTO `province_city_area` VALUES ('2003', '1994', '宁乡县', null, null);
INSERT INTO `province_city_area` VALUES ('2004', '1994', '浏阳市', null, null);
INSERT INTO `province_city_area` VALUES ('2005', '1993', '株洲', null, null);
INSERT INTO `province_city_area` VALUES ('2006', '2005', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2007', '2005', '荷塘区', null, null);
INSERT INTO `province_city_area` VALUES ('2008', '2005', '芦淞区', null, null);
INSERT INTO `province_city_area` VALUES ('2009', '2005', '石峰区', null, null);
INSERT INTO `province_city_area` VALUES ('2010', '2005', '天元区', null, null);
INSERT INTO `province_city_area` VALUES ('2011', '2005', '株洲县', null, null);
INSERT INTO `province_city_area` VALUES ('2012', '2005', '攸  县', null, null);
INSERT INTO `province_city_area` VALUES ('2013', '2005', '茶陵县', null, null);
INSERT INTO `province_city_area` VALUES ('2014', '2005', '炎陵县', null, null);
INSERT INTO `province_city_area` VALUES ('2015', '2005', '醴陵市', null, null);
INSERT INTO `province_city_area` VALUES ('2016', '1993', '湘潭', null, null);
INSERT INTO `province_city_area` VALUES ('2017', '2016', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2018', '2016', '雨湖区', null, null);
INSERT INTO `province_city_area` VALUES ('2019', '2016', '岳塘区', null, null);
INSERT INTO `province_city_area` VALUES ('2020', '2016', '湘潭县', null, null);
INSERT INTO `province_city_area` VALUES ('2021', '2016', '湘乡市', null, null);
INSERT INTO `province_city_area` VALUES ('2022', '2016', '韶山市', null, null);
INSERT INTO `province_city_area` VALUES ('2023', '1993', '衡阳', null, null);
INSERT INTO `province_city_area` VALUES ('2024', '2023', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2025', '2023', '江东区', null, null);
INSERT INTO `province_city_area` VALUES ('2026', '2023', '城南区', null, null);
INSERT INTO `province_city_area` VALUES ('2027', '2023', '城北区', null, null);
INSERT INTO `province_city_area` VALUES ('2028', '2023', '郊   区', null, null);
INSERT INTO `province_city_area` VALUES ('2029', '2023', '南岳区', null, null);
INSERT INTO `province_city_area` VALUES ('2030', '2023', '衡阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2031', '2023', '衡南县', null, null);
INSERT INTO `province_city_area` VALUES ('2032', '2023', '衡山县', null, null);
INSERT INTO `province_city_area` VALUES ('2033', '2023', '衡东县', null, null);
INSERT INTO `province_city_area` VALUES ('2034', '2023', '祁东县', null, null);
INSERT INTO `province_city_area` VALUES ('2035', '2023', '耒阳市', null, null);
INSERT INTO `province_city_area` VALUES ('2036', '2023', '常宁市', null, null);
INSERT INTO `province_city_area` VALUES ('2037', '1993', '邵阳', null, null);
INSERT INTO `province_city_area` VALUES ('2038', '2037', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2039', '2037', '双清区', null, null);
INSERT INTO `province_city_area` VALUES ('2040', '2037', '大祥区', null, null);
INSERT INTO `province_city_area` VALUES ('2041', '2037', '北塔区', null, null);
INSERT INTO `province_city_area` VALUES ('2042', '2037', '邵东县', null, null);
INSERT INTO `province_city_area` VALUES ('2043', '2037', '新邵县', null, null);
INSERT INTO `province_city_area` VALUES ('2044', '2037', '邵阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2045', '2037', '隆回县', null, null);
INSERT INTO `province_city_area` VALUES ('2046', '2037', '洞口县', null, null);
INSERT INTO `province_city_area` VALUES ('2047', '2037', '绥宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2048', '2037', '新宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2049', '2037', '城步苗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2050', '2037', '武冈市', null, null);
INSERT INTO `province_city_area` VALUES ('2051', '1993', '岳阳', null, null);
INSERT INTO `province_city_area` VALUES ('2052', '2051', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2053', '2051', '岳阳楼区', null, null);
INSERT INTO `province_city_area` VALUES ('2054', '2051', '云溪区', null, null);
INSERT INTO `province_city_area` VALUES ('2055', '2051', '君山区', null, null);
INSERT INTO `province_city_area` VALUES ('2056', '2051', '岳阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2057', '2051', '华容县', null, null);
INSERT INTO `province_city_area` VALUES ('2058', '2051', '湘阴县', null, null);
INSERT INTO `province_city_area` VALUES ('2059', '2051', '平江县', null, null);
INSERT INTO `province_city_area` VALUES ('2060', '2051', '汨罗市', null, null);
INSERT INTO `province_city_area` VALUES ('2061', '2051', '临湘市', null, null);
INSERT INTO `province_city_area` VALUES ('2062', '1993', '常德', null, null);
INSERT INTO `province_city_area` VALUES ('2063', '2062', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2064', '2062', '武陵区', null, null);
INSERT INTO `province_city_area` VALUES ('2065', '2062', '鼎城区', null, null);
INSERT INTO `province_city_area` VALUES ('2066', '2062', '安乡县', null, null);
INSERT INTO `province_city_area` VALUES ('2067', '2062', '汉寿县', null, null);
INSERT INTO `province_city_area` VALUES ('2068', '2062', '澧  县', null, null);
INSERT INTO `province_city_area` VALUES ('2069', '2062', '临澧县', null, null);
INSERT INTO `province_city_area` VALUES ('2070', '2062', '桃源县', null, null);
INSERT INTO `province_city_area` VALUES ('2071', '2062', '石门县', null, null);
INSERT INTO `province_city_area` VALUES ('2072', '2062', '津市市', null, null);
INSERT INTO `province_city_area` VALUES ('2073', '1993', '张家界', null, null);
INSERT INTO `province_city_area` VALUES ('2074', '2073', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2075', '2073', '永定区', null, null);
INSERT INTO `province_city_area` VALUES ('2076', '2073', '武陵源区', null, null);
INSERT INTO `province_city_area` VALUES ('2077', '2073', '慈利县', null, null);
INSERT INTO `province_city_area` VALUES ('2078', '2073', '桑植县', null, null);
INSERT INTO `province_city_area` VALUES ('2079', '1993', '益阳', null, null);
INSERT INTO `province_city_area` VALUES ('2080', '2079', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2081', '2079', '资阳区', null, null);
INSERT INTO `province_city_area` VALUES ('2082', '2079', '赫山区', null, null);
INSERT INTO `province_city_area` VALUES ('2083', '2079', '南  县', null, null);
INSERT INTO `province_city_area` VALUES ('2084', '2079', '桃江县', null, null);
INSERT INTO `province_city_area` VALUES ('2085', '2079', '安化县', null, null);
INSERT INTO `province_city_area` VALUES ('2086', '2079', '沅江市', null, null);
INSERT INTO `province_city_area` VALUES ('2087', '1993', '郴州', null, null);
INSERT INTO `province_city_area` VALUES ('2088', '2087', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2089', '2087', '北湖区', null, null);
INSERT INTO `province_city_area` VALUES ('2090', '2087', '苏仙区', null, null);
INSERT INTO `province_city_area` VALUES ('2091', '2087', '桂阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2092', '2087', '宜章县', null, null);
INSERT INTO `province_city_area` VALUES ('2093', '2087', '永兴县', null, null);
INSERT INTO `province_city_area` VALUES ('2094', '2087', '嘉禾县', null, null);
INSERT INTO `province_city_area` VALUES ('2095', '2087', '临武县', null, null);
INSERT INTO `province_city_area` VALUES ('2096', '2087', '汝城县', null, null);
INSERT INTO `province_city_area` VALUES ('2097', '2087', '桂东县', null, null);
INSERT INTO `province_city_area` VALUES ('2098', '2087', '安仁县', null, null);
INSERT INTO `province_city_area` VALUES ('2099', '2087', '资兴市', null, null);
INSERT INTO `province_city_area` VALUES ('2100', '1993', '永州', null, null);
INSERT INTO `province_city_area` VALUES ('2101', '2100', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2102', '2100', '芝山区', null, null);
INSERT INTO `province_city_area` VALUES ('2103', '2100', '冷水滩区', null, null);
INSERT INTO `province_city_area` VALUES ('2104', '2100', '祁阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2105', '2100', '东安县', null, null);
INSERT INTO `province_city_area` VALUES ('2106', '2100', '双牌县', null, null);
INSERT INTO `province_city_area` VALUES ('2107', '2100', '道  县', null, null);
INSERT INTO `province_city_area` VALUES ('2108', '2100', '江永县', null, null);
INSERT INTO `province_city_area` VALUES ('2109', '2100', '宁远县', null, null);
INSERT INTO `province_city_area` VALUES ('2110', '2100', '蓝山县', null, null);
INSERT INTO `province_city_area` VALUES ('2111', '2100', '新田县', null, null);
INSERT INTO `province_city_area` VALUES ('2112', '2100', '江华瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2113', '1993', '怀化', null, null);
INSERT INTO `province_city_area` VALUES ('2114', '2113', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2115', '2113', '鹤城区', null, null);
INSERT INTO `province_city_area` VALUES ('2116', '2113', '中方县', null, null);
INSERT INTO `province_city_area` VALUES ('2117', '2113', '沅陵县', null, null);
INSERT INTO `province_city_area` VALUES ('2118', '2113', '辰溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2119', '2113', '溆浦县', null, null);
INSERT INTO `province_city_area` VALUES ('2120', '2113', '会同县', null, null);
INSERT INTO `province_city_area` VALUES ('2121', '2113', '麻阳苗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2122', '2113', '新晃侗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2123', '2113', '芷江侗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2125', '2113', '通道侗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2126', '2113', '洪江市', null, null);
INSERT INTO `province_city_area` VALUES ('2127', '1993', '娄底', null, null);
INSERT INTO `province_city_area` VALUES ('2128', '2127', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2129', '2127', '娄星区', null, null);
INSERT INTO `province_city_area` VALUES ('2130', '2127', '双峰县', null, null);
INSERT INTO `province_city_area` VALUES ('2131', '2127', '新化县', null, null);
INSERT INTO `province_city_area` VALUES ('2132', '2127', '冷水江市', null, null);
INSERT INTO `province_city_area` VALUES ('2133', '2127', '涟源市', null, null);
INSERT INTO `province_city_area` VALUES ('2135', '2134', '吉首市', null, null);
INSERT INTO `province_city_area` VALUES ('2136', '2134', '泸溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2137', '2134', '凤凰县', null, null);
INSERT INTO `province_city_area` VALUES ('2138', '2134', '花垣县', null, null);
INSERT INTO `province_city_area` VALUES ('2139', '2134', '保靖县', null, null);
INSERT INTO `province_city_area` VALUES ('2140', '2134', '古丈县', null, null);
INSERT INTO `province_city_area` VALUES ('2141', '2134', '永顺县', null, null);
INSERT INTO `province_city_area` VALUES ('2142', '2134', '龙山县', null, null);
INSERT INTO `province_city_area` VALUES ('2143', '0', '广东', null, null);
INSERT INTO `province_city_area` VALUES ('2144', '2143', '广州', null, null);
INSERT INTO `province_city_area` VALUES ('2145', '2144', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2146', '2144', '东山区', null, null);
INSERT INTO `province_city_area` VALUES ('2147', '2144', '荔湾区', null, null);
INSERT INTO `province_city_area` VALUES ('2148', '2144', '越秀区', null, null);
INSERT INTO `province_city_area` VALUES ('2149', '2144', '海珠区', null, null);
INSERT INTO `province_city_area` VALUES ('2150', '2144', '天河区', null, null);
INSERT INTO `province_city_area` VALUES ('2151', '2144', '芳村区', null, null);
INSERT INTO `province_city_area` VALUES ('2152', '2144', '白云区', null, null);
INSERT INTO `province_city_area` VALUES ('2153', '2144', '黄埔区', null, null);
INSERT INTO `province_city_area` VALUES ('2154', '2144', '番禺区', null, null);
INSERT INTO `province_city_area` VALUES ('2155', '2144', '花都区', null, null);
INSERT INTO `province_city_area` VALUES ('2156', '2144', '增城市', null, null);
INSERT INTO `province_city_area` VALUES ('2157', '2144', '从化市', null, null);
INSERT INTO `province_city_area` VALUES ('2158', '2143', '韶关', null, null);
INSERT INTO `province_city_area` VALUES ('2159', '2158', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2160', '2158', '北江区', null, null);
INSERT INTO `province_city_area` VALUES ('2161', '2158', '武江区', null, null);
INSERT INTO `province_city_area` VALUES ('2162', '2158', '浈江区', null, null);
INSERT INTO `province_city_area` VALUES ('2163', '2158', '曲江县', null, null);
INSERT INTO `province_city_area` VALUES ('2164', '2158', '始兴县', null, null);
INSERT INTO `province_city_area` VALUES ('2165', '2158', '仁化县', null, null);
INSERT INTO `province_city_area` VALUES ('2166', '2158', '翁源县', null, null);
INSERT INTO `province_city_area` VALUES ('2167', '2158', '乳源瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2168', '2158', '新丰县', null, null);
INSERT INTO `province_city_area` VALUES ('2169', '2158', '乐昌市', null, null);
INSERT INTO `province_city_area` VALUES ('2170', '2158', '南雄市', null, null);
INSERT INTO `province_city_area` VALUES ('2171', '2143', '深圳', null, null);
INSERT INTO `province_city_area` VALUES ('2172', '2171', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2173', '2171', '罗湖区', null, null);
INSERT INTO `province_city_area` VALUES ('2174', '2171', '福田区', null, null);
INSERT INTO `province_city_area` VALUES ('2175', '2171', '南山区', null, null);
INSERT INTO `province_city_area` VALUES ('2176', '2171', '宝安区', null, null);
INSERT INTO `province_city_area` VALUES ('2177', '2171', '龙岗区', null, null);
INSERT INTO `province_city_area` VALUES ('2178', '2171', '盐田区', null, null);
INSERT INTO `province_city_area` VALUES ('2179', '2143', '珠海', null, null);
INSERT INTO `province_city_area` VALUES ('2180', '2179', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2181', '2179', '香洲区', null, null);
INSERT INTO `province_city_area` VALUES ('2182', '2179', '斗门县', null, null);
INSERT INTO `province_city_area` VALUES ('2183', '2143', '汕头', null, null);
INSERT INTO `province_city_area` VALUES ('2184', '2183', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2185', '2183', '达濠区', null, null);
INSERT INTO `province_city_area` VALUES ('2186', '2183', '龙湖区', null, null);
INSERT INTO `province_city_area` VALUES ('2187', '2183', '金园区', null, null);
INSERT INTO `province_city_area` VALUES ('2188', '2183', '升平区', null, null);
INSERT INTO `province_city_area` VALUES ('2189', '2183', '河浦区', null, null);
INSERT INTO `province_city_area` VALUES ('2190', '2183', '南澳县', null, null);
INSERT INTO `province_city_area` VALUES ('2191', '2183', '潮阳市', null, null);
INSERT INTO `province_city_area` VALUES ('2192', '2183', '澄海市', null, null);
INSERT INTO `province_city_area` VALUES ('2193', '2143', '佛山', null, null);
INSERT INTO `province_city_area` VALUES ('2194', '2193', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2195', '2193', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('2196', '2193', '石湾区', null, null);
INSERT INTO `province_city_area` VALUES ('2197', '2193', '顺德市', null, null);
INSERT INTO `province_city_area` VALUES ('2198', '2193', '南海市', null, null);
INSERT INTO `province_city_area` VALUES ('2199', '2193', '三水市', null, null);
INSERT INTO `province_city_area` VALUES ('2200', '2193', '高明市', null, null);
INSERT INTO `province_city_area` VALUES ('2201', '2143', '江门', null, null);
INSERT INTO `province_city_area` VALUES ('2202', '2201', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2203', '2201', '蓬江区', null, null);
INSERT INTO `province_city_area` VALUES ('2204', '2201', '江海区', null, null);
INSERT INTO `province_city_area` VALUES ('2205', '2201', '台山市', null, null);
INSERT INTO `province_city_area` VALUES ('2206', '2201', '新会市', null, null);
INSERT INTO `province_city_area` VALUES ('2207', '2201', '开平市', null, null);
INSERT INTO `province_city_area` VALUES ('2208', '2201', '鹤山市', null, null);
INSERT INTO `province_city_area` VALUES ('2209', '2201', '恩平市', null, null);
INSERT INTO `province_city_area` VALUES ('2210', '2143', '湛江', null, null);
INSERT INTO `province_city_area` VALUES ('2211', '2210', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2212', '2210', '赤坎区', null, null);
INSERT INTO `province_city_area` VALUES ('2213', '2210', '霞山区', null, null);
INSERT INTO `province_city_area` VALUES ('2214', '2210', '坡头区', null, null);
INSERT INTO `province_city_area` VALUES ('2215', '2210', '麻章区', null, null);
INSERT INTO `province_city_area` VALUES ('2216', '2210', '遂溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2217', '2210', '徐闻县', null, null);
INSERT INTO `province_city_area` VALUES ('2218', '2210', '廉江市', null, null);
INSERT INTO `province_city_area` VALUES ('2219', '2210', '雷州市', null, null);
INSERT INTO `province_city_area` VALUES ('2220', '2210', '吴川市', null, null);
INSERT INTO `province_city_area` VALUES ('2221', '2143', '茂名', null, null);
INSERT INTO `province_city_area` VALUES ('2222', '2221', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2223', '2221', '茂南区', null, null);
INSERT INTO `province_city_area` VALUES ('2224', '2221', '电白县', null, null);
INSERT INTO `province_city_area` VALUES ('2225', '2221', '高州市', null, null);
INSERT INTO `province_city_area` VALUES ('2226', '2221', '化州市', null, null);
INSERT INTO `province_city_area` VALUES ('2227', '2221', '信宜市', null, null);
INSERT INTO `province_city_area` VALUES ('2228', '2143', '肇庆', null, null);
INSERT INTO `province_city_area` VALUES ('2229', '2228', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2230', '2228', '端州区', null, null);
INSERT INTO `province_city_area` VALUES ('2231', '2228', '鼎湖区', null, null);
INSERT INTO `province_city_area` VALUES ('2232', '2228', '广宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2233', '2228', '怀集县', null, null);
INSERT INTO `province_city_area` VALUES ('2234', '2228', '封开县', null, null);
INSERT INTO `province_city_area` VALUES ('2235', '2228', '德庆县', null, null);
INSERT INTO `province_city_area` VALUES ('2236', '2228', '高要市', null, null);
INSERT INTO `province_city_area` VALUES ('2237', '2228', '四会市', null, null);
INSERT INTO `province_city_area` VALUES ('2238', '2143', '惠州', null, null);
INSERT INTO `province_city_area` VALUES ('2239', '2238', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2240', '2238', '惠城区', null, null);
INSERT INTO `province_city_area` VALUES ('2241', '2238', '博罗县', null, null);
INSERT INTO `province_city_area` VALUES ('2242', '2238', '惠东县', null, null);
INSERT INTO `province_city_area` VALUES ('2243', '2238', '龙门县', null, null);
INSERT INTO `province_city_area` VALUES ('2244', '2238', '惠阳市', null, null);
INSERT INTO `province_city_area` VALUES ('2245', '2143', '梅州', null, null);
INSERT INTO `province_city_area` VALUES ('2246', '2245', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2247', '2245', '梅江区', null, null);
INSERT INTO `province_city_area` VALUES ('2248', '2245', '梅  县', null, null);
INSERT INTO `province_city_area` VALUES ('2249', '2245', '大埔县', null, null);
INSERT INTO `province_city_area` VALUES ('2250', '2245', '丰顺县', null, null);
INSERT INTO `province_city_area` VALUES ('2251', '2245', '五华县', null, null);
INSERT INTO `province_city_area` VALUES ('2252', '2245', '平远县', null, null);
INSERT INTO `province_city_area` VALUES ('2253', '2245', '蕉岭县', null, null);
INSERT INTO `province_city_area` VALUES ('2254', '2245', '兴宁市', null, null);
INSERT INTO `province_city_area` VALUES ('2255', '2143', '汕尾', null, null);
INSERT INTO `province_city_area` VALUES ('2256', '2255', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2257', '2255', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('2258', '2255', '海丰县', null, null);
INSERT INTO `province_city_area` VALUES ('2259', '2255', '陆河县', null, null);
INSERT INTO `province_city_area` VALUES ('2260', '2255', '陆丰市', null, null);
INSERT INTO `province_city_area` VALUES ('2261', '2143', '河源', null, null);
INSERT INTO `province_city_area` VALUES ('2262', '2261', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2263', '2261', '源城区', null, null);
INSERT INTO `province_city_area` VALUES ('2264', '2261', '紫金县', null, null);
INSERT INTO `province_city_area` VALUES ('2265', '2261', '龙川县', null, null);
INSERT INTO `province_city_area` VALUES ('2266', '2261', '连平县', null, null);
INSERT INTO `province_city_area` VALUES ('2267', '2261', '和平县', null, null);
INSERT INTO `province_city_area` VALUES ('2268', '2261', '东源县', null, null);
INSERT INTO `province_city_area` VALUES ('2269', '2143', '阳江', null, null);
INSERT INTO `province_city_area` VALUES ('2270', '2269', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2271', '2269', '江城区', null, null);
INSERT INTO `province_city_area` VALUES ('2272', '2269', '阳西县', null, null);
INSERT INTO `province_city_area` VALUES ('2273', '2269', '阳东县', null, null);
INSERT INTO `province_city_area` VALUES ('2274', '2269', '阳春市', null, null);
INSERT INTO `province_city_area` VALUES ('2275', '2143', '清远', null, null);
INSERT INTO `province_city_area` VALUES ('2276', '2275', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2277', '2275', '清城区', null, null);
INSERT INTO `province_city_area` VALUES ('2278', '2275', '佛冈县', null, null);
INSERT INTO `province_city_area` VALUES ('2279', '2275', '阳山县', null, null);
INSERT INTO `province_city_area` VALUES ('2281', '2275', '连南瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2282', '2275', '清新县', null, null);
INSERT INTO `province_city_area` VALUES ('2283', '2275', '英德市', null, null);
INSERT INTO `province_city_area` VALUES ('2284', '2275', '连州市', null, null);
INSERT INTO `province_city_area` VALUES ('2285', '2143', '东莞', null, null);
INSERT INTO `province_city_area` VALUES ('2286', '2285', '莞城区', null, null);
INSERT INTO `province_city_area` VALUES ('2287', '2285', '东城区', null, null);
INSERT INTO `province_city_area` VALUES ('2288', '2285', '南城区', null, null);
INSERT INTO `province_city_area` VALUES ('2289', '2285', '万江区', null, null);
INSERT INTO `province_city_area` VALUES ('2290', '2143', '中山', null, null);
INSERT INTO `province_city_area` VALUES ('2291', '2290', '石岐区', null, null);
INSERT INTO `province_city_area` VALUES ('2292', '2290', '东区', null, null);
INSERT INTO `province_city_area` VALUES ('2293', '2290', '西区', null, null);
INSERT INTO `province_city_area` VALUES ('2294', '2290', '南区', null, null);
INSERT INTO `province_city_area` VALUES ('2295', '2290', '五桂山', null, null);
INSERT INTO `province_city_area` VALUES ('2296', '2143', '潮州', null, null);
INSERT INTO `province_city_area` VALUES ('2297', '2296', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2298', '2296', '湘桥区', null, null);
INSERT INTO `province_city_area` VALUES ('2299', '2296', '潮安县', null, null);
INSERT INTO `province_city_area` VALUES ('2300', '2296', '饶平县', null, null);
INSERT INTO `province_city_area` VALUES ('2301', '2143', '揭阳', null, null);
INSERT INTO `province_city_area` VALUES ('2302', '2301', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2303', '2301', '榕城区', null, null);
INSERT INTO `province_city_area` VALUES ('2304', '2301', '揭东县', null, null);
INSERT INTO `province_city_area` VALUES ('2305', '2301', '揭西县', null, null);
INSERT INTO `province_city_area` VALUES ('2306', '2301', '惠来县', null, null);
INSERT INTO `province_city_area` VALUES ('2307', '2301', '普宁市', null, null);
INSERT INTO `province_city_area` VALUES ('2308', '2143', '云浮', null, null);
INSERT INTO `province_city_area` VALUES ('2309', '2308', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2310', '2308', '云城区', null, null);
INSERT INTO `province_city_area` VALUES ('2311', '2308', '新兴县', null, null);
INSERT INTO `province_city_area` VALUES ('2312', '2308', '郁南县', null, null);
INSERT INTO `province_city_area` VALUES ('2313', '2308', '云安县', null, null);
INSERT INTO `province_city_area` VALUES ('2314', '2308', '罗定市', null, null);
INSERT INTO `province_city_area` VALUES ('2315', '0', '广西', null, null);
INSERT INTO `province_city_area` VALUES ('2316', '2315', '南宁', null, null);
INSERT INTO `province_city_area` VALUES ('2317', '2316', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2318', '2316', '兴宁区', null, null);
INSERT INTO `province_city_area` VALUES ('2319', '2316', '新城区', null, null);
INSERT INTO `province_city_area` VALUES ('2320', '2316', '城北区', null, null);
INSERT INTO `province_city_area` VALUES ('2321', '2316', '江南区', null, null);
INSERT INTO `province_city_area` VALUES ('2322', '2316', '永新区', null, null);
INSERT INTO `province_city_area` VALUES ('2323', '2316', '市郊区', null, null);
INSERT INTO `province_city_area` VALUES ('2324', '2316', '邕宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2325', '2316', '武鸣县', null, null);
INSERT INTO `province_city_area` VALUES ('2326', '2315', '柳州', null, null);
INSERT INTO `province_city_area` VALUES ('2327', '2326', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2328', '2326', '城中区', null, null);
INSERT INTO `province_city_area` VALUES ('2329', '2326', '鱼峰区', null, null);
INSERT INTO `province_city_area` VALUES ('2330', '2326', '柳南区', null, null);
INSERT INTO `province_city_area` VALUES ('2331', '2326', '柳北区', null, null);
INSERT INTO `province_city_area` VALUES ('2332', '2326', '市郊区', null, null);
INSERT INTO `province_city_area` VALUES ('2333', '2326', '柳江县', null, null);
INSERT INTO `province_city_area` VALUES ('2334', '2326', '柳城县', null, null);
INSERT INTO `province_city_area` VALUES ('2335', '2315', '桂林', null, null);
INSERT INTO `province_city_area` VALUES ('2336', '2335', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2337', '2335', '秀峰区', null, null);
INSERT INTO `province_city_area` VALUES ('2338', '2335', '叠彩区', null, null);
INSERT INTO `province_city_area` VALUES ('2339', '2335', '象山区', null, null);
INSERT INTO `province_city_area` VALUES ('2340', '2335', '七星区', null, null);
INSERT INTO `province_city_area` VALUES ('2341', '2335', '雁山区', null, null);
INSERT INTO `province_city_area` VALUES ('2342', '2335', '阳朔县', null, null);
INSERT INTO `province_city_area` VALUES ('2343', '2335', '临桂县', null, null);
INSERT INTO `province_city_area` VALUES ('2344', '2335', '灵川县', null, null);
INSERT INTO `province_city_area` VALUES ('2345', '2335', '全州县', null, null);
INSERT INTO `province_city_area` VALUES ('2346', '2335', '兴安县', null, null);
INSERT INTO `province_city_area` VALUES ('2347', '2335', '永福县', null, null);
INSERT INTO `province_city_area` VALUES ('2348', '2335', '灌阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2349', '2335', '龙胜各县自治区', null, null);
INSERT INTO `province_city_area` VALUES ('2350', '2335', '资源县', null, null);
INSERT INTO `province_city_area` VALUES ('2351', '2335', '平乐县', null, null);
INSERT INTO `province_city_area` VALUES ('2352', '2335', '荔蒲县', null, null);
INSERT INTO `province_city_area` VALUES ('2353', '2335', '恭城瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2354', '2315', '梧州', null, null);
INSERT INTO `province_city_area` VALUES ('2355', '2354', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2356', '2354', '万秀区', null, null);
INSERT INTO `province_city_area` VALUES ('2357', '2354', '蝶山区', null, null);
INSERT INTO `province_city_area` VALUES ('2358', '2354', '市郊区', null, null);
INSERT INTO `province_city_area` VALUES ('2359', '2354', '苍梧县', null, null);
INSERT INTO `province_city_area` VALUES ('2360', '2354', '藤  县', null, null);
INSERT INTO `province_city_area` VALUES ('2361', '2354', '蒙山县', null, null);
INSERT INTO `province_city_area` VALUES ('2362', '2354', '岑溪市', null, null);
INSERT INTO `province_city_area` VALUES ('2363', '2315', '北海', null, null);
INSERT INTO `province_city_area` VALUES ('2364', '2363', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2365', '2363', '海城区', null, null);
INSERT INTO `province_city_area` VALUES ('2366', '2363', '银海区', null, null);
INSERT INTO `province_city_area` VALUES ('2367', '2363', '铁山港区', null, null);
INSERT INTO `province_city_area` VALUES ('2368', '2363', '合浦县', null, null);
INSERT INTO `province_city_area` VALUES ('2369', '2315', '防城港', null, null);
INSERT INTO `province_city_area` VALUES ('2370', '2369', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2371', '2369', '港口区', null, null);
INSERT INTO `province_city_area` VALUES ('2372', '2369', '防城区', null, null);
INSERT INTO `province_city_area` VALUES ('2373', '2369', '上思县', null, null);
INSERT INTO `province_city_area` VALUES ('2374', '2369', '东兴市', null, null);
INSERT INTO `province_city_area` VALUES ('2375', '2315', '钦州', null, null);
INSERT INTO `province_city_area` VALUES ('2376', '2375', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2377', '2375', '钦南区', null, null);
INSERT INTO `province_city_area` VALUES ('2378', '2375', '钦北区', null, null);
INSERT INTO `province_city_area` VALUES ('2379', '2375', '浦北县', null, null);
INSERT INTO `province_city_area` VALUES ('2380', '2375', '灵山县', null, null);
INSERT INTO `province_city_area` VALUES ('2381', '2315', '贵港', null, null);
INSERT INTO `province_city_area` VALUES ('2382', '2381', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2383', '2381', '港北区', null, null);
INSERT INTO `province_city_area` VALUES ('2384', '2381', '港南区', null, null);
INSERT INTO `province_city_area` VALUES ('2385', '2381', '平南县', null, null);
INSERT INTO `province_city_area` VALUES ('2386', '2381', '桂平市', null, null);
INSERT INTO `province_city_area` VALUES ('2387', '2315', '玉林', null, null);
INSERT INTO `province_city_area` VALUES ('2388', '2387', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2389', '2387', '玉州区', null, null);
INSERT INTO `province_city_area` VALUES ('2390', '2387', '容  县', null, null);
INSERT INTO `province_city_area` VALUES ('2391', '2387', '陆川县', null, null);
INSERT INTO `province_city_area` VALUES ('2392', '2387', '博白县', null, null);
INSERT INTO `province_city_area` VALUES ('2393', '2387', '兴业县', null, null);
INSERT INTO `province_city_area` VALUES ('2394', '2387', '北流市', null, null);
INSERT INTO `province_city_area` VALUES ('2395', '2315', '南宁地区', null, null);
INSERT INTO `province_city_area` VALUES ('2396', '2395', '凭祥市', null, null);
INSERT INTO `province_city_area` VALUES ('2397', '2395', '横  县', null, null);
INSERT INTO `province_city_area` VALUES ('2398', '2395', '宾阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2399', '2395', '上林县', null, null);
INSERT INTO `province_city_area` VALUES ('2400', '2395', '隆安县', null, null);
INSERT INTO `province_city_area` VALUES ('2401', '2395', '马山县', null, null);
INSERT INTO `province_city_area` VALUES ('2402', '2395', '扶绥县', null, null);
INSERT INTO `province_city_area` VALUES ('2403', '2395', '崇左县', null, null);
INSERT INTO `province_city_area` VALUES ('2404', '2395', '大新县', null, null);
INSERT INTO `province_city_area` VALUES ('2405', '2395', '天等县', null, null);
INSERT INTO `province_city_area` VALUES ('2406', '2395', '宁明县', null, null);
INSERT INTO `province_city_area` VALUES ('2407', '2395', '龙州县', null, null);
INSERT INTO `province_city_area` VALUES ('2408', '2315', '柳州地区', null, null);
INSERT INTO `province_city_area` VALUES ('2409', '2408', '合山市', null, null);
INSERT INTO `province_city_area` VALUES ('2410', '2408', '鹿寨县', null, null);
INSERT INTO `province_city_area` VALUES ('2411', '2408', '象州县', null, null);
INSERT INTO `province_city_area` VALUES ('2412', '2408', '武宣县', null, null);
INSERT INTO `province_city_area` VALUES ('2413', '2408', '来宾县', null, null);
INSERT INTO `province_city_area` VALUES ('2414', '2408', '融安县', null, null);
INSERT INTO `province_city_area` VALUES ('2415', '2408', '三江侗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2416', '2408', '融水苗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2417', '2408', '金秀瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2418', '2408', '忻城县', null, null);
INSERT INTO `province_city_area` VALUES ('2419', '2315', '贺州地区', null, null);
INSERT INTO `province_city_area` VALUES ('2420', '2419', '贺州市', null, null);
INSERT INTO `province_city_area` VALUES ('2421', '2419', '昭平县', null, null);
INSERT INTO `province_city_area` VALUES ('2422', '2419', '钟山县', null, null);
INSERT INTO `province_city_area` VALUES ('2423', '2419', '富川瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2424', '2315', '百色地区', null, null);
INSERT INTO `province_city_area` VALUES ('2425', '2424', '百色市', null, null);
INSERT INTO `province_city_area` VALUES ('2426', '2424', '田阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2427', '2424', '田东县', null, null);
INSERT INTO `province_city_area` VALUES ('2428', '2424', '平果县', null, null);
INSERT INTO `province_city_area` VALUES ('2429', '2424', '德保县', null, null);
INSERT INTO `province_city_area` VALUES ('2430', '2424', '靖西县', null, null);
INSERT INTO `province_city_area` VALUES ('2431', '2424', '那坡县', null, null);
INSERT INTO `province_city_area` VALUES ('2432', '2424', '凌云县', null, null);
INSERT INTO `province_city_area` VALUES ('2433', '2424', '乐业县', null, null);
INSERT INTO `province_city_area` VALUES ('2434', '2424', '田林县', null, null);
INSERT INTO `province_city_area` VALUES ('2435', '2424', '隆林各族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2436', '2424', '西林县', null, null);
INSERT INTO `province_city_area` VALUES ('2437', '2315', '河池地区', null, null);
INSERT INTO `province_city_area` VALUES ('2438', '2437', '河池市', null, null);
INSERT INTO `province_city_area` VALUES ('2439', '2437', '宜州市', null, null);
INSERT INTO `province_city_area` VALUES ('2440', '2437', '罗城仫佬族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2441', '2437', '环江毛南族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2442', '2437', '南丹县', null, null);
INSERT INTO `province_city_area` VALUES ('2443', '2437', '天峨县', null, null);
INSERT INTO `province_city_area` VALUES ('2444', '2437', '凤山县', null, null);
INSERT INTO `province_city_area` VALUES ('2445', '2437', '东兰县', null, null);
INSERT INTO `province_city_area` VALUES ('2446', '2437', '巴马瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2447', '2437', '都安瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2448', '2437', '大化瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2449', '0', '海南', null, null);
INSERT INTO `province_city_area` VALUES ('2450', '2449', '海南', null, null);
INSERT INTO `province_city_area` VALUES ('2451', '2450', '通什市', null, null);
INSERT INTO `province_city_area` VALUES ('2452', '2450', '琼海市', null, null);
INSERT INTO `province_city_area` VALUES ('2453', '2450', '儋州市', null, null);
INSERT INTO `province_city_area` VALUES ('2454', '2450', '琼山市', null, null);
INSERT INTO `province_city_area` VALUES ('2455', '2450', '文昌市', null, null);
INSERT INTO `province_city_area` VALUES ('2456', '2450', '万宁市', null, null);
INSERT INTO `province_city_area` VALUES ('2457', '2450', '东方市', null, null);
INSERT INTO `province_city_area` VALUES ('2458', '2450', '定安县', null, null);
INSERT INTO `province_city_area` VALUES ('2459', '2450', '屯昌县', null, null);
INSERT INTO `province_city_area` VALUES ('2460', '2450', '澄迈县', null, null);
INSERT INTO `province_city_area` VALUES ('2461', '2450', '临高县', null, null);
INSERT INTO `province_city_area` VALUES ('2462', '2450', '白沙黎族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2463', '2450', '昌江黎族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2464', '2450', '乐东黎族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2465', '2450', '陵水黎族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2468', '2450', '西沙群岛', null, null);
INSERT INTO `province_city_area` VALUES ('2469', '2450', '南沙群岛', null, null);
INSERT INTO `province_city_area` VALUES ('2471', '2449', '海口', null, null);
INSERT INTO `province_city_area` VALUES ('2472', '2471', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2473', '2471', '振东区', null, null);
INSERT INTO `province_city_area` VALUES ('2474', '2471', '新华区', null, null);
INSERT INTO `province_city_area` VALUES ('2475', '2471', '秀英区', null, null);
INSERT INTO `province_city_area` VALUES ('2476', '2449', '三亚', null, null);
INSERT INTO `province_city_area` VALUES ('2477', '2476', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2478', '0', '重庆', null, null);
INSERT INTO `province_city_area` VALUES ('2479', '2478', '重庆市辖', null, null);
INSERT INTO `province_city_area` VALUES ('2480', '2479', '万州区', null, null);
INSERT INTO `province_city_area` VALUES ('2481', '2479', '涪陵区', null, null);
INSERT INTO `province_city_area` VALUES ('2482', '2479', '渝中区', null, null);
INSERT INTO `province_city_area` VALUES ('2483', '2479', '大渡口区', null, null);
INSERT INTO `province_city_area` VALUES ('2484', '2479', '江北区', null, null);
INSERT INTO `province_city_area` VALUES ('2485', '2479', '沙坪坝区', null, null);
INSERT INTO `province_city_area` VALUES ('2486', '2479', '九龙坡区', null, null);
INSERT INTO `province_city_area` VALUES ('2487', '2479', '南岸区', null, null);
INSERT INTO `province_city_area` VALUES ('2488', '2479', '北碚区', null, null);
INSERT INTO `province_city_area` VALUES ('2489', '2479', '万盛区', null, null);
INSERT INTO `province_city_area` VALUES ('2490', '2479', '双桥区', null, null);
INSERT INTO `province_city_area` VALUES ('2491', '2479', '渝北区', null, null);
INSERT INTO `province_city_area` VALUES ('2492', '2479', '巴南区', null, null);
INSERT INTO `province_city_area` VALUES ('2493', '2479', '黔江区', null, null);
INSERT INTO `province_city_area` VALUES ('2494', '2478', '重庆县辖', null, null);
INSERT INTO `province_city_area` VALUES ('2495', '2494', '长寿县', null, null);
INSERT INTO `province_city_area` VALUES ('2496', '2494', '綦江县', null, null);
INSERT INTO `province_city_area` VALUES ('2497', '2494', '潼南县', null, null);
INSERT INTO `province_city_area` VALUES ('2498', '2494', '铜梁县', null, null);
INSERT INTO `province_city_area` VALUES ('2499', '2494', '大足县', null, null);
INSERT INTO `province_city_area` VALUES ('2500', '2494', '荣昌县', null, null);
INSERT INTO `province_city_area` VALUES ('2501', '2494', '璧山县', null, null);
INSERT INTO `province_city_area` VALUES ('2502', '2494', '梁平县', null, null);
INSERT INTO `province_city_area` VALUES ('2503', '2494', '城口县', null, null);
INSERT INTO `province_city_area` VALUES ('2504', '2494', '丰都县', null, null);
INSERT INTO `province_city_area` VALUES ('2505', '2494', '垫江县', null, null);
INSERT INTO `province_city_area` VALUES ('2506', '2494', '武隆县', null, null);
INSERT INTO `province_city_area` VALUES ('2507', '2494', '忠  县', null, null);
INSERT INTO `province_city_area` VALUES ('2508', '2494', '开  县', null, null);
INSERT INTO `province_city_area` VALUES ('2509', '2494', '云阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2510', '2494', '奉节县', null, null);
INSERT INTO `province_city_area` VALUES ('2511', '2494', '巫山县', null, null);
INSERT INTO `province_city_area` VALUES ('2512', '2494', '巫溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2513', '2494', '石柱土家族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2517', '2478', '重庆县级', null, null);
INSERT INTO `province_city_area` VALUES ('2518', '2517', '江津市', null, null);
INSERT INTO `province_city_area` VALUES ('2519', '2517', '合川市', null, null);
INSERT INTO `province_city_area` VALUES ('2520', '2517', '永川市', null, null);
INSERT INTO `province_city_area` VALUES ('2521', '2517', '南川市', null, null);
INSERT INTO `province_city_area` VALUES ('2522', '0', '四川', null, null);
INSERT INTO `province_city_area` VALUES ('2523', '2522', '成都', null, null);
INSERT INTO `province_city_area` VALUES ('2524', '2523', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2525', '2523', '高新区', null, null);
INSERT INTO `province_city_area` VALUES ('2526', '2523', '锦江区', null, null);
INSERT INTO `province_city_area` VALUES ('2527', '2523', '青羊区', null, null);
INSERT INTO `province_city_area` VALUES ('2528', '2523', '金牛区', null, null);
INSERT INTO `province_city_area` VALUES ('2529', '2523', '武侯区', null, null);
INSERT INTO `province_city_area` VALUES ('2530', '2523', '成华区', null, null);
INSERT INTO `province_city_area` VALUES ('2531', '2523', '龙泉驿区', null, null);
INSERT INTO `province_city_area` VALUES ('2532', '2523', '青白江区', null, null);
INSERT INTO `province_city_area` VALUES ('2533', '2523', '金堂县', null, null);
INSERT INTO `province_city_area` VALUES ('2534', '2523', '双流县', null, null);
INSERT INTO `province_city_area` VALUES ('2535', '2523', '温江县', null, null);
INSERT INTO `province_city_area` VALUES ('2536', '2523', '郫  县', null, null);
INSERT INTO `province_city_area` VALUES ('2537', '2523', '新都县', null, null);
INSERT INTO `province_city_area` VALUES ('2538', '2523', '大邑县', null, null);
INSERT INTO `province_city_area` VALUES ('2539', '2523', '蒲江县', null, null);
INSERT INTO `province_city_area` VALUES ('2540', '2523', '新津县', null, null);
INSERT INTO `province_city_area` VALUES ('2541', '2523', '都江堰市', null, null);
INSERT INTO `province_city_area` VALUES ('2542', '2523', '彭州市', null, null);
INSERT INTO `province_city_area` VALUES ('2543', '2523', '邛崃市', null, null);
INSERT INTO `province_city_area` VALUES ('2544', '2523', '崇州市', null, null);
INSERT INTO `province_city_area` VALUES ('2545', '2522', '自贡', null, null);
INSERT INTO `province_city_area` VALUES ('2546', '2545', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2547', '2545', '自流井区', null, null);
INSERT INTO `province_city_area` VALUES ('2548', '2545', '贡井区', null, null);
INSERT INTO `province_city_area` VALUES ('2549', '2545', '大安区', null, null);
INSERT INTO `province_city_area` VALUES ('2550', '2545', '沿滩区', null, null);
INSERT INTO `province_city_area` VALUES ('2551', '2545', '荣  县', null, null);
INSERT INTO `province_city_area` VALUES ('2552', '2545', '富顺县', null, null);
INSERT INTO `province_city_area` VALUES ('2553', '2522', '攀枝花', null, null);
INSERT INTO `province_city_area` VALUES ('2554', '2553', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2555', '2553', '东  区', null, null);
INSERT INTO `province_city_area` VALUES ('2556', '2553', '西  区', null, null);
INSERT INTO `province_city_area` VALUES ('2557', '2553', '仁和区', null, null);
INSERT INTO `province_city_area` VALUES ('2558', '2553', '米易县', null, null);
INSERT INTO `province_city_area` VALUES ('2559', '2553', '盐边县', null, null);
INSERT INTO `province_city_area` VALUES ('2560', '2522', '泸州', null, null);
INSERT INTO `province_city_area` VALUES ('2561', '2560', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2562', '2560', '江阳区', null, null);
INSERT INTO `province_city_area` VALUES ('2563', '2560', '纳溪区', null, null);
INSERT INTO `province_city_area` VALUES ('2564', '2560', '龙马潭区', null, null);
INSERT INTO `province_city_area` VALUES ('2565', '2560', '泸  县', null, null);
INSERT INTO `province_city_area` VALUES ('2566', '2560', '合江县', null, null);
INSERT INTO `province_city_area` VALUES ('2567', '2560', '叙永县', null, null);
INSERT INTO `province_city_area` VALUES ('2568', '2560', '古蔺县', null, null);
INSERT INTO `province_city_area` VALUES ('2569', '2522', '德阳', null, null);
INSERT INTO `province_city_area` VALUES ('2570', '2569', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2571', '2569', '旌阳区', null, null);
INSERT INTO `province_city_area` VALUES ('2572', '2569', '中江县', null, null);
INSERT INTO `province_city_area` VALUES ('2573', '2569', '罗江县', null, null);
INSERT INTO `province_city_area` VALUES ('2574', '2569', '广汉市', null, null);
INSERT INTO `province_city_area` VALUES ('2575', '2569', '什邡市', null, null);
INSERT INTO `province_city_area` VALUES ('2576', '2569', '绵竹市', null, null);
INSERT INTO `province_city_area` VALUES ('2577', '2522', '绵阳', null, null);
INSERT INTO `province_city_area` VALUES ('2578', '2577', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2579', '2577', '涪城区', null, null);
INSERT INTO `province_city_area` VALUES ('2580', '2577', '游仙区', null, null);
INSERT INTO `province_city_area` VALUES ('2581', '2577', '科学城区', null, null);
INSERT INTO `province_city_area` VALUES ('2582', '2577', '三台县', null, null);
INSERT INTO `province_city_area` VALUES ('2583', '2577', '盐亭县', null, null);
INSERT INTO `province_city_area` VALUES ('2584', '2577', '安  县', null, null);
INSERT INTO `province_city_area` VALUES ('2585', '2577', '梓潼县', null, null);
INSERT INTO `province_city_area` VALUES ('2586', '2577', '北川县', null, null);
INSERT INTO `province_city_area` VALUES ('2587', '2577', '平武县', null, null);
INSERT INTO `province_city_area` VALUES ('2588', '2577', '江油市', null, null);
INSERT INTO `province_city_area` VALUES ('2589', '2522', '广元', null, null);
INSERT INTO `province_city_area` VALUES ('2590', '2589', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2591', '2589', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('2592', '2589', '元坝区', null, null);
INSERT INTO `province_city_area` VALUES ('2593', '2589', '朝天区', null, null);
INSERT INTO `province_city_area` VALUES ('2594', '2589', '旺苍县', null, null);
INSERT INTO `province_city_area` VALUES ('2595', '2589', '青川县', null, null);
INSERT INTO `province_city_area` VALUES ('2596', '2589', '剑阁县', null, null);
INSERT INTO `province_city_area` VALUES ('2597', '2589', '苍溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2598', '2522', '遂宁', null, null);
INSERT INTO `province_city_area` VALUES ('2599', '2598', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2600', '2598', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('2601', '2598', '蓬溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2602', '2598', '射洪县', null, null);
INSERT INTO `province_city_area` VALUES ('2603', '2598', '大英县', null, null);
INSERT INTO `province_city_area` VALUES ('2604', '2522', '内江', null, null);
INSERT INTO `province_city_area` VALUES ('2605', '2604', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2606', '2604', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('2607', '2604', '东兴区', null, null);
INSERT INTO `province_city_area` VALUES ('2608', '2604', '威远县', null, null);
INSERT INTO `province_city_area` VALUES ('2609', '2604', '资中县', null, null);
INSERT INTO `province_city_area` VALUES ('2610', '2604', '隆昌县', null, null);
INSERT INTO `province_city_area` VALUES ('2611', '2522', '乐山', null, null);
INSERT INTO `province_city_area` VALUES ('2612', '2611', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2613', '2611', '市中区', null, null);
INSERT INTO `province_city_area` VALUES ('2614', '2611', '沙湾区', null, null);
INSERT INTO `province_city_area` VALUES ('2615', '2611', '五通桥区', null, null);
INSERT INTO `province_city_area` VALUES ('2616', '2611', '金口河区', null, null);
INSERT INTO `province_city_area` VALUES ('2617', '2611', '犍为县', null, null);
INSERT INTO `province_city_area` VALUES ('2618', '2611', '井研县', null, null);
INSERT INTO `province_city_area` VALUES ('2619', '2611', '夹江县', null, null);
INSERT INTO `province_city_area` VALUES ('2620', '2611', '沐川县', null, null);
INSERT INTO `province_city_area` VALUES ('2621', '2611', '峨边彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2622', '2611', '马边彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2623', '2611', '峨眉山市', null, null);
INSERT INTO `province_city_area` VALUES ('2624', '2522', '南充', null, null);
INSERT INTO `province_city_area` VALUES ('2625', '2624', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2626', '2624', '顺庆区', null, null);
INSERT INTO `province_city_area` VALUES ('2627', '2624', '高坪区', null, null);
INSERT INTO `province_city_area` VALUES ('2628', '2624', '嘉陵区', null, null);
INSERT INTO `province_city_area` VALUES ('2629', '2624', '南部县', null, null);
INSERT INTO `province_city_area` VALUES ('2630', '2624', '营山县', null, null);
INSERT INTO `province_city_area` VALUES ('2631', '2624', '蓬安县', null, null);
INSERT INTO `province_city_area` VALUES ('2632', '2624', '仪陇县', null, null);
INSERT INTO `province_city_area` VALUES ('2633', '2624', '西充县', null, null);
INSERT INTO `province_city_area` VALUES ('2634', '2624', '阆中市', null, null);
INSERT INTO `province_city_area` VALUES ('2635', '2522', '眉山', null, null);
INSERT INTO `province_city_area` VALUES ('2636', '2635', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2637', '2635', '东坡区', null, null);
INSERT INTO `province_city_area` VALUES ('2638', '2635', '仁寿县', null, null);
INSERT INTO `province_city_area` VALUES ('2639', '2635', '彭山县', null, null);
INSERT INTO `province_city_area` VALUES ('2640', '2635', '洪雅县', null, null);
INSERT INTO `province_city_area` VALUES ('2641', '2635', '丹棱县', null, null);
INSERT INTO `province_city_area` VALUES ('2642', '2635', '青神县', null, null);
INSERT INTO `province_city_area` VALUES ('2643', '2522', '宜宾', null, null);
INSERT INTO `province_city_area` VALUES ('2644', '2643', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2645', '2643', '翠屏区', null, null);
INSERT INTO `province_city_area` VALUES ('2646', '2643', '宜宾县', null, null);
INSERT INTO `province_city_area` VALUES ('2647', '2643', '南溪县', null, null);
INSERT INTO `province_city_area` VALUES ('2648', '2643', '江安县', null, null);
INSERT INTO `province_city_area` VALUES ('2649', '2643', '长宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2650', '2643', '高  县', null, null);
INSERT INTO `province_city_area` VALUES ('2651', '2643', '珙  县', null, null);
INSERT INTO `province_city_area` VALUES ('2652', '2643', '筠连县', null, null);
INSERT INTO `province_city_area` VALUES ('2653', '2643', '兴文县', null, null);
INSERT INTO `province_city_area` VALUES ('2654', '2643', '屏山县', null, null);
INSERT INTO `province_city_area` VALUES ('2655', '2522', '广安', null, null);
INSERT INTO `province_city_area` VALUES ('2656', '2655', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2657', '2655', '广安区', null, null);
INSERT INTO `province_city_area` VALUES ('2658', '2655', '岳池县', null, null);
INSERT INTO `province_city_area` VALUES ('2659', '2655', '武胜县', null, null);
INSERT INTO `province_city_area` VALUES ('2660', '2655', '邻水县', null, null);
INSERT INTO `province_city_area` VALUES ('2661', '2655', '华蓥市', null, null);
INSERT INTO `province_city_area` VALUES ('2662', '2522', '达州', null, null);
INSERT INTO `province_city_area` VALUES ('2663', '2662', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2664', '2662', '通川区', null, null);
INSERT INTO `province_city_area` VALUES ('2665', '2662', '达  县', null, null);
INSERT INTO `province_city_area` VALUES ('2666', '2662', '宣汉县', null, null);
INSERT INTO `province_city_area` VALUES ('2667', '2662', '开江县', null, null);
INSERT INTO `province_city_area` VALUES ('2668', '2662', '大竹县', null, null);
INSERT INTO `province_city_area` VALUES ('2669', '2662', '渠  县', null, null);
INSERT INTO `province_city_area` VALUES ('2670', '2662', '万源市', null, null);
INSERT INTO `province_city_area` VALUES ('2671', '2522', '雅安', null, null);
INSERT INTO `province_city_area` VALUES ('2672', '2671', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2673', '2671', '雨城区', null, null);
INSERT INTO `province_city_area` VALUES ('2674', '2671', '名山县', null, null);
INSERT INTO `province_city_area` VALUES ('2675', '2671', '荥经县', null, null);
INSERT INTO `province_city_area` VALUES ('2676', '2671', '汉源县', null, null);
INSERT INTO `province_city_area` VALUES ('2677', '2671', '石棉县', null, null);
INSERT INTO `province_city_area` VALUES ('2678', '2671', '天全县', null, null);
INSERT INTO `province_city_area` VALUES ('2679', '2671', '芦山县', null, null);
INSERT INTO `province_city_area` VALUES ('2680', '2671', '宝兴县', null, null);
INSERT INTO `province_city_area` VALUES ('2681', '2522', '巴中', null, null);
INSERT INTO `province_city_area` VALUES ('2682', '2681', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2683', '2681', '巴州区', null, null);
INSERT INTO `province_city_area` VALUES ('2684', '2681', '通江县', null, null);
INSERT INTO `province_city_area` VALUES ('2685', '2681', '南江县', null, null);
INSERT INTO `province_city_area` VALUES ('2686', '2681', '平昌县', null, null);
INSERT INTO `province_city_area` VALUES ('2687', '2522', '资阳', null, null);
INSERT INTO `province_city_area` VALUES ('2688', '2687', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2689', '2687', '雁江区', null, null);
INSERT INTO `province_city_area` VALUES ('2690', '2687', '安岳县', null, null);
INSERT INTO `province_city_area` VALUES ('2691', '2687', '乐至县', null, null);
INSERT INTO `province_city_area` VALUES ('2692', '2687', '简阳市', null, null);
INSERT INTO `province_city_area` VALUES ('2694', '2693', '汶川县', null, null);
INSERT INTO `province_city_area` VALUES ('2695', '2693', '理  县', null, null);
INSERT INTO `province_city_area` VALUES ('2696', '2693', '茂  县', null, null);
INSERT INTO `province_city_area` VALUES ('2697', '2693', '松潘县', null, null);
INSERT INTO `province_city_area` VALUES ('2698', '2693', '九寨沟县', null, null);
INSERT INTO `province_city_area` VALUES ('2699', '2693', '金川县', null, null);
INSERT INTO `province_city_area` VALUES ('2700', '2693', '小金县', null, null);
INSERT INTO `province_city_area` VALUES ('2701', '2693', '黑水县', null, null);
INSERT INTO `province_city_area` VALUES ('2702', '2693', '马尔康县', null, null);
INSERT INTO `province_city_area` VALUES ('2703', '2693', '壤塘县', null, null);
INSERT INTO `province_city_area` VALUES ('2704', '2693', '阿坝县', null, null);
INSERT INTO `province_city_area` VALUES ('2705', '2693', '若尔盖县', null, null);
INSERT INTO `province_city_area` VALUES ('2706', '2693', '红原县', null, null);
INSERT INTO `province_city_area` VALUES ('2707', '2522', '甘孜藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('2708', '2707', '康定县', null, null);
INSERT INTO `province_city_area` VALUES ('2709', '2707', '泸定县', null, null);
INSERT INTO `province_city_area` VALUES ('2710', '2707', '丹巴县', null, null);
INSERT INTO `province_city_area` VALUES ('2711', '2707', '九龙县', null, null);
INSERT INTO `province_city_area` VALUES ('2712', '2707', '雅江县', null, null);
INSERT INTO `province_city_area` VALUES ('2713', '2707', '道孚县', null, null);
INSERT INTO `province_city_area` VALUES ('2714', '2707', '炉霍县', null, null);
INSERT INTO `province_city_area` VALUES ('2715', '2707', '甘孜县', null, null);
INSERT INTO `province_city_area` VALUES ('2716', '2707', '新龙县', null, null);
INSERT INTO `province_city_area` VALUES ('2717', '2707', '德格县', null, null);
INSERT INTO `province_city_area` VALUES ('2718', '2707', '白玉县', null, null);
INSERT INTO `province_city_area` VALUES ('2719', '2707', '石渠县', null, null);
INSERT INTO `province_city_area` VALUES ('2720', '2707', '色达县', null, null);
INSERT INTO `province_city_area` VALUES ('2721', '2707', '理塘县', null, null);
INSERT INTO `province_city_area` VALUES ('2722', '2707', '巴塘县', null, null);
INSERT INTO `province_city_area` VALUES ('2723', '2707', '乡城县', null, null);
INSERT INTO `province_city_area` VALUES ('2724', '2707', '稻城县', null, null);
INSERT INTO `province_city_area` VALUES ('2725', '2707', '得荣县', null, null);
INSERT INTO `province_city_area` VALUES ('2726', '2522', '凉山彝族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('2727', '2726', '西昌市', null, null);
INSERT INTO `province_city_area` VALUES ('2728', '2726', '木里藏族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2729', '2726', '盐源县', null, null);
INSERT INTO `province_city_area` VALUES ('2730', '2726', '德昌县', null, null);
INSERT INTO `province_city_area` VALUES ('2731', '2726', '会理县', null, null);
INSERT INTO `province_city_area` VALUES ('2732', '2726', '会东县', null, null);
INSERT INTO `province_city_area` VALUES ('2733', '2726', '宁南县', null, null);
INSERT INTO `province_city_area` VALUES ('2734', '2726', '普格县', null, null);
INSERT INTO `province_city_area` VALUES ('2735', '2726', '布拖县', null, null);
INSERT INTO `province_city_area` VALUES ('2736', '2726', '金阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2737', '2726', '昭觉县', null, null);
INSERT INTO `province_city_area` VALUES ('2738', '2726', '喜德县', null, null);
INSERT INTO `province_city_area` VALUES ('2739', '2726', '冕宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2740', '2726', '越西县', null, null);
INSERT INTO `province_city_area` VALUES ('2741', '2726', '甘洛县', null, null);
INSERT INTO `province_city_area` VALUES ('2742', '2726', '美姑县', null, null);
INSERT INTO `province_city_area` VALUES ('2743', '2726', '雷波县', null, null);
INSERT INTO `province_city_area` VALUES ('2744', '0', '贵州', null, null);
INSERT INTO `province_city_area` VALUES ('2745', '2744', '贵阳', null, null);
INSERT INTO `province_city_area` VALUES ('2746', '2745', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2747', '2745', '南明区', null, null);
INSERT INTO `province_city_area` VALUES ('2748', '2745', '云岩区', null, null);
INSERT INTO `province_city_area` VALUES ('2749', '2745', '花溪区', null, null);
INSERT INTO `province_city_area` VALUES ('2750', '2745', '乌当区', null, null);
INSERT INTO `province_city_area` VALUES ('2751', '2745', '白云区', null, null);
INSERT INTO `province_city_area` VALUES ('2752', '2745', '小河区', null, null);
INSERT INTO `province_city_area` VALUES ('2753', '2745', '开阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2754', '2745', '息烽县', null, null);
INSERT INTO `province_city_area` VALUES ('2755', '2745', '修文县', null, null);
INSERT INTO `province_city_area` VALUES ('2756', '2745', '清镇市', null, null);
INSERT INTO `province_city_area` VALUES ('2757', '2744', '六盘水', null, null);
INSERT INTO `province_city_area` VALUES ('2758', '2757', '钟山区', null, null);
INSERT INTO `province_city_area` VALUES ('2759', '2757', '六枝特区', null, null);
INSERT INTO `province_city_area` VALUES ('2760', '2757', '水城县', null, null);
INSERT INTO `province_city_area` VALUES ('2761', '2757', '盘  县', null, null);
INSERT INTO `province_city_area` VALUES ('2762', '2744', '遵义', null, null);
INSERT INTO `province_city_area` VALUES ('2763', '2762', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2764', '2762', '红花岗区', null, null);
INSERT INTO `province_city_area` VALUES ('2765', '2762', '遵义县', null, null);
INSERT INTO `province_city_area` VALUES ('2766', '2762', '桐梓县', null, null);
INSERT INTO `province_city_area` VALUES ('2767', '2762', '绥阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2768', '2762', '正安县', null, null);
INSERT INTO `province_city_area` VALUES ('2771', '2762', '凤冈县', null, null);
INSERT INTO `province_city_area` VALUES ('2772', '2762', '湄潭县', null, null);
INSERT INTO `province_city_area` VALUES ('2773', '2762', '余庆县', null, null);
INSERT INTO `province_city_area` VALUES ('2774', '2762', '习水县', null, null);
INSERT INTO `province_city_area` VALUES ('2775', '2762', '赤水市', null, null);
INSERT INTO `province_city_area` VALUES ('2776', '2762', '仁怀市', null, null);
INSERT INTO `province_city_area` VALUES ('2777', '2744', '安顺', null, null);
INSERT INTO `province_city_area` VALUES ('2778', '2777', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2779', '2777', '西秀区', null, null);
INSERT INTO `province_city_area` VALUES ('2780', '2777', '平坝县', null, null);
INSERT INTO `province_city_area` VALUES ('2781', '2777', '普定县', null, null);
INSERT INTO `province_city_area` VALUES ('2785', '2744', '铜仁地区', null, null);
INSERT INTO `province_city_area` VALUES ('2786', '2785', '铜仁市', null, null);
INSERT INTO `province_city_area` VALUES ('2787', '2785', '江口县', null, null);
INSERT INTO `province_city_area` VALUES ('2788', '2785', '玉屏侗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2789', '2785', '石阡县', null, null);
INSERT INTO `province_city_area` VALUES ('2790', '2785', '思南县', null, null);
INSERT INTO `province_city_area` VALUES ('2792', '2785', '德江县', null, null);
INSERT INTO `province_city_area` VALUES ('2793', '2785', '沿河土家族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2794', '2785', '松桃苗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2795', '2785', '万山特区', null, null);
INSERT INTO `province_city_area` VALUES ('2797', '2796', '兴义市', null, null);
INSERT INTO `province_city_area` VALUES ('2798', '2796', '兴仁县', null, null);
INSERT INTO `province_city_area` VALUES ('2799', '2796', '普安县', null, null);
INSERT INTO `province_city_area` VALUES ('2800', '2796', '晴隆县', null, null);
INSERT INTO `province_city_area` VALUES ('2801', '2796', '贞丰县', null, null);
INSERT INTO `province_city_area` VALUES ('2802', '2796', '望谟县', null, null);
INSERT INTO `province_city_area` VALUES ('2803', '2796', '册亨县', null, null);
INSERT INTO `province_city_area` VALUES ('2804', '2796', '安龙县', null, null);
INSERT INTO `province_city_area` VALUES ('2805', '2744', '毕节地区', null, null);
INSERT INTO `province_city_area` VALUES ('2806', '2805', '毕节市', null, null);
INSERT INTO `province_city_area` VALUES ('2807', '2805', '大方县', null, null);
INSERT INTO `province_city_area` VALUES ('2808', '2805', '黔西县', null, null);
INSERT INTO `province_city_area` VALUES ('2809', '2805', '金沙县', null, null);
INSERT INTO `province_city_area` VALUES ('2810', '2805', '织金县', null, null);
INSERT INTO `province_city_area` VALUES ('2811', '2805', '纳雍县', null, null);
INSERT INTO `province_city_area` VALUES ('2813', '2805', '赫章县', null, null);
INSERT INTO `province_city_area` VALUES ('2815', '2814', '凯里市', null, null);
INSERT INTO `province_city_area` VALUES ('2816', '2814', '黄平县', null, null);
INSERT INTO `province_city_area` VALUES ('2817', '2814', '施秉县', null, null);
INSERT INTO `province_city_area` VALUES ('2818', '2814', '三穗县', null, null);
INSERT INTO `province_city_area` VALUES ('2819', '2814', '镇远县', null, null);
INSERT INTO `province_city_area` VALUES ('2820', '2814', '岑巩县', null, null);
INSERT INTO `province_city_area` VALUES ('2821', '2814', '天柱县', null, null);
INSERT INTO `province_city_area` VALUES ('2822', '2814', '锦屏县', null, null);
INSERT INTO `province_city_area` VALUES ('2823', '2814', '剑河县', null, null);
INSERT INTO `province_city_area` VALUES ('2824', '2814', '台江县', null, null);
INSERT INTO `province_city_area` VALUES ('2825', '2814', '黎平县', null, null);
INSERT INTO `province_city_area` VALUES ('2826', '2814', '榕江县', null, null);
INSERT INTO `province_city_area` VALUES ('2827', '2814', '从江县', null, null);
INSERT INTO `province_city_area` VALUES ('2828', '2814', '雷山县', null, null);
INSERT INTO `province_city_area` VALUES ('2829', '2814', '麻江县', null, null);
INSERT INTO `province_city_area` VALUES ('2830', '2814', '丹寨县', null, null);
INSERT INTO `province_city_area` VALUES ('2832', '2831', '都匀市', null, null);
INSERT INTO `province_city_area` VALUES ('2833', '2831', '福泉市', null, null);
INSERT INTO `province_city_area` VALUES ('2834', '2831', '荔波县', null, null);
INSERT INTO `province_city_area` VALUES ('2835', '2831', '贵定县', null, null);
INSERT INTO `province_city_area` VALUES ('2836', '2831', '瓮安县', null, null);
INSERT INTO `province_city_area` VALUES ('2837', '2831', '独山县', null, null);
INSERT INTO `province_city_area` VALUES ('2838', '2831', '平塘县', null, null);
INSERT INTO `province_city_area` VALUES ('2839', '2831', '罗甸县', null, null);
INSERT INTO `province_city_area` VALUES ('2840', '2831', '长顺县', null, null);
INSERT INTO `province_city_area` VALUES ('2841', '2831', '龙里县', null, null);
INSERT INTO `province_city_area` VALUES ('2842', '2831', '惠水县', null, null);
INSERT INTO `province_city_area` VALUES ('2843', '2831', '三都水族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2844', '0', '云南', null, null);
INSERT INTO `province_city_area` VALUES ('2845', '2844', '昆明', null, null);
INSERT INTO `province_city_area` VALUES ('2846', '2845', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2847', '2845', '五华区', null, null);
INSERT INTO `province_city_area` VALUES ('2848', '2845', '盘龙区', null, null);
INSERT INTO `province_city_area` VALUES ('2849', '2845', '官渡区', null, null);
INSERT INTO `province_city_area` VALUES ('2850', '2845', '西山区', null, null);
INSERT INTO `province_city_area` VALUES ('2851', '2845', '东川区', null, null);
INSERT INTO `province_city_area` VALUES ('2852', '2845', '呈贡县', null, null);
INSERT INTO `province_city_area` VALUES ('2853', '2845', '晋宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2854', '2845', '富民县', null, null);
INSERT INTO `province_city_area` VALUES ('2855', '2845', '宜良县', null, null);
INSERT INTO `province_city_area` VALUES ('2856', '2845', '石林彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2857', '2845', '嵩明县', null, null);
INSERT INTO `province_city_area` VALUES ('2860', '2845', '安宁市', null, null);
INSERT INTO `province_city_area` VALUES ('2861', '2844', '曲靖', null, null);
INSERT INTO `province_city_area` VALUES ('2862', '2861', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2863', '2861', '麒麟区', null, null);
INSERT INTO `province_city_area` VALUES ('2864', '2861', '马龙县', null, null);
INSERT INTO `province_city_area` VALUES ('2865', '2861', '陆良县', null, null);
INSERT INTO `province_city_area` VALUES ('2866', '2861', '师宗县', null, null);
INSERT INTO `province_city_area` VALUES ('2867', '2861', '罗平县', null, null);
INSERT INTO `province_city_area` VALUES ('2868', '2861', '富源县', null, null);
INSERT INTO `province_city_area` VALUES ('2869', '2861', '会泽县', null, null);
INSERT INTO `province_city_area` VALUES ('2870', '2861', '沾益县', null, null);
INSERT INTO `province_city_area` VALUES ('2871', '2861', '宣威市', null, null);
INSERT INTO `province_city_area` VALUES ('2872', '2844', '玉溪', null, null);
INSERT INTO `province_city_area` VALUES ('2873', '2872', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2874', '2872', '红塔区', null, null);
INSERT INTO `province_city_area` VALUES ('2875', '2872', '江川县', null, null);
INSERT INTO `province_city_area` VALUES ('2876', '2872', '澄江县', null, null);
INSERT INTO `province_city_area` VALUES ('2877', '2872', '通海县', null, null);
INSERT INTO `province_city_area` VALUES ('2878', '2872', '华宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2879', '2872', '易门县', null, null);
INSERT INTO `province_city_area` VALUES ('2880', '2872', '峨山彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2883', '2844', '保山', null, null);
INSERT INTO `province_city_area` VALUES ('2884', '2883', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2885', '2883', '隆阳区', null, null);
INSERT INTO `province_city_area` VALUES ('2886', '2883', '施甸县', null, null);
INSERT INTO `province_city_area` VALUES ('2887', '2883', '腾冲县', null, null);
INSERT INTO `province_city_area` VALUES ('2888', '2883', '龙陵县', null, null);
INSERT INTO `province_city_area` VALUES ('2889', '2883', '昌宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2890', '2844', '昭通地区', null, null);
INSERT INTO `province_city_area` VALUES ('2891', '2890', '昭通市', null, null);
INSERT INTO `province_city_area` VALUES ('2892', '2890', '鲁甸县', null, null);
INSERT INTO `province_city_area` VALUES ('2893', '2890', '巧家县', null, null);
INSERT INTO `province_city_area` VALUES ('2894', '2890', '盐津县', null, null);
INSERT INTO `province_city_area` VALUES ('2895', '2890', '大关县', null, null);
INSERT INTO `province_city_area` VALUES ('2896', '2890', '永善县', null, null);
INSERT INTO `province_city_area` VALUES ('2897', '2890', '绥江县', null, null);
INSERT INTO `province_city_area` VALUES ('2898', '2890', '镇雄县', null, null);
INSERT INTO `province_city_area` VALUES ('2899', '2890', '彝良县', null, null);
INSERT INTO `province_city_area` VALUES ('2900', '2890', '威信县', null, null);
INSERT INTO `province_city_area` VALUES ('2901', '2890', '水富县', null, null);
INSERT INTO `province_city_area` VALUES ('2902', '2844', '楚雄彝族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('2903', '2902', '楚雄市', null, null);
INSERT INTO `province_city_area` VALUES ('2904', '2902', '双柏县', null, null);
INSERT INTO `province_city_area` VALUES ('2905', '2902', '牟定县', null, null);
INSERT INTO `province_city_area` VALUES ('2906', '2902', '南华县', null, null);
INSERT INTO `province_city_area` VALUES ('2907', '2902', '姚安县', null, null);
INSERT INTO `province_city_area` VALUES ('2908', '2902', '大姚县', null, null);
INSERT INTO `province_city_area` VALUES ('2909', '2902', '永仁县', null, null);
INSERT INTO `province_city_area` VALUES ('2910', '2902', '元谋县', null, null);
INSERT INTO `province_city_area` VALUES ('2911', '2902', '武定县', null, null);
INSERT INTO `province_city_area` VALUES ('2912', '2902', '禄丰县', null, null);
INSERT INTO `province_city_area` VALUES ('2914', '2913', '个旧市', null, null);
INSERT INTO `province_city_area` VALUES ('2915', '2913', '开远市', null, null);
INSERT INTO `province_city_area` VALUES ('2916', '2913', '蒙自县', null, null);
INSERT INTO `province_city_area` VALUES ('2917', '2913', '屏边苗族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2918', '2913', '建水县', null, null);
INSERT INTO `province_city_area` VALUES ('2919', '2913', '石屏县', null, null);
INSERT INTO `province_city_area` VALUES ('2920', '2913', '弥勒县', null, null);
INSERT INTO `province_city_area` VALUES ('2921', '2913', '泸西县', null, null);
INSERT INTO `province_city_area` VALUES ('2922', '2913', '元阳县', null, null);
INSERT INTO `province_city_area` VALUES ('2923', '2913', '红河县', null, null);
INSERT INTO `province_city_area` VALUES ('2925', '2913', '绿春县', null, null);
INSERT INTO `province_city_area` VALUES ('2926', '2913', '河口瑶族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2928', '2927', '文山县', null, null);
INSERT INTO `province_city_area` VALUES ('2929', '2927', '砚山县', null, null);
INSERT INTO `province_city_area` VALUES ('2930', '2927', '西畴县', null, null);
INSERT INTO `province_city_area` VALUES ('2931', '2927', '麻栗坡县', null, null);
INSERT INTO `province_city_area` VALUES ('2932', '2927', '马关县', null, null);
INSERT INTO `province_city_area` VALUES ('2933', '2927', '丘北县', null, null);
INSERT INTO `province_city_area` VALUES ('2934', '2927', '广南县', null, null);
INSERT INTO `province_city_area` VALUES ('2935', '2927', '富宁县', null, null);
INSERT INTO `province_city_area` VALUES ('2936', '2844', '思茅地区', null, null);
INSERT INTO `province_city_area` VALUES ('2937', '2936', '思茅市', null, null);
INSERT INTO `province_city_area` VALUES ('2939', '2936', '墨江哈尼族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2940', '2936', '景东彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2945', '2936', '澜沧拉祜族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2946', '2936', '西盟佤族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2948', '2947', '景洪市', null, null);
INSERT INTO `province_city_area` VALUES ('2949', '2947', '勐海县', null, null);
INSERT INTO `province_city_area` VALUES ('2950', '2947', '勐腊县', null, null);
INSERT INTO `province_city_area` VALUES ('2951', '2844', '大理白族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('2952', '2951', '大理市', null, null);
INSERT INTO `province_city_area` VALUES ('2953', '2951', '漾濞彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2954', '2951', '祥云县', null, null);
INSERT INTO `province_city_area` VALUES ('2955', '2951', '宾川县', null, null);
INSERT INTO `province_city_area` VALUES ('2956', '2951', '弥渡县', null, null);
INSERT INTO `province_city_area` VALUES ('2957', '2951', '南涧彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2959', '2951', '永平县', null, null);
INSERT INTO `province_city_area` VALUES ('2960', '2951', '云龙县', null, null);
INSERT INTO `province_city_area` VALUES ('2961', '2951', '洱源县', null, null);
INSERT INTO `province_city_area` VALUES ('2962', '2951', '剑川县', null, null);
INSERT INTO `province_city_area` VALUES ('2963', '2951', '鹤庆县', null, null);
INSERT INTO `province_city_area` VALUES ('2965', '2964', '瑞丽市', null, null);
INSERT INTO `province_city_area` VALUES ('2966', '2964', '潞西市', null, null);
INSERT INTO `province_city_area` VALUES ('2967', '2964', '梁河县', null, null);
INSERT INTO `province_city_area` VALUES ('2968', '2964', '盈江县', null, null);
INSERT INTO `province_city_area` VALUES ('2969', '2964', '陇川县', null, null);
INSERT INTO `province_city_area` VALUES ('2970', '2844', '丽江地区', null, null);
INSERT INTO `province_city_area` VALUES ('2971', '2970', '丽江纳西族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2972', '2970', '永胜县', null, null);
INSERT INTO `province_city_area` VALUES ('2973', '2970', '华坪县', null, null);
INSERT INTO `province_city_area` VALUES ('2974', '2970', '宁蒗彝族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2975', '2844', '怒江傈僳族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('2976', '2975', '泸水县', null, null);
INSERT INTO `province_city_area` VALUES ('2977', '2975', '福贡县', null, null);
INSERT INTO `province_city_area` VALUES ('2980', '2844', '迪庆藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('2981', '2980', '中甸县', null, null);
INSERT INTO `province_city_area` VALUES ('2982', '2980', '德钦县', null, null);
INSERT INTO `province_city_area` VALUES ('2983', '2980', '维西傈僳族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2984', '2844', '临沧地区', null, null);
INSERT INTO `province_city_area` VALUES ('2985', '2984', '临沧县', null, null);
INSERT INTO `province_city_area` VALUES ('2986', '2984', '凤庆县', null, null);
INSERT INTO `province_city_area` VALUES ('2987', '2984', '云  县', null, null);
INSERT INTO `province_city_area` VALUES ('2988', '2984', '永德县', null, null);
INSERT INTO `province_city_area` VALUES ('2989', '2984', '镇康县', null, null);
INSERT INTO `province_city_area` VALUES ('2992', '2984', '沧源佤族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('2993', '0', '西藏', null, null);
INSERT INTO `province_city_area` VALUES ('2994', '2993', '拉萨', null, null);
INSERT INTO `province_city_area` VALUES ('2995', '2994', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('2996', '2994', '城关区', null, null);
INSERT INTO `province_city_area` VALUES ('2997', '2994', '林周县', null, null);
INSERT INTO `province_city_area` VALUES ('2998', '2994', '当雄县', null, null);
INSERT INTO `province_city_area` VALUES ('2999', '2994', '尼木县', null, null);
INSERT INTO `province_city_area` VALUES ('3000', '2994', '曲水县', null, null);
INSERT INTO `province_city_area` VALUES ('3001', '2994', '堆龙德庆县', null, null);
INSERT INTO `province_city_area` VALUES ('3002', '2994', '达孜县', null, null);
INSERT INTO `province_city_area` VALUES ('3003', '2994', '墨竹工卡县', null, null);
INSERT INTO `province_city_area` VALUES ('3004', '2993', '昌都地区', null, null);
INSERT INTO `province_city_area` VALUES ('3005', '3004', '昌都县', null, null);
INSERT INTO `province_city_area` VALUES ('3006', '3004', '江达县', null, null);
INSERT INTO `province_city_area` VALUES ('3007', '3004', '贡觉县', null, null);
INSERT INTO `province_city_area` VALUES ('3008', '3004', '类乌齐县', null, null);
INSERT INTO `province_city_area` VALUES ('3009', '3004', '丁青县', null, null);
INSERT INTO `province_city_area` VALUES ('3010', '3004', '察雅县', null, null);
INSERT INTO `province_city_area` VALUES ('3011', '3004', '八宿县', null, null);
INSERT INTO `province_city_area` VALUES ('3012', '3004', '左贡县', null, null);
INSERT INTO `province_city_area` VALUES ('3013', '3004', '芒康县', null, null);
INSERT INTO `province_city_area` VALUES ('3014', '3004', '洛隆县', null, null);
INSERT INTO `province_city_area` VALUES ('3015', '3004', '边坝县', null, null);
INSERT INTO `province_city_area` VALUES ('3016', '2993', '山南地区', null, null);
INSERT INTO `province_city_area` VALUES ('3017', '3016', '乃东县', null, null);
INSERT INTO `province_city_area` VALUES ('3018', '3016', '扎囊县', null, null);
INSERT INTO `province_city_area` VALUES ('3019', '3016', '贡嘎县', null, null);
INSERT INTO `province_city_area` VALUES ('3020', '3016', '桑日县', null, null);
INSERT INTO `province_city_area` VALUES ('3021', '3016', '琼结县', null, null);
INSERT INTO `province_city_area` VALUES ('3022', '3016', '曲松县', null, null);
INSERT INTO `province_city_area` VALUES ('3023', '3016', '措美县', null, null);
INSERT INTO `province_city_area` VALUES ('3024', '3016', '洛扎县', null, null);
INSERT INTO `province_city_area` VALUES ('3025', '3016', '加查县', null, null);
INSERT INTO `province_city_area` VALUES ('3026', '3016', '隆子县', null, null);
INSERT INTO `province_city_area` VALUES ('3027', '3016', '错那县', null, null);
INSERT INTO `province_city_area` VALUES ('3028', '3016', '浪卡子县', null, null);
INSERT INTO `province_city_area` VALUES ('3029', '2993', '日喀则地区', null, null);
INSERT INTO `province_city_area` VALUES ('3030', '3029', '日喀则市', null, null);
INSERT INTO `province_city_area` VALUES ('3031', '3029', '南木林县', null, null);
INSERT INTO `province_city_area` VALUES ('3032', '3029', '江孜县', null, null);
INSERT INTO `province_city_area` VALUES ('3033', '3029', '定日县', null, null);
INSERT INTO `province_city_area` VALUES ('3034', '3029', '萨迦县', null, null);
INSERT INTO `province_city_area` VALUES ('3035', '3029', '拉孜县', null, null);
INSERT INTO `province_city_area` VALUES ('3036', '3029', '昂仁县', null, null);
INSERT INTO `province_city_area` VALUES ('3037', '3029', '谢通门县', null, null);
INSERT INTO `province_city_area` VALUES ('3038', '3029', '白朗县', null, null);
INSERT INTO `province_city_area` VALUES ('3039', '3029', '仁布县', null, null);
INSERT INTO `province_city_area` VALUES ('3040', '3029', '康马县', null, null);
INSERT INTO `province_city_area` VALUES ('3041', '3029', '定结县', null, null);
INSERT INTO `province_city_area` VALUES ('3042', '3029', '仲巴县', null, null);
INSERT INTO `province_city_area` VALUES ('3043', '3029', '亚东县', null, null);
INSERT INTO `province_city_area` VALUES ('3044', '3029', '吉隆县', null, null);
INSERT INTO `province_city_area` VALUES ('3045', '3029', '聂拉木县', null, null);
INSERT INTO `province_city_area` VALUES ('3046', '3029', '萨嘎县', null, null);
INSERT INTO `province_city_area` VALUES ('3047', '3029', '岗巴县', null, null);
INSERT INTO `province_city_area` VALUES ('3048', '2993', '那曲地区', null, null);
INSERT INTO `province_city_area` VALUES ('3049', '3048', '那曲县', null, null);
INSERT INTO `province_city_area` VALUES ('3050', '3048', '嘉黎县', null, null);
INSERT INTO `province_city_area` VALUES ('3051', '3048', '比如县', null, null);
INSERT INTO `province_city_area` VALUES ('3052', '3048', '聂荣县', null, null);
INSERT INTO `province_city_area` VALUES ('3053', '3048', '安多县', null, null);
INSERT INTO `province_city_area` VALUES ('3054', '3048', '申扎县', null, null);
INSERT INTO `province_city_area` VALUES ('3055', '3048', '索  县', null, null);
INSERT INTO `province_city_area` VALUES ('3056', '3048', '班戈县', null, null);
INSERT INTO `province_city_area` VALUES ('3057', '3048', '巴青县', null, null);
INSERT INTO `province_city_area` VALUES ('3058', '3048', '尼玛县', null, null);
INSERT INTO `province_city_area` VALUES ('3059', '2993', '阿里地区', null, null);
INSERT INTO `province_city_area` VALUES ('3060', '3059', '普兰县', null, null);
INSERT INTO `province_city_area` VALUES ('3061', '3059', '札达县', null, null);
INSERT INTO `province_city_area` VALUES ('3062', '3059', '噶尔县', null, null);
INSERT INTO `province_city_area` VALUES ('3063', '3059', '日土县', null, null);
INSERT INTO `province_city_area` VALUES ('3064', '3059', '革吉县', null, null);
INSERT INTO `province_city_area` VALUES ('3065', '3059', '改则县', null, null);
INSERT INTO `province_city_area` VALUES ('3066', '3059', '措勤县', null, null);
INSERT INTO `province_city_area` VALUES ('3067', '2993', '林芝地区', null, null);
INSERT INTO `province_city_area` VALUES ('3068', '3067', '林芝县', null, null);
INSERT INTO `province_city_area` VALUES ('3069', '3067', '工布江达县', null, null);
INSERT INTO `province_city_area` VALUES ('3070', '3067', '米林县', null, null);
INSERT INTO `province_city_area` VALUES ('3071', '3067', '墨脱县', null, null);
INSERT INTO `province_city_area` VALUES ('3072', '3067', '波密县', null, null);
INSERT INTO `province_city_area` VALUES ('3073', '3067', '察隅县', null, null);
INSERT INTO `province_city_area` VALUES ('3074', '3067', '朗  县', null, null);
INSERT INTO `province_city_area` VALUES ('3075', '0', '陕西', null, null);
INSERT INTO `province_city_area` VALUES ('3076', '3075', '西安', null, null);
INSERT INTO `province_city_area` VALUES ('3077', '3076', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3078', '3076', '新城区', null, null);
INSERT INTO `province_city_area` VALUES ('3079', '3076', '碑林区', null, null);
INSERT INTO `province_city_area` VALUES ('3080', '3076', '莲湖区', null, null);
INSERT INTO `province_city_area` VALUES ('3081', '3076', '灞桥区', null, null);
INSERT INTO `province_city_area` VALUES ('3082', '3076', '未央区', null, null);
INSERT INTO `province_city_area` VALUES ('3083', '3076', '雁塔区', null, null);
INSERT INTO `province_city_area` VALUES ('3084', '3076', '阎良区', null, null);
INSERT INTO `province_city_area` VALUES ('3085', '3076', '临潼区', null, null);
INSERT INTO `province_city_area` VALUES ('3086', '3076', '长安县', null, null);
INSERT INTO `province_city_area` VALUES ('3087', '3076', '蓝田县', null, null);
INSERT INTO `province_city_area` VALUES ('3088', '3076', '周至县', null, null);
INSERT INTO `province_city_area` VALUES ('3089', '3076', '户  县', null, null);
INSERT INTO `province_city_area` VALUES ('3090', '3076', '高陵县', null, null);
INSERT INTO `province_city_area` VALUES ('3091', '3075', '铜川', null, null);
INSERT INTO `province_city_area` VALUES ('3092', '3091', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3093', '3091', '王益区', null, null);
INSERT INTO `province_city_area` VALUES ('3094', '3091', '印台区', null, null);
INSERT INTO `province_city_area` VALUES ('3095', '3091', '耀  县', null, null);
INSERT INTO `province_city_area` VALUES ('3096', '3091', '宜君县', null, null);
INSERT INTO `province_city_area` VALUES ('3097', '3075', '宝鸡', null, null);
INSERT INTO `province_city_area` VALUES ('3098', '3097', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3099', '3097', '渭滨区', null, null);
INSERT INTO `province_city_area` VALUES ('3100', '3097', '金台区', null, null);
INSERT INTO `province_city_area` VALUES ('3101', '3097', '宝鸡县', null, null);
INSERT INTO `province_city_area` VALUES ('3102', '3097', '凤翔县', null, null);
INSERT INTO `province_city_area` VALUES ('3103', '3097', '岐山县', null, null);
INSERT INTO `province_city_area` VALUES ('3104', '3097', '扶风县', null, null);
INSERT INTO `province_city_area` VALUES ('3105', '3097', '眉  县', null, null);
INSERT INTO `province_city_area` VALUES ('3106', '3097', '陇  县', null, null);
INSERT INTO `province_city_area` VALUES ('3107', '3097', '千阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3108', '3097', '麟游县', null, null);
INSERT INTO `province_city_area` VALUES ('3109', '3097', '凤  县', null, null);
INSERT INTO `province_city_area` VALUES ('3110', '3097', '太白县', null, null);
INSERT INTO `province_city_area` VALUES ('3111', '3075', '咸阳', null, null);
INSERT INTO `province_city_area` VALUES ('3112', '3111', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3113', '3111', '秦都区', null, null);
INSERT INTO `province_city_area` VALUES ('3114', '3111', '杨陵区', null, null);
INSERT INTO `province_city_area` VALUES ('3115', '3111', '渭城区', null, null);
INSERT INTO `province_city_area` VALUES ('3116', '3111', '三原县', null, null);
INSERT INTO `province_city_area` VALUES ('3117', '3111', '泾阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3118', '3111', '乾  县', null, null);
INSERT INTO `province_city_area` VALUES ('3119', '3111', '礼泉县', null, null);
INSERT INTO `province_city_area` VALUES ('3120', '3111', '永寿县', null, null);
INSERT INTO `province_city_area` VALUES ('3121', '3111', '彬  县', null, null);
INSERT INTO `province_city_area` VALUES ('3122', '3111', '长武县', null, null);
INSERT INTO `province_city_area` VALUES ('3123', '3111', '旬邑县', null, null);
INSERT INTO `province_city_area` VALUES ('3124', '3111', '淳化县', null, null);
INSERT INTO `province_city_area` VALUES ('3125', '3111', '武功县', null, null);
INSERT INTO `province_city_area` VALUES ('3126', '3111', '兴平市', null, null);
INSERT INTO `province_city_area` VALUES ('3127', '3075', '渭南', null, null);
INSERT INTO `province_city_area` VALUES ('3128', '3127', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3129', '3127', '临渭区', null, null);
INSERT INTO `province_city_area` VALUES ('3130', '3127', '华  县', null, null);
INSERT INTO `province_city_area` VALUES ('3131', '3127', '潼关县', null, null);
INSERT INTO `province_city_area` VALUES ('3132', '3127', '大荔县', null, null);
INSERT INTO `province_city_area` VALUES ('3133', '3127', '合阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3134', '3127', '澄城县', null, null);
INSERT INTO `province_city_area` VALUES ('3135', '3127', '蒲城县', null, null);
INSERT INTO `province_city_area` VALUES ('3136', '3127', '白水县', null, null);
INSERT INTO `province_city_area` VALUES ('3137', '3127', '富平县', null, null);
INSERT INTO `province_city_area` VALUES ('3138', '3127', '韩城市', null, null);
INSERT INTO `province_city_area` VALUES ('3139', '3127', '华阴市', null, null);
INSERT INTO `province_city_area` VALUES ('3140', '3075', '延安', null, null);
INSERT INTO `province_city_area` VALUES ('3141', '3140', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3142', '3140', '宝塔区', null, null);
INSERT INTO `province_city_area` VALUES ('3143', '3140', '延长县', null, null);
INSERT INTO `province_city_area` VALUES ('3144', '3140', '延川县', null, null);
INSERT INTO `province_city_area` VALUES ('3145', '3140', '子长县', null, null);
INSERT INTO `province_city_area` VALUES ('3146', '3140', '安塞县', null, null);
INSERT INTO `province_city_area` VALUES ('3147', '3140', '志丹县', null, null);
INSERT INTO `province_city_area` VALUES ('3148', '3140', '吴旗县', null, null);
INSERT INTO `province_city_area` VALUES ('3149', '3140', '甘泉县', null, null);
INSERT INTO `province_city_area` VALUES ('3150', '3140', '富  县', null, null);
INSERT INTO `province_city_area` VALUES ('3151', '3140', '洛川县', null, null);
INSERT INTO `province_city_area` VALUES ('3152', '3140', '宜川县', null, null);
INSERT INTO `province_city_area` VALUES ('3153', '3140', '黄龙县', null, null);
INSERT INTO `province_city_area` VALUES ('3154', '3140', '黄陵县', null, null);
INSERT INTO `province_city_area` VALUES ('3155', '3075', '汉中', null, null);
INSERT INTO `province_city_area` VALUES ('3156', '3155', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3157', '3155', '汉台区', null, null);
INSERT INTO `province_city_area` VALUES ('3158', '3155', '南郑县', null, null);
INSERT INTO `province_city_area` VALUES ('3159', '3155', '城固县', null, null);
INSERT INTO `province_city_area` VALUES ('3160', '3155', '洋  县', null, null);
INSERT INTO `province_city_area` VALUES ('3161', '3155', '西乡县', null, null);
INSERT INTO `province_city_area` VALUES ('3162', '3155', '勉  县', null, null);
INSERT INTO `province_city_area` VALUES ('3163', '3155', '宁强县', null, null);
INSERT INTO `province_city_area` VALUES ('3164', '3155', '略阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3165', '3155', '镇巴县', null, null);
INSERT INTO `province_city_area` VALUES ('3166', '3155', '留坝县', null, null);
INSERT INTO `province_city_area` VALUES ('3167', '3155', '佛坪县', null, null);
INSERT INTO `province_city_area` VALUES ('3168', '3075', '榆林', null, null);
INSERT INTO `province_city_area` VALUES ('3169', '3168', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3170', '3168', '榆阳区', null, null);
INSERT INTO `province_city_area` VALUES ('3171', '3168', '神木县', null, null);
INSERT INTO `province_city_area` VALUES ('3172', '3168', '府谷县', null, null);
INSERT INTO `province_city_area` VALUES ('3173', '3168', '横山县', null, null);
INSERT INTO `province_city_area` VALUES ('3174', '3168', '靖边县', null, null);
INSERT INTO `province_city_area` VALUES ('3175', '3168', '定边县', null, null);
INSERT INTO `province_city_area` VALUES ('3176', '3168', '绥德县', null, null);
INSERT INTO `province_city_area` VALUES ('3177', '3168', '米脂县', null, null);
INSERT INTO `province_city_area` VALUES ('3178', '3168', '佳  县', null, null);
INSERT INTO `province_city_area` VALUES ('3179', '3168', '吴堡县', null, null);
INSERT INTO `province_city_area` VALUES ('3180', '3168', '清涧县', null, null);
INSERT INTO `province_city_area` VALUES ('3181', '3168', '子洲县', null, null);
INSERT INTO `province_city_area` VALUES ('3182', '3075', '安康', null, null);
INSERT INTO `province_city_area` VALUES ('3183', '3182', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3184', '3182', '汉滨区', null, null);
INSERT INTO `province_city_area` VALUES ('3185', '3182', '汉阴县', null, null);
INSERT INTO `province_city_area` VALUES ('3186', '3182', '石泉县', null, null);
INSERT INTO `province_city_area` VALUES ('3187', '3182', '宁陕县', null, null);
INSERT INTO `province_city_area` VALUES ('3188', '3182', '紫阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3189', '3182', '岚皋县', null, null);
INSERT INTO `province_city_area` VALUES ('3190', '3182', '平利县', null, null);
INSERT INTO `province_city_area` VALUES ('3191', '3182', '镇坪县', null, null);
INSERT INTO `province_city_area` VALUES ('3192', '3182', '旬阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3193', '3182', '白河县', null, null);
INSERT INTO `province_city_area` VALUES ('3194', '3075', '商洛地区', null, null);
INSERT INTO `province_city_area` VALUES ('3195', '3194', '商州市', null, null);
INSERT INTO `province_city_area` VALUES ('3196', '3194', '洛南县', null, null);
INSERT INTO `province_city_area` VALUES ('3197', '3194', '丹凤县', null, null);
INSERT INTO `province_city_area` VALUES ('3198', '3194', '商南县', null, null);
INSERT INTO `province_city_area` VALUES ('3199', '3194', '山阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3200', '3194', '镇安县', null, null);
INSERT INTO `province_city_area` VALUES ('3201', '3194', '柞水县', null, null);
INSERT INTO `province_city_area` VALUES ('3202', '0', '甘肃', null, null);
INSERT INTO `province_city_area` VALUES ('3203', '3202', '兰州', null, null);
INSERT INTO `province_city_area` VALUES ('3204', '3203', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3205', '3203', '城关区', null, null);
INSERT INTO `province_city_area` VALUES ('3206', '3203', '七里河区', null, null);
INSERT INTO `province_city_area` VALUES ('3207', '3203', '西固区', null, null);
INSERT INTO `province_city_area` VALUES ('3208', '3203', '安宁区', null, null);
INSERT INTO `province_city_area` VALUES ('3209', '3203', '红古区', null, null);
INSERT INTO `province_city_area` VALUES ('3210', '3203', '永登县', null, null);
INSERT INTO `province_city_area` VALUES ('3211', '3203', '皋兰县', null, null);
INSERT INTO `province_city_area` VALUES ('3212', '3203', '榆中县', null, null);
INSERT INTO `province_city_area` VALUES ('3213', '3202', '嘉峪关', null, null);
INSERT INTO `province_city_area` VALUES ('3214', '3213', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3215', '3202', '金昌', null, null);
INSERT INTO `province_city_area` VALUES ('3216', '3215', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3217', '3215', '金川区', null, null);
INSERT INTO `province_city_area` VALUES ('3218', '3215', '永昌县', null, null);
INSERT INTO `province_city_area` VALUES ('3219', '3202', '白银', null, null);
INSERT INTO `province_city_area` VALUES ('3220', '3219', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3221', '3219', '白银区', null, null);
INSERT INTO `province_city_area` VALUES ('3222', '3219', '平川区', null, null);
INSERT INTO `province_city_area` VALUES ('3223', '3219', '靖远县', null, null);
INSERT INTO `province_city_area` VALUES ('3224', '3219', '会宁县', null, null);
INSERT INTO `province_city_area` VALUES ('3225', '3219', '景泰县', null, null);
INSERT INTO `province_city_area` VALUES ('3226', '3202', '天水', null, null);
INSERT INTO `province_city_area` VALUES ('3227', '3226', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3228', '3226', '秦城区', null, null);
INSERT INTO `province_city_area` VALUES ('3229', '3226', '北道区', null, null);
INSERT INTO `province_city_area` VALUES ('3230', '3226', '清水县', null, null);
INSERT INTO `province_city_area` VALUES ('3231', '3226', '秦安县', null, null);
INSERT INTO `province_city_area` VALUES ('3232', '3226', '甘谷县', null, null);
INSERT INTO `province_city_area` VALUES ('3233', '3226', '武山县', null, null);
INSERT INTO `province_city_area` VALUES ('3234', '3226', '张家川回族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3235', '3202', '酒泉地区', null, null);
INSERT INTO `province_city_area` VALUES ('3236', '3235', '玉门市', null, null);
INSERT INTO `province_city_area` VALUES ('3237', '3235', '酒泉市', null, null);
INSERT INTO `province_city_area` VALUES ('3238', '3235', '敦煌市', null, null);
INSERT INTO `province_city_area` VALUES ('3239', '3235', '金塔县', null, null);
INSERT INTO `province_city_area` VALUES ('3240', '3235', '肃北蒙古族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3242', '3235', '安西县', null, null);
INSERT INTO `province_city_area` VALUES ('3243', '3202', '张掖地区', null, null);
INSERT INTO `province_city_area` VALUES ('3244', '3243', '张掖市', null, null);
INSERT INTO `province_city_area` VALUES ('3245', '3243', '肃南裕固族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3246', '3243', '民乐县', null, null);
INSERT INTO `province_city_area` VALUES ('3247', '3243', '临泽县', null, null);
INSERT INTO `province_city_area` VALUES ('3248', '3243', '高台县', null, null);
INSERT INTO `province_city_area` VALUES ('3249', '3243', '山丹县', null, null);
INSERT INTO `province_city_area` VALUES ('3250', '3202', '武威地区', null, null);
INSERT INTO `province_city_area` VALUES ('3251', '3250', '武威市', null, null);
INSERT INTO `province_city_area` VALUES ('3252', '3250', '民勤县', null, null);
INSERT INTO `province_city_area` VALUES ('3253', '3250', '古浪县', null, null);
INSERT INTO `province_city_area` VALUES ('3254', '3250', '天祝藏族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3255', '3202', '定西地区', null, null);
INSERT INTO `province_city_area` VALUES ('3256', '3255', '定西县', null, null);
INSERT INTO `province_city_area` VALUES ('3257', '3255', '通渭县', null, null);
INSERT INTO `province_city_area` VALUES ('3258', '3255', '陇西县', null, null);
INSERT INTO `province_city_area` VALUES ('3259', '3255', '渭源县', null, null);
INSERT INTO `province_city_area` VALUES ('3260', '3255', '临洮县', null, null);
INSERT INTO `province_city_area` VALUES ('3261', '3255', '漳  县', null, null);
INSERT INTO `province_city_area` VALUES ('3262', '3255', '岷  县', null, null);
INSERT INTO `province_city_area` VALUES ('3263', '3202', '陇南地区', null, null);
INSERT INTO `province_city_area` VALUES ('3264', '3263', '武都县', null, null);
INSERT INTO `province_city_area` VALUES ('3265', '3263', '宕昌县', null, null);
INSERT INTO `province_city_area` VALUES ('3266', '3263', '成  县', null, null);
INSERT INTO `province_city_area` VALUES ('3267', '3263', '康  县', null, null);
INSERT INTO `province_city_area` VALUES ('3268', '3263', '文  县', null, null);
INSERT INTO `province_city_area` VALUES ('3269', '3263', '西和县', null, null);
INSERT INTO `province_city_area` VALUES ('3270', '3263', '礼  县', null, null);
INSERT INTO `province_city_area` VALUES ('3271', '3263', '两当县', null, null);
INSERT INTO `province_city_area` VALUES ('3272', '3263', '徽  县', null, null);
INSERT INTO `province_city_area` VALUES ('3273', '3202', '平凉地区', null, null);
INSERT INTO `province_city_area` VALUES ('3274', '3273', '平凉市', null, null);
INSERT INTO `province_city_area` VALUES ('3275', '3273', '泾川县', null, null);
INSERT INTO `province_city_area` VALUES ('3276', '3273', '灵台县', null, null);
INSERT INTO `province_city_area` VALUES ('3277', '3273', '崇信县', null, null);
INSERT INTO `province_city_area` VALUES ('3278', '3273', '华亭县', null, null);
INSERT INTO `province_city_area` VALUES ('3279', '3273', '庄浪县', null, null);
INSERT INTO `province_city_area` VALUES ('3280', '3273', '静宁县', null, null);
INSERT INTO `province_city_area` VALUES ('3281', '3202', '庆阳地区', null, null);
INSERT INTO `province_city_area` VALUES ('3282', '3281', '西峰市', null, null);
INSERT INTO `province_city_area` VALUES ('3283', '3281', '庆阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3284', '3281', '环  县', null, null);
INSERT INTO `province_city_area` VALUES ('3285', '3281', '华池县', null, null);
INSERT INTO `province_city_area` VALUES ('3286', '3281', '合水县', null, null);
INSERT INTO `province_city_area` VALUES ('3287', '3281', '正宁县', null, null);
INSERT INTO `province_city_area` VALUES ('3288', '3281', '宁  县', null, null);
INSERT INTO `province_city_area` VALUES ('3289', '3281', '镇原县', null, null);
INSERT INTO `province_city_area` VALUES ('3290', '3202', '临夏回族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3291', '3290', '临夏市', null, null);
INSERT INTO `province_city_area` VALUES ('3292', '3290', '临夏县', null, null);
INSERT INTO `province_city_area` VALUES ('3293', '3290', '康乐县', null, null);
INSERT INTO `province_city_area` VALUES ('3294', '3290', '永靖县', null, null);
INSERT INTO `province_city_area` VALUES ('3295', '3290', '广河县', null, null);
INSERT INTO `province_city_area` VALUES ('3296', '3290', '和政县', null, null);
INSERT INTO `province_city_area` VALUES ('3297', '3290', '东乡族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3299', '3202', '甘南藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3300', '3299', '合作市', null, null);
INSERT INTO `province_city_area` VALUES ('3301', '3299', '临潭县', null, null);
INSERT INTO `province_city_area` VALUES ('3302', '3299', '卓尼县', null, null);
INSERT INTO `province_city_area` VALUES ('3303', '3299', '舟曲县', null, null);
INSERT INTO `province_city_area` VALUES ('3304', '3299', '迭部县', null, null);
INSERT INTO `province_city_area` VALUES ('3305', '3299', '玛曲县', null, null);
INSERT INTO `province_city_area` VALUES ('3306', '3299', '碌曲县', null, null);
INSERT INTO `province_city_area` VALUES ('3307', '3299', '夏河县', null, null);
INSERT INTO `province_city_area` VALUES ('3308', '0', '青海', null, null);
INSERT INTO `province_city_area` VALUES ('3309', '3308', '西宁', null, null);
INSERT INTO `province_city_area` VALUES ('3310', '3309', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3311', '3309', '城东区', null, null);
INSERT INTO `province_city_area` VALUES ('3312', '3309', '城中区', null, null);
INSERT INTO `province_city_area` VALUES ('3313', '3309', '城西区', null, null);
INSERT INTO `province_city_area` VALUES ('3314', '3309', '城北区', null, null);
INSERT INTO `province_city_area` VALUES ('3316', '3309', '湟中县', null, null);
INSERT INTO `province_city_area` VALUES ('3317', '3309', '湟源县', null, null);
INSERT INTO `province_city_area` VALUES ('3318', '3308', '海东地区', null, null);
INSERT INTO `province_city_area` VALUES ('3319', '3318', '平安县', null, null);
INSERT INTO `province_city_area` VALUES ('3321', '3318', '乐都县', null, null);
INSERT INTO `province_city_area` VALUES ('3322', '3318', '互助土族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3323', '3318', '化隆回族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3324', '3318', '循化撒拉族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3325', '3308', '海北藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3326', '3325', '门源回族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3327', '3325', '祁连县', null, null);
INSERT INTO `province_city_area` VALUES ('3328', '3325', '海晏县', null, null);
INSERT INTO `province_city_area` VALUES ('3329', '3325', '刚察县', null, null);
INSERT INTO `province_city_area` VALUES ('3330', '3308', '黄南藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3331', '3330', '同仁县', null, null);
INSERT INTO `province_city_area` VALUES ('3332', '3330', '尖扎县', null, null);
INSERT INTO `province_city_area` VALUES ('3333', '3330', '泽库县', null, null);
INSERT INTO `province_city_area` VALUES ('3334', '3330', '河南蒙古族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3335', '3308', '海南藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3336', '3335', '共和县', null, null);
INSERT INTO `province_city_area` VALUES ('3337', '3335', '同德县', null, null);
INSERT INTO `province_city_area` VALUES ('3338', '3335', '贵德县', null, null);
INSERT INTO `province_city_area` VALUES ('3339', '3335', '兴海县', null, null);
INSERT INTO `province_city_area` VALUES ('3340', '3335', '贵南县', null, null);
INSERT INTO `province_city_area` VALUES ('3341', '3308', '果洛藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3342', '3341', '玛沁县', null, null);
INSERT INTO `province_city_area` VALUES ('3343', '3341', '班玛县', null, null);
INSERT INTO `province_city_area` VALUES ('3344', '3341', '甘德县', null, null);
INSERT INTO `province_city_area` VALUES ('3345', '3341', '达日县', null, null);
INSERT INTO `province_city_area` VALUES ('3346', '3341', '久治县', null, null);
INSERT INTO `province_city_area` VALUES ('3347', '3341', '玛多县', null, null);
INSERT INTO `province_city_area` VALUES ('3348', '3308', '玉树藏族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3349', '3348', '玉树县', null, null);
INSERT INTO `province_city_area` VALUES ('3350', '3348', '杂多县', null, null);
INSERT INTO `province_city_area` VALUES ('3351', '3348', '称多县', null, null);
INSERT INTO `province_city_area` VALUES ('3352', '3348', '治多县', null, null);
INSERT INTO `province_city_area` VALUES ('3353', '3348', '囊谦县', null, null);
INSERT INTO `province_city_area` VALUES ('3354', '3348', '曲麻莱县', null, null);
INSERT INTO `province_city_area` VALUES ('3356', '3355', '格尔木市', null, null);
INSERT INTO `province_city_area` VALUES ('3357', '3355', '德令哈市', null, null);
INSERT INTO `province_city_area` VALUES ('3358', '3355', '乌兰县', null, null);
INSERT INTO `province_city_area` VALUES ('3359', '3355', '都兰县', null, null);
INSERT INTO `province_city_area` VALUES ('3360', '3355', '天峻县', null, null);
INSERT INTO `province_city_area` VALUES ('3361', '0', '宁夏', null, null);
INSERT INTO `province_city_area` VALUES ('3362', '3361', '银川', null, null);
INSERT INTO `province_city_area` VALUES ('3363', '3362', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3364', '3362', '城  区', null, null);
INSERT INTO `province_city_area` VALUES ('3365', '3362', '新城区', null, null);
INSERT INTO `province_city_area` VALUES ('3366', '3362', '郊  区', null, null);
INSERT INTO `province_city_area` VALUES ('3367', '3362', '永宁县', null, null);
INSERT INTO `province_city_area` VALUES ('3368', '3362', '贺兰县', null, null);
INSERT INTO `province_city_area` VALUES ('3369', '3361', '石嘴山', null, null);
INSERT INTO `province_city_area` VALUES ('3370', '3369', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3371', '3369', '大武口区', null, null);
INSERT INTO `province_city_area` VALUES ('3372', '3369', '石嘴山区', null, null);
INSERT INTO `province_city_area` VALUES ('3373', '3369', '石炭井区', null, null);
INSERT INTO `province_city_area` VALUES ('3374', '3369', '平罗县', null, null);
INSERT INTO `province_city_area` VALUES ('3375', '3369', '陶乐县', null, null);
INSERT INTO `province_city_area` VALUES ('3376', '3369', '惠农县', null, null);
INSERT INTO `province_city_area` VALUES ('3377', '3361', '吴忠', null, null);
INSERT INTO `province_city_area` VALUES ('3378', '3377', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3379', '3377', '利通区', null, null);
INSERT INTO `province_city_area` VALUES ('3380', '3377', '中卫县', null, null);
INSERT INTO `province_city_area` VALUES ('3381', '3377', '中宁县', null, null);
INSERT INTO `province_city_area` VALUES ('3382', '3377', '盐池县', null, null);
INSERT INTO `province_city_area` VALUES ('3383', '3377', '同心县', null, null);
INSERT INTO `province_city_area` VALUES ('3384', '3377', '青铜峡市', null, null);
INSERT INTO `province_city_area` VALUES ('3385', '3377', '灵武市', null, null);
INSERT INTO `province_city_area` VALUES ('3386', '3361', '固原地区', null, null);
INSERT INTO `province_city_area` VALUES ('3387', '3386', '固原县', null, null);
INSERT INTO `province_city_area` VALUES ('3388', '3386', '海原县', null, null);
INSERT INTO `province_city_area` VALUES ('3389', '3386', '西吉县', null, null);
INSERT INTO `province_city_area` VALUES ('3390', '3386', '隆德县', null, null);
INSERT INTO `province_city_area` VALUES ('3391', '3386', '泾源县', null, null);
INSERT INTO `province_city_area` VALUES ('3392', '3386', '彭阳县', null, null);
INSERT INTO `province_city_area` VALUES ('3393', '0', '新疆', null, null);
INSERT INTO `province_city_area` VALUES ('3394', '3393', '乌鲁木齐', null, null);
INSERT INTO `province_city_area` VALUES ('3395', '3394', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3396', '3394', '天山区', null, null);
INSERT INTO `province_city_area` VALUES ('3397', '3394', '沙依巴克区', null, null);
INSERT INTO `province_city_area` VALUES ('3398', '3394', '新市区', null, null);
INSERT INTO `province_city_area` VALUES ('3399', '3394', '水磨沟区', null, null);
INSERT INTO `province_city_area` VALUES ('3400', '3394', '头屯河区', null, null);
INSERT INTO `province_city_area` VALUES ('3401', '3394', '南泉区', null, null);
INSERT INTO `province_city_area` VALUES ('3402', '3394', '东山区', null, null);
INSERT INTO `province_city_area` VALUES ('3403', '3394', '乌鲁木齐县', null, null);
INSERT INTO `province_city_area` VALUES ('3404', '3393', '克拉玛依', null, null);
INSERT INTO `province_city_area` VALUES ('3405', '3404', '市辖区', null, null);
INSERT INTO `province_city_area` VALUES ('3406', '3404', '独山子区', null, null);
INSERT INTO `province_city_area` VALUES ('3407', '3404', '克拉玛依区', null, null);
INSERT INTO `province_city_area` VALUES ('3408', '3404', '白碱滩区', null, null);
INSERT INTO `province_city_area` VALUES ('3409', '3404', '乌尔禾区', null, null);
INSERT INTO `province_city_area` VALUES ('3410', '3393', '吐鲁番地区', null, null);
INSERT INTO `province_city_area` VALUES ('3411', '3410', '吐鲁番市', null, null);
INSERT INTO `province_city_area` VALUES ('3412', '3410', '鄯善县', null, null);
INSERT INTO `province_city_area` VALUES ('3413', '3410', '托克逊县', null, null);
INSERT INTO `province_city_area` VALUES ('3414', '3393', '哈密地区', null, null);
INSERT INTO `province_city_area` VALUES ('3415', '3414', '哈密市', null, null);
INSERT INTO `province_city_area` VALUES ('3417', '3414', '伊吾县', null, null);
INSERT INTO `province_city_area` VALUES ('3418', '3393', '昌吉回族自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3419', '3418', '昌吉市', null, null);
INSERT INTO `province_city_area` VALUES ('3420', '3418', '阜康市', null, null);
INSERT INTO `province_city_area` VALUES ('3421', '3418', '米泉市', null, null);
INSERT INTO `province_city_area` VALUES ('3422', '3418', '呼图壁县', null, null);
INSERT INTO `province_city_area` VALUES ('3423', '3418', '玛纳斯县', null, null);
INSERT INTO `province_city_area` VALUES ('3424', '3418', '奇台县', null, null);
INSERT INTO `province_city_area` VALUES ('3425', '3418', '吉木萨尔县', null, null);
INSERT INTO `province_city_area` VALUES ('3426', '3418', '木垒哈萨克自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3428', '3427', '博乐市', null, null);
INSERT INTO `province_city_area` VALUES ('3429', '3427', '精河县', null, null);
INSERT INTO `province_city_area` VALUES ('3430', '3427', '温泉县', null, null);
INSERT INTO `province_city_area` VALUES ('3432', '3431', '库尔勒市', null, null);
INSERT INTO `province_city_area` VALUES ('3433', '3431', '轮台县', null, null);
INSERT INTO `province_city_area` VALUES ('3434', '3431', '尉犁县', null, null);
INSERT INTO `province_city_area` VALUES ('3435', '3431', '若羌县', null, null);
INSERT INTO `province_city_area` VALUES ('3436', '3431', '且末县', null, null);
INSERT INTO `province_city_area` VALUES ('3437', '3431', '焉耆回族自治县', null, null);
INSERT INTO `province_city_area` VALUES ('3438', '3431', '和静县', null, null);
INSERT INTO `province_city_area` VALUES ('3439', '3431', '和硕县', null, null);
INSERT INTO `province_city_area` VALUES ('3440', '3431', '博湖县', null, null);
INSERT INTO `province_city_area` VALUES ('3441', '3393', '阿克苏地区', null, null);
INSERT INTO `province_city_area` VALUES ('3442', '3441', '阿克苏市', null, null);
INSERT INTO `province_city_area` VALUES ('3443', '3441', '温宿县', null, null);
INSERT INTO `province_city_area` VALUES ('3444', '3441', '库车县', null, null);
INSERT INTO `province_city_area` VALUES ('3445', '3441', '沙雅县', null, null);
INSERT INTO `province_city_area` VALUES ('3446', '3441', '新和县', null, null);
INSERT INTO `province_city_area` VALUES ('3447', '3441', '拜城县', null, null);
INSERT INTO `province_city_area` VALUES ('3448', '3441', '乌什县', null, null);
INSERT INTO `province_city_area` VALUES ('3449', '3441', '阿瓦提县', null, null);
INSERT INTO `province_city_area` VALUES ('3450', '3441', '柯坪县', null, null);
INSERT INTO `province_city_area` VALUES ('3452', '3451', '阿图什市', null, null);
INSERT INTO `province_city_area` VALUES ('3453', '3451', '阿克陶县', null, null);
INSERT INTO `province_city_area` VALUES ('3454', '3451', '阿合奇县', null, null);
INSERT INTO `province_city_area` VALUES ('3455', '3451', '乌恰县', null, null);
INSERT INTO `province_city_area` VALUES ('3456', '3393', '喀什地区', null, null);
INSERT INTO `province_city_area` VALUES ('3457', '3456', '喀什市', null, null);
INSERT INTO `province_city_area` VALUES ('3458', '3456', '疏附县', null, null);
INSERT INTO `province_city_area` VALUES ('3459', '3456', '疏勒县', null, null);
INSERT INTO `province_city_area` VALUES ('3460', '3456', '英吉沙县', null, null);
INSERT INTO `province_city_area` VALUES ('3461', '3456', '泽普县', null, null);
INSERT INTO `province_city_area` VALUES ('3462', '3456', '莎车县', null, null);
INSERT INTO `province_city_area` VALUES ('3463', '3456', '叶城县', null, null);
INSERT INTO `province_city_area` VALUES ('3464', '3456', '麦盖提县', null, null);
INSERT INTO `province_city_area` VALUES ('3465', '3456', '岳普湖县', null, null);
INSERT INTO `province_city_area` VALUES ('3466', '3456', '伽师县', null, null);
INSERT INTO `province_city_area` VALUES ('3467', '3456', '巴楚县', null, null);
INSERT INTO `province_city_area` VALUES ('3469', '3393', '和田地区', null, null);
INSERT INTO `province_city_area` VALUES ('3470', '3469', '和田市', null, null);
INSERT INTO `province_city_area` VALUES ('3471', '3469', '和田县', null, null);
INSERT INTO `province_city_area` VALUES ('3472', '3469', '墨玉县', null, null);
INSERT INTO `province_city_area` VALUES ('3473', '3469', '皮山县', null, null);
INSERT INTO `province_city_area` VALUES ('3474', '3469', '洛浦县', null, null);
INSERT INTO `province_city_area` VALUES ('3475', '3469', '策勒县', null, null);
INSERT INTO `province_city_area` VALUES ('3476', '3469', '于田县', null, null);
INSERT INTO `province_city_area` VALUES ('3477', '3469', '民丰县', null, null);
INSERT INTO `province_city_area` VALUES ('3478', '3393', '伊犁哈萨克自治州', null, null);
INSERT INTO `province_city_area` VALUES ('3479', '3478', '奎屯市', null, null);
INSERT INTO `province_city_area` VALUES ('3480', '3393', '伊犁地区', null, null);
INSERT INTO `province_city_area` VALUES ('3481', '3480', '伊宁市', null, null);
INSERT INTO `province_city_area` VALUES ('3482', '3480', '伊宁县', null, null);
INSERT INTO `province_city_area` VALUES ('3484', '3480', '霍城县', null, null);
INSERT INTO `province_city_area` VALUES ('3485', '3480', '巩留县', null, null);
INSERT INTO `province_city_area` VALUES ('3486', '3480', '新源县', null, null);
INSERT INTO `province_city_area` VALUES ('3487', '3480', '昭苏县', null, null);
INSERT INTO `province_city_area` VALUES ('3488', '3480', '特克斯县', null, null);
INSERT INTO `province_city_area` VALUES ('3489', '3480', '尼勒克县', null, null);
INSERT INTO `province_city_area` VALUES ('3490', '3393', '塔城地区', null, null);
INSERT INTO `province_city_area` VALUES ('3491', '3490', '塔城市', null, null);
INSERT INTO `province_city_area` VALUES ('3492', '3490', '乌苏市', null, null);
INSERT INTO `province_city_area` VALUES ('3493', '3490', '额敏县', null, null);
INSERT INTO `province_city_area` VALUES ('3494', '3490', '沙湾县', null, null);
INSERT INTO `province_city_area` VALUES ('3495', '3490', '托里县', null, null);
INSERT INTO `province_city_area` VALUES ('3496', '3490', '裕民县', null, null);
INSERT INTO `province_city_area` VALUES ('3498', '3393', '阿勒泰地区', null, null);
INSERT INTO `province_city_area` VALUES ('3499', '3498', '阿勒泰市', null, null);
INSERT INTO `province_city_area` VALUES ('3500', '3498', '布尔津县', null, null);
INSERT INTO `province_city_area` VALUES ('3501', '3498', '富蕴县', null, null);
INSERT INTO `province_city_area` VALUES ('3502', '3498', '福海县', null, null);
INSERT INTO `province_city_area` VALUES ('3503', '3498', '哈巴河县', null, null);
INSERT INTO `province_city_area` VALUES ('3504', '3498', '青河县', null, null);
INSERT INTO `province_city_area` VALUES ('3505', '3498', '吉木乃县', null, null);
INSERT INTO `province_city_area` VALUES ('3506', '3393', '省直辖行政单位', null, null);
INSERT INTO `province_city_area` VALUES ('3507', '3506', '石河子市', null, null);
INSERT INTO `province_city_area` VALUES ('3508', '0', '台湾', null, null);
INSERT INTO `province_city_area` VALUES ('3509', '0', '香港', null, null);
INSERT INTO `province_city_area` VALUES ('3510', '0', '澳门', null, null);

-- ----------------------------
-- Table structure for sales_flow
-- ----------------------------
DROP TABLE IF EXISTS `sales_flow`;
CREATE TABLE `sales_flow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键-销售流水信息',
  `channelcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
  `stationcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客运站编码',
  `groupnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组编号',
  `ticketnum` int(11) NOT NULL COMMENT '售票数目',
  `moneynum` decimal(10,0) NOT NULL COMMENT '金额',
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单位',
  `flowdate` datetime NOT NULL COMMENT '录入日期',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售流水信息';

-- ----------------------------
-- Records of sales_flow
-- ----------------------------
INSERT INTO `sales_flow` VALUES ('1', '2030', '1010', '20171023', '6', '7', '1010', '2017-10-23 00:00:00', '测试111', '88', '2017-10-23 17:59:28', '88', '2017-10-23 23:27:53', null, null, '0');
INSERT INTO `sales_flow` VALUES ('2', '2020', '1010', '20171023', '6', '8', '1010', '2017-10-23 00:00:00', '测试111', '88', '2017-10-23 17:59:28', '88', '2017-10-23 23:27:53', null, null, '0');
INSERT INTO `sales_flow` VALUES ('3', '2010', '1010', '20171023', '6', '78', '1010', '2017-10-23 00:00:00', '测试111', '88', '2017-10-23 17:59:28', '88', '2017-10-23 23:27:53', null, null, '0');
INSERT INTO `sales_flow` VALUES ('4', '1010', '1010', '20171023', '123481', '678586', '1010', '2017-10-23 00:00:00', '测试111', '88', '2017-10-23 17:59:28', '88', '2017-10-23 23:27:53', null, null, '0');
INSERT INTO `sales_flow` VALUES ('5', '2030', '1010', '20171023', '5', '7', '1010', '2017-10-23 00:00:00', '', '88', '2017-10-23 23:21:12', null, null, '88', '2017-10-23 23:22:10', '1');
INSERT INTO `sales_flow` VALUES ('6', '2020', '1010', '20171023', '6', '8', '1010', '2017-10-23 00:00:00', '', '88', '2017-10-23 23:21:12', null, null, '88', '2017-10-23 23:22:06', '1');
INSERT INTO `sales_flow` VALUES ('7', '2010', '1010', '20171023', '7', '78', '1010', '2017-10-23 00:00:00', '', '88', '2017-10-23 23:21:12', null, null, '88', '2017-10-23 23:22:02', '1');
INSERT INTO `sales_flow` VALUES ('8', '1010', '1010', '20171023', '82', '678586', '1010', '2017-10-23 00:00:00', '', '88', '2017-10-23 23:21:12', null, null, '88', '2017-10-23 23:21:50', '1');
INSERT INTO `sales_flow` VALUES ('9', '2030', '1010', '20171001', '6', '1', '1010', '2017-10-01 00:00:00', '.。。。。。', '88', '2017-10-23 23:30:59', null, null, null, null, '0');
INSERT INTO `sales_flow` VALUES ('10', '2020', '1010', '20171001', '7', '2', '1010', '2017-10-01 00:00:00', '.。。。。。', '88', '2017-10-23 23:30:59', null, null, null, null, '0');
INSERT INTO `sales_flow` VALUES ('11', '2010', '1010', '20171001', '8', '3', '1010', '2017-10-01 00:00:00', '.。。。。。', '88', '2017-10-23 23:30:59', null, null, null, null, '0');
INSERT INTO `sales_flow` VALUES ('12', '1010', '1010', '20171001', '23435', '56783', '1010', '2017-10-01 00:00:00', '.。。。。。', '88', '2017-10-23 23:30:59', null, null, null, null, '0');

-- ----------------------------
-- Table structure for sals_flow
-- ----------------------------
DROP TABLE IF EXISTS `sals_flow`;
CREATE TABLE `sals_flow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键-销售流水信息',
  `channelcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
  `stationcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客运站编码',
  `groupnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组编号',
  `ticketnum` int(11) NOT NULL COMMENT '售票数目',
  `moneynum` decimal(10,0) NOT NULL COMMENT '金额',
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单位',
  `flowdate` datetime NOT NULL COMMENT '录入日期',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `iseffective` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售流水信息';

-- ----------------------------
-- Records of sals_flow
-- ----------------------------

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键（客运站分公司）',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客运站编码',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客运站名字',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客运站类别',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `iseffective` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否启用',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客运站信息';

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('1', '1', '1', '12', 'QQ去', '1', '0', '88', '2017-10-19 16:05:45', '88', '2017-10-19 16:09:26', '88', '2017-10-19 17:51:52', '1');
INSERT INTO `station` VALUES ('2', '1010', '快速汽车客运站', '0', 'DL', '快速汽车客运站', '0', '88', '2017-10-19 16:11:44', null, null, null, null, '0');
INSERT INTO `station` VALUES ('3', '1020', '东部汽车客运站', '0', 'DL', '东部汽车客运站', '0', '88', '2017-10-19 16:13:01', '88', '2017-10-20 08:50:15', null, null, '0');
INSERT INTO `station` VALUES ('4', '1', '1', '1', '1', '1', '0', '88', '2017-10-20 08:54:54', null, null, '88', '2017-10-20 10:01:59', '1');
INSERT INTO `station` VALUES ('5', '', '', null, null, null, null, '88', '2017-10-20 13:11:49', null, null, '88', '2017-10-20 13:12:05', '1');
INSERT INTO `station` VALUES ('6', '1', '111', '1', '1', '1', '0', '88', '2017-10-20 13:12:27', '88', '2017-10-20 13:12:57', '88', '2017-10-20 13:13:14', '1');
INSERT INTO `station` VALUES ('7', '1030', '兴盛客运站', '0', '兴盛客运站', '兴盛客运站', '0', '88', '2017-10-20 13:17:08', '88', '2017-10-20 14:20:00', null, null, '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；mb_password加密',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像，相对于upload/avatar目录',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `email_code` varchar(60) DEFAULT NULL COMMENT '激活码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `phone` bigint(11) unsigned DEFAULT NULL COMMENT '手机号',
  `org_id` int(11) DEFAULT '0' COMMENT '所属机构编码',
  `dept_id` int(11) DEFAULT '0' COMMENT '所属部门编码',
  `p_id` int(11) DEFAULT '0' COMMENT '所属岗位编码',
  `e_id` int(11) DEFAULT '0' COMMENT '关联系统员工',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `register_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('88', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '/Upload/avatar/user1.jpg', 'yxh.network@gmail.com', '', '管理员', '15025134157', '1', '0', '0', '0', '1', '1449199996', '', '0');
INSERT INTO `users` VALUES ('89', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '/Upload/avatar/user2.jpg', '123@111.cc', '', '文章编辑', '18760969890', '0', '0', '0', '0', '1', '1449199996', '', '0');
INSERT INTO `users` VALUES ('90', 'user', 'e10adc3949ba59abbe56e057f20f883e', '', '111@222.ccc', null, '外太空', '13625124574', '1', '5', '0', '0', '1', '1503925261', '', '0');
INSERT INTO `users` VALUES ('91', 'shop', 'e10adc3949ba59abbe56e057f20f883e', '', '111@222.ccc', null, '店铺管理员', '12121222222', '1', '5', '0', '0', '1', '1504775393', '', '0');

-- ----------------------------
-- Table structure for weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user`;
CREATE TABLE `weixin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键-微信识别号白名单',
  `weixid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信识别码',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `phonenum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话号码',
  `gender` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '性别',
  `moduleids` text COLLATE utf8mb4_unicode_ci COMMENT '模块编码',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `iseffective` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否有效',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信用户白名单信息';

-- ----------------------------
-- Records of weixin_user
-- ----------------------------

-- ----------------------------
-- Table structure for white_list
-- ----------------------------
DROP TABLE IF EXISTS `white_list`;
CREATE TABLE `white_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键-微信识别号白名单',
  `weixid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信识别码',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `phonenum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话号码',
  `gender` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '性别',
  `moduleids` text COLLATE utf8mb4_unicode_ci COMMENT '模块编码',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `iseffective` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否有效',
  `createuserid` int(11) DEFAULT NULL COMMENT '数据添加人员编码',
  `createdate` datetime DEFAULT NULL COMMENT '数据创建日期',
  `updateuserid` int(11) DEFAULT NULL COMMENT '数据修改人员',
  `updatedate` datetime DEFAULT NULL COMMENT '数据修改日期',
  `deluserid` int(11) DEFAULT NULL COMMENT '数据删除人员编码',
  `deldate` datetime DEFAULT NULL COMMENT '数据删除时间',
  `isdel` int(11) DEFAULT '0' COMMENT '数据是否删除（0是 1否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信用户白名单信息';

-- ----------------------------
-- Records of white_list
-- ----------------------------
INSERT INTO `white_list` VALUES ('1', 'adfljhdlasghdgsfhdgf', '李阳', '13619673512', '男', '1', '描述', '1', '88', '2017-10-19 15:40:24', '88', '2017-10-19 15:46:25', null, null, '0');
INSERT INTO `white_list` VALUES ('2', '1', '1', '1', '男', '1', '1', '1', '88', '2017-10-19 15:47:29', null, null, '88', '2017-10-19 15:47:38', '1');
INSERT INTO `white_list` VALUES ('3', '131242364', '杨希', '6547548', '男', '568679', '67989', '1', '88', '2017-10-19 15:47:52', null, null, null, null, '0');
INSERT INTO `white_list` VALUES ('4', '2543333333333', '丽丽', '33434343434343434343', '男', '43333333333333', '34444444444', '1', '88', '2017-10-19 15:49:10', null, null, null, null, '0');
INSERT INTO `white_list` VALUES ('5', '1', '1', '1', '男', '1', '1', '1', '88', '2017-10-20 08:54:45', null, null, '88', '2017-10-20 13:11:21', '1');
INSERT INTO `white_list` VALUES ('6', '1', '1', '1', '男', '1', '1', '0', '88', '2017-10-20 13:11:10', null, null, '88', '2017-10-20 13:11:25', '1');
