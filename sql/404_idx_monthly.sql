#DROP TABLE IF EXISTS `idx_monthly`;
CREATE TABLE `idx_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `close` float DEFAULT NULL COMMENT '收盘点位',
  `open` float DEFAULT NULL COMMENT '开盘点位',
  `high` float DEFAULT NULL COMMENT '最高点位',
  `low` float DEFAULT NULL COMMENT '最低点位',
  `pre_close` float DEFAULT NULL COMMENT '昨日收盘点',
  `change` float DEFAULT NULL COMMENT '涨跌点',
  `pct_chg` float DEFAULT NULL COMMENT '涨跌幅（%）',
  `vol` float DEFAULT NULL COMMENT '成交量（手）',
  `amount` float DEFAULT NULL COMMENT '成交额（千元）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idm_tctd` (`ts_code`,`trade_date`) USING BTREE
) ENGINE=InnoDB;