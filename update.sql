ALTER TABLE `lamp_column`.`c_dictionary`
MODIFY COLUMN `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID' FIRST;

ALTER TABLE `lamp_column`.`c_parameter`
MODIFY COLUMN `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID' FIRST;

ALTER TABLE `lamp_column`.`c_dictionary`
CHANGE COLUMN `create_time` `create_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `updated_by`,
CHANGE COLUMN `update_time` `update_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `create_at`;

ALTER TABLE `lamp_column`.`c_parameter`
CHANGE COLUMN `create_time` `create_at` datetime(0) DEFAULT NULL COMMENT '创建时间' AFTER `updated_by`,
CHANGE COLUMN `update_time` `update_at` datetime(0) DEFAULT NULL COMMENT '更新时间' AFTER `create_at`;
