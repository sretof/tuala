#DROP TABLE IF EXISTS `mkt_margin_detail`;
CREATE TABLE `mkt_margin_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `rzye` float DEFAULT NULL COMMENT '融资余额(元)',
  `rqye` float DEFAULT NULL COMMENT '融券余额(元)',
  `rzmre` float DEFAULT NULL COMMENT '融资买入额(元)',
  `rqyl` float DEFAULT NULL COMMENT '融券余量（手）',
  `rzche` float DEFAULT NULL COMMENT '融资偿还额(元)',
  `rqchl` float DEFAULT NULL COMMENT '融券偿还量(手)',
  `rqmcl` float DEFAULT NULL COMMENT '融券卖出量(股,份,手)',
  `rzrqye` float DEFAULT NULL COMMENT '融资融券余额(元)',
  PRIMARY KEY (`id`),
  KEY `mkt_mgnd_td` (`trade_date`),
  KEY `mkt_mgnd_tc` (`ts_code`)
) ENGINE=InnoDB;