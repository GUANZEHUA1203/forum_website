/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-07 07:49:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_account`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_account`;
CREATE TABLE `tbl_account` (
  `ac_id` bigint(20) NOT NULL COMMENT '用户表',
  `ac_login_name` varchar(256) NOT NULL COMMENT '登录名称',
  `ac_real_name` varchar(256) DEFAULT NULL COMMENT '真实名字',
  `ac_mail` varchar(35) DEFAULT NULL COMMENT '邮箱',
  `ac_password` varchar(85) DEFAULT NULL COMMENT '账户密码',
  `ac_sex` char(2) DEFAULT NULL COMMENT '性别',
  `ac_salt` varchar(255) DEFAULT NULL,
  `ac_level` varchar(255) DEFAULT NULL COMMENT '经验值 ',
  `ac_createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ac_lasttime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后发帖时间',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_account
-- ----------------------------
INSERT INTO `tbl_account` VALUES ('510185430012923904', '1231231231', '123123123123', '1123217490@qq.com', '57537b5f8843d0421cf6311f341bf216', '0', 'f17b267f-d639-46b9-b271-c5a6252901dc', null, '2018-05-06 11:59:44', '2018-05-06 11:59:44');
INSERT INTO `tbl_account` VALUES ('510193118163767296', '12345679', '2342', '123123123', '8d631623a5730636a59f5cd1333a87af', '0', '7cc57c22-4fc2-4c70-924e-cab0759d5c58', null, '2018-05-06 00:19:55', '2018-05-06 00:19:55');
INSERT INTO `tbl_account` VALUES ('510605389583093760', '123456456', '123', '123123', '01ef632ba834f8719d47ee363a985ea3', '0', '6cae9d6d-d596-4563-970c-8cd5d9ccac52', null, '2018-05-06 15:38:45', '2018-05-06 15:38:45');
INSERT INTO `tbl_account` VALUES ('4474044509599501986', 'admin', 'admin', '1123217490@qq.com', '7fc445d6595a6c42de7e70392d6886a2', '1', 'e793cb5a-bf05-4cc8-94a7-65595c2e910a', '2885', '2018-05-06 15:35:35', '2018-05-06 15:35:35');

-- ----------------------------
-- Table structure for `tbl_account_role`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_account_role`;
CREATE TABLE `tbl_account_role` (
  `ar_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ac_id` bigint(20) DEFAULT NULL COMMENT '账户id',
  `ro_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_account_role
-- ----------------------------
INSERT INTO `tbl_account_role` VALUES ('26', '4474044509599501986', '1');
INSERT INTO `tbl_account_role` VALUES ('27', '509527837493956608', null);
INSERT INTO `tbl_account_role` VALUES ('28', '509527993111023616', null);
INSERT INTO `tbl_account_role` VALUES ('29', '509527993111023616', null);
INSERT INTO `tbl_account_role` VALUES ('30', '509527993111023616', null);
INSERT INTO `tbl_account_role` VALUES ('31', '509527993111023616', null);
INSERT INTO `tbl_account_role` VALUES ('32', '509527993111023616', null);
INSERT INTO `tbl_account_role` VALUES ('34', '509810441141096448', '1');
INSERT INTO `tbl_account_role` VALUES ('43', '509900472006479872', '7');
INSERT INTO `tbl_account_role` VALUES ('51', '510193118163767296', '1');
INSERT INTO `tbl_account_role` VALUES ('52', '510193118163767296', '5');
INSERT INTO `tbl_account_role` VALUES ('53', '510193118163767296', '6');
INSERT INTO `tbl_account_role` VALUES ('54', '510193118163767296', '7');
INSERT INTO `tbl_account_role` VALUES ('55', '510193118163767296', '8');
INSERT INTO `tbl_account_role` VALUES ('58', '510185430012923904', '8');
INSERT INTO `tbl_account_role` VALUES ('61', '510605389583093760', '5');
INSERT INTO `tbl_account_role` VALUES ('62', '510605389583093760', '6');

-- ----------------------------
-- Table structure for `tbl_aticle`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_aticle`;
CREATE TABLE `tbl_aticle` (
  `at_id` bigint(20) NOT NULL COMMENT '帖子表',
  `at_title` varchar(255) DEFAULT NULL COMMENT '帖子标题',
  `acount_id` bigint(20) DEFAULT NULL COMMENT '发帖人',
  `at_content` blob COMMENT '帖子内容',
  `at_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发帖时间',
  `block_id` bigint(20) DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`at_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_aticle
-- ----------------------------
INSERT INTO `tbl_aticle` VALUES ('507689183641341952', '测试', '4474044509599501986', 0xACED0005740018E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95, '2018-04-28 14:30:28', '1');
INSERT INTO `tbl_aticle` VALUES ('507693710373294080', '测试2', '4474044509599501986', 0xACED000574001BE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95323232, '2018-04-28 14:48:28', '1');
INSERT INTO `tbl_aticle` VALUES ('507694498894057472', '测试2', '4474044509599501986', 0xACED000574001BE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95323232, '2018-04-28 14:51:35', '1');
INSERT INTO `tbl_aticle` VALUES ('507695004454490112', '测试2', '4474044509599501986', 0xACED000574001BE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95323232, '2018-04-28 14:53:36', '1');
INSERT INTO `tbl_aticle` VALUES ('507695894628405248', '测试2', '4474044509599501986', 0xACED000574001BE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95323232, '2018-04-28 14:57:08', '1');
INSERT INTO `tbl_aticle` VALUES ('507696246597619712', '测试2', '4474044509599501986', 0xACED000574001BE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95323232, '2018-04-28 14:58:32', '1');
INSERT INTO `tbl_aticle` VALUES ('507704393294942208', '123', '4474044509599501986', 0xACED0005740009E6B58BE8AF95313233, '2018-04-28 15:30:55', '1');
INSERT INTO `tbl_aticle` VALUES ('510377055116857344', '123123', '4474044509599501986', 0xACED0005740006313233313233, '2018-05-06 00:31:07', null);
INSERT INTO `tbl_aticle` VALUES ('510379308674453504', '1231', '4474044509599501986', 0xACED000574000433313233, '2018-05-06 00:40:04', '1');
INSERT INTO `tbl_aticle` VALUES ('510380866535428096', '1231', '4474044509599501986', 0xACED000574000433313233, '2018-05-06 00:46:16', '3');
INSERT INTO `tbl_aticle` VALUES ('510383505507618816', '23123', '4474044509599501986', 0xACED00057400053132333132, '2018-05-06 00:56:45', '3');
INSERT INTO `tbl_aticle` VALUES ('510528291510161408', '12312', '4474044509599501986', 0xACED000574000733313233313233, '2018-05-06 10:32:05', '1');
INSERT INTO `tbl_aticle` VALUES ('510535716548120576', '123123', '4474044509599501986', 0xACED0005740006313233313233, '2018-05-06 11:01:35', '2');
INSERT INTO `tbl_aticle` VALUES ('510537975780610048', '2342', '4474044509599501986', 0xACED00057400053334323334, '2018-05-06 11:10:34', '2');
INSERT INTO `tbl_aticle` VALUES ('510543236847112192', '&middot;12', '4474044509599501986', 0xACED0005740013266D6964646F743B3132266D6964646F743B31, '2018-05-06 11:31:28', '2');
INSERT INTO `tbl_aticle` VALUES ('510555679329619968', '23123123123122222222222222', '4474044509599501986', 0xACED0005740009313233313233313233, '2018-05-06 12:20:54', '3');
INSERT INTO `tbl_aticle` VALUES ('510587160336797696', '1231', '4474044509599501986', 0xACED00057400053233313233, '2018-05-06 14:26:00', '2');
INSERT INTO `tbl_aticle` VALUES ('510604672008982528', '123123', '4474044509599501986', 0xACED00057400053132333132, '2018-05-06 15:35:35', '2');

-- ----------------------------
-- Table structure for `tbl_block`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_block`;
CREATE TABLE `tbl_block` (
  `bl_id` bigint(20) NOT NULL,
  `bl_name` varchar(255) NOT NULL,
  `bl_parent` int(11) DEFAULT NULL,
  `bl_isdelete` int(11) DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
  `bl_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `bl_manager` bigint(20) DEFAULT NULL COMMENT '版主',
  `bl_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_block
-- ----------------------------
INSERT INTO `tbl_block` VALUES ('1', '生活', null, '0', '2018-04-24 15:32:35', null, null);
INSERT INTO `tbl_block` VALUES ('2', '生活闲聊', '1', '1', '2018-05-06 14:23:44', null, null);
INSERT INTO `tbl_block` VALUES ('3', '同城交友', '1', '1', '2018-05-06 13:15:34', null, null);

-- ----------------------------
-- Table structure for `tbl_block_summary`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_block_summary`;
CREATE TABLE `tbl_block_summary` (
  `bs_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bs_block` bigint(20) DEFAULT NULL,
  `bs_account` bigint(20) DEFAULT NULL COMMENT '总数',
  `bs_lastman` varchar(255) DEFAULT NULL COMMENT '最后发帖人',
  `bs_lasttime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_block_summary
-- ----------------------------
INSERT INTO `tbl_block_summary` VALUES ('1', '1', '7', 'admin', '2018-05-06 10:32:05');
INSERT INTO `tbl_block_summary` VALUES ('3', '3', '3', 'admin', '2018-05-06 12:20:55');
INSERT INTO `tbl_block_summary` VALUES ('4', '2', '5', 'admin', '2018-05-06 15:35:35');

-- ----------------------------
-- Table structure for `tbl_file`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_file`;
CREATE TABLE `tbl_file` (
  `fi_id` bigint(20) NOT NULL,
  `fl_name` varchar(255) DEFAULT NULL,
  `fl_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_file
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_level`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_level`;
CREATE TABLE `tbl_level` (
  `le_id` int(11) NOT NULL,
  `le_name` varchar(255) DEFAULT NULL,
  `le_option` varchar(255) DEFAULT NULL,
  `le_start` varchar(255) DEFAULT NULL,
  `le_end` varchar(255) DEFAULT NULL,
  `le_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`le_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_level
-- ----------------------------
INSERT INTO `tbl_level` VALUES ('1', '路人甲', '普通等级', '0', '5000', null);
INSERT INTO `tbl_level` VALUES ('2', '跑龙套', null, '5001', '20000', null);
INSERT INTO `tbl_level` VALUES ('3', '小配角 ', null, '20001', '100000', null);
INSERT INTO `tbl_level` VALUES ('4', '演艺新秀', null, '100001', '1000000', null);
INSERT INTO `tbl_level` VALUES ('5', '节目主持人', null, '10000001', '100000000', null);
INSERT INTO `tbl_level` VALUES ('6', '二线明星', null, '100000001', '1000000000', null);
INSERT INTO `tbl_level` VALUES ('7', '担当主角', null, '1000000001', '10000000000', null);
INSERT INTO `tbl_level` VALUES ('8', '重头主角', null, '10000000001', '100000000000', null);
INSERT INTO `tbl_level` VALUES ('9', '大牌明星', null, '100000000001', '1000000000000', null);
INSERT INTO `tbl_level` VALUES ('10', 'superstar（超级明星）', null, '1000000000001', '1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null);

-- ----------------------------
-- Table structure for `tbl_permisson`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_permisson`;
CREATE TABLE `tbl_permisson` (
  `pe_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pe_name` varchar(255) DEFAULT NULL,
  `pe_url` varchar(255) DEFAULT NULL,
  `pe_open_mode` varchar(255) DEFAULT NULL,
  `pe_description` varchar(255) DEFAULT NULL,
  `pe_icon` varchar(255) DEFAULT NULL,
  `pe_parent` bigint(20) DEFAULT NULL,
  `pe_seq` tinyint(4) DEFAULT NULL COMMENT '排序',
  `pe_status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `pe_opened` tinyint(4) DEFAULT NULL,
  `pe_resource_type` tinyint(4) DEFAULT NULL,
  `pe_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_permisson
-- ----------------------------
INSERT INTO `tbl_permisson` VALUES ('2', '文章列表', '/aticle/list', 'ajax', '文章列表', 'glyphicon-pencil icon-blue ', '33', '0', '0', '1', '1', '2018-05-05 11:45:15');
INSERT INTO `tbl_permisson` VALUES ('3', '文章添加', '/aticle/add', 'ajax', '文章添加', 'glyphicon-plus icon-green', '33', '1', '0', '1', '1', '2018-05-05 11:46:58');
INSERT INTO `tbl_permisson` VALUES ('5', '系统管理', '', null, '系统管理', 'glyphicon-folder-open ', null, '0', '0', '1', '0', '2018-05-05 10:53:31');
INSERT INTO `tbl_permisson` VALUES ('6', '列表', '/permisson/treeGrid', 'ajax', '资源列表', 'glyphicon-list ', '26', '0', '0', '1', '1', '2018-05-04 20:31:26');
INSERT INTO `tbl_permisson` VALUES ('7', '添加', '/permisson/add', 'ajax', '资源添加', 'glyphicon-plus icon-green', '26', '1', '0', '1', '1', '2018-05-05 11:44:31');
INSERT INTO `tbl_permisson` VALUES ('8', '编辑', '/permisson/edit', 'ajax', '资源编辑', 'glyphicon-pencil icon-blue', '26', '2', '0', '1', '1', '2018-05-05 11:52:45');
INSERT INTO `tbl_permisson` VALUES ('9', '删除', '/permisson/delete', 'ajax', '资源删除', 'glyphicon-trash icon-red', '26', '3', '0', '1', '1', '2018-05-05 11:52:46');
INSERT INTO `tbl_permisson` VALUES ('10', '列表', '/role/dataGrid', 'ajax', '角色列表', 'glyphicon-menu-left ', '25', '0', '0', '1', '1', '2018-05-04 09:23:22');
INSERT INTO `tbl_permisson` VALUES ('11', '添加', '/role/add', 'ajax', '角色添加', 'glyphicon-plus icon-green', '25', '1', '0', '1', '1', '2018-05-05 11:44:42');
INSERT INTO `tbl_permisson` VALUES ('12', '编辑', '/role/edit', 'ajax', '角色编辑', 'glyphicon-pencil icon-blue', '25', '2', '0', '1', '1', '2018-05-05 11:44:44');
INSERT INTO `tbl_permisson` VALUES ('13', '删除', '/role/delete', 'ajax', '角色删除', 'glyphicon-trash icon-red', '25', '2', '0', '1', '1', '2018-05-05 11:44:46');
INSERT INTO `tbl_permisson` VALUES ('14', '授权', '/role/grant', 'ajax', '角色授权', 'glyphicon-ok icon-green', '25', '4', '0', '1', '1', '2018-05-05 11:44:48');
INSERT INTO `tbl_permisson` VALUES ('15', '列表', '/account/list', 'ajax', '用户列表', 'glyphicon-list ', '21', '0', '0', '1', '1', '2018-05-03 09:33:55');
INSERT INTO `tbl_permisson` VALUES ('16', '添加', '/account/add', 'ajax', '用户添加', 'glyphicon-plus icon-green', '21', '1', '0', '1', '1', '2018-05-05 11:44:52');
INSERT INTO `tbl_permisson` VALUES ('17', '编辑', '/account/update', 'ajax', '用户编辑', 'glyphicon-pencil icon-blue', '21', '2', '0', '1', '1', '2018-05-05 11:44:53');
INSERT INTO `tbl_permisson` VALUES ('18', '删除', '/account/del', 'ajax', '用户删除', 'glyphicon-trash icon-red', '21', '3', '0', '1', '1', '2018-05-05 11:44:55');
INSERT INTO `tbl_permisson` VALUES ('21', '用户管理', '/account/manager', 'ajax', '用户管理', 'glyphicon-user', '5', '0', '0', '1', '0', '2018-05-05 11:52:02');
INSERT INTO `tbl_permisson` VALUES ('25', '角色管理', '/role/manager', 'ajax', '角色管理', 'glyphicon-eye-open ', '5', '1', '0', '1', '0', '2018-05-05 11:52:00');
INSERT INTO `tbl_permisson` VALUES ('26', '权限管理', '/permisson/manager', 'ajax', '权限管理', 'glyphicon-th ', '5', '2', '0', '1', '0', '2018-05-05 11:51:59');
INSERT INTO `tbl_permisson` VALUES ('27', '操作日志管理', '/syslog/manager', 'ajax', '日志管理', 'glyphicon-list ', null, '1', '0', '1', '0', '2018-05-05 00:55:57');
INSERT INTO `tbl_permisson` VALUES ('29', '操作日志列表', '/syslog/list', 'ajax', '日志列表', 'glyphicon-list ', '27', '1', '0', '1', '1', '2018-05-05 00:05:57');
INSERT INTO `tbl_permisson` VALUES ('30', '版块管理', '/block/manager', 'ajax', '版块管理', 'glyphicon-list ', '31', '2', '0', '1', '0', '2018-05-05 10:23:29');
INSERT INTO `tbl_permisson` VALUES ('31', '博客管理', null, 'ajax', '博客管理', 'glyphicon-folder-open', null, '0', '0', '1', '0', '2018-05-05 11:42:11');
INSERT INTO `tbl_permisson` VALUES ('32', '积分管理', '/level/manager', 'ajax', '版块列表', 'glyphicon-list ', '31', '0', '0', '1', '0', '2018-05-06 11:26:14');
INSERT INTO `tbl_permisson` VALUES ('33', '文章管理', '/aticle/manager', 'ajax', '文章管理', 'glyphicon-list ', '31', '0', '0', '1', '0', '2018-05-05 11:06:00');
INSERT INTO `tbl_permisson` VALUES ('35', '删除', '/aticle/del', 'ajax', '文章删除', 'glyphicon-trash icon-red', '33', '2', '0', '1', '1', '2018-05-06 11:25:19');
INSERT INTO `tbl_permisson` VALUES ('36', '修改', '/aticle/update', 'ajax', '文章修改', 'glyphicon-pencil icon-blue', '33', '3', '0', '1', '1', '2018-05-06 11:25:16');
INSERT INTO `tbl_permisson` VALUES ('37', '修改', '/level/update', 'ajax', '等级修改', 'glyphicon-pencil icon-blue', '32', '0', '0', '1', '1', '2018-05-06 15:17:17');
INSERT INTO `tbl_permisson` VALUES ('38', '添加', '/block/add', 'ajax', '版块添加', 'glyphicon-plus icon-green', '30', '0', '0', '1', '1', '2018-05-06 11:28:17');
INSERT INTO `tbl_permisson` VALUES ('39', '删除', '/block/del', 'ajax', '版块删除', 'glyphicon-trash icon-red', '30', '1', '0', '1', '1', '2018-05-06 11:25:31');
INSERT INTO `tbl_permisson` VALUES ('40', '修改', '/block/update', 'ajax', '版块修改', 'glyphicon-pencil icon-blue', '30', '2', '0', '1', '1', '2018-05-06 11:25:34');
INSERT INTO `tbl_permisson` VALUES ('41', '添加', '/level/add', 'ajax', '等级添加', 'glyphicon-plus icon-green', '32', '1', '0', '1', '1', '2018-05-06 15:20:09');
INSERT INTO `tbl_permisson` VALUES ('42', '删除', '/level/del', 'ajax', '等级删除', 'glyphicon-trash icon-red', '32', '2', '0', '1', '1', '2018-05-06 15:17:10');

-- ----------------------------
-- Table structure for `tbl_reply`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reply`;
CREATE TABLE `tbl_reply` (
  `re_id` bigint(20) NOT NULL,
  `re_contxt` varchar(255) NOT NULL COMMENT '内容',
  `account_name` varchar(255) NOT NULL COMMENT '发帖人',
  `re_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间',
  `at_id` bigint(20) NOT NULL COMMENT '文章主键',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_reply
-- ----------------------------
INSERT INTO `tbl_reply` VALUES ('1', '1', '1', '2018-04-25 13:54:34', '506563512802217984');

-- ----------------------------
-- Table structure for `tbl_role`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `ro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(255) DEFAULT NULL,
  `ro_status` char(2) DEFAULT '0',
  `ro_description` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT '0' COMMENT '序号',
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `tbl_role` VALUES ('5', 'moderator', '0', '版主', '0');
INSERT INTO `tbl_role` VALUES ('6', 'vice moderator', '0', '副版主', '0');
INSERT INTO `tbl_role` VALUES ('7', 'common net friend', '0', '普通网友', '0');
INSERT INTO `tbl_role` VALUES ('8', 'Black households', '0', '黑户', '0');

-- ----------------------------
-- Table structure for `tbl_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_permission`;
CREATE TABLE `tbl_role_permission` (
  `rp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ro_id` bigint(20) DEFAULT NULL,
  `pe_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_role_permission
-- ----------------------------
INSERT INTO `tbl_role_permission` VALUES ('168', '5', '5');
INSERT INTO `tbl_role_permission` VALUES ('169', '5', '21');
INSERT INTO `tbl_role_permission` VALUES ('170', '5', '15');
INSERT INTO `tbl_role_permission` VALUES ('171', '5', '16');
INSERT INTO `tbl_role_permission` VALUES ('172', '5', '17');
INSERT INTO `tbl_role_permission` VALUES ('173', '5', '18');
INSERT INTO `tbl_role_permission` VALUES ('174', '5', '25');
INSERT INTO `tbl_role_permission` VALUES ('175', '5', '10');
INSERT INTO `tbl_role_permission` VALUES ('176', '5', '11');
INSERT INTO `tbl_role_permission` VALUES ('177', '5', '12');
INSERT INTO `tbl_role_permission` VALUES ('178', '5', '13');
INSERT INTO `tbl_role_permission` VALUES ('179', '5', '14');
INSERT INTO `tbl_role_permission` VALUES ('180', '5', '26');
INSERT INTO `tbl_role_permission` VALUES ('181', '5', '6');
INSERT INTO `tbl_role_permission` VALUES ('182', '5', '7');
INSERT INTO `tbl_role_permission` VALUES ('183', '5', '8');
INSERT INTO `tbl_role_permission` VALUES ('184', '5', '9');
INSERT INTO `tbl_role_permission` VALUES ('226', '7', '5');
INSERT INTO `tbl_role_permission` VALUES ('227', '7', '21');
INSERT INTO `tbl_role_permission` VALUES ('228', '7', '15');
INSERT INTO `tbl_role_permission` VALUES ('229', '7', '16');
INSERT INTO `tbl_role_permission` VALUES ('230', '7', '17');
INSERT INTO `tbl_role_permission` VALUES ('231', '7', '18');
INSERT INTO `tbl_role_permission` VALUES ('297', '8', '5');
INSERT INTO `tbl_role_permission` VALUES ('361', '1', '5');
INSERT INTO `tbl_role_permission` VALUES ('362', '1', '21');
INSERT INTO `tbl_role_permission` VALUES ('363', '1', '15');
INSERT INTO `tbl_role_permission` VALUES ('364', '1', '16');
INSERT INTO `tbl_role_permission` VALUES ('365', '1', '17');
INSERT INTO `tbl_role_permission` VALUES ('366', '1', '18');
INSERT INTO `tbl_role_permission` VALUES ('367', '1', '25');
INSERT INTO `tbl_role_permission` VALUES ('368', '1', '10');
INSERT INTO `tbl_role_permission` VALUES ('369', '1', '11');
INSERT INTO `tbl_role_permission` VALUES ('370', '1', '12');
INSERT INTO `tbl_role_permission` VALUES ('371', '1', '13');
INSERT INTO `tbl_role_permission` VALUES ('372', '1', '14');
INSERT INTO `tbl_role_permission` VALUES ('373', '1', '26');
INSERT INTO `tbl_role_permission` VALUES ('374', '1', '6');
INSERT INTO `tbl_role_permission` VALUES ('375', '1', '7');
INSERT INTO `tbl_role_permission` VALUES ('376', '1', '8');
INSERT INTO `tbl_role_permission` VALUES ('377', '1', '9');
INSERT INTO `tbl_role_permission` VALUES ('378', '1', '31');
INSERT INTO `tbl_role_permission` VALUES ('379', '1', '32');
INSERT INTO `tbl_role_permission` VALUES ('380', '1', '37');
INSERT INTO `tbl_role_permission` VALUES ('381', '1', '41');
INSERT INTO `tbl_role_permission` VALUES ('382', '1', '42');
INSERT INTO `tbl_role_permission` VALUES ('383', '1', '33');
INSERT INTO `tbl_role_permission` VALUES ('384', '1', '2');
INSERT INTO `tbl_role_permission` VALUES ('385', '1', '3');
INSERT INTO `tbl_role_permission` VALUES ('386', '1', '35');
INSERT INTO `tbl_role_permission` VALUES ('387', '1', '36');
INSERT INTO `tbl_role_permission` VALUES ('388', '1', '30');
INSERT INTO `tbl_role_permission` VALUES ('389', '1', '38');
INSERT INTO `tbl_role_permission` VALUES ('390', '1', '39');
INSERT INTO `tbl_role_permission` VALUES ('391', '1', '40');
INSERT INTO `tbl_role_permission` VALUES ('392', '1', '27');
INSERT INTO `tbl_role_permission` VALUES ('393', '1', '29');

-- ----------------------------
-- Table structure for `tbl_syslog`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_syslog`;
CREATE TABLE `tbl_syslog` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `option` varchar(265) DEFAULT NULL,
  `content` text COMMENT '内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_syslog
-- ----------------------------
INSERT INTO `tbl_syslog` VALUES ('1', '128264527228664540', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:password=test&captcha=m748&username=admin&', '2018-04-24 15:11:35', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('2', '128264527228664540', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=test&acSex=男&acPassword=test&acMail=test.@qq.com&acRealName=测试账号&roles=1,2&', '2018-04-24 15:12:38', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('3', '128264527228664540', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:password=test&captcha=3h&rememberMe=1&username=admin&', '2018-04-24 22:09:10', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('4', '128264527228664540', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:password=test&captcha=&rememberMe=1&username=test&', '2018-04-24 22:09:17', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('5', '128264527228664540', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:password=test&captcha=66cf&rememberMe=1&username=test&', '2018-04-24 22:09:26', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('6', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:username=admin&password=test&captcha=xtj6&rememberMe=0&', '2018-04-25 17:18:43', '123.145.111.46');
INSERT INTO `tbl_syslog` VALUES ('7', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:username=admin&password=test&captcha=rdgc&rememberMe=0&', '2018-04-25 17:18:52', '123.145.111.46');
INSERT INTO `tbl_syslog` VALUES ('8', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:login,[参数]:', '2018-05-02 10:17:38', null);
INSERT INTO `tbl_syslog` VALUES ('9', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:login,[参数]:', '2018-05-02 10:17:57', null);
INSERT INTO `tbl_syslog` VALUES ('10', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:login,[参数]:', '2018-05-02 10:19:38', null);
INSERT INTO `tbl_syslog` VALUES ('11', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:login,[参数]:', '2018-05-02 10:23:31', null);
INSERT INTO `tbl_syslog` VALUES ('12', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:login,[参数]:', '2018-05-02 10:26:22', null);
INSERT INTO `tbl_syslog` VALUES ('13', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:login,[参数]:', '2018-05-02 10:32:24', null);
INSERT INTO `tbl_syslog` VALUES ('14', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-02 14:53:16', null);
INSERT INTO `tbl_syslog` VALUES ('15', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-03 10:05:51', null);
INSERT INTO `tbl_syslog` VALUES ('16', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-03 10:27:14', null);
INSERT INTO `tbl_syslog` VALUES ('17', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-03 10:37:00', null);
INSERT INTO `tbl_syslog` VALUES ('18', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-03 10:43:01', null);
INSERT INTO `tbl_syslog` VALUES ('19', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-03 10:46:17', null);
INSERT INTO `tbl_syslog` VALUES ('20', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 11:29:13', null);
INSERT INTO `tbl_syslog` VALUES ('21', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454429766815740&', '2018-05-03 11:54:02', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('22', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acId=509454366772564000&_=1525327826558&', '2018-05-03 14:10:30', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('23', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772564000&_=1525327912908&', '2018-05-03 14:11:56', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('24', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772564000&_=1525327977633&', '2018-05-03 14:13:01', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('25', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772564000&_=1525328372678&', '2018-05-03 14:19:36', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('26', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772564000&_=1525328399823&', '2018-05-03 14:21:11', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('27', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599502000&_=1525328399824&', '2018-05-03 14:22:04', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('28', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599502000&_=1525328538488&', '2018-05-03 14:22:27', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('29', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599502000&_=1525328538489&', '2018-05-03 14:24:51', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('30', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772564000&_=1525328894874&', '2018-05-03 14:28:18', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('31', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454429766815740&', '2018-05-03 14:40:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('32', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454429766815740&', '2018-05-03 14:40:59', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('33', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772564000&_=1525329830610&', '2018-05-03 14:44:04', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('34', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525330117686&', '2018-05-03 14:48:43', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('35', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772563968&_=1525330250553&', '2018-05-03 14:51:00', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('36', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772563968&_=1525330466224&', '2018-05-03 14:54:29', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('37', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509454366772563968&_=1525330477059&', '2018-05-03 14:54:39', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('38', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525330771755&', '2018-05-03 14:59:39', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('39', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525330808638&', '2018-05-03 15:00:12', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('40', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525330818506&', '2018-05-03 15:00:24', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('41', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525330852548&', '2018-05-03 15:00:56', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('42', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525330948295&', '2018-05-03 15:02:32', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('43', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525331062702&', '2018-05-03 15:04:26', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('44', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 15:07:03', null);
INSERT INTO `tbl_syslog` VALUES ('45', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525331062704&', '2018-05-03 15:07:11', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('46', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525331255771&', '2018-05-03 15:07:40', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('47', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525331475012&', '2018-05-03 15:11:19', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('48', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332027664&', '2018-05-03 15:20:34', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('49', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332114357&', '2018-05-03 15:21:58', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('50', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332194721&', '2018-05-03 15:23:19', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('51', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332663653&', '2018-05-03 15:31:08', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('52', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332747921&', '2018-05-03 15:32:32', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('53', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332800908&', '2018-05-03 15:33:25', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('54', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332932809&', '2018-05-03 15:35:47', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('55', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525332961585&', '2018-05-03 15:36:05', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('56', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333084623&', '2018-05-03 15:38:09', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('57', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333119503&', '2018-05-03 15:38:43', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('58', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333182968&', '2018-05-03 15:39:50', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('59', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454429766815744&', '2018-05-03 15:41:29', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('60', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333337754&', '2018-05-03 15:42:21', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('61', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333408322&', '2018-05-03 15:43:36', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('62', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333604946&', '2018-05-03 15:47:10', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('63', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333815292&', '2018-05-03 15:50:21', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('64', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333835906&', '2018-05-03 15:50:38', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('65', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525333999526&', '2018-05-03 15:53:22', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('66', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525334019039&', '2018-05-03 15:53:58', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('67', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525334019040&', '2018-05-03 15:54:10', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('68', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-03 15:54:28', null);
INSERT INTO `tbl_syslog` VALUES ('69', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525334082505&', '2018-05-03 15:54:49', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('70', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525334082506&', '2018-05-03 15:55:11', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('71', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525334500436&', '2018-05-03 16:01:44', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('72', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525334934047&', '2018-05-03 16:08:57', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('73', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454415137083392&', '2018-05-03 16:09:16', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('74', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454366772563968&', '2018-05-03 16:09:19', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('75', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454382782222336&', '2018-05-03 16:09:28', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('76', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454392974381056&', '2018-05-03 16:09:31', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('77', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509454402579337216&', '2018-05-03 16:09:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('78', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:09:41', null);
INSERT INTO `tbl_syslog` VALUES ('79', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:13:11', null);
INSERT INTO `tbl_syslog` VALUES ('80', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:14:11', null);
INSERT INTO `tbl_syslog` VALUES ('81', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:15:08', null);
INSERT INTO `tbl_syslog` VALUES ('82', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:16:21', null);
INSERT INTO `tbl_syslog` VALUES ('83', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=123456&acSex=0&acPassword=123456&acRealName=123456&roles=7&', '2018-05-03 16:16:37', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('84', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509527837493956608&_=1525335378538&', '2018-05-03 16:16:45', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('85', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:16:52', null);
INSERT INTO `tbl_syslog` VALUES ('86', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=123123123&acSex=0&acPassword=123123123123&acRealName=123123&roles=1&', '2018-05-03 16:17:15', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('87', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509527993111023616&', '2018-05-03 16:18:24', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('88', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509527837493956608&', '2018-05-03 16:18:27', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('89', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-03 16:18:29', null);
INSERT INTO `tbl_syslog` VALUES ('90', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525396341039&', '2018-05-04 09:12:25', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('91', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:delete,[参数]:id=8&', '2018-05-04 10:11:39', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('92', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525401166707&', '2018-05-04 10:32:50', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('93', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401297583&', '2018-05-04 10:35:08', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('94', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525401393142&', '2018-05-04 10:36:37', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('95', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401393143&', '2018-05-04 10:39:11', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('96', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401658234&', '2018-05-04 10:41:02', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('97', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401725122&', '2018-05-04 10:42:14', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('98', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401741299&', '2018-05-04 10:42:24', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('99', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401789850&', '2018-05-04 10:43:13', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('100', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525401823395&', '2018-05-04 10:43:47', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('101', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-04 10:50:04', null);
INSERT INTO `tbl_syslog` VALUES ('102', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-04 10:54:23', null);
INSERT INTO `tbl_syslog` VALUES ('103', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-04 10:56:09', null);
INSERT INTO `tbl_syslog` VALUES ('104', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:delete,[参数]:id=8&', '2018-05-04 10:57:20', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('105', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525402565466&', '2018-05-04 10:57:30', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('106', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525402565467&', '2018-05-04 10:57:39', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('107', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-04 10:57:47', null);
INSERT INTO `tbl_syslog` VALUES ('108', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525402702603&', '2018-05-04 10:59:16', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('109', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-04 10:59:20', null);
INSERT INTO `tbl_syslog` VALUES ('110', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=12312312312&acSex=0&acPassword=123456`&acRealName=123&roles=1&', '2018-05-04 10:59:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('111', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509810441141096448&_=1525402702605&', '2018-05-04 10:59:45', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('112', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403369904&', '2018-05-04 11:09:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('113', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403505170&', '2018-05-04 11:11:56', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('114', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403527584&', '2018-05-04 11:12:18', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('115', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403602005&', '2018-05-04 11:13:32', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('116', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403624814&', '2018-05-04 11:13:47', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('117', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403709732&', '2018-05-04 11:15:13', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('118', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403789405&', '2018-05-04 11:16:34', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('119', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525403804731&', '2018-05-04 11:16:47', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('120', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=5&_=1525403804732&', '2018-05-04 11:17:02', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('121', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525403804735&', '2018-05-04 11:17:39', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('122', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525404155357&', '2018-05-04 11:22:41', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('123', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-04 11:40:51', null);
INSERT INTO `tbl_syslog` VALUES ('124', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525412327393&', '2018-05-04 13:39:23', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('125', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525412327394&', '2018-05-04 13:39:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('126', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509810441141096448&_=1525412327395&', '2018-05-04 13:39:57', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('127', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509810441141096448&_=1525412327396&', '2018-05-04 13:40:12', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('128', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 13:40:43', null);
INSERT INTO `tbl_syslog` VALUES ('129', '509810441141096448', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:password=123456&captcha=bn3q&_csrf=01d7933f-61ce-401f-8cae-27bd15ca7938&rememberMe=1&username=123456&', '2018-05-04 13:41:18', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('130', '509810441141096448', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:loginPost,[参数]:password=123456&captcha=a6g7&_csrf=01d7933f-61ce-401f-8cae-27bd15ca7938&rememberMe=1&username=admin&', '2018-05-04 13:41:50', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('131', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525412511265&', '2018-05-04 13:42:27', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('132', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525412511266&', '2018-05-04 13:42:30', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('133', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:null', '2018-05-04 13:45:53', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('134', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:null', '2018-05-04 13:47:38', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('135', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:null', '2018-05-04 14:04:51', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('136', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-04 14:18:45', null);
INSERT INTO `tbl_syslog` VALUES ('137', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-04 14:21:10', null);
INSERT INTO `tbl_syslog` VALUES ('138', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:add,[参数]:peResourceType=0&peName=123&peUrl=123123&peSeq=0&peOpenMode=ajax&peParent=5&peStatus=0&peIcon=glyphicon-headphones &peOpened=0&', '2018-05-04 14:21:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('139', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525415432816&', '2018-05-04 14:30:36', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('140', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=4&_=1525415474292&', '2018-05-04 14:31:17', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('141', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525415578892&', '2018-05-04 14:33:02', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('142', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525415656907&', '2018-05-04 14:34:20', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('143', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525415712800&', '2018-05-04 14:35:16', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('144', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525415771644&', '2018-05-04 14:36:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('145', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:null', '2018-05-04 14:36:34', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('146', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:null', '2018-05-04 14:37:29', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('147', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=4&_=1525415902266&', '2018-05-04 14:38:27', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('148', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:null', '2018-05-04 14:38:35', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('149', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:id=4&', '2018-05-04 14:38:53', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('150', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525415937714&', '2018-05-04 14:39:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('151', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525416531270&', '2018-05-04 14:49:06', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('152', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525419344067&', '2018-05-04 15:35:49', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('153', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:delete,[参数]:id=8&', '2018-05-04 15:35:56', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('154', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525419344069&', '2018-05-04 15:36:02', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('155', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525419344071&', '2018-05-04 15:36:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('156', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-04 15:36:21', null);
INSERT INTO `tbl_syslog` VALUES ('157', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:add,[参数]:peResourceType=0&peName=123123123&peUrl=3123&peSeq=0&peOpenMode=无(用于上层菜单)&peParent=21&peStatus=0&peIcon=glyphicon-volume-down &peOpened=1&', '2018-05-04 15:36:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('158', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525420678182&', '2018-05-04 15:58:06', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('159', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:id=28&', '2018-05-04 16:55:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('160', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:id=20&', '2018-05-04 16:55:39', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('161', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509810441141096448&_=1525424186274&', '2018-05-04 16:57:01', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('162', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509810441141096448&', '2018-05-04 16:57:08', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('163', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-04 16:57:13', null);
INSERT INTO `tbl_syslog` VALUES ('164', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=dASD&acSex=0&acPassword=asdASD&acRealName=asdASD&roles=7&', '2018-05-04 16:57:20', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('165', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509900472006479872&_=1525424186276&', '2018-05-04 16:57:27', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('166', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509900472006479872&_=1525424186277&', '2018-05-04 16:57:37', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('167', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-04 16:57:48', null);
INSERT INTO `tbl_syslog` VALUES ('168', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525424186280&', '2018-05-04 16:58:02', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('169', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525424186281&', '2018-05-04 16:58:12', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('170', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525424186283&', '2018-05-04 16:58:29', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('171', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525424186284&', '2018-05-04 16:58:55', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('172', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525424186285&', '2018-05-04 16:59:09', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('173', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509900472006479872&_=1525424454052&', '2018-05-04 17:04:08', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('174', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=5&_=1525424454054&', '2018-05-04 17:04:38', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('175', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 17:05:12', null);
INSERT INTO `tbl_syslog` VALUES ('176', '509900472006479872', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:delete,[参数]:_=1525424863536&', '2018-05-04 17:07:49', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('177', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525436120209&', '2018-05-04 20:15:31', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('178', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=5&_=1525436545210&', '2018-05-04 20:22:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('179', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525436616813&', '2018-05-04 20:23:43', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('180', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525436616814&', '2018-05-04 20:24:01', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('181', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 20:29:20', null);
INSERT INTO `tbl_syslog` VALUES ('182', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525437028280&', '2018-05-04 20:30:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('183', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525437125202&', '2018-05-04 20:32:13', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('184', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525437125203&', '2018-05-04 20:32:26', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('185', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525437125204&', '2018-05-04 20:32:36', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('186', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525437125205&', '2018-05-04 20:32:40', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('187', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=6&_=1525437125206&', '2018-05-04 20:32:54', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('188', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=5&_=1525437125207&', '2018-05-04 20:33:03', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('189', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=5&_=1525437125208&', '2018-05-04 20:33:24', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('190', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525444930011&', '2018-05-04 22:42:31', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('191', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525445160437&', '2018-05-04 22:47:42', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('192', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 22:48:19', null);
INSERT INTO `tbl_syslog` VALUES ('193', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525445307598&', '2018-05-04 22:48:32', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('194', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509900472006479872&_=1525445307601&', '2018-05-04 22:48:53', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('195', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=509900472006479872&_=1525445307602&', '2018-05-04 22:49:15', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('196', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 22:49:39', null);
INSERT INTO `tbl_syslog` VALUES ('197', '509900472006479872', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 22:53:02', null);
INSERT INTO `tbl_syslog` VALUES ('198', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525445590930&', '2018-05-04 22:53:17', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('199', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525445590931&', '2018-05-04 22:53:33', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('200', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 22:53:40', null);
INSERT INTO `tbl_syslog` VALUES ('201', '509900472006479872', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 22:54:29', null);
INSERT INTO `tbl_syslog` VALUES ('202', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=7&_=1525445680152&', '2018-05-04 22:54:46', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('203', '4474044509599501986', null, '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-04 22:54:56', null);
INSERT INTO `tbl_syslog` VALUES ('204', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 00:06:09', null);
INSERT INTO `tbl_syslog` VALUES ('205', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525452785305&', '2018-05-05 00:54:16', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('206', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:delete,[参数]:acid=509900472006479872&', '2018-05-05 01:03:04', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('207', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525453358800&', '2018-05-05 01:03:12', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('208', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525485462771&', '2018-05-05 09:57:58', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('209', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 09:59:23', null);
INSERT INTO `tbl_syslog` VALUES ('210', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 10:21:47', null);
INSERT INTO `tbl_syslog` VALUES ('211', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 10:23:53', null);
INSERT INTO `tbl_syslog` VALUES ('212', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 10:24:50', null);
INSERT INTO `tbl_syslog` VALUES ('213', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 10:25:51', null);
INSERT INTO `tbl_syslog` VALUES ('214', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=5&_=1525488221384&', '2018-05-05 10:43:47', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('215', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 10:47:49', null);
INSERT INTO `tbl_syslog` VALUES ('216', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525488849638&', '2018-05-05 10:54:59', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('217', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525489563588&', '2018-05-05 11:06:07', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('218', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525489603001&', '2018-05-05 11:06:46', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('219', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525490275047&', '2018-05-05 11:18:00', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('220', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-05 11:30:10', null);
INSERT INTO `tbl_syslog` VALUES ('221', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-05 11:35:58', null);
INSERT INTO `tbl_syslog` VALUES ('222', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525491739481&', '2018-05-05 11:42:22', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('223', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=27&_=1525491919743&', '2018-05-05 11:45:58', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('224', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-05 11:47:33', null);
INSERT INTO `tbl_syslog` VALUES ('225', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-05 11:47:48', null);
INSERT INTO `tbl_syslog` VALUES ('226', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-05 11:48:01', null);
INSERT INTO `tbl_syslog` VALUES ('227', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 11:48:55', null);
INSERT INTO `tbl_syslog` VALUES ('228', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 11:49:32', null);
INSERT INTO `tbl_syslog` VALUES ('229', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=123123&acSex=0&acPassword=23123&acRealName=1231&roles=8&', '2018-05-05 11:49:40', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('230', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:edit,[参数]:_=1525492347093&', '2018-05-05 11:52:32', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('231', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 12:10:34', null);
INSERT INTO `tbl_syslog` VALUES ('232', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-05 12:14:57', null);
INSERT INTO `tbl_syslog` VALUES ('233', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-05 12:15:18', null);
INSERT INTO `tbl_syslog` VALUES ('234', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 12:20:06', null);
INSERT INTO `tbl_syslog` VALUES ('235', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=234234&acSex=0&acPassword=2342432&acRealName=2342&roles=8&', '2018-05-05 12:20:13', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('236', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=8&_=1525493711996&', '2018-05-05 12:25:23', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('237', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510193118163767296&_=1525493711997&', '2018-05-05 12:25:34', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('238', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525499097814&', '2018-05-05 13:45:35', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('239', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-05 13:45:43', null);
INSERT INTO `tbl_syslog` VALUES ('240', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 13:46:29', null);
INSERT INTO `tbl_syslog` VALUES ('241', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 19:55:46', null);
INSERT INTO `tbl_syslog` VALUES ('242', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 19:55:51', null);
INSERT INTO `tbl_syslog` VALUES ('243', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-05 20:15:16', null);
INSERT INTO `tbl_syslog` VALUES ('244', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-05 20:15:21', null);
INSERT INTO `tbl_syslog` VALUES ('245', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:21:50', null);
INSERT INTO `tbl_syslog` VALUES ('246', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:22:03', null);
INSERT INTO `tbl_syslog` VALUES ('247', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:27:16', null);
INSERT INTO `tbl_syslog` VALUES ('248', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:32:30', null);
INSERT INTO `tbl_syslog` VALUES ('249', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:38:03', null);
INSERT INTO `tbl_syslog` VALUES ('250', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:38:31', null);
INSERT INTO `tbl_syslog` VALUES ('251', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:40:15', null);
INSERT INTO `tbl_syslog` VALUES ('252', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:41:14', null);
INSERT INTO `tbl_syslog` VALUES ('253', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:43:51', null);
INSERT INTO `tbl_syslog` VALUES ('254', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:44:06', null);
INSERT INTO `tbl_syslog` VALUES ('255', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:45:07', null);
INSERT INTO `tbl_syslog` VALUES ('256', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:45:23', null);
INSERT INTO `tbl_syslog` VALUES ('257', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:46:36', null);
INSERT INTO `tbl_syslog` VALUES ('258', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:47:14', null);
INSERT INTO `tbl_syslog` VALUES ('259', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=2&_=1525524482591&', '2018-05-05 20:48:10', '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_syslog` VALUES ('260', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 20:48:22', null);
INSERT INTO `tbl_syslog` VALUES ('261', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 23:32:18', null);
INSERT INTO `tbl_syslog` VALUES ('262', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 23:32:58', null);
INSERT INTO `tbl_syslog` VALUES ('263', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525534403399&', '2018-05-05 23:33:27', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('264', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 23:33:49', null);
INSERT INTO `tbl_syslog` VALUES ('265', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-05 23:34:57', null);
INSERT INTO `tbl_syslog` VALUES ('266', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=506563512802218000&_=1525534697909&', '2018-05-05 23:38:27', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('267', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=507704393294942200&', '2018-05-05 23:42:56', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('268', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=506563512802218000&', '2018-05-05 23:43:06', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('269', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=506563512802218000&', '2018-05-05 23:43:26', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('270', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=506563512802217984&', '2018-05-05 23:48:56', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('271', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=506563512802217984&', '2018-05-05 23:49:31', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('272', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=506563512802217984&', '2018-05-05 23:51:52', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('273', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=506563858173792256&_=1525535507312&', '2018-05-05 23:51:55', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('274', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=507704393294942208&_=1525535675858&', '2018-05-05 23:54:46', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('275', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525535800077&', '2018-05-05 23:56:44', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('276', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536009012&', '2018-05-06 00:00:12', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('277', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536009012&', '2018-05-06 00:00:20', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('278', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536009012&', '2018-05-06 00:00:49', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('279', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536057207&', '2018-05-06 00:01:00', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('280', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536111649&', '2018-05-06 00:01:54', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('281', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536217840&', '2018-05-06 00:03:40', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('282', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536248440&', '2018-05-06 00:04:12', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('283', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536278452&', '2018-05-06 00:04:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('284', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536296681&', '2018-05-06 00:04:59', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('285', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536296682&', '2018-05-06 00:05:04', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('286', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536338511&', '2018-05-06 00:05:52', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('287', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536009012&', '2018-05-06 00:07:08', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('288', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536443350&', '2018-05-06 00:07:34', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('289', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525536443352&', '2018-05-06 00:08:23', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('290', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525536443355&', '2018-05-06 00:08:32', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('291', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536443356&', '2018-05-06 00:09:19', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('292', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525536443357&', '2018-05-06 00:10:29', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('293', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525536968849&', '2018-05-06 00:16:12', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('294', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507695894628405248&_=1525537011455&', '2018-05-06 00:16:54', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('295', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537041561&', '2018-05-06 00:17:24', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('296', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537098249&', '2018-05-06 00:18:21', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('297', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510193118163767296&_=1525537165279&', '2018-05-06 00:19:28', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('298', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=4474044509599501986&_=1525537165280&', '2018-05-06 00:19:34', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('299', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510193118163767296&_=1525537165281&', '2018-05-06 00:19:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('300', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510193118163767296&_=1525537197373&', '2018-05-06 00:20:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('301', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510193118163767296&_=1525537211578&', '2018-05-06 00:20:18', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('302', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537275506&', '2018-05-06 00:21:19', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('303', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537286632&', '2018-05-06 00:21:31', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('304', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537315835&', '2018-05-06 00:21:58', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('305', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537341835&', '2018-05-06 00:22:24', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('306', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537358151&', '2018-05-06 00:22:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('307', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525537557248&', '2018-05-06 00:26:01', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('308', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=506563858173792256&', '2018-05-06 00:30:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('309', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507704393294942208&_=1525537777564&', '2018-05-06 00:30:18', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('310', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:30:25', null);
INSERT INTO `tbl_syslog` VALUES ('311', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:30:54', null);
INSERT INTO `tbl_syslog` VALUES ('312', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:31:22', null);
INSERT INTO `tbl_syslog` VALUES ('313', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:33:42', null);
INSERT INTO `tbl_syslog` VALUES ('314', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:35:02', null);
INSERT INTO `tbl_syslog` VALUES ('315', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510377055116857344&_=1525538338968&', '2018-05-06 00:39:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('316', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510377055116857344&_=1525538349945&', '2018-05-06 00:39:13', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('317', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:39:48', null);
INSERT INTO `tbl_syslog` VALUES ('318', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:40:09', null);
INSERT INTO `tbl_syslog` VALUES ('319', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:40:54', null);
INSERT INTO `tbl_syslog` VALUES ('320', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:43:23', null);
INSERT INTO `tbl_syslog` VALUES ('321', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:43:58', null);
INSERT INTO `tbl_syslog` VALUES ('322', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:46:07', null);
INSERT INTO `tbl_syslog` VALUES ('323', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:46:20', null);
INSERT INTO `tbl_syslog` VALUES ('324', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 00:56:37', null);
INSERT INTO `tbl_syslog` VALUES ('325', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510383505507618816&_=1525539388094&', '2018-05-06 00:56:49', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('326', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525539426170&', '2018-05-06 00:57:10', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('327', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 08:50:35', null);
INSERT INTO `tbl_syslog` VALUES ('328', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507695894628405248&_=1525567823658&', '2018-05-06 08:50:38', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('329', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 08:51:18', null);
INSERT INTO `tbl_syslog` VALUES ('330', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-06 08:53:33', null);
INSERT INTO `tbl_syslog` VALUES ('331', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=6&_=1525570567233&', '2018-05-06 09:39:46', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('332', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=6&_=1525570567234&', '2018-05-06 09:41:48', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('333', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525571595710&', '2018-05-06 10:06:25', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('334', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525572389000&', '2018-05-06 10:06:31', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('335', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525572596642&', '2018-05-06 10:10:11', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('336', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:editPage,[参数]:id=27&_=1525572596643&', '2018-05-06 10:10:25', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('337', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525573623529&', '2018-05-06 10:30:10', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('338', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525573623530&', '2018-05-06 10:30:38', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('339', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:30:41', null);
INSERT INTO `tbl_syslog` VALUES ('340', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:31:07', null);
INSERT INTO `tbl_syslog` VALUES ('341', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:31:17', null);
INSERT INTO `tbl_syslog` VALUES ('342', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:31:58', null);
INSERT INTO `tbl_syslog` VALUES ('343', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510380866535428096&_=1525573914554&', '2018-05-06 10:32:22', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('344', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525574519673&', '2018-05-06 10:42:02', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('345', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:43:28', null);
INSERT INTO `tbl_syslog` VALUES ('346', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:48:00', null);
INSERT INTO `tbl_syslog` VALUES ('347', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-06 10:48:33', null);
INSERT INTO `tbl_syslog` VALUES ('348', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:addPage,[参数]:', '2018-05-06 10:48:39', null);
INSERT INTO `tbl_syslog` VALUES ('349', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-06 10:48:49', null);
INSERT INTO `tbl_syslog` VALUES ('350', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:49:48', null);
INSERT INTO `tbl_syslog` VALUES ('351', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-06 10:50:57', null);
INSERT INTO `tbl_syslog` VALUES ('352', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-06 10:51:01', null);
INSERT INTO `tbl_syslog` VALUES ('353', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:51:49', null);
INSERT INTO `tbl_syslog` VALUES ('354', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525574984578&', '2018-05-06 10:55:56', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('355', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 10:57:19', null);
INSERT INTO `tbl_syslog` VALUES ('356', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-06 10:57:28', null);
INSERT INTO `tbl_syslog` VALUES ('357', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:01:11', null);
INSERT INTO `tbl_syslog` VALUES ('358', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:01:54', null);
INSERT INTO `tbl_syslog` VALUES ('359', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510535716548120576&_=1525575704147&', '2018-05-06 11:02:02', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('360', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:02:54', null);
INSERT INTO `tbl_syslog` VALUES ('361', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:03:52', null);
INSERT INTO `tbl_syslog` VALUES ('362', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525575770513&', '2018-05-06 11:03:57', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('363', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:05:22', null);
INSERT INTO `tbl_syslog` VALUES ('364', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510383505507618816&_=1525575770516&', '2018-05-06 11:10:39', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('365', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=6&_=1525575770519&', '2018-05-06 11:16:55', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('366', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525577302005&', '2018-05-06 11:28:25', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('367', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-06 11:30:57', null);
INSERT INTO `tbl_syslog` VALUES ('368', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:31:23', null);
INSERT INTO `tbl_syslog` VALUES ('369', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:31:43', null);
INSERT INTO `tbl_syslog` VALUES ('370', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525577682430&', '2018-05-06 11:34:46', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('371', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 11:40:33', null);
INSERT INTO `tbl_syslog` VALUES ('372', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525578535882&', '2018-05-06 11:53:05', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('373', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507689183641341952&_=1525578535883&', '2018-05-06 11:53:14', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('374', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507689183641341952&_=1525578535884&', '2018-05-06 11:53:35', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('375', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525578535885&', '2018-05-06 11:55:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('376', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525578928173&', '2018-05-06 11:55:39', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('377', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579073771&', '2018-05-06 11:58:14', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('378', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525579073773&', '2018-05-06 11:59:01', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('379', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525579073774&', '2018-05-06 11:59:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('380', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510185430012923904&_=1525579073775&', '2018-05-06 11:59:27', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('381', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579282550&', '2018-05-06 12:01:33', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('382', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579465457&', '2018-05-06 12:04:32', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('383', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579559264&', '2018-05-06 12:06:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('384', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579588790&', '2018-05-06 12:06:33', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('385', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579637492&', '2018-05-06 12:07:21', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('386', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510377055116857344&_=1525579755523&', '2018-05-06 12:09:22', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('387', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507694498894057472&_=1525579755524&', '2018-05-06 12:09:31', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('388', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525579857536&', '2018-05-06 12:11:04', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('389', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510193118163767296&_=1525579992143&', '2018-05-06 12:13:18', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('390', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=510543236847112192&_=1525580046461&', '2018-05-06 12:14:36', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('391', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507695004454490112&_=1525580340619&', '2018-05-06 12:19:07', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('392', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525580398894&', '2018-05-06 12:20:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('393', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525580414224&', '2018-05-06 12:20:18', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('394', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 12:20:30', null);
INSERT INTO `tbl_syslog` VALUES ('395', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 12:20:59', null);
INSERT INTO `tbl_syslog` VALUES ('396', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525580414227&', '2018-05-06 12:21:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('397', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582079316&', '2018-05-06 12:48:04', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('398', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582169815&', '2018-05-06 12:49:34', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('399', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582239325&', '2018-05-06 12:50:44', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('400', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582360707&', '2018-05-06 12:52:45', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('401', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582449486&', '2018-05-06 12:54:13', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('402', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582480475&', '2018-05-06 12:54:44', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('403', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582556126&', '2018-05-06 12:55:59', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('404', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582658410&', '2018-05-06 12:57:42', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('405', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582682025&', '2018-05-06 12:58:06', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('406', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582724096&', '2018-05-06 12:58:48', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('407', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525582724097&', '2018-05-06 12:59:02', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('408', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525582795416&', '2018-05-06 13:00:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('409', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525582856092&', '2018-05-06 13:01:00', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('410', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525582952299&', '2018-05-06 13:02:37', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('411', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525582983185&', '2018-05-06 13:03:07', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('412', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525582997926&', '2018-05-06 13:03:21', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('413', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583108594&', '2018-05-06 13:05:14', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('414', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583129434&', '2018-05-06 13:05:34', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('415', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583144996&', '2018-05-06 13:05:49', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('416', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583176124&', '2018-05-06 13:06:20', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('417', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583196201&', '2018-05-06 13:06:40', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('418', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525583196202&', '2018-05-06 13:06:44', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('419', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583196203&', '2018-05-06 13:06:46', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('420', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583196204&', '2018-05-06 13:06:51', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('421', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583331333&', '2018-05-06 13:09:08', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('422', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583391590&', '2018-05-06 13:09:56', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('423', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583391591&', '2018-05-06 13:10:10', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('424', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583391592&', '2018-05-06 13:10:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('425', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583391593&', '2018-05-06 13:10:19', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('426', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583456421&', '2018-05-06 13:11:02', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('427', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583456422&', '2018-05-06 13:11:39', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('428', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583631467&', '2018-05-06 13:13:59', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('429', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525583631468&', '2018-05-06 13:14:10', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('430', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583631469&', '2018-05-06 13:14:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('431', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583631470&', '2018-05-06 13:14:19', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('432', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=3&_=1525583728377&', '2018-05-06 13:15:32', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('433', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525587797549&', '2018-05-06 14:23:21', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('434', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525587797550&', '2018-05-06 14:23:33', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('435', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525587797551&', '2018-05-06 14:23:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('436', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 14:24:10', null);
INSERT INTO `tbl_syslog` VALUES ('437', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507689183641341952&_=1525587797554&', '2018-05-06 14:24:16', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('438', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 14:25:56', null);
INSERT INTO `tbl_syslog` VALUES ('439', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 14:26:03', null);
INSERT INTO `tbl_syslog` VALUES ('440', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-06 14:46:42', null);
INSERT INTO `tbl_syslog` VALUES ('441', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525589213507&', '2018-05-06 14:47:06', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('442', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525589296953&', '2018-05-06 14:48:25', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('443', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525590955041&', '2018-05-06 15:15:59', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('444', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525590955042&', '2018-05-06 15:16:19', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('445', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525591043015&', '2018-05-06 15:17:27', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('446', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.RoleController,[方法]:grantPage,[参数]:roleid=1&_=1525591043016&', '2018-05-06 15:17:41', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('447', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-06 15:17:58', null);
INSERT INTO `tbl_syslog` VALUES ('448', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:editpage,[参数]:blockid=undefined&_=1525591084547&', '2018-05-06 15:18:09', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('449', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:logout,[参数]:', '2018-05-06 15:20:19', null);
INSERT INTO `tbl_syslog` VALUES ('450', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.PermissonController,[方法]:addPage,[参数]:', '2018-05-06 15:20:30', null);
INSERT INTO `tbl_syslog` VALUES ('451', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:26:06', null);
INSERT INTO `tbl_syslog` VALUES ('452', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:28:37', null);
INSERT INTO `tbl_syslog` VALUES ('453', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:30:15', null);
INSERT INTO `tbl_syslog` VALUES ('454', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:editpage,[参数]:Levelid=undefined&_=1525591713494&', '2018-05-06 15:31:03', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('455', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525591713495&', '2018-05-06 15:31:15', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('456', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:editpage,[参数]:Levelid=undefined&_=1525591713496&', '2018-05-06 15:31:25', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('457', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:delete,[参数]:null', '2018-05-06 15:31:29', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('458', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:31:33', null);
INSERT INTO `tbl_syslog` VALUES ('459', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:32:12', null);
INSERT INTO `tbl_syslog` VALUES ('460', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 15:32:30', null);
INSERT INTO `tbl_syslog` VALUES ('461', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:addpage,[参数]:', '2018-05-06 15:34:40', null);
INSERT INTO `tbl_syslog` VALUES ('462', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=2&_=1525592076980&', '2018-05-06 15:34:53', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('463', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:editpage,[参数]:Levelid=undefined&_=1525592076982&', '2018-05-06 15:35:01', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('464', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:editpage,[参数]:Levelid=undefined&_=1525592076983&', '2018-05-06 15:35:06', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('465', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:35:09', null);
INSERT INTO `tbl_syslog` VALUES ('466', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 15:35:29', null);
INSERT INTO `tbl_syslog` VALUES ('467', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:geteditpage,[参数]:atcid=507676961754058752&_=1525592076988&', '2018-05-06 15:35:37', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('468', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:deleteAticle,[参数]:atid=507676961754058752&', '2018-05-06 15:35:53', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('469', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:delete,[参数]:null', '2018-05-06 15:36:01', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('470', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:36:12', null);
INSERT INTO `tbl_syslog` VALUES ('471', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.LevelController,[方法]:addpage,[参数]:', '2018-05-06 15:37:00', null);
INSERT INTO `tbl_syslog` VALUES ('472', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AticleController,[方法]:getaddpage,[参数]:', '2018-05-06 15:37:18', null);
INSERT INTO `tbl_syslog` VALUES ('473', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:addPage,[参数]:', '2018-05-06 15:38:12', null);
INSERT INTO `tbl_syslog` VALUES ('474', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:add,[参数]:acLoginName=1231111&acSex=0&acPassword=1231&acRealName=123&roles=5&', '2018-05-06 15:38:26', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('475', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.AccountController,[方法]:editPage,[参数]:acid=510605389583093760&_=1525592215782&', '2018-05-06 15:38:32', '127.0.0.1');
INSERT INTO `tbl_syslog` VALUES ('476', '4474044509599501986', '[admin]', '[类名]:com.gzeh.forum.controller.BlockController,[方法]:editpage,[参数]:blockid=1&_=1525592215784&', '2018-05-06 15:39:21', '127.0.0.1');
