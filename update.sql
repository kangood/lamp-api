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
    CHANGE COLUMN `level` `level_` varchar(10) DEFAULT '' COMMENT '行政区级: dictType = AREA_LEVEL' AFTER `latitude`;
ALTER TABLE `c_area`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `deleted_at`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `created_by`;
ALTER TABLE `c_area`
    CHANGE COLUMN `parent_id` `parentId` bigint(20) DEFAULT NULL COMMENT '父ID' AFTER `state`;
-- 删除多余数据
delete from c_menu where label in ('租户设置','租户管理','数据源配置','超级用户','流程管理','流程部署','模型管理','请假流程','请假管理','请假任务','报销流程','报销管理','报销任务','工作台','通知公告','待我审批','我已审批','我发起的','了解lamp','在线文档','会员版','获取源码','问题反馈','更新日志','蓝图','更多功能','多级菜单','菜单1-1','菜单1-1-1','菜单1-1-2','菜单1-2');
