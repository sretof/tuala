#DROP TABLE IF EXISTS `fund_daily`;
CREATE TABLE `fund_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `close` decimal(12,4) DEFAULT NULL COMMENT 'fqf收盘点位',
  `open` decimal(12,4) DEFAULT NULL COMMENT 'fqf开盘点位',
  `high` decimal(12,4) DEFAULT NULL COMMENT 'fqf最高点位',
  `low` decimal(12,4) DEFAULT NULL COMMENT 'fqf最低点位',
  `pre_close` decimal(12,4) DEFAULT NULL COMMENT 'fqf昨日收盘点',
  `change` float DEFAULT NULL COMMENT 'fqf涨跌点',
  `pct_chg` float DEFAULT NULL COMMENT 'fqf涨跌幅（%）',
  `vol` decimal(16,4) DEFAULT NULL COMMENT '成交量（手）',
  `amount` decimal(16,4) DEFAULT NULL COMMENT '成交额（千元）',
  PRIMARY KEY (`id`),
  KEY `f_fdy_tc` (`ts_code`),
  UNIQUE KEY `f_fdy_tctd` (`ts_code`,`trade_date`) USING BTREE
) ENGINE=InnoDB;