-- 加字段
ALTER TABLE `c_dictionary`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `readonly_`;
ALTER TABLE `c_parameter`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `readonly_`;
ALTER TABLE `c_menu`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `readonly_`;
ALTER TABLE `c_area`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `parent_id`;
ALTER TABLE `c_area`
    ADD COLUMN `mpath` varchar(255) DEFAULT '' COMMENT '物化路径' AFTER `parent_id`;
ALTER TABLE `c_org`
    ADD COLUMN `deleted_at` datetime(0) NULL COMMENT '删除时间' AFTER `describe_`;
ALTER TABLE `c_station`
    ADD COLUMN `deleted_at` datetime NULL COMMENT '删除时间' AFTER `describe_`;
ALTER TABLE `c_user`
    ADD COLUMN `deleted_at` datetime NULL COMMENT '删除时间' AFTER `last_login_time`;

-- 修改字段
ALTER TABLE `c_dictionary`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`;
ALTER TABLE `c_parameter`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`;
ALTER TABLE `c_menu`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`;
ALTER TABLE `c_area`
    CHANGE COLUMN `level_` `level_` varchar(10) DEFAULT '' COMMENT '行政区级: dictType = AREA_LEVEL' AFTER `latitude`;
ALTER TABLE `c_area`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `deleted_at`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `created_by`;
ALTER TABLE `c_area`
    CHANGE COLUMN `parent_id` `parentId` bigint(20) DEFAULT NULL COMMENT '父ID' AFTER `state`;
ALTER TABLE `c_org`
    CHANGE COLUMN `create_time` `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间' AFTER `describe_`,
    CHANGE COLUMN `update_time` `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间' AFTER `created_by`;
ALTER TABLE `c_org`
    MODIFY COLUMN `type_` char(2) NULL DEFAULT '' COMMENT '类型: dictType = ORG_TYPE' AFTER `label`;
ALTER TABLE `c_org`
    CHANGE COLUMN `parent_id` `parentId` bigint(20) NULL DEFAULT NULL COMMENT '父ID' AFTER `abbreviation`;
ALTER TABLE `c_org`
    CHANGE COLUMN `tree_path` `mpath` varchar(255) NULL DEFAULT '' COMMENT '树结构' AFTER `parentId`;
ALTER TABLE `c_station`
    CHANGE COLUMN `create_time` `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间' AFTER `describe_`,
    CHANGE COLUMN `update_time` `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间' AFTER `created_by`,
    MODIFY COLUMN `org_id` bigint(20) NULL DEFAULT NULL COMMENT '机构' AFTER `name`;
ALTER TABLE `c_user`
    CHANGE COLUMN `create_time` `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`,
    MODIFY COLUMN `org_id` bigint(20) NULL DEFAULT NULL COMMENT '机构' AFTER `name`,
    MODIFY COLUMN `station_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位' AFTER `org_id`,
    MODIFY COLUMN `nation` char(2) NULL DEFAULT '' COMMENT '民族: dictType = NATION' AFTER `avatar`,
    MODIFY COLUMN `education` char(2) NULL DEFAULT '' COMMENT '学历: dictType = EDUCATION' AFTER `nation`,
    MODIFY COLUMN `position_status` char(2) NULL DEFAULT '' COMMENT '职位状态: dictType = POSITION_STATUS' AFTER `education`;

-- 修改索引
ALTER TABLE `c_org` DROP INDEX `fu_path`, ADD FULLTEXT INDEX `fu_path`(`mpath`);

-- 删除多余数据
delete from c_menu where label in ('租户设置','租户管理','数据源配置','超级用户','流程管理','流程部署','模型管理','请假流程','请假管理','请假任务','报销流程','报销管理','报销任务','工作台','通知公告','待我审批','我已审批','我发起的','了解lamp','在线文档','会员版','获取源码','问题反馈','更新日志','蓝图','更多功能','多级菜单','菜单1-1','菜单1-1-1','菜单1-1-2','菜单1-2');

-- 添加数据
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `readonly_`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES (449940761571413, 'AREA_SOURCE', '地区数据来源', '01', '爬取', b'1', 2, '2023-06-27 11:29:45', 2, '2023-06-27 11:29:47');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `readonly_`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES (449940761571414, 'AREA_SOURCE', '地区数据来源', '02', '新增', b'1', 2, '2023-06-27 11:31:24', 2, '2023-06-27 11:31:26')
