#DROP TABLE IF EXISTS `mkt_pledge_detail`;
CREATE TABLE `mkt_pledge_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '截至日期',
  `holder_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '股东名称',
  `pledge_amount` float DEFAULT NULL COMMENT '质押数量',
  `start_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '质押开始日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '质押结束日期',
  `release` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否已解押',
  `release_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '解押日期',
  `pledgor` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '质押方',
  `holding_amount` float DEFAULT NULL COMMENT '持股总数',
  `pledged_amount` float DEFAULT NULL COMMENT '质押总数',
  `p_total_ratio` float DEFAULT NULL COMMENT '本次质押占总股本比例',
  `h_total_ratio` float DEFAULT NULL COMMENT '持股总数占总股本比例',
  `buyback` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否回购',
  PRIMARY KEY (`id`),
  KEY `mkt_pgd_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;