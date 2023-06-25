-- 加字段
ALTER TABLE `lamp_nestjs`.`c_dictionary`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `readonly_`;
ALTER TABLE `lamp_nestjs`.`c_parameter`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `readonly_`;
ALTER TABLE `lamp_nestjs`.`c_menu`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `readonly_`;
-- 修改字段
ALTER TABLE `lamp_nestjs`.`c_dictionary`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`;
ALTER TABLE `lamp_nestjs`.`c_parameter`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`;
ALTER TABLE `lamp_nestjs`.`c_menu`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `created_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `updated_by`;
-- 删除多余数据
delete from c_menu where label in ('租户设置','租户管理','数据源配置','超级用户','流程管理','流程部署','模型管理','请假流程','请假管理','请假任务','报销流程','报销管理','报销任务','工作台','通知公告','待我审批','我已审批','我发起的','了解lamp','在线文档','会员版','获取源码','问题反馈','更新日志','蓝图','更多功能','多级菜单','菜单1-1','菜单1-1-1','菜单1-1-2','菜单1-2');
