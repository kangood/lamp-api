ALTER TABLE `lamp_nestjs`.`c_dictionary`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `tenant_code`;
ALTER TABLE `lamp_nestjs`.`c_parameter`
    ADD COLUMN `deleted_at` datetime(0) COMMENT '删除时间' AFTER `tenant_code`;
ALTER TABLE `lamp_nestjs`.`c_dictionary`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `updated_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `created_at`;
ALTER TABLE `lamp_nestjs`.`c_parameter`
    CHANGE COLUMN `create_time` `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `updated_by`,
    CHANGE COLUMN `update_time` `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `created_at`;
