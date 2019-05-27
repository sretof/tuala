#DROP TABLE IF EXISTS `mkt_margin`;
CREATE TABLE `mkt_margin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易日期',
  `exchange_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易所代码（SSE上交所SZSE深交所）',
  `rzye` float DEFAULT NULL COMMENT '融资余额(元)',
  `rzmre` float DEFAULT NULL COMMENT '融资买入额(元)',
  `rzche` float DEFAULT NULL COMMENT '融资偿还额(元)',
  `rqye` float DEFAULT NULL COMMENT '融券余额(元)',
  `rqmcl` float DEFAULT NULL COMMENT '融券卖出量(股,份,手)',
  `rzrqye` float DEFAULT NULL COMMENT '融资融券余额(元)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mkt_mgn_td` (`trade_date`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;