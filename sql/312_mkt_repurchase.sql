#DROP TABLE IF EXISTS `mkt_repurchase`;
CREATE TABLE `mkt_repurchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) NOT NULL COMMENT '公告日期',
  `end_date` char(8) DEFAULT NULL COMMENT '截至日期',
  `proc` varchar(50) DEFAULT NULL COMMENT '进度',
  `exp_date` char(8) DEFAULT NULL COMMENT '过期日期',
  `vol` float DEFAULT NULL COMMENT '回购数量',
  `amount` float DEFAULT NULL COMMENT '回购金额',
  `high_limit` float DEFAULT NULL COMMENT '回购最高价',
  `low_limit` float DEFAULT NULL COMMENT '回购最低价',
  PRIMARY KEY (`id`),
  KEY `mkt_rhc_tc` (`ts_code`)
) ENGINE=InnoDB;