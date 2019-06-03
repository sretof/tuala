#DROP TABLE IF EXISTS `mkt_top10_floatholders`;
CREATE TABLE `mkt_top10_floatholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) NOT NULL COMMENT '公告日期',
  `end_date` char(8) NOT NULL COMMENT '报告期',
  `holder_name` varchar(300) DEFAULT NULL COMMENT '股东名称',
  `hold_amount` float DEFAULT NULL COMMENT '持有数量（股）',
  `hold_ratio` float DEFAULT NULL COMMENT '持有比例',
  PRIMARY KEY (`id`),
  KEY `mkt_ttfh_tc` (`ts_code`)
) ENGINE=InnoDB;