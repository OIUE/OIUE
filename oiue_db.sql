#
# SQL Export
# Created: 17 November 2016 at 1:54:59 PM GMT+8
# Encoding: Unicode (UTF-8)
#


CREATE DATABASE IF NOT EXISTS `massplat_oiue` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
USE `massplat_oiue`;




SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


CREATE TABLE `fm_application_service_event` (
  `server_application_id` varchar(36) DEFAULT NULL,
  `bundle_id` varchar(128) DEFAULT NULL COMMENT 'ID',
  `bundle_service_id` varchar(36) DEFAULT NULL COMMENT 'ID',
  `service_id` varchar(36) DEFAULT NULL,
  `service_event_id` varchar(36) DEFAULT NULL COMMENT '服务事件ID',
  `application_service_event_id` varchar(36) NOT NULL COMMENT '服务事件ID',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `type` varchar(45) NOT NULL COMMENT '事件类型',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`application_service_event_id`),
  KEY `fk_fm_application_service_event_fm_bundle` (`bundle_id`) USING BTREE,
  KEY `fk_fm_application_service_event_fm_bundle_service` (`bundle_service_id`) USING BTREE,
  KEY `fk_fm_application_service_event_fm_server_application` (`server_application_id`) USING BTREE,
  KEY `fk_fm_application_service_event_fm_service` (`service_id`) USING BTREE,
  KEY `fk_fm_application_service_event_fm_service_event` (`service_event_id`) USING BTREE,
  KEY `fk_fm_application_service_event_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_fm_application_service_event_fm_bundle` FOREIGN KEY (`bundle_id`) REFERENCES `fm_bundle` (`bundle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_application_service_event_fm_bundle_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_application_service_event_fm_server_application` FOREIGN KEY (`server_application_id`) REFERENCES `fm_server_application` (`server_application_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_application_service_event_fm_service` FOREIGN KEY (`service_id`) REFERENCES `fm_service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_application_service_event_fm_service_event` FOREIGN KEY (`service_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用服务事件';


CREATE TABLE `fm_application_service_event_config` (
  `application_service_event_id` varchar(36) NOT NULL COMMENT '服务事件ID',
  `service_event_config_id` varchar(36) DEFAULT NULL COMMENT '服务配置ID',
  `application_service_event_config_id` varchar(36) NOT NULL COMMENT '服务配置ID',
  `entity_id` varchar(36) NOT NULL COMMENT '实体',
  `entity_column_id` varchar(36) NOT NULL COMMENT '实体字段',
  `alias` varchar(45) NOT NULL COMMENT '别名',
  `desc` varchar(128) NOT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `content` varchar(1024) DEFAULT NULL COMMENT '配置内容',
  `data_type_id` varchar(36) NOT NULL COMMENT '类型',
  `precision` int(11) NOT NULL DEFAULT '0' COMMENT '精度',
  `scale` int(11) DEFAULT NULL COMMENT '刻度',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `config_type` varchar(36) DEFAULT NULL COMMENT '配置类型',
  `null_able` int(11) NOT NULL DEFAULT '1' COMMENT '允许空',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`application_service_event_config_id`),
  KEY `fk_fm_a_service_event_config_fm_a_service_event` (`application_service_event_id`) USING BTREE,
  KEY `fk_fm_a_service_event_config_fm_entity_column` (`entity_column_id`) USING BTREE,
  KEY `fk_fm_a_service_event_config_fm_service_event_config` (`service_event_config_id`) USING BTREE,
  KEY `fk_fm_application_service_event_config_fm_data_type` (`data_type_id`) USING BTREE,
  KEY `fk_fm_application_service_event_config_fm_entity` (`entity_id`) USING BTREE,
  KEY `fk_fm_application_service_event_config_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_fm_a_service_event_config_fm_a_service_event` FOREIGN KEY (`application_service_event_id`) REFERENCES `fm_application_service_event` (`application_service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_a_service_event_config_fm_entity_column` FOREIGN KEY (`entity_column_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_a_service_event_config_fm_service_event_config` FOREIGN KEY (`service_event_config_id`) REFERENCES `fm_service_event_config` (`service_event_config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_application_service_event_config_fm_data_type` FOREIGN KEY (`data_type_id`) REFERENCES `fm_data_type` (`data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_application_service_event_config_fm_entity` FOREIGN KEY (`entity_id`) REFERENCES `fm_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用服务配置';


CREATE TABLE `fm_application_service_event_parameters` (
  `application_service_event_id` varchar(36) NOT NULL COMMENT '服务事件ID',
  `service_event_parameters_id` varchar(36) DEFAULT NULL,
  `application_service_event_parameters_id` varchar(36) NOT NULL,
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `rule` varchar(45) NOT NULL COMMENT '规则',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `expression` varchar(1024) DEFAULT NULL COMMENT '表达式',
  `data_type_id` varchar(36) NOT NULL COMMENT '类型',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`application_service_event_parameters_id`),
  KEY `fk_fm_a_service_event_parameters_fm_a_service_event` (`application_service_event_id`) USING BTREE,
  KEY `fk_fm_a_service_event_parameters_fm_data_type` (`data_type_id`) USING BTREE,
  KEY `fk_fm_a_service_event_parameters_fm_service_event_parameters` (`service_event_parameters_id`) USING BTREE,
  KEY `fk_fm_application_service_event_parameters_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_fm_a_service_event_parameters_fm_a_service_event` FOREIGN KEY (`application_service_event_id`) REFERENCES `fm_application_service_event` (`application_service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_a_service_event_parameters_fm_data_type` FOREIGN KEY (`data_type_id`) REFERENCES `fm_data_type` (`data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_a_service_event_parameters_fm_service_event_parameters` FOREIGN KEY (`service_event_parameters_id`) REFERENCES `fm_service_event_parameters` (`service_event_parameters_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用服务时间属性';


CREATE TABLE `fm_bundle_class` (
  `parent_id` varchar(36) DEFAULT NULL,
  `bundle_class_id` varchar(36) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) NOT NULL COMMENT '快捷编码',
  `icon` varchar(45) NOT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`bundle_class_id`),
  KEY `fk_fm_bundle_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件分类';


CREATE TABLE `fm_bundle` (
  `bundle_class_id` varchar(36) NOT NULL,
  `bundle_id` varchar(128) NOT NULL COMMENT 'ID',
  `name` varchar(1024) NOT NULL COMMENT '名称',
  `version` varchar(32) NOT NULL COMMENT '版本',
  `desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `md5` varchar(64) NOT NULL COMMENT 'MD5校验',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`bundle_id`),
  KEY `fk_bundle_bundle_class` (`bundle_class_id`) USING BTREE,
  KEY `fk_fm_bundle_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_bundle_bundle_class` FOREIGN KEY (`bundle_class_id`) REFERENCES `fm_bundle_class` (`bundle_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bundle';


CREATE TABLE `fm_bundle_service_class` (
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父ID',
  `bundle_service_class_id` varchar(36) NOT NULL COMMENT 'ID',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) DEFAULT NULL COMMENT '快捷编码',
  `icon` varchar(45) DEFAULT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`bundle_service_class_id`),
  KEY `fk_fm_bundle_service_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务分类表';


CREATE TABLE `fm_bundle_service` (
  `bundle_id` varchar(128) NOT NULL COMMENT 'bundleID',
  `bundle_service_class_id` varchar(36) NOT NULL COMMENT '服务分类',
  `bundle_service_id` varchar(64) NOT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) NOT NULL COMMENT '备注',
  `short_code` varchar(45) DEFAULT NULL COMMENT '快捷编码',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`bundle_service_id`),
  KEY `fk_fm_bundle_service_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_service_bundle` (`bundle_id`) USING BTREE,
  KEY `fk_service_service_classs` (`bundle_service_class_id`) USING BTREE,
  CONSTRAINT `fk_service_bundle` FOREIGN KEY (`bundle_id`) REFERENCES `fm_bundle` (`bundle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_service_classs` FOREIGN KEY (`bundle_service_class_id`) REFERENCES `fm_bundle_service_class` (`bundle_service_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务表';


CREATE TABLE `fm_bundle_service_config` (
  `bundle_service_id` varchar(36) DEFAULT NULL COMMENT 'ID',
  `bundle_config_class_id` varchar(36) NOT NULL COMMENT 'bundle配置分类',
  `bundle_service_config_id` varchar(36) NOT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `value` varchar(2048) DEFAULT NULL COMMENT '值',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`bundle_service_config_id`),
  KEY `bundle_config_class_id` (`bundle_config_class_id`) USING BTREE,
  KEY `fk_fm_bundle_service_config_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_fm_service_config_fm_bundle_service` (`bundle_service_id`) USING BTREE,
  CONSTRAINT `fk_fm_service_config_fm_bundle_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件配置';


CREATE TABLE `fm_component_class` (
  `parent_id` varchar(36) DEFAULT NULL,
  `component_class_id` varchar(36) NOT NULL COMMENT '组件分类ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) NOT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) DEFAULT NULL COMMENT '快捷编码',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(11) unsigned DEFAULT NULL COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`component_class_id`),
  KEY `fk_fm_component_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端组件分类';


CREATE TABLE `fm_component` (
  `component_id` varchar(36) NOT NULL COMMENT '组件ID',
  `component_class_id` varchar(36) NOT NULL COMMENT '组件分类ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) NOT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `path` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `content` blob COMMENT '内容',
  `type` varchar(36) DEFAULT NULL,
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`component_id`),
  KEY `fk_component_component_class` (`component_class_id`) USING BTREE,
  KEY `fk_fm_component_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_component_component_class` FOREIGN KEY (`component_class_id`) REFERENCES `fm_component_class` (`component_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端组件';


CREATE TABLE `fm_component_attr` (
  `component_id` varchar(36) NOT NULL COMMENT '组件ID',
  `component_attr_id` varchar(36) NOT NULL COMMENT '组件属性ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) NOT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) DEFAULT NULL COMMENT '快捷编码',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` int(11) unsigned DEFAULT NULL COMMENT '排序',
  `attr_value_type` varchar(45) NOT NULL DEFAULT 'string' COMMENT '属性值类型',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`component_attr_id`),
  KEY `fk_component_attr_component` (`component_id`) USING BTREE,
  KEY `fk_fm_component_attr_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_component_attr_component` FOREIGN KEY (`component_id`) REFERENCES `fm_component` (`component_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端组件参数';


CREATE TABLE `fm_component_event` (
  `component_id` varchar(36) NOT NULL COMMENT '组件ID',
  `component_event_id` varchar(36) NOT NULL COMMENT '组件事件ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) NOT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) DEFAULT NULL COMMENT '快捷编码',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `event_type_id` int(11) unsigned DEFAULT NULL COMMENT '事件类型ID',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`component_event_id`),
  KEY `fk_component_event_component` (`component_id`) USING BTREE,
  KEY `fk_fm_component_event_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_component_event_component` FOREIGN KEY (`component_id`) REFERENCES `fm_component` (`component_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端组件事件';


CREATE TABLE `fm_component_instance` (
  `project_id` varchar(36) NOT NULL COMMENT '项目实例化',
  `component_instance_id` varchar(36) NOT NULL COMMENT '前端组件实例ID',
  `component_id` varchar(36) NOT NULL COMMENT '引用组件ID',
  `component_instance_name` varchar(255) DEFAULT NULL COMMENT '组件实例化模块名称',
  `component_instance_desc` varchar(255) DEFAULT NULL COMMENT '模块描述（模块用）',
  `parent_component_id` varchar(36) DEFAULT NULL COMMENT '父级组件ID',
  `sys_auto_code_link` varchar(1109) NOT NULL COMMENT '自动编码link',
  `model` varchar(255) DEFAULT NULL COMMENT '类型(前端控件补充属性)',
  `status` char(11) NOT NULL DEFAULT '1',
  `short_code` varchar(45) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `service_id` varchar(36) DEFAULT NULL COMMENT '服务ID',
  `service_config_id` int(11) unsigned DEFAULT NULL COMMENT '关联服务配置ID',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  PRIMARY KEY (`component_instance_id`),
  KEY `fk_component_instance_component` (`component_id`) USING BTREE,
  KEY `fk_fm_component_instance_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_fm_component_instance_fm_project` (`project_id`),
  KEY `fk_fm_component_instance_fm_service` (`service_id`),
  CONSTRAINT `fk_component_instance_component` FOREIGN KEY (`component_id`) REFERENCES `fm_component` (`component_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_fm_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_fm_service` FOREIGN KEY (`service_id`) REFERENCES `fm_service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件实例';


CREATE TABLE `fm_component_instance_attr` (
  `project_id` varchar(36) NOT NULL,
  `component_instance_attr_id` varchar(36) NOT NULL COMMENT '前端组件实例属性ID',
  `component_instance_id` varchar(36) NOT NULL COMMENT '组件实例ID',
  `component_attr_id` varchar(36) NOT NULL COMMENT '组件属性ID',
  `attr_value_type` varchar(45) NOT NULL DEFAULT 'event_id',
  `component_attr_value` varchar(255) NOT NULL COMMENT '组件属性值',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`component_instance_attr_id`),
  KEY `fk_component_instance_attr_component_attr` (`component_attr_id`) USING BTREE,
  KEY `fk_component_instance_attr_component_instance` (`component_instance_id`) USING BTREE,
  KEY `fk_fm_component_instance_attr_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_fm_component_instance_attr_fm_project` (`project_id`),
  CONSTRAINT `fk_component_instance_attr_component_attr` FOREIGN KEY (`component_attr_id`) REFERENCES `fm_component_attr` (`component_attr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_instance_attr_component_instance` FOREIGN KEY (`component_instance_id`) REFERENCES `fm_component_instance` (`component_instance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_attr_fm_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件实例参数';


CREATE TABLE `fm_component_instance_event` (
  `project_id` varchar(36) NOT NULL,
  `component_id` varchar(36) NOT NULL,
  `component_event_id` varchar(36) NOT NULL,
  `component_instance_id` varchar(36) NOT NULL,
  `component_instance_event_id` varchar(36) NOT NULL,
  `event_name` varchar(64) DEFAULT NULL COMMENT '操作  事件名称',
  `event_desc` varchar(256) DEFAULT NULL COMMENT '事件描述',
  `event_code` varchar(36) NOT NULL,
  `update_user_id` varchar(36) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`component_instance_event_id`),
  KEY `fk_fm_component_instance_event_fm_component` (`component_id`),
  KEY `fk_fm_component_instance_event_fm_component_event` (`component_event_id`),
  KEY `fk_fm_component_instance_event_fm_component_instance` (`component_instance_id`),
  KEY `fk_fm_component_instance_event_m_user` (`update_user_id`),
  KEY `fk_fm_component_instance_event_fm_project` (`project_id`),
  CONSTRAINT `fk_fm_component_instance_event_fm_component` FOREIGN KEY (`component_id`) REFERENCES `fm_component` (`component_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_event_fm_component_event` FOREIGN KEY (`component_event_id`) REFERENCES `fm_component_event` (`component_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_event_fm_component_instance` FOREIGN KEY (`component_instance_id`) REFERENCES `fm_component_instance` (`component_instance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_event_fm_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `fm_component_instance_relation` (
  `project_id` varchar(36) NOT NULL COMMENT '项目实例化',
  `component_instance_id` varchar(36) NOT NULL COMMENT '前端组件实例ID',
  `relation_component_instance_id` varchar(36) NOT NULL COMMENT '引用组件ID',
  `component_instance_relation_id` varchar(36) NOT NULL COMMENT '组件实例引用',
  `status` char(11) NOT NULL DEFAULT '1',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`component_instance_relation_id`),
  KEY `fk_fm_component_instance_rl_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_fm_component_instance_relation_fm_project` (`project_id`),
  KEY `fk_fm_component_instance_relation_fm_component_instance` (`component_instance_id`),
  KEY `fk_fm_component_instance_relations_fm_component_instance` (`relation_component_instance_id`),
  CONSTRAINT `fk_fm_component_instance_relation_fm_component_instance` FOREIGN KEY (`component_instance_id`) REFERENCES `fm_component_instance` (`component_instance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_relation_fm_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_component_instance_relations_fm_component_instance` FOREIGN KEY (`relation_component_instance_id`) REFERENCES `fm_component_instance` (`component_instance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件实例引用';


CREATE TABLE `fm_data_source` (
  `data_type_class_id` varchar(36) DEFAULT NULL COMMENT '数据源分类ID',
  `data_source_id` varchar(36) NOT NULL COMMENT '数据源ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`data_source_id`),
  KEY `fk_data_source_data_type_class` (`data_type_class_id`) USING BTREE,
  KEY `fk_fm_data_source_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_data_source_data_type_class` FOREIGN KEY (`data_type_class_id`) REFERENCES `fm_data_type_class` (`data_type_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源';


CREATE TABLE `fm_data_source_parameters` (
  `data_source_parameters_id` varchar(36) NOT NULL COMMENT '参数ID',
  `data_source_id` varchar(36) NOT NULL COMMENT '数据源ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `value` varchar(512) DEFAULT NULL COMMENT '值',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`data_source_parameters_id`),
  KEY `fk_data_source_parameters_data_source` (`data_source_id`) USING BTREE,
  KEY `fk_fm_data_source_parameters_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_data_source_parameters_data_source` FOREIGN KEY (`data_source_id`) REFERENCES `fm_data_source` (`data_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源配置';


CREATE TABLE `fm_data_type_class` (
  `data_type_class_id` varchar(36) NOT NULL COMMENT '数据类型分类',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` varchar(64) DEFAULT NULL COMMENT '版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`data_type_class_id`),
  KEY `fk_fm_data_type_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据类型分类';


CREATE TABLE `fm_data_type` (
  `data_type_class_id` varchar(36) NOT NULL COMMENT '数据类型分类ID',
  `data_type_id` varchar(36) NOT NULL COMMENT '数据类型ID',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `max_precision` int(11) NOT NULL DEFAULT '0' COMMENT '最大长度',
  `min_precision` int(11) NOT NULL DEFAULT '0' COMMENT '最小长度',
  `scale` int(11) DEFAULT NULL COMMENT '刻度长度',
  `desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`data_type_id`),
  KEY `fk_data_type_data_type_class` (`data_type_class_id`) USING BTREE,
  KEY `fk_fm_data_type_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_data_type_data_type_class` FOREIGN KEY (`data_type_class_id`) REFERENCES `fm_data_type_class` (`data_type_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据类型';


CREATE TABLE `fm_data_type_relation` (
  `data_type_relation_id` varchar(36) NOT NULL COMMENT '数据类型关系',
  `primary_data_type_id` varchar(36) NOT NULL COMMENT '原类型',
  `foreign_data_type_id` varchar(36) NOT NULL COMMENT '映射类型',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `desc` varchar(256) DEFAULT NULL COMMENT '描述',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`data_type_relation_id`),
  KEY `fk_data_type_relation_data_type_f` (`foreign_data_type_id`) USING BTREE,
  KEY `fk_data_type_relation_data_type_p` (`primary_data_type_id`) USING BTREE,
  KEY `fk_fm_data_type_relation_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_data_type_relation_data_type_f` FOREIGN KEY (`foreign_data_type_id`) REFERENCES `fm_data_type` (`data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_type_relation_data_type_p` FOREIGN KEY (`primary_data_type_id`) REFERENCES `fm_data_type` (`data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据类型关系';


CREATE TABLE `fm_entity_class` (
  `parent_id` varchar(36) NOT NULL COMMENT '父ID',
  `entity_class_id` varchar(36) NOT NULL DEFAULT '0' COMMENT 'ID',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) DEFAULT NULL COMMENT '快捷编码',
  `icon` varchar(45) DEFAULT NULL COMMENT '图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`entity_class_id`),
  KEY `fk_fm_entity_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体分类';


CREATE TABLE `fm_entity` (
  `entity_class_id` varchar(36) NOT NULL COMMENT '所属分类',
  `entity_id` varchar(36) NOT NULL COMMENT 'ID',
  `name` varchar(45) NOT NULL COMMENT '表名',
  `desc` varchar(1024) DEFAULT NULL COMMENT '描述',
  `remark` varchar(2014) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(2014) DEFAULT NULL COMMENT '快捷编码',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `islevel` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否有层次',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `type` varchar(30) NOT NULL DEFAULT 'table' COMMENT '实体类型，包括table、view等，来源于字典表',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`entity_id`),
  KEY `fk_entity_entity_class` (`entity_class_id`) USING BTREE,
  KEY `fk_fm_entity_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_entity_entity_class` FOREIGN KEY (`entity_class_id`) REFERENCES `fm_entity_class` (`entity_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体';


CREATE TABLE `fm_entity_column` (
  `data_type_id` varchar(36) NOT NULL COMMENT '数据类型',
  `entity_id` varchar(36) NOT NULL COMMENT '表ID',
  `entity_column_id` varchar(36) NOT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) NOT NULL COMMENT '描述',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `precision` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '字段长度',
  `scale` int(11) DEFAULT NULL COMMENT '刻度',
  `default_value` varchar(45) DEFAULT NULL COMMENT '默认值',
  `primary_key` int(11) NOT NULL DEFAULT '0' COMMENT '是否主键',
  `unique_key` int(11) NOT NULL DEFAULT '0' COMMENT '是否唯一',
  `null_able` int(11) NOT NULL DEFAULT '0' COMMENT '允许空',
  `status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `encrypt_type` int(11) NOT NULL DEFAULT '0' COMMENT '加密类型',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`entity_column_id`),
  KEY `fk_entity_column_data_type` (`data_type_id`) USING BTREE,
  KEY `fk_entity_column_entity` (`entity_id`) USING BTREE,
  KEY `fk_fm_entity_column_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_entity_column_data_type` FOREIGN KEY (`data_type_id`) REFERENCES `fm_data_type` (`data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entity_column_entity` FOREIGN KEY (`entity_id`) REFERENCES `fm_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体字段';


CREATE TABLE `fm_entity_relation` (
  `entity_relation_id` varchar(36) NOT NULL COMMENT 'ID',
  `primary_entity_id` varchar(36) NOT NULL COMMENT '主键表ID',
  `primary_column_id` varchar(36) NOT NULL COMMENT '主键表字段ID',
  `foreign_entity_id` varchar(36) NOT NULL COMMENT '外键表ID',
  `foreign_column_id` varchar(36) NOT NULL COMMENT '外键表字段ID',
  `relation_type` int(11) NOT NULL DEFAULT '0' COMMENT '关系类型',
  `translate_type` int(11) NOT NULL DEFAULT '0' COMMENT '翻译方式',
  `primary_show_columns_id` varchar(36) NOT NULL COMMENT '主键表展示字段ID',
  `foreign_show_columns_id` varchar(36) NOT NULL COMMENT '外键表展示字段ID',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`entity_relation_id`),
  KEY `fk_entity_relation_entity_column_f` (`foreign_column_id`) USING BTREE,
  KEY `fk_entity_relation_entity_column_fs` (`foreign_show_columns_id`) USING BTREE,
  KEY `fk_entity_relation_entity_column_p` (`primary_column_id`) USING BTREE,
  KEY `fk_entity_relation_entity_column_ps` (`primary_show_columns_id`) USING BTREE,
  KEY `fk_entity_relation_entity_f` (`foreign_entity_id`) USING BTREE,
  KEY `fk_entity_relation_entity_p` (`primary_entity_id`) USING BTREE,
  KEY `fk_fm_entity_relation_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_entity_relation_entity_column_f` FOREIGN KEY (`foreign_column_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entity_relation_entity_column_fs` FOREIGN KEY (`foreign_show_columns_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entity_relation_entity_column_p` FOREIGN KEY (`primary_column_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entity_relation_entity_column_ps` FOREIGN KEY (`primary_show_columns_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entity_relation_entity_f` FOREIGN KEY (`foreign_entity_id`) REFERENCES `fm_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entity_relation_entity_p` FOREIGN KEY (`primary_entity_id`) REFERENCES `fm_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体关系';


CREATE TABLE `fm_event_component_service` (
  `event_component_service_id` varchar(36) NOT NULL,
  `component_instance_event_id` varchar(36) NOT NULL,
  `service_event_id` varchar(36) NOT NULL,
  `update_user_id` varchar(36) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  KEY `fk_fm_event_component_service_fm_component_instance_event` (`component_instance_event_id`),
  KEY `fk_fm_event_component_service_fm_service_event` (`service_event_id`),
  KEY `fk_fm_event_component_service_m_user` (`update_user_id`),
  CONSTRAINT `fk_fm_event_component_service_fm_component_instance_event` FOREIGN KEY (`component_instance_event_id`) REFERENCES `fm_component_instance_event` (`component_instance_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_event_component_service_fm_service_event` FOREIGN KEY (`service_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `fm_project` (
  `corp_id` varchar(36) DEFAULT NULL COMMENT '集团编号',
  `project_id` varchar(36) NOT NULL COMMENT 'ID',
  `project_class_id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `desc` varchar(256) NOT NULL COMMENT '描述',
  `remark` varchar(1024) NOT NULL COMMENT '备注',
  `domain` varchar(128) NOT NULL COMMENT '访问域名',
  `root_path` varchar(128) NOT NULL COMMENT '根路径',
  `short_code` varchar(32) DEFAULT NULL COMMENT '快捷编码',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`project_id`),
  KEY `fk_fm_project_m_corp` (`corp_id`) USING BTREE,
  KEY `fk_fm_project_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_fm_project_fm_project_class` (`project_class_id`),
  CONSTRAINT `fk_fm_project_fm_project_class` FOREIGN KEY (`project_class_id`) REFERENCES `fm_project_class` (`project_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_project_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';


CREATE TABLE `fm_project_bundle_service` (
  `project_bundle_service_id` varchar(36) NOT NULL COMMENT '项目服务ID',
  `project_id` varchar(36) NOT NULL COMMENT '项目ID',
  `bundle_service_id` varchar(36) NOT NULL COMMENT '服务ID',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`project_bundle_service_id`),
  KEY `fk_fm_project_bundle_service_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_project_service_project` (`project_id`) USING BTREE,
  KEY `fk_project_service_service` (`bundle_service_id`) USING BTREE,
  CONSTRAINT `fk_project_service_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_service_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目服务';


CREATE TABLE `fm_project_bundle_service_config` (
  `project_bundle_service_config_id` varchar(36) NOT NULL COMMENT '项目配置ID',
  `bundle_service_id` varchar(36) NOT NULL COMMENT '服务ID',
  `project_id` varchar(36) NOT NULL COMMENT '项目ID',
  `bundle_service_config_id` varchar(36) NOT NULL COMMENT '服务配置ID',
  `project_bundle_service_id` varchar(36) DEFAULT NULL COMMENT '项目服务ID',
  `config_value` varchar(1024) DEFAULT NULL COMMENT '值',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`project_bundle_service_config_id`),
  KEY `fk_fm_project_bundle_service_config_fm_project_bundle_service` (`project_bundle_service_id`) USING BTREE,
  KEY `fk_fm_project_bundle_service_config_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_project_service_config_project` (`project_id`) USING BTREE,
  KEY `fk_project_service_config_service` (`bundle_service_id`) USING BTREE,
  KEY `fk_project_service_config_service_config` (`bundle_service_config_id`) USING BTREE,
  CONSTRAINT `fk_fm_project_bundle_service_config_fm_bundle_service_config` FOREIGN KEY (`bundle_service_config_id`) REFERENCES `fm_bundle_service_config` (`bundle_service_config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_project_bundle_service_config_fm_project_bundle_service` FOREIGN KEY (`project_bundle_service_id`) REFERENCES `fm_project_bundle_service` (`project_bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_service_config_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_service_config_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目服务配置';


CREATE TABLE `fm_project_class` (
  `parent_id` varchar(36) DEFAULT NULL,
  `project_class_id` varchar(36) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `short_code` varchar(45) NOT NULL COMMENT '快捷编码',
  `icon` varchar(45) NOT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`project_class_id`),
  KEY `fk_fm_project_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目分类';


CREATE TABLE `fm_sequence` (
  `sequence_id` varchar(36) NOT NULL COMMENT '序列ID',
  `name` varchar(128) NOT NULL COMMENT '序列名称',
  `increment` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '增长值',
  `current_value` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起始值',
  `project_id` varchar(36) NOT NULL COMMENT '项目',
  `entity_id` varchar(36) DEFAULT NULL COMMENT '实体',
  `entity_column_id` varchar(36) DEFAULT NULL COMMENT '实体字段',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`sequence_id`),
  KEY `fk_fm_sequence_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_sequence_entity` (`entity_id`) USING BTREE,
  KEY `fk_sequence_entity_column` (`entity_column_id`) USING BTREE,
  KEY `fk_sequence_project` (`project_id`) USING BTREE,
  CONSTRAINT `fk_sequence_entity` FOREIGN KEY (`entity_id`) REFERENCES `fm_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sequence_entity_column` FOREIGN KEY (`entity_column_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sequence_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表序列';


CREATE TABLE `fm_server` (
  `server_id` varchar(36) NOT NULL,
  `ipv4` varchar(16) DEFAULT NULL,
  `ipv6` varchar(64) DEFAULT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_bin,
  `corp_id` varchar(36) DEFAULT NULL COMMENT '集团编号',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`server_id`),
  KEY `fk_fm_server_m_corp` (`corp_id`) USING BTREE,
  KEY `fk_fm_server_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_fm_server_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器';


CREATE TABLE `fm_server_application` (
  `server_application_id` varchar(36) NOT NULL,
  `server_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL COMMENT 'ID',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`server_application_id`),
  KEY `fk_fm_server_application_fm_project` (`project_id`) USING BTREE,
  KEY `fk_fm_server_application_fm_server` (`server_id`) USING BTREE,
  KEY `fk_fm_server_application_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_fm_server_application_fm_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_server_application_fm_server` FOREIGN KEY (`server_id`) REFERENCES `fm_server` (`server_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器应用';


CREATE TABLE `fm_service_class` (
  `parent_id` varchar(36) DEFAULT NULL,
  `service_class_id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`service_class_id`),
  KEY `fk_fm_service_class_relation_m_user` (`update_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务服务分类';


CREATE TABLE `fm_service` (
  `service_id` varchar(36) NOT NULL,
  `service_class_id` varchar(36) DEFAULT NULL,
  `bundle_service_id` varchar(64) DEFAULT NULL COMMENT 'ID',
  `name` varchar(128) NOT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`service_id`),
  KEY `fk_fm_service_fm_bundle_service` (`bundle_service_id`) USING BTREE,
  KEY `fk_fm_service_fm_service_class` (`service_class_id`) USING BTREE,
  KEY `fk_fm_service_relation_m_user` (`update_user_id`) USING BTREE,
  CONSTRAINT `fk_fm_service_fm_bundle_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_service_fm_service_class` FOREIGN KEY (`service_class_id`) REFERENCES `fm_service_class` (`service_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务服务';


CREATE TABLE `fm_service_event` (
  `service_event_id` varchar(36) NOT NULL COMMENT '服务事件ID',
  `service_id` varchar(36) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `type` varchar(45) NOT NULL COMMENT '事件类型',
  `adapter` varchar(64) NOT NULL COMMENT '改编者',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`service_event_id`),
  KEY `fk_fm_service_event_r_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_fm_service_event_fm_service` (`service_id`),
  CONSTRAINT `fk_fm_service_event_fm_service` FOREIGN KEY (`service_id`) REFERENCES `fm_service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务事件';


CREATE TABLE `fm_service_event_config` (
  `bundle_service_id` varchar(36) NOT NULL COMMENT '服务ID',
  `service_event_id` varchar(36) DEFAULT NULL COMMENT '服务事件ID',
  `service_event_config_id` varchar(36) NOT NULL COMMENT '服务配置ID',
  `entity_id` varchar(36) NOT NULL COMMENT '实体',
  `entity_column_id` varchar(36) NOT NULL COMMENT '实体字段',
  `alias` varchar(45) NOT NULL COMMENT '别名',
  `desc` varchar(128) NOT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `content` varchar(1024) DEFAULT NULL COMMENT '配置内容',
  `data_type_id` varchar(36) NOT NULL COMMENT '类型',
  `precision` int(11) NOT NULL DEFAULT '0' COMMENT '精度',
  `scale` int(11) DEFAULT NULL COMMENT '刻度',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `config_type` varchar(36) DEFAULT NULL COMMENT '配置类型',
  `null_able` int(11) NOT NULL DEFAULT '1' COMMENT '允许空',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`service_event_config_id`),
  KEY `fk_fm_service_event_config_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_service_config_data_type` (`data_type_id`) USING BTREE,
  KEY `fk_service_config_entity` (`entity_id`) USING BTREE,
  KEY `fk_service_config_entity_column` (`entity_column_id`) USING BTREE,
  KEY `fk_service_config_service` (`bundle_service_id`) USING BTREE,
  KEY `fk_service_config_service_event` (`service_event_id`) USING BTREE,
  CONSTRAINT `fk_service_config_data_type` FOREIGN KEY (`data_type_id`) REFERENCES `fm_data_type` (`data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_config_entity` FOREIGN KEY (`entity_id`) REFERENCES `fm_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_config_entity_column` FOREIGN KEY (`entity_column_id`) REFERENCES `fm_entity_column` (`entity_column_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_config_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_config_service_event` FOREIGN KEY (`service_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务配置';


CREATE TABLE `fm_service_event_parameters` (
  `service_event_parameters_id` varchar(36) NOT NULL,
  `data_type_class_id` varchar(36) NOT NULL COMMENT '类型',
  `service_id` varchar(36) NOT NULL COMMENT '服务ID',
  `service_event_id` varchar(36) NOT NULL COMMENT '服务事件ID',
  `desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `rule` varchar(45) NOT NULL COMMENT '规则',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `expression` varchar(1024) DEFAULT NULL COMMENT '表达式',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`service_event_parameters_id`),
  KEY `fk_fm_service_event_parameters_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_service_event_parameters_service_event` (`service_event_id`) USING BTREE,
  KEY `fk_fm_service_event_parameters_fm_data_type_class` (`data_type_class_id`),
  KEY `fk_fm_service_event_parameters_fm_service` (`service_id`),
  CONSTRAINT `fk_fm_service_event_parameters_fm_data_type_class` FOREIGN KEY (`data_type_class_id`) REFERENCES `fm_data_type_class` (`data_type_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_service_event_parameters_fm_service` FOREIGN KEY (`service_id`) REFERENCES `fm_service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_event_parameters_service_event` FOREIGN KEY (`service_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务时间属性';


CREATE TABLE `fm_service_event_relation` (
  `bundle_service_id` varchar(36) NOT NULL COMMENT '服务ID',
  `service_event_id` varchar(36) NOT NULL COMMENT '服务事件ID',
  `update_user_id` varchar(36) NOT NULL COMMENT '最后修改用户',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`bundle_service_id`,`service_event_id`),
  KEY `fk_fm_service_event_relation_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_service_event_refer_service` (`bundle_service_id`) USING BTREE,
  KEY `fk_service_event_refer_service_event` (`service_event_id`) USING BTREE,
  CONSTRAINT `fk_service_event_refer_service` FOREIGN KEY (`bundle_service_id`) REFERENCES `fm_bundle_service` (`bundle_service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_event_refer_service_event` FOREIGN KEY (`service_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务事件引用';


CREATE TABLE `fm_synchronization_cache` (
  `synchronization_cache_id` varchar(36) NOT NULL,
  `quartz` varchar(25) NOT NULL COMMENT 'quartz 表达式',
  `task_event_id` varchar(36) NOT NULL COMMENT '初始化事件ID',
  `task_incrementReference` varchar(256) DEFAULT NULL COMMENT '标记增量字段',
  `task_incrementEvent_id` varchar(36) DEFAULT NULL COMMENT '增量事件id',
  `task_cachename` varchar(128) DEFAULT NULL COMMENT '更新local cache key',
  `task_command` varchar(1) DEFAULT NULL COMMENT '操作命令字',
  `task_type` varchar(2) DEFAULT NULL COMMENT '缓存类型',
  `data_source_id` varchar(36) DEFAULT NULL,
  `update_user_id` varchar(36) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  KEY `fk_fm_synchronization_cache_fm_data_source` (`data_source_id`),
  KEY `fk_fm_synchronization_cache_fm_service_event` (`task_event_id`),
  KEY `fk_fm_synchronization_cache_fm_service_events` (`task_incrementEvent_id`),
  KEY `fk_fm_synchronization_cache_m_user` (`update_user_id`),
  CONSTRAINT `fk_fm_synchronization_cache_fm_data_source` FOREIGN KEY (`data_source_id`) REFERENCES `fm_data_source` (`data_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_synchronization_cache_fm_service_event` FOREIGN KEY (`task_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fm_synchronization_cache_fm_service_events` FOREIGN KEY (`task_incrementEvent_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_base_dictionary` (
  `baseid` varchar(36) NOT NULL COMMENT '字典主键',
  `item_code` varchar(30) DEFAULT NULL COMMENT '字典编码，作为预留字段，程序中引用ID',
  `item_name` varchar(50) DEFAULT NULL COMMENT '字典项名称',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父字典名称',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序字段',
  `default_value` int(11) DEFAULT NULL COMMENT '缺省值',
  `fcode` varchar(50) DEFAULT NULL,
  `update_user_id` varchar(36) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_base_exception` (
  `exception_id` varchar(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `desc` varchar(512) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `service_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`exception_id`),
  KEY `fk_fm_exception_fm_service` (`service_id`) USING BTREE,
  KEY `fk_fm_exception_m_user` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统异常定义表';


CREATE TABLE `m_corp` (
  `corp_id` varchar(36) NOT NULL COMMENT '集团编号',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父集团编号',
  `corp_name` varchar(255) NOT NULL,
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1',
  `update_user_id` varchar(36) NOT NULL COMMENT '更新操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`corp_id`),
  KEY `fk_m_corp_m_user` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团';


CREATE TABLE `m_corp_append` (
  `corp_id` varchar(36) NOT NULL,
  `agentcode` varchar(30) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `code_id` varchar(36) DEFAULT NULL,
  `typecode` int(11) DEFAULT NULL,
  `license_word` varchar(30) DEFAULT NULL,
  `license_id` varchar(30) DEFAULT NULL,
  `startdate` int(11) DEFAULT NULL,
  `expiredate` int(11) DEFAULT NULL,
  `issuecertificateorgans` varchar(128) DEFAULT NULL,
  `issuecertificate_date` int(11) DEFAULT NULL,
  `register_captial` int(11) DEFAULT NULL,
  `owncars` int(11) DEFAULT NULL,
  `legal_person` varchar(30) DEFAULT NULL,
  `responsible` varchar(30) DEFAULT NULL,
  `contact_telephone` varchar(30) DEFAULT NULL,
  `creditcheck_level` int(11) DEFAULT NULL,
  `creditcheck_date` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `fid` varchar(36) DEFAULT NULL,
  `update_user_id` varchar(36) NOT NULL COMMENT '??????',
  `update_time` int(11) NOT NULL COMMENT '??????',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `IDX_CORP_APPEND_CORP_ID` (`corp_id`),
  CONSTRAINT `fk_m_corp_append_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_corp_role` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `corp_id` varchar(36) NOT NULL COMMENT '集团编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '修改操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`corp_id`),
  UNIQUE KEY `CORP_ROL_PK` (`role_id`,`corp_id`),
  KEY `IDX_CORP_ROLE_CORP_ID` (`corp_id`) USING BTREE,
  KEY `fk_m_corp_role_m_user` (`update_user_id`),
  CONSTRAINT `fk_m_corp_role_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_corp_role_m_role` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_menu` (
  `project_id` varchar(36) NOT NULL,
  `menu_id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `component_instance_id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_user_id` varchar(36) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_MENU_COMPONENT_ID` (`component_instance_id`) USING BTREE,
  KEY `fk_m_menu_m_user` (`update_user_id`) USING BTREE,
  KEY `fk_m_menu_fm_project` (`project_id`),
  CONSTRAINT `fk_m_menu_fm_component_instance` FOREIGN KEY (`component_instance_id`) REFERENCES `fm_component_instance` (`component_instance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_menu_fm_project` FOREIGN KEY (`project_id`) REFERENCES `fm_project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_role` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `corp_id` varchar(36) DEFAULT NULL COMMENT '角色所属集团编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '修改操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`role_id`),
  KEY `IDX_ROLE_CORP_ID` (`corp_id`) USING BTREE,
  KEY `fk_m_role_m_user` (`update_user_id`),
  CONSTRAINT `fk_m_role_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';


CREATE TABLE `m_role_component_event` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `component_instance_event_id` varchar(36) NOT NULL,
  `grant_attribute` varchar(2048) DEFAULT NULL COMMENT '授权的模块属性',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '修改操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`role_id`,`component_instance_event_id`),
  KEY `fk_m_role_module_m_role` (`role_id`) USING BTREE,
  KEY `fk_m_role_module_m_user` (`update_user_id`),
  KEY `IDX_ROLE_MODULE_MODULE_ID` (`component_instance_event_id`) USING BTREE,
  CONSTRAINT `fk_m_role_component_event_fm_component_instance_event` FOREIGN KEY (`component_instance_event_id`) REFERENCES `fm_component_instance_event` (`component_instance_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_role_module_m_role` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与组件事件多对多关系';


CREATE TABLE `m_role_service_event` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `service_event_id` varchar(36) NOT NULL,
  `grant_attribute` varchar(2048) DEFAULT NULL COMMENT '授权的服务事件属性',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '修改操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`role_id`,`service_event_id`),
  KEY `fk_m_role_service_m_role` (`role_id`) USING BTREE,
  KEY `fk_m_role_service_m_user` (`update_user_id`),
  KEY `IDX_ROLE_SERVICE_EVENT_ID` (`service_event_id`) USING BTREE,
  CONSTRAINT `fk_m_role_service_event_fm_service_event` FOREIGN KEY (`service_event_id`) REFERENCES `fm_service_event` (`service_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_role_service_m_role` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与服务事件多对多关系';


CREATE TABLE `m_user` (
  `corp_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_administrator` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `icon` varchar(1024) DEFAULT NULL,
  `gender` int(11) NOT NULL DEFAULT '0',
  `memo` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `user_origin_id` varchar(36) DEFAULT NULL,
  `source_id` varchar(36) DEFAULT NULL,
  `update_user_id` varchar(36) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `m_oper_user_name` (`login_name`) USING BTREE,
  KEY `IDX_OPER_USER_CORP_ID` (`corp_id`) USING BTREE,
  KEY `fk_m_user_m_source` (`user_origin_id`) USING BTREE,
  CONSTRAINT `fk_m_user_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_user_m_user_origin` FOREIGN KEY (`user_origin_id`) REFERENCES `m_user_origin` (`user_origin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';


CREATE TABLE `m_user_group` (
  `user_group_id` varchar(36) NOT NULL COMMENT '用户组编号',
  `group_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `corp_id` varchar(36) DEFAULT NULL COMMENT '所属集团ID',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '更新操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_group_id`),
  KEY `IDX_USER_GROUP_CORP_ID` (`corp_id`) USING BTREE,
  KEY `fk_m_user_group_m_user` (`update_user_id`),
  CONSTRAINT `fk_m_user_group_m_corp` FOREIGN KEY (`corp_id`) REFERENCES `m_corp` (`corp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组';


CREATE TABLE `m_user_group_map` (
  `user_group_map_id` varchar(36) NOT NULL,
  `user_group_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_group_map_id`),
  KEY `IDX_USER_GROUP_MAP_USER_ID` (`user_id`) USING BTREE,
  KEY `IDX_USER__GROUP_ID` (`user_group_id`) USING BTREE,
  CONSTRAINT `fk_m_user_group_map_m_user` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_user_group_map_m_user_group` FOREIGN KEY (`user_group_id`) REFERENCES `m_user_group` (`user_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='?????';


CREATE TABLE `m_user_group_role` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `user_group_id` varchar(36) NOT NULL COMMENT '用户组编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '更新操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`role_id`,`user_group_id`),
  KEY `IDX_USER_GROUP_ROLE_GROUP_ID` (`user_group_id`) USING BTREE,
  KEY `fk_m_user_group_role_m_user` (`update_user_id`),
  CONSTRAINT `fk_m_user_group_role_m_role` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m_user_group_role_m_user_group` FOREIGN KEY (`user_group_id`) REFERENCES `m_user_group` (`user_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组角色';


CREATE TABLE `m_user_info` (
  `user_id` varchar(36) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `regist_ip` varchar(20) DEFAULT NULL,
  `regist_time` bigint(20) DEFAULT NULL,
  `regist_service` varchar(10) DEFAULT NULL COMMENT '注册来源,hdletv => shop.letv.com(乐视商城),www => www.letv.com(乐视网),',
  `birthday` bigint(20) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `picture` varchar(1024) DEFAULT NULL,
  `alias` varchar(150) DEFAULT NULL,
  `last_modify_time` bigint(20) DEFAULT NULL,
  `is_identify` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_m_user_info_m_user` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_user_login_record` (
  `user_login_record_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `login_time` int(11) NOT NULL DEFAULT '0',
  `logout_time` int(11) DEFAULT NULL,
  `demo` varchar(255) DEFAULT NULL,
  `login_type` int(11) DEFAULT NULL,
  `login_ip` varchar(15) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  PRIMARY KEY (`user_login_record_id`),
  KEY `fk_m_user_login_record_m_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_m_user_login_record_m_user` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `m_user_origin` (
  `user_origin_id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `demo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_origin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户来源';


CREATE TABLE `m_user_role` (
  `user_id` varchar(36) NOT NULL COMMENT '用户编号',
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_user_id` varchar(36) NOT NULL COMMENT '更新操作员ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_USER_ROLE_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `fk_m_user_role_m_role` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色';




LOCK TABLES `fm_application_service_event` WRITE;
ALTER TABLE `fm_application_service_event` DISABLE KEYS;
ALTER TABLE `fm_application_service_event` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_application_service_event_config` WRITE;
ALTER TABLE `fm_application_service_event_config` DISABLE KEYS;
ALTER TABLE `fm_application_service_event_config` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_application_service_event_parameters` WRITE;
ALTER TABLE `fm_application_service_event_parameters` DISABLE KEYS;
ALTER TABLE `fm_application_service_event_parameters` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_bundle_class` WRITE;
ALTER TABLE `fm_bundle_class` DISABLE KEYS;
INSERT INTO `fm_bundle_class` (`parent_id`, `bundle_class_id`, `name`, `desc`, `remark`, `short_code`, `icon`, `sort`, `update_user_id`, `update_time`) VALUES 
	(NULL,'fm_system_bundle_base','系统基础BUNDLE',NULL,'系统基础BUNDLE，请勿修改！','','',1,'fm_system_user_root',0);
ALTER TABLE `fm_bundle_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_bundle` WRITE;
ALTER TABLE `fm_bundle` DISABLE KEYS;
ALTER TABLE `fm_bundle` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_bundle_service_class` WRITE;
ALTER TABLE `fm_bundle_service_class` DISABLE KEYS;
INSERT INTO `fm_bundle_service_class` (`parent_id`, `bundle_service_class_id`, `name`, `desc`, `remark`, `short_code`, `icon`, `sort`, `update_user_id`, `update_time`) VALUES 
	(NULL,'fm_system_bundle_service_base','系统基础服务',NULL,'系统基础服务，请勿修改！',NULL,NULL,1,'fm_system_user_root',0);
ALTER TABLE `fm_bundle_service_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_bundle_service` WRITE;
ALTER TABLE `fm_bundle_service` DISABLE KEYS;
ALTER TABLE `fm_bundle_service` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_bundle_service_config` WRITE;
ALTER TABLE `fm_bundle_service_config` DISABLE KEYS;
ALTER TABLE `fm_bundle_service_config` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_class` WRITE;
ALTER TABLE `fm_component_class` DISABLE KEYS;
INSERT INTO `fm_component_class` (`parent_id`, `component_class_id`, `name`, `desc`, `remark`, `short_code`, `status`, `sort`, `update_user_id`, `update_time`) VALUES 
	(NULL,'fm_system_component_base','系统基础组件','系统基础组件','系统基础组件，请勿删除！',NULL,1,NULL,'fm_system_user_root',0);
ALTER TABLE `fm_component_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component` WRITE;
ALTER TABLE `fm_component` DISABLE KEYS;
ALTER TABLE `fm_component` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_attr` WRITE;
ALTER TABLE `fm_component_attr` DISABLE KEYS;
ALTER TABLE `fm_component_attr` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_event` WRITE;
ALTER TABLE `fm_component_event` DISABLE KEYS;
ALTER TABLE `fm_component_event` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_instance` WRITE;
ALTER TABLE `fm_component_instance` DISABLE KEYS;
ALTER TABLE `fm_component_instance` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_instance_attr` WRITE;
ALTER TABLE `fm_component_instance_attr` DISABLE KEYS;
ALTER TABLE `fm_component_instance_attr` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_instance_event` WRITE;
ALTER TABLE `fm_component_instance_event` DISABLE KEYS;
ALTER TABLE `fm_component_instance_event` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_component_instance_relation` WRITE;
ALTER TABLE `fm_component_instance_relation` DISABLE KEYS;
ALTER TABLE `fm_component_instance_relation` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_data_source` WRITE;
ALTER TABLE `fm_data_source` DISABLE KEYS;
ALTER TABLE `fm_data_source` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_data_source_parameters` WRITE;
ALTER TABLE `fm_data_source_parameters` DISABLE KEYS;
ALTER TABLE `fm_data_source_parameters` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_data_type_class` WRITE;
ALTER TABLE `fm_data_type_class` DISABLE KEYS;
INSERT INTO `fm_data_type_class` (`data_type_class_id`, `name`, `desc`, `remark`, `version`, `update_user_id`, `update_time`) VALUES 
	('system_data_type_DB2','DB2','DB2数据类型',NULL,NULL,'fm_system_user_root',0),
	('system_data_type_h2','H2','h2数据类型',NULL,NULL,'fm_system_user_root',0),
	('system_data_type_java','JAVA','java数据类型',NULL,NULL,'fm_system_user_root',0),
	('system_data_type_mongodb','mongodb','mongodb数据类型',NULL,NULL,'fm_system_user_root',0),
	('system_data_type_mysql','MySQL','mysql数据类型',NULL,NULL,'fm_system_user_root',0),
	('system_data_type_oracle','Oracle','oracle数据类型',NULL,NULL,'fm_system_user_root',0),
	('system_data_type_postgresql','postgresql','postgresql数据类型',NULL,NULL,'fm_system_user_root',0);
ALTER TABLE `fm_data_type_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_data_type` WRITE;
ALTER TABLE `fm_data_type` DISABLE KEYS;
INSERT INTO `fm_data_type` (`data_type_class_id`, `data_type_id`, `name`, `max_precision`, `min_precision`, `scale`, `desc`, `remark`, `update_user_id`, `update_time`) VALUES 
	('system_data_type_DB2','db2_BIGINT','BIGINT',0,0,NULL,'若Oracle中定义NUMBER(p) 或 NUMBER(p,s), 则使用SAMLLINT/INTEGER/BIGINT',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_BLOB','BLOB',0,0,NULL,'若n<=2GB, 则使用BLOB(n)',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_CHAR','CHAR',32766,0,NULL,'若n<=32766,则使用DB2/400中的CHAR类型、VARCHAR',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_CHAR_FOR_BIT_DATA','CHAR FOR BIT DATA',0,0,NULL,'若n<=32K, 则使用CHAR(n) FOR BIT DATA 或',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_CLOB','CLOB',0,0,NULL,'若32K=< n <=2GB，则使用CLOB',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_DATE','DATE',0,0,NULL,'如果只使用MM/DD/YYY,那么使用DATE类型。',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_DBCLOB','DBCLOB',0,0,NULL,'若n<=2GB, 则使用DBCLOB(n/2)',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_DECIMAL','DECIMAL',0,0,NULL,'若Oracle中定义NUMBER(p,s), 则使用DECIMAL(p,s)',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_DOUBLE','DOUBLE',0,0,NULL,'若Oracle中定义NUMBER,则使用FLOAT(n)/REAL/DOUBLE',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_Float','Float',0,0,NULL,'若Oracle中定义NUMBER,则使用FLOAT(n)/REAL/DOUBLE',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_INTEGER','INTEGER',0,0,NULL,'若Oracle中定义NUMBER(p) 或 NUMBER(p,s), 则使用SAMLLINT/INTEGER/BIGINT',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_REAL','REAL',0,0,NULL,'若Oracle中定义NUMBER,则使用FLOAT(n)/REAL/DOUBLE',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_SMALLINT','SMALLINT',0,0,NULL,'若Oracle中定义NUMBER(p) 或 NUMBER(p,s), 则使用SAMLLINT/INTEGER/BIGINT',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_TIME','TIME',0,0,NULL,'如果只使用HH:MM:SS, 那么使用TIME类型。',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_TIMESTAMP','TIMESTAMP',0,0,NULL,'如果要使用日期和时间，则使用时间戳类型（TIMESTAMP）',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_VARCHAR','VARCHAR',32766,0,NULL,'若n<=32K,则使用DB2/400中的CHAR类型、VARCHAR。',NULL,'fm_system_user_root',0),
	('system_data_type_DB2','db2_VARCHAR_FOR_BIT_DATA','VARCHAR FOR BIT DATA',0,0,NULL,'VARCHAR(n) FOR BIT DATA',NULL,'fm_system_user_root',0),
	('system_data_type_mongodb','Integer','Integer',0,0,NULL,'整型',NULL,'fm_system_user_root',0),
	('system_data_type_mongodb','mongodb_String','String',0,0,NULL,'UTF-8编码的字符串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_BIGINT','BIGINT',0,0,NULL,'较大整数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_BLOB','BLOB',0,0,NULL,'小BLOB',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_CHAR','CHAR',0,0,NULL,'定长字符串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_DATE','DATE',0,0,NULL,'“YYYY-MM-DD”格式表示的日期值',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_DATETIME','DATETIME',0,0,NULL,'“YYYY-MM-DD hh:mm:ss”格式',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_DECIMAL','DECIMAL',0,0,NULL,'一个串的浮点数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_DOUBLE','DOUBLE',0,0,NULL,'双精度浮点数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_ENUM','ENUM',0,0,NULL,'枚举；列可赋予某个枚举成员',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_FLOAT','FLOAT',0,0,NULL,'单精度浮点数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_INT','INT',0,0,NULL,'标准整数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_LONGBLOB','LONGBLOB',0,0,NULL,'大BLOB',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_LONGTEXT','LONGTEXT',0,0,NULL,'大文本串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_MEDIUMBLOB','MEDIUMBLOB',0,0,NULL,'中等的BLOB',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_MEDIUMINT','MEDIUMINT',0,0,NULL,'中等大小整数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_MEDIUMTEXT','MEDIUMTEXT',0,0,NULL,'中等文本串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_SET','SET',0,0,NULL,'集合；列可赋予多个集合成员',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_SMALLINT','SMALLINT',0,0,NULL,'较小整数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_TEXT','TEXT',0,0,NULL,'小文本串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_TIME','TIME',0,0,NULL,'“hh:mm:ss”格式表示的时间值',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_TIMESTAMP','TIMESTAMP',0,0,NULL,'“YYYYMMDDhhmmss”格式表示的时间戳值',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_TINYBLOB','TINYBLOB',0,0,NULL,'非常小的BLOB（二进制大对象）',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_TINYINT','TINYINT',0,0,NULL,'非常小的整数',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_TINYTEXT','TINYTEXT',0,0,NULL,'非常小的文本串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_VARCHAR','VARCHAR',0,0,NULL,'可变长字符串',NULL,'fm_system_user_root',0),
	('system_data_type_mysql','mysql_YEAR','YEAR',0,0,NULL,'“YYYY”格式的年份值',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Blob','Blob',0,0,NULL,'二进制数据',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Char','Char',2000,0,NULL,'固定长度字符串',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Clob','Clob',0,0,NULL,'字符数据',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Date','Date',0,0,NULL,'日期（日-月-年）   DD-MM-YY（HH-MI-SS）',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Long','Long',0,0,NULL,'超长字符串',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Number','Number',0,0,NULL,'数字类型',NULL,'fm_system_user_root',0),
	('system_data_type_oracle','oracle_Varchar2','Varchar2',4000,0,NULL,'可变长度的字符串',NULL,'fm_system_user_root',0);
ALTER TABLE `fm_data_type` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_data_type_relation` WRITE;
ALTER TABLE `fm_data_type_relation` DISABLE KEYS;
ALTER TABLE `fm_data_type_relation` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_entity_class` WRITE;
ALTER TABLE `fm_entity_class` DISABLE KEYS;
ALTER TABLE `fm_entity_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_entity` WRITE;
ALTER TABLE `fm_entity` DISABLE KEYS;
ALTER TABLE `fm_entity` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_entity_column` WRITE;
ALTER TABLE `fm_entity_column` DISABLE KEYS;
ALTER TABLE `fm_entity_column` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_entity_relation` WRITE;
ALTER TABLE `fm_entity_relation` DISABLE KEYS;
ALTER TABLE `fm_entity_relation` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_event_component_service` WRITE;
ALTER TABLE `fm_event_component_service` DISABLE KEYS;
ALTER TABLE `fm_event_component_service` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_project` WRITE;
ALTER TABLE `fm_project` DISABLE KEYS;
ALTER TABLE `fm_project` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_project_bundle_service` WRITE;
ALTER TABLE `fm_project_bundle_service` DISABLE KEYS;
ALTER TABLE `fm_project_bundle_service` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_project_bundle_service_config` WRITE;
ALTER TABLE `fm_project_bundle_service_config` DISABLE KEYS;
ALTER TABLE `fm_project_bundle_service_config` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_project_class` WRITE;
ALTER TABLE `fm_project_class` DISABLE KEYS;
ALTER TABLE `fm_project_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_sequence` WRITE;
ALTER TABLE `fm_sequence` DISABLE KEYS;
ALTER TABLE `fm_sequence` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_server` WRITE;
ALTER TABLE `fm_server` DISABLE KEYS;
ALTER TABLE `fm_server` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_server_application` WRITE;
ALTER TABLE `fm_server_application` DISABLE KEYS;
ALTER TABLE `fm_server_application` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_service_class` WRITE;
ALTER TABLE `fm_service_class` DISABLE KEYS;
INSERT INTO `fm_service_class` (`parent_id`, `service_class_id`, `name`, `desc`, `update_user_id`, `update_time`) VALUES 
	(NULL,'fm_system_service_base','系统基础服务','系统基础服务，请勿删除','fm_system_user_root',0);
ALTER TABLE `fm_service_class` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_service` WRITE;
ALTER TABLE `fm_service` DISABLE KEYS;
ALTER TABLE `fm_service` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_service_event` WRITE;
ALTER TABLE `fm_service_event` DISABLE KEYS;
ALTER TABLE `fm_service_event` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_service_event_config` WRITE;
ALTER TABLE `fm_service_event_config` DISABLE KEYS;
ALTER TABLE `fm_service_event_config` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_service_event_parameters` WRITE;
ALTER TABLE `fm_service_event_parameters` DISABLE KEYS;
ALTER TABLE `fm_service_event_parameters` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_service_event_relation` WRITE;
ALTER TABLE `fm_service_event_relation` DISABLE KEYS;
ALTER TABLE `fm_service_event_relation` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `fm_synchronization_cache` WRITE;
ALTER TABLE `fm_synchronization_cache` DISABLE KEYS;
ALTER TABLE `fm_synchronization_cache` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_base_dictionary` WRITE;
ALTER TABLE `m_base_dictionary` DISABLE KEYS;
ALTER TABLE `m_base_dictionary` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_base_exception` WRITE;
ALTER TABLE `m_base_exception` DISABLE KEYS;
ALTER TABLE `m_base_exception` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_corp` WRITE;
ALTER TABLE `m_corp` DISABLE KEYS;
INSERT INTO `m_corp` (`corp_id`, `parent_id`, `corp_name`, `memo`, `status`, `update_user_id`, `update_time`) VALUES 
	('fm_system_corp',NULL,'系统',NULL,1,'fm_system_user_root',0);
ALTER TABLE `m_corp` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_corp_append` WRITE;
ALTER TABLE `m_corp_append` DISABLE KEYS;
ALTER TABLE `m_corp_append` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_corp_role` WRITE;
ALTER TABLE `m_corp_role` DISABLE KEYS;
ALTER TABLE `m_corp_role` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_menu` WRITE;
ALTER TABLE `m_menu` DISABLE KEYS;
ALTER TABLE `m_menu` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_role` WRITE;
ALTER TABLE `m_role` DISABLE KEYS;
ALTER TABLE `m_role` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_role_component_event` WRITE;
ALTER TABLE `m_role_component_event` DISABLE KEYS;
ALTER TABLE `m_role_component_event` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_role_service_event` WRITE;
ALTER TABLE `m_role_service_event` DISABLE KEYS;
ALTER TABLE `m_role_service_event` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user` WRITE;
ALTER TABLE `m_user` DISABLE KEYS;
INSERT INTO `m_user` (`corp_id`, `user_id`, `login_name`, `password`, `is_administrator`, `user_name`, `icon`, `gender`, `memo`, `status`, `user_origin_id`, `source_id`, `update_user_id`, `update_time`) VALUES 
	('fm_system_corp','fm_system_user_root','root','root',1,'root',NULL,2,NULL,1,'fm_local',NULL,'fm_system_user_root',0);
ALTER TABLE `m_user` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_group` WRITE;
ALTER TABLE `m_user_group` DISABLE KEYS;
ALTER TABLE `m_user_group` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_group_map` WRITE;
ALTER TABLE `m_user_group_map` DISABLE KEYS;
ALTER TABLE `m_user_group_map` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_group_role` WRITE;
ALTER TABLE `m_user_group_role` DISABLE KEYS;
ALTER TABLE `m_user_group_role` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_info` WRITE;
ALTER TABLE `m_user_info` DISABLE KEYS;
ALTER TABLE `m_user_info` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_login_record` WRITE;
ALTER TABLE `m_user_login_record` DISABLE KEYS;
ALTER TABLE `m_user_login_record` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_origin` WRITE;
ALTER TABLE `m_user_origin` DISABLE KEYS;
INSERT INTO `m_user_origin` (`user_origin_id`, `name`, `demo`) VALUES 
	('fm_local','local','系统本地账户');
ALTER TABLE `m_user_origin` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `m_user_role` WRITE;
ALTER TABLE `m_user_role` DISABLE KEYS;
ALTER TABLE `m_user_role` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


