#DROP TABLE IF EXISTS `stk_weekly`;
CREATE TABLE `stk_weekly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `close` decimal(12,4) DEFAULT NULL COMMENT '收盘点位',
  `open` decimal(12,4) DEFAULT NULL COMMENT '开盘点位',
  `high` decimal(12,4) DEFAULT NULL COMMENT '最高点位',
  `low` decimal(12,4) DEFAULT NULL COMMENT '最低点位',
  `pre_close` decimal(12,4) DEFAULT NULL COMMENT '昨日收盘点',
  `change` float DEFAULT NULL COMMENT '涨跌点',
  `pct_chg` float DEFAULT NULL COMMENT '涨跌幅（%）',
  `vol` decimal(16,4) DEFAULT NULL COMMENT '成交量（手）',
  `amount` decimal(16,4) DEFAULT NULL COMMENT '成交额（千元）',
  `ori_close` decimal(12,4) DEFAULT NULL COMMENT '收盘点位',
  `ori_open` decimal(12,4) DEFAULT NULL COMMENT '开盘点位',
  `ori_high` decimal(12,4) DEFAULT NULL COMMENT '最高点位',
  `ori_low` decimal(12,4) DEFAULT NULL COMMENT '最低点位',
  `ori_pre_close` decimal(12,4) DEFAULT NULL COMMENT '昨日收盘点',
  `ori_change` float DEFAULT NULL COMMENT '涨跌点',
  `ori_pct_chg` float DEFAULT NULL COMMENT '涨跌幅（%）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_w_tctd` (`ts_code`,`trade_date`) USING BTREE
) ENGINE=InnoDB;