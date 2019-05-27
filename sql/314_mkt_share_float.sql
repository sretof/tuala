#DROP TABLE IF EXISTS `mkt_share_float`;
CREATE TABLE `mkt_share_float` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `end_date` char(8) DEFAULT NULL COMMENT '截至日期',
  PRIMARY KEY (`id`),
  KEY `mkt_rhc_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;