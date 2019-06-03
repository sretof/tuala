DROP TABLE IF EXISTS `idx_basic`;
CREATE TABLE `idx_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `name` varchar(50) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(50) DEFAULT NULL COMMENT '全称',
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `publisher` varchar(50) DEFAULT NULL COMMENT '发布方',
  `index_type` varchar(50) DEFAULT NULL COMMENT '指数风格',
  `category` varchar(50) DEFAULT NULL COMMENT '指数类别',
  `base_date` varchar(8) DEFAULT NULL COMMENT '基期',
  `base_point` float DEFAULT NULL COMMENT '基点',
  `list_date` varchar(8) DEFAULT NULL COMMENT '发布日期',
  `weight_rule` varchar(10) DEFAULT NULL COMMENT '加权方式',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `exp_date` varchar(8) DEFAULT NULL COMMENT '终止日期',
  `fav` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tts_code` varchar(20) DEFAULT NULL COMMENT 'TRIM_TS代码',
  `del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idb_ts_code` (`ts_code`)
) ENGINE=InnoDB;