#DROP TABLE IF EXISTS `mkt_stk_holdernumber`;
CREATE TABLE `mkt_stk_holdernumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '截止日期',
  `holder_num` int DEFAULT NULL COMMENT '股东户数',
  PRIMARY KEY (`id`),
  KEY `mkt_shno_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;