/*
 Navicat Premium Data Transfer

 Source Server         : mysql.local
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : csa

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 27/03/2022 22:16:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm_visitor
-- ----------------------------
DROP TABLE IF EXISTS `crm_visitor`;
CREATE TABLE `crm_visitor`  (
  `visitor_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访客Id',
  `visitor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访客姓名',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访客电话',
  `matter` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访客事由',
  `backlog` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '待办事项',
  `visit_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`visitor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访客信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of crm_visitor
-- ----------------------------
INSERT INTO `crm_visitor` VALUES (1, '张三', '13588552211', '参观', '发送资料', '2022-02-07 15:42:34', '0', 'admin', '2022-02-07 15:42:40', 'admin', '2022-02-07 15:42:40', NULL);
INSERT INTO `crm_visitor` VALUES (2, '李四', '13233668877', '参观', '喝酒', '2022-02-07 00:00:00', '0', 'admin', '2022-02-07 15:43:04', 'admin', '2022-02-08 16:04:02', NULL);
INSERT INTO `crm_visitor` VALUES (3, '王五', '13322226666', '太闲', NULL, '2022-02-08 00:00:00', '1', NULL, '2022-02-08 15:45:56', NULL, '2022-02-08 15:46:11', NULL);
INSERT INTO `crm_visitor` VALUES (4, '老五', '13566557788', '聊天', '吃大餐', NULL, '0', NULL, '2022-02-09 10:59:29', NULL, '2022-03-21 19:59:02', NULL);

-- ----------------------------
-- Table structure for csa_arched_record
-- ----------------------------
DROP TABLE IF EXISTS `csa_arched_record`;
CREATE TABLE `csa_arched_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '拱棚使用记录id',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `garden_id` int(11) NOT NULL COMMENT '菜地id',
  `year_no` int(11) NOT NULL COMMENT '对应年份',
  `consum_year` int(11) NOT NULL COMMENT '消耗年份',
  `remaining_years` int(11) NOT NULL COMMENT '剩余年份',
  `doer_id` int(11) NOT NULL COMMENT '操作人id',
  `do_time` datetime NOT NULL COMMENT '处理时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '有效状态（0代表有效 1代表无效）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拱棚使用记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_arched_record
-- ----------------------------

-- ----------------------------
-- Table structure for csa_coin_record
-- ----------------------------
DROP TABLE IF EXISTS `csa_coin_record`;
CREATE TABLE `csa_coin_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `op_id` int(11) NOT NULL COMMENT '业务id',
  `op_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务类型',
  `coins` decimal(19, 4) NOT NULL COMMENT '金币花费',
  `coin_balance` decimal(19, 4) NOT NULL COMMENT '金币余额',
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `op_time` datetime NOT NULL COMMENT '业务发生时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '金币记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_coin_record
-- ----------------------------

-- ----------------------------
-- Table structure for csa_communicate_record
-- ----------------------------
DROP TABLE IF EXISTS `csa_communicate_record`;
CREATE TABLE `csa_communicate_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '沟通记录id',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `garden_id` int(11) NULL DEFAULT NULL COMMENT '菜地id',
  `recorder` bigint(20) NOT NULL COMMENT '发布人',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '种植任务id',
  `comm_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '沟通类型',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '沟通内容',
  `result` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `is_completed` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否处理（0代表未处理 1代表已处理）',
  `comm_time` datetime NOT NULL COMMENT '沟通时间',
  `do_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '沟通记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_communicate_record
-- ----------------------------

-- ----------------------------
-- Table structure for csa_crop_files
-- ----------------------------
DROP TABLE IF EXISTS `csa_crop_files`;
CREATE TABLE `csa_crop_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作物档案id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作物名称',
  `plant_guide` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '种植指南',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代表图片',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '作物档案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_crop_files
-- ----------------------------
INSERT INTO `csa_crop_files` VALUES (1, '辣椒', NULL, NULL, NULL, '0', '0', '', '2022-03-25 22:33:34', '', '2022-03-25 22:33:42', NULL);

-- ----------------------------
-- Table structure for csa_crop_phase
-- ----------------------------
DROP TABLE IF EXISTS `csa_crop_phase`;
CREATE TABLE `csa_crop_phase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '阶段id',
  `crop_id` int(11) NOT NULL COMMENT '作物id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '阶段名称',
  `production` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产出',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代表图片',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '作物生长阶段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_crop_phase
-- ----------------------------

-- ----------------------------
-- Table structure for csa_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `csa_dict_data`;
CREATE TABLE `csa_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of csa_dict_data
-- ----------------------------
INSERT INTO `csa_dict_data` VALUES (1, 1, '正常', '0', 'csa_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '正常状态');
INSERT INTO `csa_dict_data` VALUES (2, 2, '停用', '1', 'csa_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for csa_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `csa_dict_type`;
CREATE TABLE `csa_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of csa_dict_type
-- ----------------------------
INSERT INTO `csa_dict_type` VALUES (1, '开关状态', 'csa_normal_disable', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '系统开关列表');

-- ----------------------------
-- Table structure for csa_farmer
-- ----------------------------
DROP TABLE IF EXISTS `csa_farmer`;
CREATE TABLE `csa_farmer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员姓名',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `coins` decimal(19, 4) NOT NULL DEFAULT 0.0000 COMMENT '金币余额',
  `balance` decimal(19, 4) NOT NULL DEFAULT 0.0000 COMMENT '账户余额',
  `weight` decimal(19, 4) NOT NULL DEFAULT 0.0000 COMMENT '重量余额',
  `arched_years` int(11) NOT NULL DEFAULT 0 COMMENT '拱棚年限余额',
  `join_date` date NULL DEFAULT NULL COMMENT '加入日期',
  `due_date` date NULL DEFAULT NULL COMMENT '到期日期',
  `is_expire` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否过期',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '私家农场会员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_farmer
-- ----------------------------

-- ----------------------------
-- Table structure for csa_garden
-- ----------------------------
DROP TABLE IF EXISTS `csa_garden`;
CREATE TABLE `csa_garden`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜地编号',
  `zone_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分区代码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜地名称',
  `m2` decimal(19, 4) NOT NULL DEFAULT 0.0000 COMMENT '平方米',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `manager_id` int(11) NULL DEFAULT NULL COMMENT '菜地管理员id',
  `worker_id` int(11) NULL DEFAULT NULL COMMENT '工人id',
  `contacter_id` int(11) NULL DEFAULT NULL COMMENT '客服人员id',
  `is_farming` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '耕作状态',
  `is_selled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '售出状态',
  `is_completed` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '竣工状态',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜地' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_garden
-- ----------------------------
INSERT INTO `csa_garden` VALUES (1, '8001', 'default', '百草园', 30.0000, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '', '2022-03-25 19:31:52', '', '2022-03-25 19:34:51', NULL);
INSERT INTO `csa_garden` VALUES (2, '8002', 'default', '香草居', 30.0000, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '', '2022-03-25 19:33:34', '', NULL, NULL);

-- ----------------------------
-- Table structure for csa_garden_log
-- ----------------------------
DROP TABLE IF EXISTS `csa_garden_log`;
CREATE TABLE `csa_garden_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜地日志id',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `garden_id` bigint(20) NOT NULL COMMENT '菜地id',
  `task_id` bigint(20) NULL DEFAULT NULL COMMENT '种植任务id',
  `log_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志类型',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `publisher` bigint(20) NOT NULL COMMENT '发布人',
  `publish_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜地日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_garden_log
-- ----------------------------

-- ----------------------------
-- Table structure for csa_garden_log_attach
-- ----------------------------
DROP TABLE IF EXISTS `csa_garden_log_attach`;
CREATE TABLE `csa_garden_log_attach`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `log_id` int(11) NOT NULL COMMENT '菜地日志id',
  `attach_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件类型',
  `filename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'URL',
  `width` int(11) NULL DEFAULT 0 COMMENT '附件宽度',
  `height` int(11) NULL DEFAULT 0 COMMENT '附件高度',
  `bytes` bigint(20) NULL DEFAULT 0 COMMENT '字节数',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜地日志附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_garden_log_attach
-- ----------------------------

-- ----------------------------
-- Table structure for csa_garden_strain
-- ----------------------------
DROP TABLE IF EXISTS `csa_garden_strain`;
CREATE TABLE `csa_garden_strain`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜地品种id',
  `garden_id` int(11) NOT NULL COMMENT '菜地id',
  `task_id` bigint(20) NULL DEFAULT NULL COMMENT '种植任务id',
  `crop_id` int(11) NOT NULL COMMENT '作物id',
  `crop_phase_id` int(11) NULL DEFAULT NULL COMMENT '作物阶段id',
  `m2` decimal(19, 4) NOT NULL COMMENT '平方米',
  `output_weight` decimal(19, 4) NOT NULL COMMENT '产出重量',
  `is_definite` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否确定',
  `is_planted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否种植',
  `is_ended` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否拉秧',
  `definite_date` datetime NULL DEFAULT NULL COMMENT '确定时间',
  `planted_date` date NULL DEFAULT NULL COMMENT '种植日期',
  `ended_date` date NULL DEFAULT NULL COMMENT '拉秧日期',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `garden_id`(`garden_id`) USING BTREE COMMENT '按菜地索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜地品种' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_garden_strain
-- ----------------------------

-- ----------------------------
-- Table structure for csa_member_card
-- ----------------------------
DROP TABLE IF EXISTS `csa_member_card`;
CREATE TABLE `csa_member_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡id',
  `cardno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号',
  `passwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `activation_validity` date NULL DEFAULT NULL COMMENT '激活有效期',
  `usability_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '可用状态（0不可用 1可用）',
  `active_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '激活状态（0未激活 1已激活）',
  `m2` decimal(19, 4) NOT NULL COMMENT '平方米',
  `land_years` int(11) NOT NULL COMMENT '土地年限',
  `arched_years` int(11) NOT NULL COMMENT '拱棚年限',
  `coins` decimal(19, 4) NOT NULL COMMENT '金币',
  `balance` decimal(19, 4) NOT NULL COMMENT '账户金额',
  `weight` decimal(19, 4) NOT NULL COMMENT '重量',
  `set_meal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐代码',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '私家农场会员卡' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_member_card
-- ----------------------------

-- ----------------------------
-- Table structure for csa_pick_detail
-- ----------------------------
DROP TABLE IF EXISTS `csa_pick_detail`;
CREATE TABLE `csa_pick_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采摘明细id',
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `strain_id` bigint(20) NULL DEFAULT NULL COMMENT '菜地品种id',
  `plan_weight` decimal(19, 4) NULL DEFAULT NULL COMMENT '计划重量',
  `result_weight` decimal(19, 4) NULL DEFAULT NULL COMMENT '实际重量',
  `is_completed` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否处理完毕',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE COMMENT '按任务索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采摘任务明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_pick_detail
-- ----------------------------

-- ----------------------------
-- Table structure for csa_staff
-- ----------------------------
DROP TABLE IF EXISTS `csa_staff`;
CREATE TABLE `csa_staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工作人员id',
  `user_id` bigint(20) NOT NULL COMMENT '系统用户id',
  `staff_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `is_sysuser` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否系统用户',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '有效状态（0代表有效 1代表无效）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_staff
-- ----------------------------

-- ----------------------------
-- Table structure for csa_tend_task
-- ----------------------------
DROP TABLE IF EXISTS `csa_tend_task`;
CREATE TABLE `csa_tend_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `garden_id` int(11) NOT NULL COMMENT '菜地id',
  `task_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务类型',
  `task_subtype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务子类型',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `execution_phase` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务阶段',
  `coins` decimal(19, 4) NOT NULL COMMENT '金币花费',
  `task_time` datetime NOT NULL COMMENT '任务产生时间',
  `feedback_time` datetime NULL DEFAULT NULL COMMENT '反馈时间',
  `feedback_result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈结果',
  `executor` bigint(20) NULL DEFAULT NULL COMMENT '执行人',
  `feedbacker` bigint(20) NULL DEFAULT NULL COMMENT '反馈人',
  `is_completed` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否处理完毕',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `garden_id`(`garden_id`) USING BTREE COMMENT '按菜地索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '打理任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_tend_task
-- ----------------------------

-- ----------------------------
-- Table structure for csa_zone
-- ----------------------------
DROP TABLE IF EXISTS `csa_zone`;
CREATE TABLE `csa_zone`  (
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分区代码',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分区类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分区名称',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '农场分区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csa_zone
-- ----------------------------
INSERT INTO `csa_zone` VALUES ('default', '菜园', '默认农场', '0', '0', '', NULL, '', '2022-03-24 21:16:30', '基础版只支持一个农场分区');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'csa_zone', '农场分区', NULL, NULL, 'Zone', 'crud', 'com.jlt.csa', 'csa', 'farmzone', '农场分区', '郏磊涛', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2022-03-24 19:16:52', '', '2022-03-27 20:49:39', NULL);
INSERT INTO `gen_table` VALUES (2, 'csa_garden', '菜地', NULL, NULL, 'Garden', 'crud', 'com.jlt.csa', 'csa', 'garden', '菜地划分', '郏磊涛', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04', NULL);
INSERT INTO `gen_table` VALUES (13, 'csa_crop_files', '作物档案', NULL, NULL, 'CropFiles', 'crud', 'com.jlt.csa', 'csa', 'cropfiles', '作物档案', 'JiaLeitao', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53', NULL);
INSERT INTO `gen_table` VALUES (14, 'csa_crop_phase', '作物生长阶段', NULL, NULL, 'CropPhase', 'crud', 'com.jlt.csa', 'csa', 'phase', '作物生长阶段', 'JiaLeitao', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:51', NULL);
INSERT INTO `gen_table` VALUES (15, 'csa_farmer', '私家农场会员', NULL, NULL, 'CsaFarmer', 'crud', 'com.jlt.csa', 'csa', 'farmer', '私家农场会员', 'JiaLeitao', '0', '/', '{\"parentMenuId\":\"2021\"}', 'admin', '2022-03-26 14:34:03', '', '2022-03-26 14:40:49', NULL);
INSERT INTO `gen_table` VALUES (16, 'csa_member_card', '私家农场会员卡', NULL, NULL, 'CsaMemberCard', 'crud', 'com.jlt.csa', 'csa', 'card', '会员卡', 'JiaLeitao', '0', '/', '{\"parentMenuId\":\"2028\"}', 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07', NULL);
INSERT INTO `gen_table` VALUES (17, 'csa_arched_record', '拱棚使用记录', NULL, NULL, 'ArchedRecord', 'crud', 'com.jlt.csa', 'csa', 'archedrecord', '拱棚使用记录', 'JiaLeitao', '0', '/', '{\"parentMenuId\":\"2021\"}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55', NULL);
INSERT INTO `gen_table` VALUES (18, 'csa_coin_record', '金币记录', NULL, NULL, 'CoinRecord', 'crud', 'com.jlt.csa', 'csa', 'coinrecord', '金币记录', 'JiaLeitao', '0', '/', '{\"parentMenuId\":\"2021\"}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:00:07', NULL);
INSERT INTO `gen_table` VALUES (19, 'csa_communicate_record', '沟通记录', NULL, NULL, 'CommunicateRecord', 'crud', 'com.jlt.csa', 'csa', 'commrecord', '沟通记录', 'JiaLeitao', '0', '/', '{\"parentMenuId\":\"2021\"}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05', NULL);
INSERT INTO `gen_table` VALUES (20, 'csa_garden_log', '菜地日志', NULL, NULL, 'GardenLog', 'crud', 'com.jlt.csa', 'csa', 'log', '菜地日志', 'JiaLeitao', '0', '/', '{\"parentMenuId\":2021}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24', NULL);
INSERT INTO `gen_table` VALUES (21, 'csa_garden_log_attach', '菜地日志附件', NULL, NULL, 'GardenLogAttach', 'crud', 'com.jlt.csa', 'csa', 'attach', '菜地日志附件', 'JiaLeitao', '0', '/', '{\"parentMenuId\":2021}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28', NULL);
INSERT INTO `gen_table` VALUES (22, 'csa_garden_strain', '菜地品种', NULL, NULL, 'GardenStrain', 'crud', 'com.jlt.csa', 'csa', 'strain', '菜地品种', 'JiaLeitao', '0', '/', '{\"parentMenuId\":2021}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34', NULL);
INSERT INTO `gen_table` VALUES (23, 'csa_pick_detail', '采摘任务明细', NULL, NULL, 'PickDetail', 'crud', 'com.jlt.csa', 'csa', 'detail', '采摘任务明细', 'JiaLeitao', '0', '/', '{\"parentMenuId\":2021}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02', NULL);
INSERT INTO `gen_table` VALUES (24, 'csa_tend_task', '打理任务', NULL, NULL, 'TendTask', 'crud', 'com.jlt.csa', 'csa', 'task', '打理任务', 'JiaLeitao', '0', '/', '{\"parentMenuId\":\"2021\"}', 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 342 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'code', '分区代码', 'varchar(10)', 'String', 'code', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', '分区名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (3, '1', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (4, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 5, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (5, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 6, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (6, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 7, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (7, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 8, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (8, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 9, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (9, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-24 19:16:52', NULL, '2022-03-27 20:49:39');
INSERT INTO `gen_table_column` VALUES (10, '2', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (11, '2', 'code', '菜地编号', 'varchar(20)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (12, '2', 'zone_code', '分区代码', 'varchar(10)', 'String', 'zoneCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (13, '2', 'name', '菜地名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (14, '2', 'm2', '平方米', 'decimal(19,4)', 'BigDecimal', 'm2', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (15, '2', 'member_id', '会员id', 'int(11)', 'Long', 'memberId', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 6, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (16, '2', 'manager_id', '菜地管理员id', 'int(11)', 'Long', 'managerId', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 7, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (17, '2', 'worker_id', '工人id', 'int(11)', 'Long', 'workerId', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 8, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (18, '2', 'contacter_id', '客服人员id', 'int(11)', 'Long', 'contacterId', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 9, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (19, '2', 'coins', '金币', 'decimal(19,4)', 'BigDecimal', 'coins', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (20, '2', 'is_farming', '耕作状态', 'char(1)', 'String', 'isFarming', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 11, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (21, '2', 'is_selled', '售出状态', 'char(1)', 'String', 'isSelled', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 12, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (22, '2', 'is_completed', '竣工状态', 'char(1)', 'String', 'isCompleted', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (23, '2', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'radio', '', 14, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (24, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (25, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (26, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (27, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (28, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (29, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 20, 'admin', '2022-03-24 22:23:32', '', '2022-03-24 22:39:04');
INSERT INTO `gen_table_column` VALUES (150, '13', 'id', '作物档案id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (151, '13', 'name', '作物名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (152, '13', 'plant_guide', '种植指南', 'varchar(1024)', 'String', 'plantGuide', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'textarea', '', 3, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (153, '13', 'picture', '代表图片', 'varchar(255)', 'String', 'picture', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (154, '13', 'description', '作物描述', 'varchar(1024)', 'String', 'description', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'textarea', '', 5, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (155, '13', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', '', 6, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (156, '13', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (157, '13', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (158, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (159, '13', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (160, '13', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (161, '13', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-25 22:20:58', '', '2022-03-25 22:23:53');
INSERT INTO `gen_table_column` VALUES (162, '14', 'id', '阶段id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:51');
INSERT INTO `gen_table_column` VALUES (163, '14', 'crop_id', '作物id', 'int(11)', 'Long', 'cropId', '0', '0', '1', '1', '1', NULL, '1', 'EQ', 'input', '', 2, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (164, '14', 'name', '阶段名称', 'varchar(20)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (165, '14', 'production', '产出', 'varchar(20)', 'String', 'production', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (166, '14', 'picture', '代表图片', 'varchar(255)', 'String', 'picture', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (167, '14', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (168, '14', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (169, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (170, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (171, '14', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (172, '14', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (173, '14', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-26 10:44:00', '', '2022-03-26 10:45:52');
INSERT INTO `gen_table_column` VALUES (174, '15', 'id', '会员id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (175, '15', 'name', '会员姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (176, '15', 'gender', '性别', 'varchar(2)', 'String', 'gender', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (177, '15', 'coins', '金币余额', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'coins', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (178, '15', 'balance', '账户余额', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'balance', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (179, '15', 'weight', '重量余额', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'weight', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (180, '15', 'arched_years', '拱棚年限余额', 'int(10) unsigned zerofill', 'Integer', 'archedYears', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (183, '15', 'is_expire', '是否过期', 'varchar(1)', 'String', 'isExpire', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (184, '15', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (185, '15', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 12, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (186, '15', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 13, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (187, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 14, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (188, '15', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 15, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (189, '15', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 16, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (190, '15', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2022-03-26 14:34:03', NULL, '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (191, '15', 'join_date', '加入日期', 'date', 'Date', 'joinDate', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 8, '', '2022-03-26 14:39:22', '', '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (192, '15', 'due_date', '到期日期', 'date', 'Date', 'dueDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, '', '2022-03-26 14:39:22', '', '2022-03-26 14:40:49');
INSERT INTO `gen_table_column` VALUES (193, '16', 'id', '卡id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (194, '16', 'cardno', '卡号', 'varchar(20)', 'String', 'cardno', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (195, '16', 'passwd', '密码', 'varchar(64)', 'String', 'passwd', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (196, '16', 'activation_validity', '激活有效期', 'date', 'Date', 'activationValidity', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (197, '16', 'usability_status', '可用状态', 'char(1)', 'String', 'usabilityStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (198, '16', 'active_status', '激活状态', 'char(1)', 'String', 'activeStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (199, '16', 'm2', '平方米', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'm2', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (200, '16', 'land_years', '土地年限', 'int(10) unsigned zerofill', 'Integer', 'landYears', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (201, '16', 'arched_years', '拱棚年限', 'int(10) unsigned zerofill', 'Integer', 'archedYears', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (202, '16', 'coins', '金币', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'coins', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (203, '16', 'balance', '金额', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'balance', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (204, '16', 'weight', '重量', 'decimal(19,4) unsigned zerofill', 'BigDecimal', 'weight', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (205, '16', 'set_meal', '套餐代码', 'varchar(20)', 'String', 'setMeal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (206, '16', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (207, '16', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (208, '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (209, '16', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (210, '16', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (211, '16', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 19, 'admin', '2022-03-26 16:11:17', '', '2022-03-26 16:21:07');
INSERT INTO `gen_table_column` VALUES (212, '17', 'id', '拱棚使用记录id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (213, '17', 'member_id', '会员id', 'bigint(20)', 'Long', 'memberId', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (214, '17', 'garden_id', '菜地id', 'int(11)', 'Long', 'gardenId', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (215, '17', 'year_no', '对应年份', 'int(11)', 'Long', 'yearNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (216, '17', 'consum_year', '消耗年份', 'int(11)', 'Long', 'consumYear', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (217, '17', 'remaining_years', '剩余年份', 'int(11)', 'Long', 'remainingYears', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (218, '17', 'doer_id', '操作人id', 'int(11)', 'Long', 'doerId', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (219, '17', 'do_time', '处理时间', 'datetime', 'Date', 'doTime', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (220, '17', 'status', '有效状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (221, '17', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (222, '17', 'create_by', '创建者', 'varchar(30)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (223, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (224, '17', 'update_by', '更新者', 'varchar(30)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (225, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (226, '17', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:23:55');
INSERT INTO `gen_table_column` VALUES (227, '18', 'id', '记录id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (228, '18', 'member_id', '会员id', 'int(11)', 'Long', 'memberId', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (229, '18', 'op_id', '业务id', 'int(11)', 'Long', 'opId', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (230, '18', 'op_type', '业务类型', 'varchar(10)', 'String', 'opType', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (231, '18', 'coins', '金币花费', 'decimal(19,4)', 'BigDecimal', 'coins', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (232, '18', 'coin_balance', '金币余额', 'decimal(19,4)', 'BigDecimal', 'coinBalance', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (233, '18', 'description', '描述', 'varchar(50)', 'String', 'description', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (234, '18', 'op_time', '业务发生时间', 'datetime', 'Date', 'opTime', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (235, '18', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (236, '18', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 10, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (237, '18', 'create_by', '创建者', 'varchar(30)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 11, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (238, '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 12, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (239, '18', 'update_by', '更新者', 'varchar(30)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 13, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (240, '18', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 14, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (241, '18', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', NULL, '2022-03-27 19:00:07');
INSERT INTO `gen_table_column` VALUES (242, '19', 'id', '沟通日志记录id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (243, '19', 'member_id', '会员', 'bigint(20)', 'Long', 'memberId', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (244, '19', 'garden_id', '菜地id', 'int(11)', 'Long', 'gardenId', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (245, '19', 'recorder', '发布人', 'bigint(20)', 'Long', 'recorder', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (246, '19', 'task_id', '种植任务id', 'int(11)', 'Long', 'taskId', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (247, '19', 'comm_type', '沟通类型', 'varchar(10)', 'String', 'commType', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'select', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (248, '19', 'content', '沟通内容', 'varchar(500)', 'String', 'content', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'editor', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (249, '19', 'result', '处理结果', 'varchar(500)', 'String', 'result', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (250, '19', 'is_completed', '是否处理', 'char(1)', 'String', 'isCompleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (251, '19', 'comm_time', '沟通时间', 'datetime', 'Date', 'commTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (252, '19', 'do_time', '处理时间', 'datetime', 'Date', 'doTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (253, '19', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (254, '19', 'create_by', '创建者', 'varchar(30)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (255, '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (256, '19', 'update_by', '更新者', 'varchar(30)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (257, '19', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (258, '19', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 19:51:05');
INSERT INTO `gen_table_column` VALUES (259, '20', 'id', '菜地日志id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (260, '20', 'member_id', '会员', 'bigint(20)', 'Long', 'memberId', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (261, '20', 'garden_id', '菜地', 'bigint(20)', 'Long', 'gardenId', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (262, '20', 'task_id', '种植任务', 'bigint(20)', 'Long', 'taskId', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (263, '20', 'log_type', '日志类型', 'varchar(10)', 'String', 'logType', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (264, '20', 'content', '日志内容', 'varchar(200)', 'String', 'content', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'editor', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (265, '20', 'publish_time', '发布时间', 'datetime', 'Date', 'publishTime', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (266, '20', 'publisher', '发布人', 'bigint(20)', 'Long', 'publisher', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (267, '20', 'publish_status', '发布状态', 'char(1)', 'String', 'publishStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (268, '20', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (269, '20', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (270, '20', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (271, '20', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (272, '20', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (273, '20', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:30:24');
INSERT INTO `gen_table_column` VALUES (274, '21', 'id', '附件id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (275, '21', 'log_id', '菜地日志', 'int(11)', 'Long', 'logId', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (276, '21', 'attach_type', '附件类型', 'varchar(10)', 'String', 'attachType', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (277, '21', 'filename', '文件名', 'varchar(50)', 'String', 'filename', '0', '0', NULL, '1', '1', '1', NULL, 'LIKE', 'input', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (278, '21', 'url', 'URL', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (279, '21', 'width', '附件宽度', 'int(11)', 'Long', 'width', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (280, '21', 'height', '附件高度', 'int(11)', 'Long', 'height', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (281, '21', 'bytes', '字节数', 'bigint(20)', 'Long', 'bytes', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (282, '21', 'publish_time', '发布时间', 'datetime', 'Date', 'publishTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (283, '21', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (284, '21', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (285, '21', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (286, '21', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (287, '21', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (288, '21', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:24:28');
INSERT INTO `gen_table_column` VALUES (289, '22', 'id', '菜地品种id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (290, '22', 'garden_id', '菜地', 'int(11)', 'Long', 'gardenId', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (291, '22', 'task_id', '种植任务', 'bigint(20)', 'Long', 'taskId', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (292, '22', 'crop_id', '作物id', 'int(11)', 'Long', 'cropId', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (293, '22', 'crop_phase_id', '作物阶段', 'int(11)', 'Long', 'cropPhaseId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (294, '22', 'm2', '平方米', 'decimal(19,4)', 'BigDecimal', 'm2', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (295, '22', 'output_weight', '产出重量', 'decimal(19,4)', 'BigDecimal', 'outputWeight', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (296, '22', 'is_definite', '是否确定', 'char(1)', 'String', 'isDefinite', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (297, '22', 'is_planted', '是否种植', 'char(1)', 'String', 'isPlanted', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (298, '22', 'is_ended', '是否拉秧', 'char(1)', 'String', 'isEnded', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (299, '22', 'definite_date', '确定时间', 'datetime', 'Date', 'definiteDate', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (300, '22', 'planted_date', '种植日期', 'date', 'Date', 'plantedDate', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (301, '22', 'ended_date', '拉秧日期', 'date', 'Date', 'endedDate', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (302, '22', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (303, '22', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (304, '22', 'create_by', '创建者', 'varchar(30)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:34');
INSERT INTO `gen_table_column` VALUES (305, '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:35');
INSERT INTO `gen_table_column` VALUES (306, '22', 'update_by', '更新者', 'varchar(30)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:35');
INSERT INTO `gen_table_column` VALUES (307, '22', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:35');
INSERT INTO `gen_table_column` VALUES (308, '22', 'remark', '备注', 'varchar(20)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 20, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:02:35');
INSERT INTO `gen_table_column` VALUES (309, '23', 'id', '采摘明细id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (310, '23', 'task_id', '任务id', 'bigint(20)', 'Long', 'taskId', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (311, '23', 'strain_id', '菜地品种id', 'bigint(20)', 'Long', 'strainId', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (312, '23', 'plan_weight', '计划重量', 'decimal(19,4)', 'BigDecimal', 'planWeight', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (313, '23', 'result_weight', '实际重量', 'decimal(19,4)', 'BigDecimal', 'resultWeight', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (314, '23', 'is_completed', '是否处理完毕', 'char(1)', 'String', 'isCompleted', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (315, '23', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (316, '23', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (317, '23', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (318, '23', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (319, '23', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (320, '23', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:19:02');
INSERT INTO `gen_table_column` VALUES (321, '24', 'id', '任务id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (322, '24', 'garden_id', '菜地id', 'int(11)', 'Long', 'gardenId', '0', '0', '1', '1', NULL, '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (323, '24', 'task_type', '任务类型', 'varchar(10)', 'String', 'taskType', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'select', '', 3, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (324, '24', 'task_subtype', '任务子类型', 'varchar(10)', 'String', 'taskSubtype', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'select', '', 4, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (325, '24', 'description', '任务描述', 'varchar(100)', 'String', 'description', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (326, '24', 'execution_phase', '任务阶段', 'varchar(10)', 'String', 'executionPhase', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (327, '24', 'coins', '金币花费', 'decimal(19,4)', 'BigDecimal', 'coins', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (328, '24', 'task_time', '任务产生时间', 'datetime', 'Date', 'taskTime', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (329, '24', 'feedback_time', '反馈时间', 'datetime', 'Date', 'feedbackTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (330, '24', 'feedback_result', '反馈结果', 'varchar(50)', 'String', 'feedbackResult', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (331, '24', 'executor', '执行人', 'bigint(20)', 'Long', 'executor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (332, '24', 'feedbacker', '反馈人', 'bigint(20)', 'Long', 'feedbacker', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (333, '24', 'is_completed', '是否处理完毕', 'char(1)', 'String', 'isCompleted', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (334, '24', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (335, '24', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (336, '24', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (337, '24', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (338, '24', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (339, '24', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (340, '24', 'remark', '备注', 'varchar(10)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 20, 'admin', '2022-03-27 17:59:21', '', '2022-03-27 18:12:16');
INSERT INTO `gen_table_column` VALUES (341, '1', 'type', '分区类型', 'varchar(10)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, '', '2022-03-27 20:47:50', '', '2022-03-27 20:49:39');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-20 21:45:30', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-20 21:45:30', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-20 21:45:30', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-20 21:45:30', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-03-20 21:45:30', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-20 21:45:25', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-20 21:45:30', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-20 21:45:29', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-20 21:45:31', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-20 21:45:31', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-20 21:45:31', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 21:52:55');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 22:53:14');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-21 19:32:14');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-21 21:59:36');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码已失效', '2022-03-24 19:16:07');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-24 19:16:11');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-24 20:38:33');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-24 21:01:29');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-24 21:06:19');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-24 22:23:14');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 19:29:33');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码已失效', '2022-03-25 21:56:25');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-25 21:56:29');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 22:02:11');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 10:17:12');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 11:20:12');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 13:27:14');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 14:32:42');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 16:10:52');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:19:11');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 19:17:07');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 17:56:53');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-27 20:38:25');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 20:55:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 21:58:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2089 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 970, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-03-20 21:45:26', 'admin', '2022-03-20 22:55:45', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 980, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-03-20 21:45:26', 'admin', '2022-03-20 22:55:37', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 990, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-03-20 21:45:26', 'admin', '2022-03-20 22:55:31', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 1000, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2022-03-20 21:45:26', 'admin', '2022-03-25 22:44:18', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-20 21:45:26', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-20 21:45:26', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-20 21:45:26', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-03-20 21:45:26', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-03-20 21:45:26', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-20 21:45:26', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-03-20 21:45:26', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-03-20 21:45:26', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-03-20 21:45:26', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-03-20 21:45:26', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-03-20 21:45:26', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-03-20 21:45:26', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-03-20 21:45:26', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-03-20 21:45:26', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-20 21:45:26', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-20 21:45:26', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-20 21:45:26', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-03-20 21:45:26', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-03-20 21:45:26', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '客户关系', 0, 800, 'crm', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2022-03-20 22:54:29', 'admin', '2022-03-24 19:23:38', '');
INSERT INTO `sys_menu` VALUES (2001, '访客管理', 2000, 10, 'visitor', 'crm/visitor/index', NULL, 1, 0, 'C', '0', '0', 'crm:visitor:list', 'logininfor', 'admin', '2022-03-20 22:59:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '农场规划', 0, 100, 'partition', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'cascader', 'admin', '2022-03-24 19:25:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '农场分区', 2002, 1, 'farmzone', 'csa/farmzone/index', NULL, 1, 0, 'C', '0', '0', 'csa:farmzone:list', 'tab', 'admin', '2022-03-24 19:34:52', 'admin', '2022-03-27 20:53:05', '农场分区菜单');
INSERT INTO `sys_menu` VALUES (2004, '农场分区查询', 2003, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmzone:query', '#', 'admin', '2022-03-24 19:34:52', 'admin', '2022-03-27 20:53:25', '');
INSERT INTO `sys_menu` VALUES (2005, '农场分区新增', 2003, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmzone:add', '#', 'admin', '2022-03-24 19:34:52', 'admin', '2022-03-27 20:53:34', '');
INSERT INTO `sys_menu` VALUES (2006, '农场分区修改', 2003, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmzone:edit', '#', 'admin', '2022-03-24 19:34:52', 'admin', '2022-03-27 20:53:41', '');
INSERT INTO `sys_menu` VALUES (2007, '农场分区删除', 2003, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmzone:remove', '#', 'admin', '2022-03-24 19:34:52', 'admin', '2022-03-27 20:53:50', '');
INSERT INTO `sys_menu` VALUES (2008, '农场分区导出', 2003, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmzone:export', '#', 'admin', '2022-03-24 19:34:52', 'admin', '2022-03-27 20:53:57', '');
INSERT INTO `sys_menu` VALUES (2009, '菜地划分', 2002, 1, 'garden', 'csa/garden/index', NULL, 1, 0, 'C', '0', '0', 'csa:garden:list', 'table', 'admin', '2022-03-24 22:30:32', 'admin', '2022-03-24 22:38:08', '菜地划分菜单');
INSERT INTO `sys_menu` VALUES (2010, '菜地划分查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:garden:query', '#', 'admin', '2022-03-24 22:30:32', 'admin', '2022-03-24 22:38:15', '');
INSERT INTO `sys_menu` VALUES (2011, '菜地划分新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:garden:add', '#', 'admin', '2022-03-24 22:30:32', 'admin', '2022-03-24 22:38:22', '');
INSERT INTO `sys_menu` VALUES (2012, '菜地划分修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:garden:edit', '#', 'admin', '2022-03-24 22:30:32', 'admin', '2022-03-24 22:38:28', '');
INSERT INTO `sys_menu` VALUES (2013, '菜地划分删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:garden:remove', '#', 'admin', '2022-03-24 22:30:32', 'admin', '2022-03-24 22:38:33', '');
INSERT INTO `sys_menu` VALUES (2014, '菜地划分导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:garden:export', '#', 'admin', '2022-03-24 22:30:33', 'admin', '2022-03-24 22:38:38', '');
INSERT INTO `sys_menu` VALUES (2015, '作物档案', 2002, 1, 'cropfiles', 'csa/cropfiles/index', NULL, 1, 0, 'C', '0', '0', 'csa:cropfiles:list', 'documentation', 'admin', '2022-03-25 22:25:59', 'admin', '2022-03-25 22:30:56', '作物档案菜单');
INSERT INTO `sys_menu` VALUES (2016, '作物档案查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:cropfiles:query', '#', 'admin', '2022-03-25 22:25:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '作物档案新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:cropfiles:add', '#', 'admin', '2022-03-25 22:25:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '作物档案修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:cropfiles:edit', '#', 'admin', '2022-03-25 22:25:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '作物档案删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:cropfiles:remove', '#', 'admin', '2022-03-25 22:25:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '作物档案导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:cropfiles:export', '#', 'admin', '2022-03-25 22:25:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '会员服务', 0, 200, 'member', NULL, NULL, 1, 0, 'M', '0', '0', '', 'people', 'admin', '2022-03-25 22:43:43', 'admin', '2022-03-26 14:33:42', '');
INSERT INTO `sys_menu` VALUES (2022, '私家农场会员', 2021, 1, 'farmer', 'csa/farmer/index', NULL, 1, 0, 'C', '0', '0', 'csa:farmer:list', '#', 'admin', '2022-03-26 14:48:06', '', NULL, '私家农场会员菜单');
INSERT INTO `sys_menu` VALUES (2023, '私家农场会员查询', 2022, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmer:query', '#', 'admin', '2022-03-26 14:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '私家农场会员新增', 2022, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmer:add', '#', 'admin', '2022-03-26 14:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '私家农场会员修改', 2022, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmer:edit', '#', 'admin', '2022-03-26 14:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '私家农场会员删除', 2022, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmer:remove', '#', 'admin', '2022-03-26 14:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '私家农场会员导出', 2022, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:farmer:export', '#', 'admin', '2022-03-26 14:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '卡务管理', 0, 400, 'card', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'row', 'admin', '2022-03-26 16:14:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '会员卡', 2028, 1, 'card', 'csa/card/index', NULL, 1, 0, 'C', '0', '0', 'csa:card:list', '#', 'admin', '2022-03-26 16:24:15', '', NULL, '会员卡菜单');
INSERT INTO `sys_menu` VALUES (2030, '会员卡查询', 2029, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:card:query', '#', 'admin', '2022-03-26 16:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '会员卡新增', 2029, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:card:add', '#', 'admin', '2022-03-26 16:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '会员卡修改', 2029, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:card:edit', '#', 'admin', '2022-03-26 16:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '会员卡删除', 2029, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:card:remove', '#', 'admin', '2022-03-26 16:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '会员卡导出', 2029, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:card:export', '#', 'admin', '2022-03-26 16:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '菜地品种', 2021, 1, 'strain', 'csa/strain/index', NULL, 1, 0, 'C', '0', '0', 'csa:strain:list', '#', 'admin', '2022-03-27 18:06:35', '', NULL, '菜地品种菜单');
INSERT INTO `sys_menu` VALUES (2036, '菜地品种查询', 2035, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:strain:query', '#', 'admin', '2022-03-27 18:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '菜地品种新增', 2035, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:strain:add', '#', 'admin', '2022-03-27 18:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '菜地品种修改', 2035, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:strain:edit', '#', 'admin', '2022-03-27 18:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '菜地品种删除', 2035, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:strain:remove', '#', 'admin', '2022-03-27 18:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '菜地品种导出', 2035, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:strain:export', '#', 'admin', '2022-03-27 18:06:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '打理任务', 2021, 1, 'task', 'csa/task/index', NULL, 1, 0, 'C', '0', '0', 'csa:task:list', '#', 'admin', '2022-03-27 18:14:22', '', NULL, '打理任务菜单');
INSERT INTO `sys_menu` VALUES (2042, '打理任务查询', 2041, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:task:query', '#', 'admin', '2022-03-27 18:14:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '打理任务新增', 2041, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:task:add', '#', 'admin', '2022-03-27 18:14:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '打理任务修改', 2041, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:task:edit', '#', 'admin', '2022-03-27 18:14:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '打理任务删除', 2041, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:task:remove', '#', 'admin', '2022-03-27 18:14:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '打理任务导出', 2041, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:task:export', '#', 'admin', '2022-03-27 18:14:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '采摘任务明细', 2021, 1, 'detail', 'csa/detail/index', NULL, 1, 0, 'C', '0', '0', 'csa:detail:list', '#', 'admin', '2022-03-27 18:22:28', '', NULL, '采摘任务明细菜单');
INSERT INTO `sys_menu` VALUES (2048, '采摘任务明细查询', 2047, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:detail:query', '#', 'admin', '2022-03-27 18:22:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '采摘任务明细新增', 2047, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:detail:add', '#', 'admin', '2022-03-27 18:22:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '采摘任务明细修改', 2047, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:detail:edit', '#', 'admin', '2022-03-27 18:22:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '采摘任务明细删除', 2047, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:detail:remove', '#', 'admin', '2022-03-27 18:22:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '采摘任务明细导出', 2047, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:detail:export', '#', 'admin', '2022-03-27 18:22:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '菜地日志附件', 2021, 1, 'attach', 'csa/attach/index', NULL, 1, 0, 'C', '0', '0', 'csa:attach:list', '#', 'admin', '2022-03-27 18:26:34', '', NULL, '菜地日志附件菜单');
INSERT INTO `sys_menu` VALUES (2054, '菜地日志附件查询', 2053, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:attach:query', '#', 'admin', '2022-03-27 18:26:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '菜地日志附件新增', 2053, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:attach:add', '#', 'admin', '2022-03-27 18:26:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '菜地日志附件修改', 2053, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:attach:edit', '#', 'admin', '2022-03-27 18:26:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '菜地日志附件删除', 2053, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:attach:remove', '#', 'admin', '2022-03-27 18:26:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '菜地日志附件导出', 2053, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:attach:export', '#', 'admin', '2022-03-27 18:26:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '菜地日志', 2021, 1, 'log', 'csa/log/index', NULL, 1, 0, 'C', '0', '0', 'csa:log:list', '#', 'admin', '2022-03-27 18:31:22', '', NULL, '菜地日志菜单');
INSERT INTO `sys_menu` VALUES (2060, '菜地日志查询', 2059, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:log:query', '#', 'admin', '2022-03-27 18:31:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '菜地日志新增', 2059, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:log:add', '#', 'admin', '2022-03-27 18:31:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '菜地日志修改', 2059, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:log:edit', '#', 'admin', '2022-03-27 18:31:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '菜地日志删除', 2059, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:log:remove', '#', 'admin', '2022-03-27 18:31:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '菜地日志导出', 2059, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:log:export', '#', 'admin', '2022-03-27 18:31:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '金币记录', 2021, 1, 'coinrecord', 'csa/coinrecord/index', NULL, 1, 0, 'C', '0', '0', 'csa:coinrecord:list', 'radio', 'admin', '2022-03-27 18:35:32', 'admin', '2022-03-27 19:02:00', '打理任务菜单');
INSERT INTO `sys_menu` VALUES (2066, '金币记录查询', 2065, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:coinrecord:query', '#', 'admin', '2022-03-27 18:35:32', 'admin', '2022-03-27 19:03:49', '');
INSERT INTO `sys_menu` VALUES (2067, '金币记录新增', 2065, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:coinrecord:add', '#', 'admin', '2022-03-27 18:35:32', 'admin', '2022-03-27 19:03:56', '');
INSERT INTO `sys_menu` VALUES (2068, '金币记录修改', 2065, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:coinrecord:edit', '#', 'admin', '2022-03-27 18:35:32', 'admin', '2022-03-27 19:04:04', '');
INSERT INTO `sys_menu` VALUES (2069, '金币记录删除', 2065, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:coinrecord:remove', '#', 'admin', '2022-03-27 18:35:32', 'admin', '2022-03-27 19:04:12', '');
INSERT INTO `sys_menu` VALUES (2070, '金币记录导出', 2065, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:coinrecord:export', '#', 'admin', '2022-03-27 18:35:32', 'admin', '2022-03-27 19:04:21', '');
INSERT INTO `sys_menu` VALUES (2071, '沟通记录', 2021, 1, 'commrecord', 'csa/commrecord/index', NULL, 1, 0, 'C', '0', '0', 'csa:commrecord:list', '#', 'admin', '2022-03-27 18:43:39', 'admin', '2022-03-27 19:56:01', '沟通记录菜单');
INSERT INTO `sys_menu` VALUES (2072, '沟通记录查询', 2071, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:commrecord:query', '#', 'admin', '2022-03-27 18:43:39', 'admin', '2022-03-27 19:56:11', '');
INSERT INTO `sys_menu` VALUES (2073, '沟通记录新增', 2071, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:commrecord:add', '#', 'admin', '2022-03-27 18:43:39', 'admin', '2022-03-27 19:56:22', '');
INSERT INTO `sys_menu` VALUES (2074, '沟通记录修改', 2071, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:commrecord:edit', '#', 'admin', '2022-03-27 18:43:39', 'admin', '2022-03-27 19:56:32', '');
INSERT INTO `sys_menu` VALUES (2075, '沟通记录删除', 2071, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:commrecord:remove', '#', 'admin', '2022-03-27 18:43:39', 'admin', '2022-03-27 19:56:42', '');
INSERT INTO `sys_menu` VALUES (2076, '沟通记录导出', 2071, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:commrecord:export', '#', 'admin', '2022-03-27 18:43:39', 'admin', '2022-03-27 19:56:53', '');
INSERT INTO `sys_menu` VALUES (2077, '拱棚使用记录', 2021, 1, 'archedrecord', 'csa/archedrecord/index', NULL, 1, 0, 'C', '0', '0', 'csa:archedrecord:list', '#', 'admin', '2022-03-27 18:46:37', 'admin', '2022-03-27 19:57:28', '拱棚使用记录菜单');
INSERT INTO `sys_menu` VALUES (2078, '拱棚使用记录查询', 2077, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:archedrecord:query', '#', 'admin', '2022-03-27 18:46:37', 'admin', '2022-03-27 19:57:37', '');
INSERT INTO `sys_menu` VALUES (2079, '拱棚使用记录新增', 2077, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:archedrecord:add', '#', 'admin', '2022-03-27 18:46:37', 'admin', '2022-03-27 19:57:48', '');
INSERT INTO `sys_menu` VALUES (2080, '拱棚使用记录修改', 2077, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:archedrecord:edit', '#', 'admin', '2022-03-27 18:46:37', 'admin', '2022-03-27 19:57:57', '');
INSERT INTO `sys_menu` VALUES (2081, '拱棚使用记录删除', 2077, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:archedrecord:remove', '#', 'admin', '2022-03-27 18:46:37', 'admin', '2022-03-27 19:58:07', '');
INSERT INTO `sys_menu` VALUES (2082, '拱棚使用记录导出', 2077, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'csa:archedrecord:export', '#', 'admin', '2022-03-27 18:46:37', 'admin', '2022-03-27 19:58:16', '');
INSERT INTO `sys_menu` VALUES (2083, '业务字典', 1, 60, 'csadict', 'csa/dict/index', NULL, 1, 0, 'C', '0', '0', 'system:dict:list', 'excel', 'admin', '2022-03-27 22:02:03', 'admin', '2022-03-27 22:04:19', '');
INSERT INTO `sys_menu` VALUES (2084, '字典查询', 2083, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-27 22:05:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '字典新增', 2083, 20, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-27 22:05:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '字典修改', 2083, 30, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-27 22:06:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '字典删除', 2083, 40, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-27 22:06:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '字典导出', 2083, 50, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-27 22:06:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-20 21:45:32', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-03-20 21:45:32', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 285 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":10,\"menuName\":\"客户关系\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/crm\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:54:29');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":10,\"menuName\":\"客户关系\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm\",\"children\":[],\"createTime\":1647788069000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:54:42');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":900,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:54:57');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":800,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:55:08');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":990,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:55:31');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":980,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:55:38');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":970,\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:55:46');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":1000,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:56:02');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":100,\"menuName\":\"客户关系\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm\",\"children\":[],\"createTime\":1647788069000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:56:10');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"logininfor\",\"orderNum\":10,\"menuName\":\"访客管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"visitor\",\"component\":\"crm/visitor/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"crm:visitor:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 22:59:06');
INSERT INTO `sys_oper_log` VALUES (110, '访客信息', 2, 'com.jlt.farming.crm.controller.VisitorController.edit()', 'PUT', 1, 'admin', NULL, '/crm/visitor', '127.0.0.1', '内网IP', '{\"updateTime\":1647863942003,\"matter\":\"聊天\",\"params\":{},\"visitorName\":\"老五\",\"backlog\":\"吃大餐\",\"createTime\":1644375569000,\"phone\":\"13566557788\",\"status\":\"0\",\"visitorId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-21 19:59:02');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_zone', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:16:52');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分区代码\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"状态（0正常 1停用）\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志（0代表存在 2代表删除）\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:19:08');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":800,\"menuName\":\"客户关系\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"crm\",\"children\":[],\"createTime\":1647788069000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:23:38');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":100,\"menuName\":\"农场规划\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"partition\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:25:15');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分区代码\",\"updateTime\":1648120748000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"updateTime\":1648120748000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"状态（0正常 1停用）\",\"isQuery\":\"1\",\"updateTime\":1648120748000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志（0代表存在 2代表删除）\",\"updateTime\":1648120748000,\"sort\":4,\"list\":false,\"params', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:26:36');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648121196000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"分区名称\",\"updateTime\":1648121196000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":false,\"columnComment\":\"状态\",\"updateTime\":1648121196000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志\",\"updateTime\":1648121196000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"St', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:28:11');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-24 19:28:26');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648121291000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"updateTime\":1648121291000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":false,\"columnComment\":\"状态\",\"updateTime\":1648121291000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志\",\"updateTime\":1648121291000,\"sort\":4,\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:42:27');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-24 19:42:32');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648122147000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"updateTime\":1648122147000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":false,\"columnComment\":\"状态\",\"updateTime\":1648122147000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志\",\"updateTime\":1648122147000,\"sort\":4,\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:51:31');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648122690000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"updateTime\":1648122690000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":false,\"columnComment\":\"状态\",\"updateTime\":1648122690000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志\",\"updateTime\":1648122690000,\"sort\":4,\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:51:44');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648122704000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"updateTime\":1648122704000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":false,\"columnComment\":\"状态\",\"updateTime\":1648122704000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"status\"},{\"capJavaField\":\"DelFlag\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标志\",\"updateTime\":1648122704000,\"sort\":4,\"lis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 19:52:31');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-24 19:52:57');
INSERT INTO `sys_oper_log` VALUES (124, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"updateTime\":1648123463329,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:04:23');
INSERT INTO `sys_oper_log` VALUES (125, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"updateTime\":1648123523993,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:05:24');
INSERT INTO `sys_oper_log` VALUES (126, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"ddd\",\"name\":\"aaaa\",\"updateTime\":1648124166119,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:16:06');
INSERT INTO `sys_oper_log` VALUES (127, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"updateTime\":1648124328632,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:18:48');
INSERT INTO `sys_oper_log` VALUES (128, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"updateTime\":1648124349586,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:19:09');
INSERT INTO `sys_oper_log` VALUES (129, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"remark\":\"工\",\"updateTime\":1648124352414,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:19:12');
INSERT INTO `sys_oper_log` VALUES (130, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"remark\":\"工\",\"updateTime\":1648124559938,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:22:39');
INSERT INTO `sys_oper_log` VALUES (131, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"de\",\"name\":\"ab\",\"remark\":\"\",\"updateTime\":1648124609181,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:23:29');
INSERT INTO `sys_oper_log` VALUES (132, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"aaa\",\"name\":\"bbb\",\"remark\":\"ccc\",\"updateTime\":1648124849455,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:27:29');
INSERT INTO `sys_oper_log` VALUES (133, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"def\",\"name\":\"默认分区\",\"remark\":\"\",\"updateTime\":1648124962243,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:29:22');
INSERT INTO `sys_oper_log` VALUES (134, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"def\",\"name\":\"默认分区\",\"remark\":\"\",\"updateTime\":1648125332219,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:35:32');
INSERT INTO `sys_oper_log` VALUES (135, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"remark\":\"\",\"updateTime\":1648125349340,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:35:49');
INSERT INTO `sys_oper_log` VALUES (136, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"默认分区\",\"remark\":\"\",\"updateTime\":1648125527827,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:38:47');
INSERT INTO `sys_oper_log` VALUES (137, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"aaa\",\"remark\":\"\",\"updateTime\":1648126773203,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 20:59:33');
INSERT INTO `sys_oper_log` VALUES (138, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"aaa\",\"remark\":\"\",\"updateTime\":1648126869508,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:01:09');
INSERT INTO `sys_oper_log` VALUES (139, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"aa\",\"name\":\"bb\",\"remark\":\"cc\",\"updateTime\":1648127195588,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:06:35');
INSERT INTO `sys_oper_log` VALUES (140, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"code\":\"default\",\"updateBy\":\"\",\"name\":\"默认分区\",\"remark\":\"\",\"updateTime\":1648127356508,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:09:16');
INSERT INTO `sys_oper_log` VALUES (141, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"aaa\",\"name\":\"ccc\",\"remark\":\"sss\",\"updateTime\":1648127442369,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:10:42');
INSERT INTO `sys_oper_log` VALUES (142, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"aaa\",\"name\":\"ccc\",\"remark\":\"sss\",\"updateTime\":1648127474784,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:11:14');
INSERT INTO `sys_oper_log` VALUES (143, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"aaa\",\"name\":\"ccc\",\"remark\":\"sss\",\"updateTime\":1648127493363,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:11:33');
INSERT INTO `sys_oper_log` VALUES (144, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"name\":\"ccc\",\"remark\":\"sss\",\"updateTime\":1648127553034,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:12:33');
INSERT INTO `sys_oper_log` VALUES (145, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"code\":\"default\",\"updateBy\":\"\",\"name\":\"默认农场\",\"remark\":\"高级版支持农场多分区\",\"updateTime\":1648127585833,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:13:05');
INSERT INTO `sys_oper_log` VALUES (146, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"code\":\"default\",\"updateBy\":\"\",\"name\":\"默认农场\",\"remark\":\"基础版只支持一个农场分区\",\"updateTime\":1648127790275,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:16:30');
INSERT INTO `sys_oper_log` VALUES (147, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"02\",\"name\":\"二号农场\",\"remark\":\"\",\"updateTime\":1648128073890,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:21:13');
INSERT INTO `sys_oper_log` VALUES (148, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"22\",\"name\":\"222\",\"remark\":\"\",\"updateTime\":1648128202904,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:23:22');
INSERT INTO `sys_oper_log` VALUES (149, '农场分区', 2, 'com.jlt.csa.controller.ZoneController.edit()', 'PUT', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"22\",\"name\":\"222\",\"remark\":\"\",\"updateTime\":1648128207228,\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 21:23:27');
INSERT INTO `sys_oper_log` VALUES (150, '农场分区', 1, 'com.jlt.csa.controller.ZoneController.add()', 'POST', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"aaa\",\"createTime\":1648128268740,\"name\":\"bbb\",\"remark\":\"\",\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:24:28');
INSERT INTO `sys_oper_log` VALUES (151, '农场分区', 3, 'com.jlt.csa.controller.ZoneController.remove()', 'DELETE', 1, 'admin', NULL, '/csa/zone/aaa', '127.0.0.1', '内网IP', '{codes=aaa}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:24:34');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":1,\"menuName\":\"农场分区\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"zone\",\"component\":\"csa/zone/index\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"csa:zone:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 21:27:46');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_garden', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:23:32');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648131812000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648131812000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"code\"},{\"capJavaField\":\"ZoneCode\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"zoneCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648131812000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zone_code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:24:58');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1648131897000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648131812000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地编号\",\"isQuery\":\"1\",\"updateTime\":1648131897000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648131812000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"code\"},{\"capJavaField\":\"ZoneCode\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"zoneCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648131897000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648131812000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zone_code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地名称\",\"isQuery\":\"1\",\"updateTime\":1648131898000,\"sort\":4,\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:28:49');
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-24 22:28:54');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":1,\"menuName\":\"菜地划分\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"garden\",\"component\":\"partition/garden/index\",\"children\":[],\"createTime\":1648132232000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2009,\"menuType\":\"C\",\"perms\":\"partition:garden:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:31:25');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":1,\"menuName\":\"菜地划分\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"garden\",\"component\":\"csa/garden/index\",\"children\":[],\"createTime\":1648132232000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2009,\"menuType\":\"C\",\"perms\":\"csa:garden:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:38:09');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"菜地划分查询\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648132232000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2010,\"menuType\":\"F\",\"perms\":\"csa:garden:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:38:15');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"菜地划分新增\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648132232000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2011,\"menuType\":\"F\",\"perms\":\"csa:garden:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:38:22');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"菜地划分修改\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648132232000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"F\",\"perms\":\"csa:garden:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:38:28');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"菜地划分删除\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648132232000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2013,\"menuType\":\"F\",\"perms\":\"csa:garden:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:38:33');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"菜地划分导出\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648132233000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"F\",\"perms\":\"csa:garden:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:38:38');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1648132129000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648131812000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地编号\",\"isQuery\":\"1\",\"updateTime\":1648132129000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648131812000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"code\"},{\"capJavaField\":\"ZoneCode\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"zoneCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区代码\",\"isQuery\":\"1\",\"updateTime\":1648132129000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648131812000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zone_code\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地名称\",\"isQuery\":\"1\",\"updateTime\":1648132129000,\"sort\":4,\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-24 22:39:04');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-24 22:39:11');
INSERT INTO `sys_oper_log` VALUES (166, '菜地划分', 1, 'com.jlt.csa.controller.GardenController.add()', 'POST', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"m2\":30,\"params\":{},\"createTime\":1648133319383,\"name\":\"悠然菜园\",\"zoneCode\":\"default\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Projects\\私家农场\\Private-Farm\\private-farm\\target\\classes\\mapper\\csa\\GardenMapper.xml]\r\n### The error may involve com.jlt.csa.mapper.GardenMapper.insertGarden-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csa_garden          ( code,             zone_code,             name,             m2,                                                                                                                     status,                                       create_time )           values ( ?,             ?,             ?,             ?,                                                                                                                     ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-03-24 22:48:39');
INSERT INTO `sys_oper_log` VALUES (167, '菜地划分', 1, 'com.jlt.csa.controller.GardenController.add()', 'POST', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"m2\":30,\"params\":{},\"createTime\":1648133324236,\"name\":\"悠然菜园\",\"zoneCode\":\"default\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Projects\\私家农场\\Private-Farm\\private-farm\\target\\classes\\mapper\\csa\\GardenMapper.xml]\r\n### The error may involve com.jlt.csa.mapper.GardenMapper.insertGarden-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csa_garden          ( code,             zone_code,             name,             m2,                                                                                                                     status,                                       create_time )           values ( ?,             ?,             ?,             ?,                                                                                                                     ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-03-24 22:48:44');
INSERT INTO `sys_oper_log` VALUES (168, '菜地划分', 1, 'com.jlt.csa.controller.GardenController.add()', 'POST', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"m2\":30,\"params\":{},\"createTime\":1648133328047,\"name\":\"悠然菜园\",\"zoneCode\":\"default\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Projects\\私家农场\\Private-Farm\\private-farm\\target\\classes\\mapper\\csa\\GardenMapper.xml]\r\n### The error may involve com.jlt.csa.mapper.GardenMapper.insertGarden-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csa_garden          ( code,             zone_code,             name,             m2,                                                                                                                     status,                                       create_time )           values ( ?,             ?,             ?,             ?,                                                                                                                     ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-03-24 22:48:48');
INSERT INTO `sys_oper_log` VALUES (169, '菜地划分', 1, 'com.jlt.csa.controller.GardenController.add()', 'POST', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"m2\":30,\"params\":{},\"createTime\":1648207838236,\"name\":\"百草园\",\"zoneCode\":\"default\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Projects\\私家农场\\Private-Farm\\private-farm\\target\\classes\\mapper\\csa\\GardenMapper.xml]\r\n### The error may involve com.jlt.csa.mapper.GardenMapper.insertGarden-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csa_garden          ( code,             zone_code,             name,             m2,                                                                                                                     status,                                       create_time )           values ( ?,             ?,             ?,             ?,                                                                                                                     ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-03-25 19:30:38');
INSERT INTO `sys_oper_log` VALUES (170, '菜地划分', 1, 'com.jlt.csa.controller.GardenController.add()', 'POST', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"m2\":30,\"params\":{},\"createTime\":1648207911892,\"name\":\"百草园\",\"zoneCode\":\"default\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 19:31:52');
INSERT INTO `sys_oper_log` VALUES (171, '菜地划分', 1, 'com.jlt.csa.controller.GardenController.add()', 'POST', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8002\",\"m2\":30,\"params\":{},\"createTime\":1648208014251,\"name\":\"香草居\",\"zoneCode\":\"default\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 19:33:34');
INSERT INTO `sys_oper_log` VALUES (172, '菜地划分', 2, 'com.jlt.csa.controller.GardenController.edit()', 'PUT', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"coins\":0,\"m2\":30,\"updateTime\":1648208075337,\"delFlag\":\"0\",\"params\":{},\"isFarming\":\"0\",\"createBy\":\"\",\"createTime\":1648207912000,\"updateBy\":\"\",\"isSelled\":\"0\",\"name\":\"百草花园\",\"id\":1,\"zoneCode\":\"default\",\"isCompleted\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 19:34:35');
INSERT INTO `sys_oper_log` VALUES (173, '菜地划分', 2, 'com.jlt.csa.controller.GardenController.edit()', 'PUT', 1, 'admin', NULL, '/csa/garden', '127.0.0.1', '内网IP', '{\"code\":\"8001\",\"coins\":0,\"m2\":30,\"updateTime\":1648208090943,\"delFlag\":\"0\",\"params\":{},\"isFarming\":\"0\",\"createBy\":\"\",\"createTime\":1648207912000,\"updateBy\":\"\",\"isSelled\":\"0\",\"name\":\"百草园\",\"id\":1,\"zoneCode\":\"default\",\"isCompleted\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 19:34:51');
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files,csa_crop_phase', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 21:57:14');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3,4', '127.0.0.1', '内网IP', '{tableIds=3,4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:02:40');
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files,csa_crop_phase', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:02:50');
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5,6', '127.0.0.1', '内网IP', '{tableIds=5,6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:04:14');
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:05:23');
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:07:39');
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:07:49');
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{tableIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:10:54');
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:11:00');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{tableIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:11:49');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:12:35');
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/10', '127.0.0.1', '内网IP', '{tableIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:15:02');
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:15:06');
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/11', '127.0.0.1', '内网IP', '{tableIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:19:50');
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:19:59');
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/12', '127.0.0.1', '内网IP', '{tableIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:20:54');
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_files', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:20:58');
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":150,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"作物档案id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648218058000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":151,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"作物名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648218058000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"PlantGuide\",\"usableColumn\":false,\"columnId\":152,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"plantGuide\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"种植指南\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1024)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648218058000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"plant_guide\"},{\"capJavaField\":\"Picture\",\"usableColumn\":false,\"columnId\":153,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"picture\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"代表图片\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:23:53');
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-25 22:24:08');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"作物档案\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"cropfiles\",\"component\":\"csa/cropfiles/index\",\"children\":[],\"createTime\":1648218359000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"C\",\"perms\":\"csa:cropfiles:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:30:56');
INSERT INTO `sys_oper_log` VALUES (194, '作物档案', 1, 'com.jlt.csa.controller.CropFilesController.add()', 'POST', 1, 'admin', NULL, '/csa/cropfiles', '127.0.0.1', '内网IP', '{\"delFlag\":\"0\",\"params\":{},\"createTime\":1648218814107,\"name\":\"辣椒\",\"id\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:33:34');
INSERT INTO `sys_oper_log` VALUES (195, '作物档案', 2, 'com.jlt.csa.controller.CropFilesController.edit()', 'PUT', 1, 'admin', NULL, '/csa/cropfiles', '127.0.0.1', '内网IP', '{\"updateTime\":1648218821974,\"delFlag\":\"0\",\"params\":{},\"createBy\":\"\",\"createTime\":1648218814000,\"updateBy\":\"\",\"name\":\"辣椒\",\"id\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:33:42');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":200,\"menuName\":\"农场会员\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:43:43');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":1000,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1647783926000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 22:44:18');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_crop_phase', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 10:44:00');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":162,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"阶段id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648262640000,\"tableId\":14,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"CropId\",\"usableColumn\":false,\"columnId\":163,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cropId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"作物id\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648262640000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"crop_id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":164,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"阶段名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648262640000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Production\",\"usableColumn\":false,\"columnId\":165,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"production\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"产出\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"create', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 10:45:52');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-26 11:20:56');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":200,\"menuName\":\"会员服务\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"children\":[],\"createTime\":1648219423000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 14:33:42');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_farmer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 14:34:03');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"会员id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648276443000,\"tableId\":15,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"会员姓名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648276443000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Gender\",\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"gender\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"性别\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648276443000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"gender\"},{\"capJavaField\":\"Coins\",\"usableColumn\":false,\"columnId\":177,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coins\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"金币余额\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"decimal(19,4) unsigned zerofill\",\"createBy\":\"admin\",\"isPk\":\"0\",\"creat', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 14:39:13');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/csa_farmer', '127.0.0.1', '内网IP', '{tableName=csa_farmer}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 14:39:22');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"会员id\",\"updateTime\":1648276762000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648276443000,\"tableId\":15,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"会员姓名\",\"isQuery\":\"1\",\"updateTime\":1648276762000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648276443000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Gender\",\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"gender\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"性别\",\"updateTime\":1648276762000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648276443000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"gender\"},{\"capJavaField\":\"Coins\",\"usableColumn\":false,\"columnId\":177,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"coins\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"金币余额\",\"updateTime\":1648276762000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"decimal(19,4) unsigned zerofill', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 14:40:49');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-26 14:44:55');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_member_card', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 16:11:17');
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"卡id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648282277000,\"tableId\":16,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Cardno\",\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cardno\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"卡号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648282277000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"cardno\"},{\"capJavaField\":\"Passwd\",\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"passwd\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"密码\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648282277000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"passwd\"},{\"capJavaField\":\"ActivationValidity\",\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activationValidity\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"激活有效期\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"d', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 16:12:33');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":400,\"menuName\":\"卡务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"card\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 16:14:39');
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"卡id\",\"updateTime\":1648282353000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648282277000,\"tableId\":16,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Cardno\",\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cardno\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"卡号\",\"isQuery\":\"1\",\"updateTime\":1648282353000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648282277000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"cardno\"},{\"capJavaField\":\"Passwd\",\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"passwd\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"密码\",\"updateTime\":1648282353000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648282277000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"passwd\"},{\"capJavaField\":\"ActivationValidity\",\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activationValidity\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":false,\"columnComment\":\"激活有效期\",\"updateTime\":1648282353000,\"sort\":4,\"lis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 16:18:43');
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"卡id\",\"updateTime\":1648282723000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648282277000,\"tableId\":16,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Cardno\",\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cardno\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"卡号\",\"isQuery\":\"1\",\"updateTime\":1648282723000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648282277000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"cardno\"},{\"capJavaField\":\"Passwd\",\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"passwd\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"密码\",\"updateTime\":1648282723000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648282277000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"passwd\"},{\"capJavaField\":\"ActivationValidity\",\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activationValidity\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":false,\"columnComment\":\"激活有效期\",\"updateTime\":1648282723000,\"sort\":4,\"lis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 16:21:07');
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-26 16:21:12');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'csa_garden_strain,csa_tend_task,csa_pick_detail,csa_garden_log,csa_garden_log_attach,csa_arched_record,csa_coin_record,csa_communicate_record', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 17:59:21');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":289,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"菜地品种id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":22,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":290,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":22,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"TaskId\",\"usableColumn\":false,\"columnId\":291,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"taskId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"种植任务\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":22,\"pk\":false,\"columnName\":\"task_id\"},{\"capJavaField\":\"CropId\",\"usableColumn\":false,\"columnId\":292,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cropId\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"作物id\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"isEdit\":\"1\",\"tabl', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:02:35');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:02:52');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":321,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"任务id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":24,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":322,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"TaskType\",\"usableColumn\":false,\"columnId\":323,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"taskType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"任务类型\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"task_type\"},{\"capJavaField\":\"TaskSubtype\",\"usableColumn\":false,\"columnId\":324,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"taskSubtype\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"任务子类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:09:57');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":321,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"任务id\",\"updateTime\":1648375797000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":24,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":322,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"updateTime\":1648375797000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":24,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"TaskType\",\"usableColumn\":false,\"columnId\":323,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"taskType\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"任务类型\",\"isQuery\":\"1\",\"updateTime\":1648375797000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":24,\"pk\":false,\"columnName\":\"task_type\"},{\"capJavaField\":\"TaskSubtype\",\"usableColumn\":false,\"columnId\":324,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"taskSubtype\",\"htmlType\":\"select\",\"edit\":false,\"query\":false,\"columnComment\":\"任务子类型\",\"updateTime\":1648375797000,\"sort\":4,\"list\":false,\"params\":{},\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:12:16');
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:12:34');
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/csa_coin_record', '127.0.0.1', '内网IP', '{tableName=csa_coin_record}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:16:32');
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":227,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"任务id\",\"updateTime\":1648376192000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":228,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"updateTime\":1648376192000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"OpId\",\"usableColumn\":false,\"columnId\":229,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"业务id\",\"isQuery\":\"1\",\"updateTime\":1648376192000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"op_id\"},{\"capJavaField\":\"OpType\",\"usableColumn\":false,\"columnId\":230,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"updateTime\":1648376192000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:16:53');
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":309,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"采摘明细id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":23,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"TaskId\",\"usableColumn\":false,\"columnId\":310,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"taskId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"任务id\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":23,\"pk\":false,\"columnName\":\"task_id\"},{\"capJavaField\":\"StrainId\",\"usableColumn\":false,\"columnId\":311,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"strainId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"菜地品种id\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":23,\"pk\":false,\"columnName\":\"strain_id\"},{\"capJavaField\":\"PlanWeight\",\"usableColumn\":false,\"columnId\":312,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"planWeight\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"计划重量\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"decimal(19,4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"isEdit\":\"1\",\"table', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:19:02');
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:21:00');
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":274,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"附件id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":21,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"LogId\",\"usableColumn\":false,\"columnId\":275,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"logId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地日志\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":21,\"pk\":false,\"columnName\":\"log_id\"},{\"capJavaField\":\"AttachType\",\"usableColumn\":false,\"columnId\":276,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attachType\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"附件类型\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":21,\"pk\":false,\"columnName\":\"attach_type\"},{\"capJavaField\":\"Filename\",\"usableColumn\":false,\"columnId\":277,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"filename\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"文件名\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:24:28');
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:25:47');
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":259,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"菜地日志id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":20,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":260,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":20,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":261,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":20,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"TaskId\",\"usableColumn\":false,\"columnId\":262,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"taskId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"种植任务\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:30:25');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:30:30');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":227,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"任务id\",\"updateTime\":1648376213000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":228,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"updateTime\":1648376213000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"OpId\",\"usableColumn\":false,\"columnId\":229,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"业务id\",\"updateTime\":1648376213000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":false,\"columnName\":\"op_id\"},{\"capJavaField\":\"OpType\",\"usableColumn\":false,\"columnId\":230,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opType\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"updateTime\":1648376213000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:34:11');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:34:38');
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":242,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"沟通日志记录id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":19,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":243,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":19,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":244,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":19,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"Recorder\",\"usableColumn\":false,\"columnId\":245,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"recorder\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"发布人\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:40:32');
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:40:41');
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":212,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"菜地日志id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":213,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":214,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"YearNo\",\"usableColumn\":false,\"columnId\":215,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"yearNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"对应年份\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"create', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:45:43');
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 18:45:52');
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":227,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"任务id\",\"updateTime\":1648377251000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":228,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"updateTime\":1648377251000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"OpId\",\"usableColumn\":false,\"columnId\":229,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"业务id\",\"updateTime\":1648377251000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":false,\"columnName\":\"op_id\"},{\"capJavaField\":\"OpType\",\"usableColumn\":false,\"columnId\":230,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opType\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"updateTime\":1648377251000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:59:53');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":227,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"记录id\",\"updateTime\":1648378792000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":228,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"updateTime\":1648378792000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"OpId\",\"usableColumn\":false,\"columnId\":229,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"业务id\",\"updateTime\":1648378792000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":18,\"pk\":false,\"columnName\":\"op_id\"},{\"capJavaField\":\"OpType\",\"usableColumn\":false,\"columnId\":230,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"opType\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"updateTime\":1648378792000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:00:08');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"radio\",\"orderNum\":1,\"menuName\":\"金币记录\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"coinrecord\",\"component\":\"csa/coinrecord/index\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2065,\"menuType\":\"C\",\"perms\":\"csa:coinrecord:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:02:00');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"打理任务查询\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2066,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:02:23');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"打理任务新增\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2067,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:02:34');
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"打理任务修改\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2068,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:02:44');
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"打理任务删除\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2069,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:02:57');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"打理任务导出\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2070,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:03:17');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"金币任务查询\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2066,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:03:31');
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"金币记录查询\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2066,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:03:49');
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"金币记录新增\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2067,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:03:56');
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"金币记录修改\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2068,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:04:04');
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"金币记录删除\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2069,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:04:13');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"金币记录导出\",\"params\":{},\"parentId\":2065,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377332000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2070,\"menuType\":\"F\",\"perms\":\"csa:coinrecord:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:04:22');
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 19:06:57');
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":212,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"拱棚使用记录id\",\"updateTime\":1648377942000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":213,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"updateTime\":1648377942000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":214,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"updateTime\":1648377942000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"YearNo\",\"usableColumn\":false,\"columnId\":215,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"yearNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"对应年份\",\"isQuery\":\"1\",\"updateTime\":1648377942000,\"sort\":4,\"list\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:17:51');
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 19:18:07');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":212,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"拱棚使用记录id\",\"updateTime\":1648379870000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":213,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员id\",\"isQuery\":\"1\",\"updateTime\":1648379870000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":214,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"updateTime\":1648379870000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":17,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"YearNo\",\"usableColumn\":false,\"columnId\":215,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"yearNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"对应年份\",\"isQuery\":\"1\",\"updateTime\":1648379870000,\"sort\":4,\"list\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:23:55');
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 19:25:47');
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"JiaLeitao\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":242,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"沟通日志记录id\",\"updateTime\":1648377632000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648375161000,\"tableId\":19,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"MemberId\",\"usableColumn\":false,\"columnId\":243,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memberId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"会员\",\"isQuery\":\"1\",\"updateTime\":1648377632000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":19,\"pk\":false,\"columnName\":\"member_id\"},{\"capJavaField\":\"GardenId\",\"usableColumn\":false,\"columnId\":244,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"gardenId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"菜地id\",\"isQuery\":\"1\",\"updateTime\":1648377632000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648375161000,\"tableId\":19,\"pk\":false,\"columnName\":\"garden_id\"},{\"capJavaField\":\"Recorder\",\"usableColumn\":false,\"columnId\":245,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"recorder\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"发布人\",\"isQuery\":\"1\",\"updateTime\":1648377632000,\"sort\":4,\"l', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:51:05');
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 19:52:40');
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"沟通记录\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"commrecord\",\"component\":\"csa/commrecord/index\",\"children\":[],\"createTime\":1648377819000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2071,\"menuType\":\"C\",\"perms\":\"csa:commrecord:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:56:01');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"沟通记录查询\",\"params\":{},\"parentId\":2071,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377819000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2072,\"menuType\":\"F\",\"perms\":\"csa:commrecord:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:56:11');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"沟通记录新增\",\"params\":{},\"parentId\":2071,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377819000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"F\",\"perms\":\"csa:commrecord:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:56:22');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"沟通记录修改\",\"params\":{},\"parentId\":2071,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377819000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"F\",\"perms\":\"csa:commrecord:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:56:32');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"沟通记录删除\",\"params\":{},\"parentId\":2071,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377819000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2075,\"menuType\":\"F\",\"perms\":\"csa:commrecord:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:56:42');
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"沟通记录导出\",\"params\":{},\"parentId\":2071,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377819000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2076,\"menuType\":\"F\",\"perms\":\"csa:commrecord:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:56:53');
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"拱棚使用记录\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"archedrecord\",\"component\":\"csa/archedrecord/index\",\"children\":[],\"createTime\":1648377997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2077,\"menuType\":\"C\",\"perms\":\"csa:archedrecord:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:57:28');
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"拱棚使用记录查询\",\"params\":{},\"parentId\":2077,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2078,\"menuType\":\"F\",\"perms\":\"csa:archedrecord:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:57:37');
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"拱棚使用记录新增\",\"params\":{},\"parentId\":2077,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2079,\"menuType\":\"F\",\"perms\":\"csa:archedrecord:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:57:48');
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"拱棚使用记录修改\",\"params\":{},\"parentId\":2077,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"F\",\"perms\":\"csa:archedrecord:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:57:57');
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"拱棚使用记录删除\",\"params\":{},\"parentId\":2077,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2081,\"menuType\":\"F\",\"perms\":\"csa:archedrecord:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:58:07');
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"拱棚使用记录导出\",\"params\":{},\"parentId\":2077,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648377997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2082,\"menuType\":\"F\",\"perms\":\"csa:archedrecord:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:58:16');
INSERT INTO `sys_oper_log` VALUES (266, '农场分区', 1, 'com.jlt.csa.controller.ZoneController.add()', 'POST', 1, 'admin', NULL, '/csa/zone', '127.0.0.1', '内网IP', '{\"code\":\"default\",\"createTime\":1648384763404,\"name\":\"aaa\",\"remark\":\"aa\",\"delFlag\":\"0\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'default\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\Projects\\私家农场\\Private-Farm\\private-farm\\target\\classes\\mapper\\csa\\ZoneMapper.xml]\r\n### The error may involve com.jlt.csa.mapper.ZoneMapper.insertZone-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into csa_zone          ( code,             name,             status,             del_flag,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'default\' for key \'PRIMARY\'\n; Duplicate entry \'default\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'default\' for key \'PRIMARY\'', '2022-03-27 20:39:23');
INSERT INTO `sys_oper_log` VALUES (267, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/csa_zone', '127.0.0.1', '内网IP', '{tableName=csa_zone}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:47:51');
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"郏磊涛\",\"columns\":[{\"capJavaField\":\"Code\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"code\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分区代码\",\"updateTime\":1648385270000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648120612000,\"tableId\":1,\"pk\":true,\"columnName\":\"code\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":341,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分区类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1648385270000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分区名称\",\"isQuery\":\"1\",\"updateTime\":1648385270000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648120612000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Status\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"status\",\"htmlType\":\"radio\",\"edit\":true,\"query\":true,\"columnComment\":\"状态（0正常 1停用）\",\"isQuery\":\"1\",\"updateTime\":1648385270000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:49:39');
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 20:49:51');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":1,\"menuName\":\"农场分区\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"farmzone\",\"component\":\"csa/farmzone/index\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"csa:farmzone:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:53:05');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"农场分区查询\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"F\",\"perms\":\"csa:farmzone:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:53:25');
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"农场分区新增\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"F\",\"perms\":\"csa:farmzone:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:53:34');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"农场分区修改\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"F\",\"perms\":\"csa:farmzone:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:53:41');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"农场分区删除\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"F\",\"perms\":\"csa:farmzone:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:53:50');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":5,\"menuName\":\"农场分区导出\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648121692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"F\",\"perms\":\"csa:farmzone:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 20:53:57');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":60,\"menuName\":\"业务字典\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"csa/dict\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:02:03');
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":60,\"menuName\":\"业务字典\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"csa/dict/index\",\"children\":[],\"createTime\":1648389723000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:02:45');
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":60,\"menuName\":\"业务字典\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"csa/dict/index\",\"children\":[],\"createTime\":1648389723000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:02:58');
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":60,\"menuName\":\"业务字典\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"csadict\",\"component\":\"csa/dict/index\",\"children\":[],\"createTime\":1648389723000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"C\",\"perms\":\"system:dict:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:04:19');
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":10,\"menuName\":\"字典查询\",\"params\":{},\"parentId\":2083,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dict:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:05:26');
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":20,\"menuName\":\"字典新增\",\"params\":{},\"parentId\":2083,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dict:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:05:52');
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":30,\"menuName\":\"字典修改\",\"params\":{},\"parentId\":2083,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dict:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:06:12');
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":40,\"menuName\":\"字典删除\",\"params\":{},\"parentId\":2083,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dict:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:06:33');
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":50,\"menuName\":\"字典导出\",\"params\":{},\"parentId\":2083,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:dict:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:07:00');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-03-20 21:45:26', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-03-20 21:45:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-03-20 21:45:26', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-03-20 21:45:26', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-27 21:58:48', 'admin', '2022-03-20 21:45:25', '', '2022-03-27 21:58:47', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-20 21:45:25', 'admin', '2022-03-20 21:45:25', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
