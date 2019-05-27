#DROP TABLE IF EXISTS `mkt_top_inst`;
CREATE TABLE `mkt_top_inst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易日期',
  `exalter` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '营业部名称',
  `buy` float DEFAULT NULL COMMENT '买入额（万）',
  `buy_rate` float DEFAULT NULL COMMENT '买入占总成交比例',
  `sell` float DEFAULT NULL COMMENT '卖出额（万）',
  `sell_rate` float DEFAULT NULL COMMENT '卖出占总成交比例',
  `net_buy` float DEFAULT NULL COMMENT '净成交额（万）',
  PRIMARY KEY (`id`),
  KEY `mkt_tit_tc` (`ts_code`),
  KEY `mkt_tit_td` (`trade_date`),
  KEY `mkt_tit_exr` (`exalter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;