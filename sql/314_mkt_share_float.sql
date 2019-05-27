#DROP TABLE IF EXISTS `mkt_share_float`;
CREATE TABLE `mkt_share_float` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `float_date` char(8) DEFAULT NULL COMMENT '解禁日期',
  `float_share` float DEFAULT NULL COMMENT '流通股份',
  `float_ratio` float DEFAULT NULL COMMENT '流通股份占总股本比率',
  `holder_name` varchar(200) DEFAULT NULL COMMENT '股东名称',
  `share_type` varchar(50) DEFAULT NULL COMMENT '股份类型',
  PRIMARY KEY (`id`),
  KEY `mkt_sf_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;