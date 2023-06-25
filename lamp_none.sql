/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 127.0.0.1:3306
 Source Schema         : lamp_none

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 25/06/2023 17:15:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历 \n@Echo(api = \"orderServiceImpl\", dictType = DictionaryType.EDUCATION)',
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '民族 \n@Echo(api = DICTIONARY_ITEM_FEIGN_CLASS, dictType = DictionaryType.NATION)',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织ID \n#c_org@Echo(api = ORG_ID_FEIGN_CLASS)',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_product
-- ----------------------------
DROP TABLE IF EXISTS `b_product`;
CREATE TABLE `b_product`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `stock` int(10) NOT NULL COMMENT '库存',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `type_` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品类型 \n#ProductType{ordinary:普通;gift:赠品}',
  `type2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品类型2 \n#{ordinary:普通;gift:赠品;}',
  `type3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历 \n@Echo(api = DICTIONARY_ITEM_FEIGN_CLASS, dictType = DictionaryType.EDUCATION)',
  `state` bit(1) DEFAULT NULL COMMENT '状态',
  `test4` tinyint(3) DEFAULT NULL COMMENT '测试',
  `test5` date DEFAULT NULL COMMENT '时间',
  `test6` datetime(0) DEFAULT NULL COMMENT '日期',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `sort_value` int(10) DEFAULT NULL COMMENT '排序',
  `test7` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '测试字段 \n@InjectionField(api = \"userApi\") RemoteData<Long, String>',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户 \n@Echo(api = USER_ID_FEIGN_CLASS)',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织 \n@Echo(api = ORG_ID_FEIGN_CLASS)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_appendix
-- ----------------------------
DROP TABLE IF EXISTS `c_appendix`;
CREATE TABLE `c_appendix`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `biz_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '业务id',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型',
  `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '桶',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件相对地址',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '原始文件名',
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件类型',
  `size_` bigint(20) DEFAULT 0 COMMENT '大小',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后修改时间',
  `updated_by` bigint(20) NOT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_application
-- ----------------------------
DROP TABLE IF EXISTS `c_application`;
CREATE TABLE `c_application`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `client_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '客户端ID',
  `client_secret` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '客户端密码',
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '官网',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '应用图标',
  `app_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '类型 \n#{SERVER:服务应用;APP:手机应用;PC:PC网页应用;WAP:手机网页应用}',
  `describe_` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_client_id`(`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_application
-- ----------------------------
INSERT INTO `c_application` VALUES (1, 'lamp_web_plus', 'lamp_web_plus_secret', 'https://tangyh.top', 'lamp快速开发平台', NULL, 'PC', '内置', b'1', 1, '2020-04-02 15:05:14', 1, '2020-04-02 15:05:17');
INSERT INTO `c_application` VALUES (2, 'lamp_web', 'lamp_web_secret', 'https://tangyh.top', 'lamp快速开发平台', NULL, 'PC', '内置', b'1', 1, '2020-04-02 15:05:14', 1, '2020-04-02 15:05:17');

-- ----------------------------
-- Table structure for c_area
-- ----------------------------
DROP TABLE IF EXISTS `c_area`;
CREATE TABLE `c_area`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '全名',
  `sort_value` int(11) DEFAULT 1 COMMENT '排序',
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '维度',
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '行政区级 \n@Echo(api = DICTIONARY_ITEM_CLASS,  dictType = EchoDictType.AREA_LEVEL)',
  `source_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '数据来源',
  `state` bit(1) DEFAULT b'0' COMMENT '状态',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `c_dictionary`;
CREATE TABLE `c_dictionary`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型标签',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `sort_value` int(11) DEFAULT 1 COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '图标',
  `css_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'css样式',
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'css class',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_type_code`(`type`, `code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_dictionary
-- ----------------------------
INSERT INTO `c_dictionary` VALUES (1, 'AREA_LEVEL', '行政区划', '01', '国家', b'1', '', 1, '', '', '', b'1', 3, '2020-01-20 15:12:57', 3, '2020-01-20 15:12:57');
INSERT INTO `c_dictionary` VALUES (2, 'AREA_LEVEL', '行政区划', '02', '省份/直辖市', b'1', '', 2, '', '', '', b'1', 3, '2020-01-20 15:13:45', 3, '2020-01-20 15:13:45');
INSERT INTO `c_dictionary` VALUES (3, 'AREA_LEVEL', '行政区划', '03', '地市', b'1', '', 3, '', '', '', b'1', 3, '2020-01-20 15:14:16', 3, '2020-01-20 15:14:16');
INSERT INTO `c_dictionary` VALUES (4, 'AREA_LEVEL', '行政区划', '04', '区县', b'1', '', 4, '', '', '', b'1', 3, '2020-01-20 15:14:54', 3, '2020-01-20 15:14:54');
INSERT INTO `c_dictionary` VALUES (5, 'AREA_LEVEL', '行政区划', '05', '乡镇', b'1', '', 5, '', '', '', b'1', 3, '2020-03-09 23:33:46', 3, '2020-03-09 23:33:46');
INSERT INTO `c_dictionary` VALUES (10, 'EDUCATION', '学历', '01', '小学', b'1', '', 1, '', '', '', b'1', 3, '2020-03-09 23:34:13', 3, '2020-03-09 23:34:13');
INSERT INTO `c_dictionary` VALUES (11, 'EDUCATION', '学历', '02', '中学', b'1', '', 2, '', '', '', b'1', 3, '2020-03-09 23:34:32', 3, '2020-03-09 23:34:32');
INSERT INTO `c_dictionary` VALUES (12, 'EDUCATION', '学历', '03', '高中', b'1', '', 3, '', '', '', b'1', 3, '2020-03-09 23:34:40', 3, '2020-03-09 23:34:40');
INSERT INTO `c_dictionary` VALUES (13, 'EDUCATION', '学历', '04', '专科', b'1', '', 4, '', '', '', b'1', 1, '2019-06-04 11:36:29', 1, '2019-06-04 11:36:29');
INSERT INTO `c_dictionary` VALUES (14, 'EDUCATION', '学历', '05', '本科', b'1', '', 5, '', '', '', b'1', 1, '2019-06-04 11:36:19', 1, '2019-06-04 11:36:19');
INSERT INTO `c_dictionary` VALUES (15, 'EDUCATION', '学历', '06', '硕士', b'1', '', 6, '', '', '', b'1', 1, '2019-06-04 11:36:29', 1, '2019-06-04 11:36:29');
INSERT INTO `c_dictionary` VALUES (16, 'EDUCATION', '学历', '07', '博士', b'1', '', 7, '', '', '', b'1', 1, '2019-06-04 11:36:29', 1, '2019-06-04 11:36:29');
INSERT INTO `c_dictionary` VALUES (17, 'EDUCATION', '学历', '08', '博士后', b'1', '', 8, '', '', '', b'1', 1, '2019-06-04 11:36:29', 1, '2019-06-04 11:36:29');
INSERT INTO `c_dictionary` VALUES (29, 'EDUCATION', '学历', '20', '其他', b'1', '', 20, '', '', '', b'1', 3, '2020-03-09 23:34:54', 3, '2020-03-09 23:34:54');
INSERT INTO `c_dictionary` VALUES (40, 'ORG_TYPE', '机构类型', '01', '单位', b'1', '', 1, '', '', '', b'1', 1, '2020-11-23 21:13:17', 1, '2020-11-23 21:13:17');
INSERT INTO `c_dictionary` VALUES (41, 'ORG_TYPE', '机构类型', '02', '部门', b'1', '', 2, '', '', '', b'1', 1, '2020-11-23 21:13:17', 1, '2020-11-23 21:13:17');
INSERT INTO `c_dictionary` VALUES (43, 'NATION', '民族', '01', '汉族', b'1', '', 0, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (44, 'NATION', '民族', '02', '壮族', b'1', '', 1, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (45, 'NATION', '民族', '03', '满族', b'1', '', 2, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (46, 'NATION', '民族', '04', '回族', b'1', '', 3, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (47, 'NATION', '民族', '05', '苗族', b'1', '', 4, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (48, 'NATION', '民族', '06', '维吾尔族', b'1', '', 5, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (49, 'NATION', '民族', '07', '土家族', b'1', '', 6, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (50, 'NATION', '民族', '08', '彝族', b'1', '', 7, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (51, 'NATION', '民族', '09', '蒙古族', b'1', '', 8, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (52, 'NATION', '民族', '10', '藏族', b'1', '', 9, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (53, 'NATION', '民族', '11', '布依族', b'1', '', 10, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (54, 'NATION', '民族', '12', '侗族', b'1', '', 11, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (55, 'NATION', '民族', '13', '瑶族', b'1', '', 12, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (56, 'NATION', '民族', '14', '朝鲜族', b'1', '', 13, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (57, 'NATION', '民族', '15', '白族', b'1', '', 14, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (58, 'NATION', '民族', '16', '哈尼族', b'1', '', 15, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (59, 'NATION', '民族', '17', '哈萨克族', b'1', '', 16, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (60, 'NATION', '民族', '18', '黎族', b'1', '', 17, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (61, 'NATION', '民族', '19', '傣族', b'1', '', 18, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (62, 'NATION', '民族', '20', '畲族', b'1', '', 19, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (63, 'NATION', '民族', '21', '傈僳族', b'1', '', 20, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (64, 'NATION', '民族', '22', '仡佬族', b'1', '', 21, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (65, 'NATION', '民族', '23', '东乡族', b'1', '', 22, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (66, 'NATION', '民族', '24', '高山族', b'1', '', 23, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (67, 'NATION', '民族', '25', '拉祜族', b'1', '', 24, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (68, 'NATION', '民族', '26', '水族', b'1', '', 25, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (69, 'NATION', '民族', '27', '佤族', b'1', '', 26, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (70, 'NATION', '民族', '28', '纳西族', b'1', '', 27, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (71, 'NATION', '民族', '29', '羌族', b'1', '', 28, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (72, 'NATION', '民族', '30', '土族', b'1', '', 29, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (73, 'NATION', '民族', '31', '仫佬族', b'1', '', 30, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (74, 'NATION', '民族', '32', '锡伯族', b'1', '', 31, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (75, 'NATION', '民族', '33', '柯尔克孜族', b'1', '', 32, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (76, 'NATION', '民族', '34', '达斡尔族', b'1', '', 33, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (77, 'NATION', '民族', '35', '景颇族', b'1', '', 34, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (78, 'NATION', '民族', '36', '毛南族', b'1', '', 35, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (79, 'NATION', '民族', '37', '撒拉族', b'1', '', 36, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (80, 'NATION', '民族', '38', '塔吉克族', b'1', '', 37, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (81, 'NATION', '民族', '39', '阿昌族', b'1', '', 38, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (82, 'NATION', '民族', '40', '普米族', b'1', '', 39, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (83, 'NATION', '民族', '41', '鄂温克族', b'1', '', 40, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (84, 'NATION', '民族', '42', '怒族', b'1', '', 41, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (85, 'NATION', '民族', '43', '京族', b'1', '', 42, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (86, 'NATION', '民族', '44', '基诺族', b'1', '', 43, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (87, 'NATION', '民族', '45', '德昂族', b'1', '', 44, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (88, 'NATION', '民族', '46', '保安族', b'1', '', 45, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (89, 'NATION', '民族', '47', '俄罗斯族', b'1', '', 46, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (90, 'NATION', '民族', '48', '裕固族', b'1', '', 47, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (91, 'NATION', '民族', '49', '乌兹别克族', b'1', '', 48, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (92, 'NATION', '民族', '50', '门巴族', b'1', '', 49, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (93, 'NATION', '民族', '51', '鄂伦春族', b'1', '', 50, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (94, 'NATION', '民族', '52', '独龙族', b'1', '', 51, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (95, 'NATION', '民族', '53', '塔塔尔族', b'1', '', 52, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (96, 'NATION', '民族', '54', '赫哲族', b'1', '', 53, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (97, 'NATION', '民族', '55', '珞巴族', b'1', '', 54, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (98, 'NATION', '民族', '56', '布朗族', b'1', '', 55, '', '', '', b'1', 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_dictionary` VALUES (99, 'NATION', '民族', '57', '其他', b'1', '', 100, '', '', '', b'1', 3, '2020-03-09 23:38:29', 3, '2020-03-09 23:38:29');
INSERT INTO `c_dictionary` VALUES (110, 'POSITION_STATUS', '职位状态', '01', '在职', b'1', '', 1, '', '', '', b'1', 1, '2019-06-04 11:38:16', 1, '2019-06-04 11:38:16');
INSERT INTO `c_dictionary` VALUES (111, 'POSITION_STATUS', '职位状态', '02', '请假', b'1', '', 2, '', '', '', b'1', 3, '2020-03-09 23:39:30', 3, '2020-03-09 23:39:30');
INSERT INTO `c_dictionary` VALUES (112, 'POSITION_STATUS', '职位状态', '03', '离职', b'1', '', 3, '', '', '', b'1', 1, '2019-06-04 11:38:50', 1, '2019-06-04 11:38:50');
INSERT INTO `c_dictionary` VALUES (1486198107023605760, 'RESOURCE_TYPE', '资源类型', '20', '菜单', b'1', '', 2, '', '', '', b'1', 2, '2022-01-26 12:43:36', 2, '2022-01-26 12:46:58');
INSERT INTO `c_dictionary` VALUES (1486198623417925632, 'RESOURCE_DATA_SCOPE', '数据范围', '01', '全部', b'1', '', 1, '', '', '', b'1', 2, '2022-01-26 12:45:39', 2, '2022-01-26 12:47:45');
INSERT INTO `c_dictionary` VALUES (1486198858865180672, 'ROLE_CATEGORY', '角色类别', '10', '功能角色', b'1', '', 1, '', '', '', b'1', 2, '2022-01-26 12:46:35', 2, '2022-01-26 12:51:54');
INSERT INTO `c_dictionary` VALUES (1486198996287356928, 'RESOURCE_TYPE', '资源类型', '60', '数据', b'1', '', 6, '', '', '', b'1', 2, '2022-01-26 12:47:08', 2, '2022-01-26 12:47:08');
INSERT INTO `c_dictionary` VALUES (1486199651718660096, 'RESOURCE_DATA_SCOPE', '数据范围', '02', '本单位及子级', b'1', '', 2, '', '', '', b'1', 2, '2022-01-26 12:49:44', 2, '2022-01-26 12:49:44');
INSERT INTO `c_dictionary` VALUES (1486199679237488640, 'RESOURCE_DATA_SCOPE', '数据范围', '03', '本单位', b'1', '', 3, '', '', '', b'1', 2, '2022-01-26 12:49:50', 2, '2022-01-26 12:49:50');
INSERT INTO `c_dictionary` VALUES (1486199726792507392, 'RESOURCE_DATA_SCOPE', '数据范围', '04', '本部门及子级', b'1', '', 4, '', '', '', b'1', 2, '2022-01-26 12:50:02', 2, '2022-01-26 12:50:02');
INSERT INTO `c_dictionary` VALUES (1486199753644441600, 'RESOURCE_DATA_SCOPE', '数据范围', '05', '本部门', b'1', '', 5, '', '', '', b'1', 2, '2022-01-26 12:50:08', 2, '2022-01-26 12:50:08');
INSERT INTO `c_dictionary` VALUES (1486199809227358208, 'RESOURCE_DATA_SCOPE', '数据范围', '06', '个人', b'1', '', 6, '', '', '', b'1', 2, '2022-01-26 12:50:21', 2, '2022-01-26 12:50:21');
INSERT INTO `c_dictionary` VALUES (1486199838218387456, 'RESOURCE_DATA_SCOPE', '数据范围', '07', '自定义', b'1', '', 7, '', '', '', b'1', 2, '2022-01-26 12:50:28', 2, '2022-01-26 12:53:23');
INSERT INTO `c_dictionary` VALUES (1486200233623814144, 'ROLE_CATEGORY', '角色类别', '20', '桌面角色', b'1', '', 2, '', '', '', b'1', 2, '2022-01-26 12:52:03', 2, '2022-01-26 12:52:03');
INSERT INTO `c_dictionary` VALUES (1486200358744096768, 'ROLE_CATEGORY', '角色类别', '30', '数据角色', b'1', '', 3, '', '', '', b'1', 2, '2022-01-26 12:52:32', 2, '2022-01-26 12:52:32');

-- ----------------------------
-- Table structure for c_file
-- ----------------------------
DROP TABLE IF EXISTS `c_file`;
CREATE TABLE `c_file`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型',
  `storage_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '存储类型\nLOCAL FAST_DFS MIN_IO ALI \n',
  `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '桶',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件相对地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件访问地址',
  `unique_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '唯一文件名',
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件md5',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '原始文件名',
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件类型',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '后缀',
  `size_` bigint(20) DEFAULT 0 COMMENT '大小',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后修改时间',
  `updated_by` bigint(20) NOT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '增量文件上传日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_file
-- ----------------------------
INSERT INTO `c_file` VALUES (1531859537911349248, 'BASE_FILE', 'DOC', 'LOCAL', 'dev', '0000/BASE_FILE/2022/06/01/0bd3aee387bb49f9b17bd429145cda87.xlsx', 'http://127.0.0.1/file/dev/0000/BASE_FILE/2022/06/01/0bd3aee387bb49f9b17bd429145cda87.xlsx', '0bd3aee387bb49f9b17bd429145cda87.xlsx', NULL, '用户列表.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'xlsx', 13663, '2022-06-01 12:45:49', 2, '2022-06-01 12:45:49', 2);

-- ----------------------------
-- Table structure for c_login_log
-- ----------------------------
DROP TABLE IF EXISTS `c_login_log`;
CREATE TABLE `c_login_log`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `request_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP',
  `user_id` bigint(20) DEFAULT NULL COMMENT '登录人ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录人姓名',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录人账号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录描述',
  `login_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录时间',
  `ua` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器请求头',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器名称',
  `browser_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器版本',
  `operating_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_login_log
-- ----------------------------
INSERT INTO `c_login_log` VALUES (1672885830504415232, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 16:33:57', 2);
INSERT INTO `c_login_log` VALUES (1672887843153772544, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 16:41:57', 2);
INSERT INTO `c_login_log` VALUES (1672888330930356224, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 16:43:54', 2);
INSERT INTO `c_login_log` VALUES (1672890507300175872, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 16:52:32', 2);
INSERT INTO `c_login_log` VALUES (1672891224308056064, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 16:55:23', 2);
INSERT INTO `c_login_log` VALUES (1672891368361426944, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 16:55:58', 2);
INSERT INTO `c_login_log` VALUES (1672892425095348224, '127.0.0.1', 2, '超级管理员', 'lamp', '登录成功', '2023-06-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Chrome', '114.0.0.0', 'Windows 10', '0|0|0|内网IP|内网IP', '2023-06-25 17:00:10', 2);

-- ----------------------------
-- Table structure for c_menu
-- ----------------------------
DROP TABLE IF EXISTS `c_menu`;
CREATE TABLE `c_menu`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `resource_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '[20-菜单 60-数据];\n@Echo(api = DICTIONARY_ITEM_FEIGN_CLASS,dictType = EchoDictType.RESOURCE_TYPE)',
  `tree_grade` int(11) DEFAULT NULL COMMENT '树层级',
  `tree_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '树路径',
  `describe_` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `is_general` bit(1) DEFAULT b'0' COMMENT '通用菜单 \nTrue表示无需分配所有人就可以访问的',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '组件',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `sort_value` int(11) DEFAULT 1 COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单图标',
  `group_` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '分组',
  `data_scope` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据范围;[01-全部 02-本单位及子级 03-本单位 04-本部门 05-本部门及子级 06-个人 07-自定义]',
  `custom_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实现类',
  `is_def` bit(1) DEFAULT b'0' COMMENT '是否默认',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父级菜单ID',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_path`(`path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_menu
-- ----------------------------
INSERT INTO `c_menu` VALUES (30, '组织管理', '20', 0, ',', '', b'0', '/org', 'Layout', b'1', 30, 'ant-design:cluster-outlined', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (40, '资源中心', '20', 0, ',', '', b'0', '/resources', 'Layout', b'1', 40, 'ant-design:cloud-server-outlined', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (60, '系统设置', '20', 0, ',', '', b'0', '/system', 'Layout', b'1', 60, 'ant-design:setting-outlined', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (70, '网关管理', '20', 0, ',', '', b'0', '/gateway', 'Layout', b'1', 70, 'ant-design:sliders-filled', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (80, '开发者管理', '20', 0, ',', '', b'0', '/developer', 'Layout', b'1', 80, 'ant-design:bug-filled', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (90, '了解lamp', '20', 0, ',', '', b'1', '/community', 'Layout', b'1', 90, 'ant-design:github-filled', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (100, '更多功能', '20', 0, ',', '', b'1', '/more', 'Layout', b'1', 100, 'ant-design:appstore-add-outlined', '', NULL, NULL, NULL, 0, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (130, '机构管理', '20', 1, ',30,', '', b'0', '/org/org', 'lamp/org/org/index', b'1', 10, '', '', NULL, NULL, NULL, 30, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (131, '岗位管理', '20', 1, ',30,', '', b'0', '/org/station', 'lamp/org/station/index', b'1', 20, '', '', NULL, NULL, NULL, 30, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (132, '用户管理', '20', 1, ',30,', '', b'0', '/org/user', 'lamp/org/user/index', b'1', 30, '', '', NULL, NULL, NULL, 30, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (140, '消息中心', '20', 1, ',40,', '', b'0', '/resources/msg', 'lamp/resources/msg/index', b'1', 10, '', '', NULL, NULL, NULL, 40, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (141, '短信模版', '20', 1, ',40,', '', b'0', '/resources/smsTemplate', 'lamp/resources/smsTemplate/index', b'1', 20, '', '', NULL, NULL, NULL, 40, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (142, '短信中心', '20', 1, ',40,', '', b'0', '/resources/sms', 'lamp/resources/sms/index', b'1', 30, '', '', NULL, NULL, NULL, 40, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (143, '附件管理', '20', 1, ',40,', '', b'0', '/resources/attachment', 'lamp/resources/attachment/index', b'1', 40, '', '', NULL, NULL, NULL, 40, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (160, '菜单管理', '20', 1, ',60,', '', b'0', '/system/menu', 'lamp/system/menu/index', b'1', 10, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (161, '角色管理', '20', 1, ',60,', '', b'0', '/system/role', 'lamp/system/role/index', b'1', 20, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (162, '字典管理', '20', 1, ',60,', '', b'0', '/system/dictionary', 'lamp/system/dictionary/index', b'1', 30, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (163, '地区管理', '20', 1, ',60,', '', b'0', '/system/area', 'lamp/system/area/index', b'1', 40, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (164, '参数管理', '20', 1, ',60,', '', b'0', '/system/parameter', 'lamp/system/parameter/index', b'1', 50, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (165, '操作日志', '20', 1, ',60,', '', b'0', '/system/optLog', 'lamp/system/optLog/index', b'1', 60, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (166, '登录日志', '20', 1, ',60,', '', b'0', '/system/loginLog', 'lamp/system/loginLog/index', b'1', 70, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (167, '在线用户', '20', 1, ',60,', '', b'0', '/system/online', 'lamp/system/online/index', b'1', 80, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (168, '应用管理', '20', 1, ',60,', '', b'0', '/system/application', 'lamp/system/application/index', b'1', 90, '', '', NULL, NULL, NULL, 60, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (180, '限流规则', '20', 1, ',70,', '', b'0', '/gateway/ratelimiter', 'lamp/gateway/ratelimiter/index', b'1', 10, '', '', NULL, NULL, NULL, 70, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (181, '阻止访问', '20', 1, ',70,', '', b'0', '/gateway/blocklist', 'lamp/gateway/blocklist/index', b'1', 20, '', '', NULL, NULL, NULL, 70, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (190, '定时任务', '20', 1, ',80,', '', b'0', 'http://127.0.0.1:8767/xxl-job-admin', 'Layout', b'1', 10, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (191, '接口文档', '20', 1, ',80,', '', b'0', 'http://127.0.0.1:8760/api/gate/doc.html', 'Layout', b'1', 20, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (192, 'nacos', '20', 1, ',80,', '', b'0', 'http://127.0.0.1:8848/nacos', 'Layout', b'1', 30, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (193, '服务监控', '20', 1, ',80,', '', b'0', 'http://127.0.0.1:8762/lamp-monitor', 'Layout', b'1', 40, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (194, '数据库监控', '20', 1, ',80,', '', b'0', '/developer/db', 'lamp/developer/db/index', b'1', 50, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (195, '缓存监控', '20', 1, ',80,', '', b'0', 'https://github.com/junegunn/redis-stat', 'Layout', b'1', 60, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (196, 'zipkin监控', '20', 1, ',80,', '', b'0', 'http://127.0.0.1:8772/zipkin', 'Layout', b'1', 70, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (197, 'SkyWalking监控', '20', 1, ',80,', '', b'0', 'http://127.0.0.1:12080', 'Layout', b'1', 80, '', '', NULL, NULL, NULL, 80, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (210, '在线文档', '20', 1, ',90,', '', b'1', 'https://www.kancloud.cn/zuihou/zuihou-admin-cloud', 'Layout', b'1', 10, '', '', NULL, NULL, NULL, 90, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (211, '会员版', '20', 1, ',90,', '', b'1', 'https://www.kancloud.cn/zuihou/zuihou-admin-cloud/2003629', 'Layout', b'1', 20, '', '', NULL, NULL, NULL, 90, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (212, '获取源码', '20', 1, ',90,', '', b'1', 'https://github.com/zuihou', 'Layout', b'1', 30, '', '', NULL, NULL, NULL, 90, b'1', 1, '2020-11-23 11:47:31', 2, '2020-12-01 11:34:20');
INSERT INTO `c_menu` VALUES (213, '问题反馈', '20', 1, ',90,', '', b'1', 'https://github.com/zuihou/lamp-cloud/issues', 'Layout', b'1', 40, '', '', NULL, NULL, NULL, 90, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (214, '更新日志', '20', 1, ',90,', '', b'1', 'https://www.kancloud.cn/zuihou/zuihou-admin-cloud/1465302', 'Layout', b'1', 50, '', '', NULL, NULL, NULL, 90, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (215, '蓝图', '20', 1, ',90,', '', b'1', 'https://www.kancloud.cn/zuihou/zuihou-admin-cloud/2003640', 'Layout', b'1', 60, '', '', NULL, NULL, NULL, 90, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (220, '多级菜单', '20', 1, ',100,', '', b'1', '/more/multiMenu', 'Layout', b'1', 1, '', '', NULL, NULL, NULL, 100, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (221, '菜单1-1', '20', 2, ',100,220,', '', b'1', '/more/multiMenu/menu1-1', 'Layout', b'1', 1, '', '', NULL, NULL, NULL, 220, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (222, '菜单1-1-1', '20', 3, ',100,220,221,', '', b'1', '/more/multiMenu/menu1-1/menu1-1-1', 'lamp/more/multiMenu/menu1-1/menu1-1-1/index', b'1', 1, '', '', NULL, NULL, NULL, 221, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (223, '菜单1-1-2', '20', 3, ',100,220,221,', '', b'1', '/more/multiMenu/menu1-1/menu1-1-2', 'lamp/more/multiMenu/menu1-1/menu1-1-2/index', b'1', 2, '', '', NULL, NULL, NULL, 221, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (224, '菜单1-2', '20', 2, ',100,220,', '', b'1', '/more/multiMenu/menu1-2', 'lamp/more/multiMenu/menu1-2/index', b'1', 2, '', '', NULL, NULL, NULL, 220, b'1', 1, '2020-11-23 11:47:31', 1, '2020-11-23 11:47:31');
INSERT INTO `c_menu` VALUES (1486201050779090944, '查看全部', '60', 2, ',30,132,', '', b'0', NULL, NULL, b'1', 1, '', '', '01', NULL, b'0', 132, b'1', 2, '2022-01-26 12:55:17', 2, '2022-01-26 12:55:17');
INSERT INTO `c_menu` VALUES (1486201491877265408, '查看本单位及子单位', '60', 2, ',30,132,', '', b'0', NULL, '', b'1', 2, '', '', '02', NULL, b'0', 132, b'1', 2, '2022-01-26 12:57:03', 2, '2022-01-26 12:57:03');
INSERT INTO `c_menu` VALUES (1486201562119274496, '查看本单位', '60', 2, ',30,132,', '', b'0', NULL, '', b'1', 3, '', '', '06', NULL, b'0', 132, b'1', 2, '2022-01-26 12:57:19', 2, '2022-01-26 12:57:19');
INSERT INTO `c_menu` VALUES (1486201715840516096, '查看本部门及子部门', '60', 2, ',30,132,', '', b'0', NULL, '', b'1', 4, '', '', '04', NULL, b'0', 132, b'1', 2, '2022-01-26 12:57:56', 2, '2022-01-26 12:57:56');
INSERT INTO `c_menu` VALUES (1486201804327747584, '查看本部门', '60', 2, ',30,132,', '', b'0', NULL, '', b'1', 5, '', '', '05', NULL, b'0', 132, b'1', 2, '2022-01-26 12:58:17', 2, '2022-01-26 12:58:17');
INSERT INTO `c_menu` VALUES (1486201872350969856, '查看个人', '60', 2, ',30,132,', '', b'0', NULL, '', b'1', 6, '', '', '06', NULL, b'1', 132, b'1', 2, '2022-01-26 12:58:33', 2, '2022-01-26 12:58:33');
INSERT INTO `c_menu` VALUES (1486201971705643008, '查看自定义数据', '60', 2, ',30,132,', '', b'0', NULL, '', b'1', 7, '', '', '07', 'DATA_SCOPE_MY_TEST', b'0', 132, b'1', 2, '2022-01-26 12:58:57', 2, '2022-01-26 12:59:07');
INSERT INTO `c_menu` VALUES (1486619304207056896, '查看全部', '60', 2, ',30,131,', '', b'0', NULL, '', b'1', 1, '', '', '01', NULL, b'0', 131, b'1', 2, '2022-01-27 16:37:17', 2, '2022-01-27 16:37:17');
INSERT INTO `c_menu` VALUES (1486619392048365568, '查看本单位及子单位', '60', 2, ',30,131,', '', b'0', NULL, '', b'1', 2, '', '', '02', NULL, b'0', 131, b'1', 2, '2022-01-27 16:37:38', 2, '2022-01-27 16:37:38');
INSERT INTO `c_menu` VALUES (1486620313587286016, '查看本单位', '60', 2, ',30,131,', '', b'0', NULL, '', b'1', 3, '', '', '03', NULL, b'0', 131, b'1', 2, '2022-01-27 16:41:17', 2, '2022-01-27 16:41:17');
INSERT INTO `c_menu` VALUES (1486620425789112320, '查看本部门及子部门', '60', 2, ',30,131,', '', b'0', NULL, '', b'1', 4, '', '', '04', NULL, b'0', 131, b'1', 2, '2022-01-27 16:41:44', 2, '2022-01-27 16:41:44');
INSERT INTO `c_menu` VALUES (1486620477806870528, '查看本部门', '60', 2, ',30,131,', '', b'0', NULL, '', b'1', 5, '', '', '05', NULL, b'0', 131, b'1', 2, '2022-01-27 16:41:57', 2, '2022-01-27 16:41:57');
INSERT INTO `c_menu` VALUES (1486620546081751040, '查看个人', '60', 2, ',30,131,', '', b'0', NULL, '', b'1', 6, '', '', '06', NULL, b'1', 131, b'1', 2, '2022-01-27 16:42:13', 2, '2022-01-27 16:42:13');

-- ----------------------------
-- Table structure for c_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `c_opt_log`;
CREATE TABLE `c_opt_log`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `request_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作IP',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '日志类型 \n#LogType{OPT:操作类型;EX:异常类型}',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作描述',
  `class_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '类路径',
  `action_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方法',
  `request_uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求地址',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求类型 \n#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
  `start_time` datetime(0) DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime(0) DEFAULT NULL COMMENT '完成时间',
  `consuming_time` bigint(20) DEFAULT NULL COMMENT '消耗时间',
  `ua` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_opt_log_ext
-- ----------------------------
DROP TABLE IF EXISTS `c_opt_log_ext`;
CREATE TABLE `c_opt_log_ext`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '返回值',
  `ex_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常描述',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志扩展' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_org
-- ----------------------------
DROP TABLE IF EXISTS `c_org`;
CREATE TABLE `c_org`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `type_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '类型 \n@Echo(api = DICTIONARY_ITEM_CLASS,  dictType = EchoDictType.ORG_TYPE)',
  `abbreviation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '简称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父ID',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '树结构',
  `sort_value` int(11) DEFAULT 1 COMMENT '排序',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`label`) USING BTREE,
  FULLTEXT INDEX `fu_path`(`tree_path`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_org
-- ----------------------------
INSERT INTO `c_org` VALUES (1, '最后集团', '01', '', 0, ',', 1, b'1', '', '2020-11-23 00:05:55', 1, '2020-11-23 00:05:59', 1);
INSERT INTO `c_org` VALUES (1415864548283383808, '1', '01', '1', 0, ',', 1, b'1', '', '2021-07-16 10:43:08', 2, '2021-07-16 10:43:08', 2);
INSERT INTO `c_org` VALUES (1415864576410386432, '1-1', '02', '', 1415864548283383808, ',1415864548283383808,', 1, b'1', '', '2021-07-16 10:43:15', 2, '2021-07-16 10:43:15', 2);
INSERT INTO `c_org` VALUES (1415864608656195584, '1-2', '02', '', 1415864548283383808, ',1415864548283383808,', 1, b'1', '', '2021-07-16 10:43:23', 2, '2021-07-16 10:43:23', 2);
INSERT INTO `c_org` VALUES (1415864637190045696, '1-1-1', '02', '', 1415864576410386432, ',1415864548283383808,1415864576410386432,', 1, b'1', '', '2021-07-16 10:43:30', 2, '2021-07-16 10:43:30', 2);
INSERT INTO `c_org` VALUES (1533406176778125312, '办公室', '02', '', 1, ',1,', 1, b'1', '', '2022-06-05 19:11:37', 2, '2022-06-05 19:11:37', 2);
INSERT INTO `c_org` VALUES (1533406241466875904, '综合部', '02', '', 1, ',1,', 2, b'1', '', '2022-06-05 19:11:52', 2, '2022-06-05 19:11:52', 2);
INSERT INTO `c_org` VALUES (1533406367992250368, '最后集团贵阳分公司', '01', '', 1, ',1,', 10, b'1', '', '2022-06-05 19:12:22', 2, '2022-06-05 21:41:33', 2);
INSERT INTO `c_org` VALUES (1533438004188676096, '研发部', '02', '', 1533406367992250368, ',1533406367992250368,1,', 1, b'1', '', '2022-06-05 21:18:05', 2, '2022-06-05 21:18:05', 2);
INSERT INTO `c_org` VALUES (1533438039630544896, '产品部', '02', '', 1533406367992250368, ',1533406367992250368,1,', 2, b'1', '', '2022-06-05 21:18:13', 2, '2022-06-05 21:18:13', 2);

-- ----------------------------
-- Table structure for c_parameter
-- ----------------------------
DROP TABLE IF EXISTS `c_parameter`;
CREATE TABLE `c_parameter`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数名称',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_key`(`key_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_parameter
-- ----------------------------
INSERT INTO `c_parameter` VALUES (1, 'LoginPolicy', 'MANY', '登录策略', 'ONLY_ONE:一个用户只能登录一次; MANY:用户可以任意登录; ONLY_ONE_CLIENT:一个用户在一个应用只能登录一次', b'1', b'1', 1, '2020-04-02 21:56:19', 2, '2020-11-30 09:14:44');

-- ----------------------------
-- Table structure for c_resource
-- ----------------------------
DROP TABLE IF EXISTS `c_resource`;
CREATE TABLE `c_resource`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单\n#c_menu',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `readonly_` bit(1) DEFAULT b'1' COMMENT '内置',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_resource
-- ----------------------------
INSERT INTO `c_resource` VALUES (1, 'authority:menu:add', '新增', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (2, 'authority:menu:edit', '编辑', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (3, 'authority:menu:delete', '删除', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (4, 'authority:menu:view;authority:resource:view', '查看', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (5, 'authority:menu:import', '导入', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (6, 'authority:menu:export', '导出', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (7, 'authority:resource:add', '新增', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (8, 'authority:resource:edit', '编辑', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (9, 'authority:resource:delete', '删除', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');
INSERT INTO `c_resource` VALUES (25938183673872440, 'tenant:tenant:add', '新增', 110, '', b'1', 1, '2020-11-23 21:44:46', 1, '2020-11-23 21:44:46');
INSERT INTO `c_resource` VALUES (25938183673872445, 'tenant:tenant:edit', '编辑', 110, '', b'1', 1, '2020-11-23 21:44:54', 1, '2020-11-23 21:44:54');
INSERT INTO `c_resource` VALUES (25938183673872450, 'tenant:tenant:delete', '删除', 110, '', b'1', 1, '2020-11-23 21:45:02', 1, '2020-11-23 21:45:02');
INSERT INTO `c_resource` VALUES (25938183673872455, 'tenant:tenant:view', '查看', 110, '', b'1', 1, '2020-11-23 21:45:10', 1, '2020-11-23 21:45:10');
INSERT INTO `c_resource` VALUES (25938183673872460, 'tenant:tenant:initConnect;tenant:datasourceConfig:view', '初始化', 110, '', b'1', 1, '2020-11-23 22:01:23', 1, '2020-11-23 22:01:23');
INSERT INTO `c_resource` VALUES (25938183673872467, 'tenant:user:add', '新增', 111, '', b'1', 1, '2020-11-23 22:01:46', 1, '2020-11-23 22:01:46');
INSERT INTO `c_resource` VALUES (25938183673872472, 'tenant:user:edit', '编辑', 111, '', b'1', 1, '2020-11-23 22:01:58', 1, '2020-11-23 22:01:58');
INSERT INTO `c_resource` VALUES (25938183673872477, 'tenant:user:delete', '删除', 111, '', b'1', 1, '2020-11-23 22:02:09', 1, '2020-11-23 22:02:09');
INSERT INTO `c_resource` VALUES (25938183673872484, 'tenant:user:view;tenant:tenant:view', '查看', 111, '', b'1', 1, '2020-11-23 22:02:22', 1, '2020-11-23 22:02:22');
INSERT INTO `c_resource` VALUES (25938183673872491, 'authority:org:add', '新增', 130, '', b'1', 1, '2020-11-23 22:02:52', 1, '2020-11-23 22:02:52');
INSERT INTO `c_resource` VALUES (25938183673872496, 'authority:org:edit', '编辑', 130, '', b'1', 1, '2020-11-23 22:03:13', 1, '2020-11-23 22:03:13');
INSERT INTO `c_resource` VALUES (25938183673872501, 'authority:org:delete', '删除', 130, '', b'1', 1, '2020-11-23 22:03:33', 1, '2020-11-23 22:03:33');
INSERT INTO `c_resource` VALUES (25938183673872506, 'authority:org:view', '查看', 130, '', b'1', 1, '2020-11-23 22:03:47', 1, '2020-11-23 22:03:47');
INSERT INTO `c_resource` VALUES (25938183673872513, 'authority:station:add', '新增', 131, '', b'1', 1, '2020-11-23 22:04:08', 1, '2020-11-23 22:04:08');
INSERT INTO `c_resource` VALUES (25938183673872518, 'authority:station:edit', '编辑', 131, '', b'1', 1, '2020-11-23 22:04:17', 1, '2020-11-23 22:04:17');
INSERT INTO `c_resource` VALUES (25938183673872523, 'authority:station:delete', '删除', 131, '', b'1', 1, '2020-11-23 22:04:28', 1, '2020-11-23 22:04:28');
INSERT INTO `c_resource` VALUES (25938183673872528, 'authority:station:view;authority:org:view', '查看', 131, '', b'1', 1, '2020-11-23 22:04:41', 1, '2020-11-23 22:04:41');
INSERT INTO `c_resource` VALUES (25938183673872537, 'authority:user:add', '新增', 132, '', b'1', 1, '2020-11-23 22:05:24', 1, '2020-11-23 22:05:24');
INSERT INTO `c_resource` VALUES (25938183673872542, 'authority:user:edit', '编辑', 132, '', b'1', 1, '2020-11-23 22:05:33', 1, '2020-11-23 22:05:33');
INSERT INTO `c_resource` VALUES (25938183673872547, 'authority:user:delete', '删除', 132, '', b'1', 1, '2020-11-23 22:05:41', 1, '2020-11-23 22:05:41');
INSERT INTO `c_resource` VALUES (25938183673872552, 'authority:user:view;authority:station:view;authority:org:view', '查看', 132, '', b'1', 1, '2020-11-23 22:05:47', 1, '2020-11-23 22:05:47');
INSERT INTO `c_resource` VALUES (25938183673872557, 'authority:user:resetPassword', '重置密码', 132, '', b'1', 1, '2020-11-23 22:06:09', 1, '2020-11-23 22:06:09');
INSERT INTO `c_resource` VALUES (25938183673872562, 'authority:user:updateState', '修改状态', 132, '', b'1', 1, '2020-11-23 22:06:42', 1, '2020-11-23 22:06:42');
INSERT INTO `c_resource` VALUES (25938183673872569, 'msg:msg:add;authority:user:view;authority:role:view', '新增', 140, '', b'1', 1, '2020-11-23 22:08:07', 1, '2020-11-23 22:08:07');
INSERT INTO `c_resource` VALUES (25938183673872574, 'msg:msg:edit;authority:user:view;authority:role:view', '编辑', 140, '', b'1', 1, '2020-11-23 22:08:23', 1, '2020-11-23 22:08:23');
INSERT INTO `c_resource` VALUES (25938183673872579, 'msg:msg:delete', '删除', 140, '', b'1', 1, '2020-11-23 22:08:32', 1, '2020-11-23 22:08:32');
INSERT INTO `c_resource` VALUES (25938183673872584, 'msg:msg:view', '查看', 140, '', b'1', 1, '2020-11-23 22:08:38', 1, '2020-11-23 22:08:38');
INSERT INTO `c_resource` VALUES (25938183673872589, 'msg:msg:mark', '标记已读', 140, '', b'1', 1, '2020-11-23 22:10:36', 1, '2020-11-23 22:10:36');
INSERT INTO `c_resource` VALUES (25938183673872596, 'authority:org:import', '导入', 130, '', b'1', 1, '2020-11-23 22:11:11', 1, '2020-11-23 22:11:11');
INSERT INTO `c_resource` VALUES (25938183673872601, 'authority:org:export', '导出', 130, '', b'1', 1, '2020-11-23 22:11:21', 1, '2020-11-23 22:11:21');
INSERT INTO `c_resource` VALUES (25938183673872610, 'authority:station:import', '导入', 131, '', b'1', 1, '2020-11-23 22:11:41', 1, '2020-11-23 22:11:41');
INSERT INTO `c_resource` VALUES (25938183673872615, 'authority:station:export', '导出', 131, '', b'1', 1, '2020-11-23 22:11:50', 1, '2020-11-23 22:11:50');
INSERT INTO `c_resource` VALUES (25938183673872622, 'authority:user:import', '导入', 132, '', b'1', 1, '2020-11-23 22:12:16', 1, '2020-11-23 22:12:16');
INSERT INTO `c_resource` VALUES (25938183673872627, 'authority:user:export', '导出', 132, '', b'1', 1, '2020-11-23 22:12:24', 1, '2020-11-23 22:12:24');
INSERT INTO `c_resource` VALUES (25938183673872646, 'msg:msg:export', '导出', 140, '', b'1', 1, '2020-11-23 22:15:21', 1, '2020-11-23 22:15:21');
INSERT INTO `c_resource` VALUES (25938183673872657, 'msg:sms:add', '新增', 142, '', b'1', 1, '2020-11-23 22:16:55', 1, '2020-11-23 22:16:55');
INSERT INTO `c_resource` VALUES (25938183673872662, 'msg:sms:edit', '编辑', 142, '', b'1', 1, '2020-11-23 22:17:03', 1, '2020-11-23 22:17:03');
INSERT INTO `c_resource` VALUES (25938183673872667, 'msg:sms:delete', '删除', 142, '', b'1', 1, '2020-11-23 22:17:15', 1, '2020-11-23 22:17:15');
INSERT INTO `c_resource` VALUES (25938183673872672, 'msg:sms:view;msg:smsTemplate:view', '查看', 142, '', b'1', 1, '2020-11-23 22:17:24', 1, '2020-11-23 22:17:24');
INSERT INTO `c_resource` VALUES (25938183673872679, 'msg:smsTemplate:add', '新增', 141, '', b'1', 1, '2020-11-23 22:18:00', 1, '2020-11-23 22:18:00');
INSERT INTO `c_resource` VALUES (25938183673872684, 'msg:smsTemplate:edit', '编辑', 141, '', b'1', 1, '2020-11-23 22:18:07', 1, '2020-11-23 22:18:07');
INSERT INTO `c_resource` VALUES (25938183673872689, 'msg:smsTemplate:delete', '删除', 141, '', b'1', 1, '2020-11-23 22:18:13', 1, '2020-11-23 22:18:13');
INSERT INTO `c_resource` VALUES (25938183673872694, 'msg:smsTemplate:view', '查看', 141, '', b'1', 1, '2020-11-23 22:18:20', 1, '2020-11-23 22:18:20');
INSERT INTO `c_resource` VALUES (25938183673872703, 'file:attachment:add', '新增', 143, '', b'1', 1, '2020-11-23 22:19:58', 1, '2020-11-23 22:19:58');
INSERT INTO `c_resource` VALUES (25938183673872708, 'file:attachment:edit', '编辑', 143, '', b'1', 1, '2020-11-23 22:20:07', 1, '2020-11-23 22:20:07');
INSERT INTO `c_resource` VALUES (25938183673872713, 'file:attachment:delete', '删除', 143, '', b'1', 1, '2020-11-23 22:20:13', 1, '2020-11-23 22:20:13');
INSERT INTO `c_resource` VALUES (25938183673872718, 'file:attachment:view', '查看', 143, '', b'1', 1, '2020-11-23 22:20:19', 1, '2020-11-23 22:20:19');
INSERT INTO `c_resource` VALUES (25938183673872723, 'file:attachment:download', '下载', 143, '', b'1', 1, '2020-11-23 22:20:30', 1, '2020-11-23 22:20:30');
INSERT INTO `c_resource` VALUES (25938183673872736, 'authority:role:add;authority:org:view', '新增', 161, '', b'1', 1, '2020-11-23 22:23:25', 1, '2020-11-23 22:23:25');
INSERT INTO `c_resource` VALUES (25938183673872741, 'authority:role:edit;authority:org:view', '编辑', 161, '', b'1', 1, '2020-11-23 22:23:33', 1, '2020-11-23 22:23:33');
INSERT INTO `c_resource` VALUES (25938183673872746, 'authority:role:delete', '删除', 161, '', b'1', 1, '2020-11-23 22:23:41', 1, '2020-11-23 22:23:41');
INSERT INTO `c_resource` VALUES (25938183673872751, 'authority:role:view', '查看', 161, '', b'1', 1, '2020-11-23 22:24:50', 1, '2020-11-23 22:24:50');
INSERT INTO `c_resource` VALUES (25938183673872756, 'authority:role:config;authority:user:view', '配置权限', 161, '', b'1', 1, '2020-11-23 22:25:26', 1, '2020-11-23 22:25:26');
INSERT INTO `c_resource` VALUES (25938183673872761, 'authority:role:auth;authority:menu:view;authority:resource:view', '授权', 161, '', b'1', 1, '2020-11-23 22:25:39', 1, '2020-11-23 22:25:39');
INSERT INTO `c_resource` VALUES (25938183673872768, 'authority:dictionary:add', '新增', 162, '', b'1', 1, '2020-11-23 22:27:08', 1, '2020-11-23 22:27:08');
INSERT INTO `c_resource` VALUES (25938183673872773, 'authority:dictionary:edit', '编辑', 162, '', b'1', 1, '2020-11-23 22:27:15', 1, '2020-11-23 22:27:15');
INSERT INTO `c_resource` VALUES (25938183673872778, 'authority:dictionary:delete', '删除', 162, '', b'1', 1, '2020-11-23 22:27:22', 1, '2020-11-23 22:27:22');
INSERT INTO `c_resource` VALUES (25938183673872783, 'authority:dictionary:view', '查看', 162, '', b'1', 1, '2020-11-23 22:27:28', 1, '2020-11-23 22:27:28');
INSERT INTO `c_resource` VALUES (25938183673872790, 'authority:area:add', '新增', 163, '', b'1', 1, '2020-11-23 22:27:56', 1, '2020-11-23 22:27:56');
INSERT INTO `c_resource` VALUES (25938183673872795, 'authority:area:edit', '编辑', 163, '', b'1', 1, '2020-11-23 22:28:04', 1, '2020-11-23 22:28:04');
INSERT INTO `c_resource` VALUES (25938183673872800, 'authority:area:delete', '删除', 163, '', b'1', 1, '2020-11-23 22:28:11', 1, '2020-11-23 22:28:11');
INSERT INTO `c_resource` VALUES (25938183673872805, 'authority:area:view', '查看', 163, '', b'1', 1, '2020-11-23 22:28:25', 1, '2020-11-23 22:28:25');
INSERT INTO `c_resource` VALUES (25938183673872812, 'authority:parameter:add', '新增', 164, '', b'1', 1, '2020-11-23 22:29:01', 1, '2020-11-23 22:29:01');
INSERT INTO `c_resource` VALUES (25938183673872817, 'authority:parameter:edit', '编辑', 164, '', b'1', 1, '2020-11-23 22:29:08', 1, '2020-11-23 22:29:08');
INSERT INTO `c_resource` VALUES (25938183673872822, 'authority:parameter:delete', '删除', 164, '', b'1', 1, '2020-11-23 22:29:18', 1, '2020-11-23 22:29:18');
INSERT INTO `c_resource` VALUES (25938183673872827, 'authority:parameter:view', '查看', 164, '', b'1', 1, '2020-11-23 22:29:26', 1, '2020-11-23 22:29:26');
INSERT INTO `c_resource` VALUES (25938183673872838, 'authority:optLog:delete', '删除', 165, '', b'1', 1, '2020-11-23 22:30:00', 1, '2020-11-23 22:30:00');
INSERT INTO `c_resource` VALUES (25938183673872843, 'authority:optLog:view', '查看', 165, '', b'1', 1, '2020-11-23 22:30:08', 1, '2020-11-23 22:30:08');
INSERT INTO `c_resource` VALUES (25938183673872850, 'authority:loginLog:delete', '删除', 166, '', b'1', 1, '2020-11-23 22:30:27', 1, '2020-11-23 22:30:27');
INSERT INTO `c_resource` VALUES (25938183673872857, 'authority:loginLog:view', '查看', 166, '', b'1', 1, '2020-11-23 22:30:43', 1, '2020-11-23 22:30:43');
INSERT INTO `c_resource` VALUES (25938183673872864, 'authority:online:view', '查看', 167, '', b'1', 1, '2020-11-23 22:31:11', 1, '2020-11-23 22:31:11');
INSERT INTO `c_resource` VALUES (25938183673872869, 'authority:online:delete', '删除', 167, '', b'1', 1, '2020-11-23 22:31:19', 1, '2020-11-23 22:31:19');
INSERT INTO `c_resource` VALUES (25938183673872876, 'authority:application:add', '新增', 168, '', b'1', 1, '2020-11-23 22:31:37', 1, '2020-11-23 22:31:37');
INSERT INTO `c_resource` VALUES (25938183673872881, 'authority:application:edit', '编辑', 168, '', b'1', 1, '2020-11-23 22:31:43', 1, '2020-11-23 22:31:43');
INSERT INTO `c_resource` VALUES (25938183673872886, 'authority:application:delete', '删除', 168, '', b'1', 1, '2020-11-23 22:31:49', 1, '2020-11-23 22:31:49');
INSERT INTO `c_resource` VALUES (25938183673872891, 'authority:application:view', '查看', 168, '', b'1', 1, '2020-11-23 22:31:55', 1, '2020-11-23 22:31:55');
INSERT INTO `c_resource` VALUES (26578833880645891, 'tenant:datasourceConfig:add', '新增', 112, '', b'1', 2, '2020-11-25 17:05:43', 2, '2020-11-25 17:05:43');
INSERT INTO `c_resource` VALUES (26578833880645896, 'tenant:datasourceConfig:edit', '编辑', 112, '', b'1', 2, '2020-11-25 17:06:41', 2, '2020-11-25 17:06:41');
INSERT INTO `c_resource` VALUES (26578833880645901, 'tenant:datasourceConfig:delete', '删除', 112, '', b'1', 2, '2020-11-25 17:12:41', 2, '2020-11-25 17:12:41');
INSERT INTO `c_resource` VALUES (26578833880645906, 'tenant:datasourceConfig:view', '查看', 112, '', b'1', 2, '2020-11-25 17:12:56', 2, '2020-11-25 17:12:56');
INSERT INTO `c_resource` VALUES (1400107570902859776, 'authority:resource:view', '查看', 160, '', b'1', 1, '2020-11-23 21:12:57', 1, '2020-11-23 21:12:57');

-- ----------------------------
-- Table structure for c_role
-- ----------------------------
DROP TABLE IF EXISTS `c_role`;
CREATE TABLE `c_role`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `category` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色类别;[10-功能角色 20-桌面角色 30-数据角色]',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '编码',
  `describe_` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置角色',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_role
-- ----------------------------
INSERT INTO `c_role` VALUES (1, '10', '超级管理员', 'SUPER_ADMIN', '内置管理员(二次开发必须保留)', b'1', b'1', 1, '2020-11-22 23:46:00', 1, '2020-11-22 23:46:00');
INSERT INTO `c_role` VALUES (2, '10', '平台管理员', 'PT_ADMIN', '内置运营专用平台管理员(二次开发必须保留)', b'1', b'1', 1, '2020-11-22 23:46:00', 1, '2020-11-22 23:46:00');
INSERT INTO `c_role` VALUES (3, '10', '普通管理员', 'GENERAL_ADMIN', '演示用的', b'1', b'1', 1, '2020-11-22 23:46:00', 1, '2020-11-22 23:46:00');
INSERT INTO `c_role` VALUES (4, '10', '普通用户', 'NORMAL', '演示用的', b'1', b'1', 1, '2020-11-22 23:46:00', 1, '2020-11-22 23:46:00');
INSERT INTO `c_role` VALUES (1486215142227050496, '30', 'TEST', 'TEST', '', b'1', b'0', 2, '2022-01-26 13:51:17', 2, '2022-01-26 13:51:17');

-- ----------------------------
-- Table structure for c_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `c_role_authority`;
CREATE TABLE `c_role_authority`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `authority_id` bigint(20) NOT NULL COMMENT '资源id \n#c_resource #c_menu',
  `authority_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限类型 \n#AuthorizeType{MENU:菜单;RESOURCE:资源;}',
  `role_id` bigint(20) NOT NULL COMMENT '角色id \n#c_role',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_authority`(`authority_id`, `authority_type`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色的资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_role_authority
-- ----------------------------
INSERT INTO `c_role_authority` VALUES (26578833880645921, 1, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645922, 25938183673872761, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645923, 25938183673872506, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645924, 2, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645925, 26578833880645906, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645926, 3, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645927, 25938183673872891, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645928, 4, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645929, 5, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645930, 6, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645931, 7, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645932, 25938183673872496, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645933, 8, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645934, 9, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645935, 25938183673872881, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645936, 10, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645937, 25938183673872627, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645938, 25938183673872756, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645939, 25938183673872501, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645940, 25938183673872886, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645941, 26578833880645891, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645942, 25938183673872746, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645943, 25938183673872491, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645944, 25938183673872876, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645945, 25938183673872622, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645946, 25938183673872751, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645947, 25938183673872736, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645948, 25938183673872864, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645949, 26578833880645896, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645950, 25938183673872610, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645951, 26578833880645901, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645952, 25938183673872484, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645953, 25938183673872741, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645954, 25938183673872869, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645955, 25938183673872615, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645956, 25938183673872472, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645957, 25938183673872601, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645958, 25938183673872857, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645959, 25938183673872477, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645960, 25938183673872850, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645961, 25938183673872467, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645962, 25938183673872723, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645963, 25938183673872596, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645964, 25938183673872584, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645965, 25938183673872713, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645966, 25938183673872843, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645967, 25938183673872460, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645968, 25938183673872589, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645969, 25938183673872718, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645970, 25938183673872450, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645971, 25938183673872579, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645972, 25938183673872708, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645973, 25938183673872838, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645974, 25938183673872455, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645975, 25938183673872440, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645976, 25938183673872569, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645977, 25938183673872827, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645978, 25938183673872445, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645979, 25938183673872574, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645980, 25938183673872703, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645981, 25938183673872689, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645982, 25938183673872817, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645983, 25938183673872562, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645984, 25938183673872694, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645985, 25938183673872822, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645986, 25938183673872552, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645987, 25938183673872684, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645988, 25938183673872812, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645989, 25938183673872557, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645990, 25938183673872672, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645991, 25938183673872800, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645992, 25938183673872547, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645993, 25938183673872805, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645994, 25938183673872679, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645995, 25938183673872537, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645996, 25938183673872667, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645997, 25938183673872795, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645998, 25938183673872542, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880645999, 25938183673872528, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646000, 25938183673872657, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646001, 25938183673872662, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646002, 25938183673872790, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646003, 25938183673872778, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646004, 25938183673872523, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646005, 25938183673872783, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646006, 25938183673872768, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646007, 25938183673872513, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646008, 25938183673872773, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646009, 25938183673872518, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646010, 25938183673872646, 'RESOURCE', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646011, 130, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646012, 131, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646013, 132, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646014, 10, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646015, 140, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646016, 141, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646017, 142, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646018, 143, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646019, 20, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646020, 150, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646021, 151, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646022, 152, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646023, 153, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646024, 154, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646025, 155, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646026, 156, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646027, 157, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646028, 30, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646029, 160, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646030, 161, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646031, 162, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646032, 163, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646033, 164, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646034, 165, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646035, 166, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646036, 167, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646037, 40, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646038, 168, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646039, 50, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646040, 180, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646041, 181, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646042, 60, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646043, 190, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646044, 191, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646045, 192, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646046, 193, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646047, 194, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646048, 195, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646049, 196, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646050, 197, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646051, 70, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646052, 80, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646053, 210, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646054, 211, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646055, 212, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646056, 213, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646057, 214, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646058, 215, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646059, 90, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646060, 220, 'MENU', 2, '2020-11-25 17:13:10', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646061, 221, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646062, 222, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646063, 223, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646064, 224, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646065, 100, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646066, 110, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646067, 111, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646068, 112, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646069, 120, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646070, 121, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646071, 122, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (26578833880646072, 123, 'MENU', 2, '2020-11-25 17:13:11', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633954, 25938183673872569, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633955, 25938183673872506, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633956, 25938183673872574, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633957, 25938183673872703, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633958, 25938183673872496, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633959, 25938183673872689, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633960, 25938183673872562, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633961, 25938183673872627, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633962, 25938183673872501, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633963, 25938183673872694, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633964, 25938183673872552, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633965, 25938183673872491, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633966, 25938183673872684, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633967, 25938183673872557, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633968, 25938183673872622, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633969, 25938183673872672, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633970, 25938183673872610, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633971, 25938183673872547, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633972, 25938183673872615, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633973, 25938183673872679, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633974, 25938183673872601, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633975, 25938183673872537, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633976, 25938183673872667, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633977, 25938183673872542, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633978, 25938183673872528, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633979, 25938183673872657, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633980, 25938183673872723, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633981, 25938183673872596, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633982, 25938183673872662, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633983, 25938183673872584, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633984, 25938183673872713, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633985, 25938183673872523, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633986, 25938183673872589, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633987, 25938183673872718, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633988, 25938183673872513, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633989, 25938183673872579, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633990, 25938183673872708, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633991, 25938183673872518, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633992, 25938183673872646, 'RESOURCE', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633993, 130, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633994, 131, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633995, 132, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633996, 140, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633997, 141, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633998, 142, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228633999, 143, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634000, 20, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634001, 150, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634002, 151, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634003, 152, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634004, 153, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634005, 154, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634006, 155, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634007, 156, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634008, 157, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634009, 30, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634010, 40, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634011, 50, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634012, 120, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634013, 121, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634014, 122, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (28369762228634015, 123, 'MENU', 3, '2020-11-30 11:22:51', 2);
INSERT INTO `c_role_authority` VALUES (1401793578031644672, 25938183673872491, 'RESOURCE', 1401106547731333120, '2021-06-07 14:50:08', 2);
INSERT INTO `c_role_authority` VALUES (1401793578031644673, 130, 'MENU', 1401106547731333120, '2021-06-07 14:50:08', 2);
INSERT INTO `c_role_authority` VALUES (1401793578035838976, 30, 'MENU', 1401106547731333120, '2021-06-07 14:50:08', 2);
INSERT INTO `c_role_authority` VALUES (1401796782312128512, 25938183673872440, 'RESOURCE', 1401105465810616320, '2021-06-07 15:02:52', 2);
INSERT INTO `c_role_authority` VALUES (1401796782312128513, 25938183673872445, 'RESOURCE', 1401105465810616320, '2021-06-07 15:02:52', 2);
INSERT INTO `c_role_authority` VALUES (1401796782312128514, 10, 'MENU', 1401105465810616320, '2021-06-07 15:02:52', 2);
INSERT INTO `c_role_authority` VALUES (1401796782312128515, 110, 'MENU', 1401105465810616320, '2021-06-07 15:02:52', 2);
INSERT INTO `c_role_authority` VALUES (1401882022011469824, 224, 'MENU', 1401107652259348480, '2021-06-07 20:41:34', 2);
INSERT INTO `c_role_authority` VALUES (1401882022019858432, 100, 'MENU', 1401107652259348480, '2021-06-07 20:41:34', 2);
INSERT INTO `c_role_authority` VALUES (1401882022019858433, 220, 'MENU', 1401107652259348480, '2021-06-07 20:41:34', 2);
INSERT INTO `c_role_authority` VALUES (1401882022019858434, 221, 'MENU', 1401107652259348480, '2021-06-07 20:41:34', 2);
INSERT INTO `c_role_authority` VALUES (1401882022019858435, 222, 'MENU', 1401107652259348480, '2021-06-07 20:41:34', 2);
INSERT INTO `c_role_authority` VALUES (1401882022024052736, 223, 'MENU', 1401107652259348480, '2021-06-07 20:41:34', 2);
INSERT INTO `c_role_authority` VALUES (1401884591014281216, 25938183673872460, 'RESOURCE', 1401884493064699904, '2021-06-07 20:51:47', 2);
INSERT INTO `c_role_authority` VALUES (1401884591014281217, 110, 'MENU', 1401884493064699904, '2021-06-07 20:51:47', 2);
INSERT INTO `c_role_authority` VALUES (1408620582760611840, 20, 'MENU', 1408618647575855104, '2021-06-26 10:58:12', 2);
INSERT INTO `c_role_authority` VALUES (1408620582773194752, 120, 'MENU', 1408618647575855104, '2021-06-26 10:58:12', 2);
INSERT INTO `c_role_authority` VALUES (1408620582802554880, 121, 'MENU', 1408618647575855104, '2021-06-26 10:58:13', 2);
INSERT INTO `c_role_authority` VALUES (1408620582802554881, 122, 'MENU', 1408618647575855104, '2021-06-26 10:58:13', 2);
INSERT INTO `c_role_authority` VALUES (1486319826061230080, 25938183673872601, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826090590208, 25938183673872537, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826098978816, 25938183673872506, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826103173120, 25938183673872542, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826107367424, 25938183673872496, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826115756032, 25938183673872528, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826119950336, 25938183673872562, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826124144640, 25938183673872627, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826128338944, 25938183673872596, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826132533248, 25938183673872501, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826136727552, 25938183673872552, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826136727553, 25938183673872491, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826145116160, 25938183673872523, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826153504768, 25938183673872557, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826157699072, 25938183673872622, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826166087680, 25938183673872513, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826174476288, 25938183673872610, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826178670592, 25938183673872547, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826182864896, 25938183673872518, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826187059200, 25938183673872615, 'RESOURCE', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826191253504, 130, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826195447808, 131, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826199642112, 132, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826203836416, 50, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826203836417, 20, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826216419328, 120, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826216419329, 152, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826224807936, 121, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826224807937, 153, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826229002240, 122, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826233196544, 154, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826233196545, 123, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826237390848, 155, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826241585152, 156, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826241585153, 157, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486319826245779456, 30, 'MENU', 4, '2022-01-26 20:47:16', 2);
INSERT INTO `c_role_authority` VALUES (1486321523068239872, 132, 'MENU', 0, '2022-01-26 20:54:00', 2);
INSERT INTO `c_role_authority` VALUES (1486321523076628480, 1486201050779090944, 'MENU', 0, '2022-01-26 20:54:00', 2);
INSERT INTO `c_role_authority` VALUES (1486321523085017088, 30, 'MENU', 0, '2022-01-26 20:54:00', 2);
INSERT INTO `c_role_authority` VALUES (1533464117128462336, 1486201491877265408, 'MENU', 1486215142227050496, '2022-06-05 23:01:51', 2);
INSERT INTO `c_role_authority` VALUES (1533464117132656640, 131, 'MENU', 1486215142227050496, '2022-06-05 23:01:51', 2);
INSERT INTO `c_role_authority` VALUES (1533464117132656641, 1486620477806870528, 'MENU', 1486215142227050496, '2022-06-05 23:01:51', 2);
INSERT INTO `c_role_authority` VALUES (1533464117136850944, 132, 'MENU', 1486215142227050496, '2022-06-05 23:01:51', 2);
INSERT INTO `c_role_authority` VALUES (1533464117136850945, 30, 'MENU', 1486215142227050496, '2022-06-05 23:01:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339659804672, 25938183673872761, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339663998976, 1, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339663998977, 2, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339663998978, 25938183673872506, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339663998979, 25938183673872891, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339668193280, 3, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339668193281, 4, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339668193282, 5, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339668193283, 6, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339668193284, 7, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339672387584, 8, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339672387585, 25938183673872496, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339672387586, 25938183673872881, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339672387587, 9, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339672387588, 25938183673872627, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339676581888, 25938183673872756, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339676581889, 25938183673872501, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339676581890, 25938183673872886, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339676581891, 25938183673872746, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339676581892, 25938183673872491, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339676581893, 25938183673872876, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339680776192, 25938183673872622, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339680776193, 25938183673872751, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339680776194, 25938183673872864, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339680776195, 25938183673872736, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339680776196, 25938183673872610, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339680776197, 25938183673872869, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339684970496, 25938183673872741, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339684970497, 25938183673872615, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339684970498, 25938183673872857, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339684970499, 25938183673872601, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339684970500, 25938183673872850, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339689164800, 25938183673872723, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339689164801, 25938183673872596, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339689164802, 25938183673872584, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339689164803, 25938183673872713, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339689164804, 25938183673872843, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339689164805, 25938183673872589, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339693359104, 25938183673872718, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339693359105, 25938183673872579, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339693359106, 25938183673872708, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339693359107, 25938183673872838, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339693359108, 25938183673872569, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339693359109, 25938183673872827, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339697553408, 25938183673872574, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339697553409, 25938183673872703, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339697553410, 25938183673872817, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339697553411, 25938183673872689, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339697553412, 25938183673872562, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339701747712, 25938183673872822, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339701747713, 25938183673872694, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339701747714, 25938183673872552, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339701747715, 25938183673872812, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339701747716, 25938183673872684, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339701747717, 25938183673872557, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942016, 25938183673872800, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942017, 25938183673872672, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942018, 25938183673872547, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942019, 25938183673872805, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942020, 25938183673872679, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942021, 25938183673872537, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339705942022, 25938183673872795, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339710136320, 25938183673872667, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339710136321, 25938183673872542, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339710136322, 25938183673872528, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339710136323, 25938183673872657, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339710136324, 25938183673872790, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339710136325, 25938183673872662, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339714330624, 25938183673872778, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339714330625, 25938183673872523, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339718524928, 25938183673872783, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339718524929, 25938183673872768, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339718524930, 25938183673872513, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339722719232, 25938183673872773, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339722719233, 25938183673872646, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339722719234, 25938183673872518, 'RESOURCE', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339722719235, 130, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339722719236, 131, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339722719237, 132, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339726913536, 1486201804327747584, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339726913537, 140, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339726913538, 141, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339726913539, 142, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339726913540, 143, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339726913541, 1486201562119274496, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107840, 1486619392048365568, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107841, 1486201872350969856, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107842, 30, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107843, 160, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107844, 161, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107845, 162, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339731107846, 1486620546081751040, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302144, 163, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302145, 164, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302146, 165, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302147, 166, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302148, 167, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302149, 40, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339735302150, 168, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496448, 1486620313587286016, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496449, 180, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496450, 181, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496451, 60, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496452, 1486619304207056896, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496453, 1486201491877265408, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339739496454, 70, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339743690752, 1486620425789112320, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339743690753, 1486620477806870528, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339743690754, 1486201050779090944, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339743690755, 1486201971705643008, 'MENU', 1, '2023-06-25 16:55:51', 2);
INSERT INTO `c_role_authority` VALUES (1672891339743690756, 1486201715840516096, 'MENU', 1, '2023-06-25 16:55:51', 2);

-- ----------------------------
-- Table structure for c_role_org
-- ----------------------------
DROP TABLE IF EXISTS `c_role_org`;
CREATE TABLE `c_role_org`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色\n#c_role',
  `org_id` bigint(20) NOT NULL COMMENT '部门\n#c_org',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_org`(`org_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色组织关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_station
-- ----------------------------
DROP TABLE IF EXISTS `c_station`;
CREATE TABLE `c_station`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织\n#c_org\n@Echo(api = ORG_ID_CLASS,  beanClass = Org.class)',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `created_org_id` bigint(20) DEFAULT NULL COMMENT '创建者所属机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_station
-- ----------------------------
INSERT INTO `c_station` VALUES (1, '总经理', 1, b'1', '', '2020-11-23 00:06:20', 1, '2020-11-23 00:06:25', 1, 1);
INSERT INTO `c_station` VALUES (1415864686808662016, '1-1', 1415864576410386432, b'1', '', '2021-07-16 10:43:41', 2, '2021-07-16 10:43:41', 2, 1);
INSERT INTO `c_station` VALUES (1533445633120141312, 'general创建的', 1415864608656195584, b'1', '', '2022-06-05 21:48:24', 4, '2022-06-05 21:48:24', 4, 1415864608656195584);
INSERT INTO `c_station` VALUES (1533445687008559104, 'general创建的2', 1, b'1', '', '2022-06-05 21:48:36', 4, '2022-06-05 21:48:36', 4, 1415864608656195584);

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织\n#c_org\n@Echo(api = ORG_ID_CLASS,  beanClass = Org.class)',
  `station_id` bigint(20) DEFAULT NULL COMMENT '岗位\n#c_station\n@Echo(api = STATION_ID_CLASS)',
  `readonly` bit(1) NOT NULL DEFAULT b'0' COMMENT '内置',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'M' COMMENT '性别 \n#Sex{W:女;M:男;N:未知}',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像',
  `nation` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '民族 \n@Echo(api = DICTIONARY_ITEM_CLASS,  dictType = EchoDictType.NATION)',
  `education` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '学历 \n@Echo(api = DICTIONARY_ITEM_CLASS,  dictType = EchoDictType.EDUCATION)',
  `position_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '职位状态 \n@Echo(api = DICTIONARY_ITEM_CLASS,  dictType = EchoDictType.POSITION_STATUS)',
  `work_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '工作描述',
  `password_error_last_time` datetime(0) DEFAULT NULL COMMENT '最后一次输错密码时间',
  `password_error_num` int(11) DEFAULT 0 COMMENT '密码错误次数',
  `password_expire_time` datetime(0) DEFAULT NULL COMMENT '密码过期时间',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login_time` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `created_org_id` bigint(20) DEFAULT NULL COMMENT '创建者所属机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES (1, 'lampAdmin', '内置管理员', 1, 1, b'1', '15217781234@qq.com', '15217781234', NULL, b'1', '17e420c250804efe904a09a33796d5a10.jpg', '01', '01', '01', '不想上班!', '2020-11-24 19:08:45', 0, NULL, '0d70cc96860681487869a0304139d3410044298da40fe5b2d7acff76f83d79c8', 'ki5pj8dv44i14yu4nbhh', '2020-11-24 19:08:45', 1, '2020-11-22 23:03:15', 1, '2020-11-22 23:03:15', 1);
INSERT INTO `c_user` VALUES (2, 'lamp', '超级管理员', 1533406176778125312, 1, b'0', '5', '3', '', b'1', '20180414165815.jpg', '02', '04', '03', '不想上班!', NULL, 0, NULL, '0d70cc96860681487869a0304139d3410044298da40fe5b2d7acff76f83d79c8', 'ki5pj8dv44i14yu4nbhh', '2023-06-25 17:00:10', 1, '2020-11-22 23:03:15', 2, '2022-06-05 23:02:13', 1);
INSERT INTO `c_user` VALUES (3, 'lamp_pt', '平台管理员', 1, 1, b'0', '2', '3', NULL, b'1', 'a3b10296862e40edb811418d64455d00.jpeg', '05', '06', '02', '不想上班!', '2022-06-01 12:46:59', 0, NULL, '0d70cc96860681487869a0304139d3410044298da40fe5b2d7acff76f83d79c8', 'ki5pj8dv44i14yu4nbhh', '2022-06-01 12:46:59', 1, '2020-11-22 23:03:15', 2, '2022-06-05 21:46:27', 1);
INSERT INTO `c_user` VALUES (4, 'general', '普通管理员', 1415864608656195584, 1, b'0', '', '', 'N', b'1', '', '01', '01', '01', '不想上班!', '2022-06-05 21:47:47', 0, NULL, '0d70cc96860681487869a0304139d3410044298da40fe5b2d7acff76f83d79c8', 'ki5pj8dv44i14yu4nbhh', '2022-06-05 21:47:47', 1, '2020-11-22 23:03:15', 2, '2022-06-05 21:46:08', 1);
INSERT INTO `c_user` VALUES (5, 'normal', '普通用户', 1533438004188676096, 1, b'0', '', '', 'M', b'1', '', '02', '02', '02', '不想上班!', '2022-01-27 12:21:39', 0, NULL, '0d70cc96860681487869a0304139d3410044298da40fe5b2d7acff76f83d79c8', 'ki5pj8dv44i14yu4nbhh', '2022-01-27 12:21:39', 1, '2020-11-22 23:03:15', 2, '2022-06-05 21:46:20', 1);

-- ----------------------------
-- Table structure for c_user_role
-- ----------------------------
DROP TABLE IF EXISTS `c_user_role`;
CREATE TABLE `c_user_role`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色\n#c_role',
  `user_id` bigint(20) NOT NULL COMMENT '用户\n#c_user',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_role`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色分配\n账号角色绑定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_user_role
-- ----------------------------
INSERT INTO `c_user_role` VALUES (1, 1, 1, 1, '2020-11-23 14:19:09');
INSERT INTO `c_user_role` VALUES (2, 1, 2, 1, '2020-11-23 14:19:11');
INSERT INTO `c_user_role` VALUES (3, 2, 3, 1, '2020-11-23 14:19:14');
INSERT INTO `c_user_role` VALUES (4, 3, 4, 1, '2020-11-23 14:19:14');
INSERT INTO `c_user_role` VALUES (5, 4, 5, 1, '2020-11-23 14:19:14');
INSERT INTO `c_user_role` VALUES (1533405569933639680, 1486215142227050496, 2, 2, '2022-06-05 19:09:12');

-- ----------------------------
-- Table structure for e_block_list
-- ----------------------------
DROP TABLE IF EXISTS `e_block_list`;
CREATE TABLE `e_block_list`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '阻止访问ip',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URI',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方法 \n如果为ALL则表示对所有方法生效',
  `limit_start` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '限制时间起',
  `limit_end` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '限制时间止',
  `state` bit(1) DEFAULT b'0' COMMENT '状态',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阻止访问' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for e_msg
-- ----------------------------
DROP TABLE IF EXISTS `e_msg`;
CREATE TABLE `e_msg`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '业务ID',
  `biz_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '业务类型 \n#MsgBizType{USER_LOCK:账号锁定;USER_REG:账号申请;WORK_APPROVAL:考勤审批;}',
  `msg_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息类型 \n#MsgType{WAIT:待办;NOTIFY:通知;PUBLICITY:公告;WARN:预警;}',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '发布人',
  `handler_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '处理地址 \n以http开头时直接跳转，否则与#c_application表拼接后跳转http可带参数',
  `handler_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '处理参数',
  `is_single_handle` bit(1) DEFAULT b'1' COMMENT '是否单人处理',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for e_msg_receive
-- ----------------------------
DROP TABLE IF EXISTS `e_msg_receive`;
CREATE TABLE `e_msg_receive`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `msg_id` bigint(20) NOT NULL COMMENT '消息ID \n#msg',
  `user_id` bigint(20) NOT NULL COMMENT '接收人ID \n#c_user',
  `is_read` bit(1) DEFAULT b'0' COMMENT '是否已读',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息接收表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for e_rate_limiter
-- ----------------------------
DROP TABLE IF EXISTS `e_rate_limiter`;
CREATE TABLE `e_rate_limiter`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `count` int(10) DEFAULT 0 COMMENT '次数',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URI',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方法 \n如果为ALL则表示对所有方法生效',
  `limit_start` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '限制时间起',
  `limit_end` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '限制时间止',
  `state` bit(1) DEFAULT b'0' COMMENT '状态',
  `interval_sec` bigint(20) DEFAULT 0 COMMENT '时间窗口',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for e_sms_send_status
-- ----------------------------
DROP TABLE IF EXISTS `e_sms_send_status`;
CREATE TABLE `e_sms_send_status`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID \n#e_sms_task',
  `send_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送状态 \n#SendStatus{WAITING:等待发送;SUCCESS:发送成功;FAIL:发送失败}',
  `tel_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者手机\n单个手机号 \n阿里：发送回执ID,可根据该ID查询具体的发送状态  腾讯：sid 标识本次发送id，标识一次短信下发记录  百度：requestId 短信发送请求唯一流水ID',
  `biz_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '发送回执ID',
  `ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '发送返回 \n阿里：RequestId 请求ID  腾讯：ext：用户的session内容，腾讯server回包中会原样返回   百度：无',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '状态码 \n阿里：返回OK代表请求成功,其他错误码详见错误码列表  腾讯：0表示成功(计费依据)，非0表示失败  百度：1000 表示成功',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '状态码的描述',
  `fee` int(10) DEFAULT NULL COMMENT '短信计费的条数\n腾讯专用',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id_tel_num`(`task_id`, `tel_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信发送状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for e_sms_task
-- ----------------------------
DROP TABLE IF EXISTS `e_sms_task`;
CREATE TABLE `e_sms_task`  (
  `id` bigint(20) NOT NULL COMMENT '短信记录ID',
  `template_id` bigint(20) NOT NULL COMMENT '短信模板\n@Echo(api = SMS_TEMPLATE_ID_CLASS)\n#e_sms_template',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '执行状态 \n(手机号具体发送状态看sms_send_status表) \n#TaskStatus{WAITING:等待执行;SUCCESS:执行成功;FAIL:执行失败}',
  `source_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '发送渠道\n#SourceType{APP:应用;SERVICE:服务}',
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主题',
  `template_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数 \n需要封装为{‘key’:’value’, ...}格式且key必须有序',
  `send_time` datetime(0) DEFAULT NULL COMMENT '发送时间',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '发送内容 \n需要封装正确格式化: 您好，张三，您有一个新的快递。',
  `draft` bit(1) DEFAULT b'0' COMMENT '是否草稿',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempate_id_topic_content`(`template_id`, `topic`, `content`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发送任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for e_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `e_sms_template`;
CREATE TABLE `e_sms_template`  (
  `id` bigint(20) NOT NULL COMMENT '模板ID',
  `provider_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '供应商类型 \n#ProviderType{ALI:OK,阿里云短信;TENCENT:0,腾讯云短信;BAIDU:1000,百度云短信}',
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID',
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用密码',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'SMS服务域名 \n百度、其他厂商会用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模板名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板参数',
  `template_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板编码',
  `sign_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '签名',
  `template_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_sms_template
-- ----------------------------
INSERT INTO `e_sms_template` VALUES (1412275572473593856, 'ALI', '1', '2', '', '阿里', '使用ali云 ${xx} 作为占位符，有效期${vv}.  sm${xx}', '[{\"key\":\"xx\",\"value\":\"\"},{\"key\":\"vv\",\"value\":\"\"},{\"key\":\"xx\",\"value\":\"\"}]', '12', '', '', 2, '2021-07-06 13:01:50', 2, '2021-07-17 00:43:35');
INSERT INTO `e_sms_template` VALUES (1416073412907892736, 'TENCENT', '1', '1', '', '腾讯', '使用腾讯云 {xx} 作为占位符，有效期{vv}.  sm{xx}', '[{\"key\":\"xx\",\"value\":\"\"},{\"key\":\"vv\",\"value\":\"\"},{\"key\":\"xx\",\"value\":\"\"}]', '123', '', '', 2, '2021-07-17 00:33:06', 2, '2021-07-17 00:43:28');
INSERT INTO `e_sms_template` VALUES (1416073582500380672, 'BAIDU', '11', '11', '', '百度', '使用百度云 ${xx} 作为占位符，有效期${vv}.  sm${xx}', '[{\"key\":\"xx\",\"value\":\"\"},{\"key\":\"vv\",\"value\":\"\"},{\"key\":\"xx\",\"value\":\"\"}]', '12', '', '', 2, '2021-07-17 00:33:46', 2, '2021-07-17 00:43:22');
INSERT INTO `e_sms_template` VALUES (1416073809147985920, 'CL', '1', '1', 'http://smssh1.253.com/msg/variable/json', '创蓝注册', '使用腾讯云 {$var} 作为占位符，有效期{$var}.  sm{$var}', '[{\"key\":\"$var\",\"value\":\"\"},{\"key\":\"$var\",\"value\":\"\"},{\"key\":\"$var\",\"value\":\"\"}]', '1', '', '', 2, '2021-07-17 00:34:40', 2, '2021-07-17 00:43:10');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'increment id',
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for worker_node
-- ----------------------------
DROP TABLE IF EXISTS `worker_node`;
CREATE TABLE `worker_node`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
  `host_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主机名',
  `port` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '端口',
  `type` int(11) NOT NULL COMMENT '节点类型: ACTUAL 或者 CONTAINER',
  `launch_date` date NOT NULL COMMENT '上线日期',
  `modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'DB WorkerID Assigner for UID Generator' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
