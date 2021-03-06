﻿#DROP TABLE IF EXISTS `fund_nav`;
CREATE TABLE `fund_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) DEFAULT NULL COMMENT '公告日期',
  `end_date` char(8) NOT NULL COMMENT '截止日期',
  `unit_nav` float DEFAULT NULL COMMENT '单位净值',
  `accum_nav` float DEFAULT NULL COMMENT '累计净值',
  `accum_div` float DEFAULT NULL COMMENT '累计分红',
  `net_asset` float DEFAULT NULL COMMENT '资产净值',
  `total_netasset` float DEFAULT NULL COMMENT '合计资产净值',
  `adj_nav` float DEFAULT NULL COMMENT '复权单位净值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `f_fnv_tc_ed` (`ts_code`,`end_date`),
  KEY `f_fnv_tc` (`ts_code`)
) ENGINE=InnoDB;