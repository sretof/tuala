#DROP TABLE IF EXISTS `idx_daily_basic`;
CREATE TABLE `idx_daily_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `total_mv` float DEFAULT NULL COMMENT '当日总市值（元）',
  `float_mv` float DEFAULT NULL COMMENT '当日流通市值（元）',
  `total_share` float DEFAULT NULL COMMENT '当日总股本（股）',
  `float_share` float DEFAULT NULL COMMENT '当日流通股本（股）',
  `free_share` float DEFAULT NULL COMMENT '当日自由流通股本（股）',
  `turnover_rate` float DEFAULT NULL COMMENT '换手率',
  `turnover_rate_f` float DEFAULT NULL COMMENT '换手率(基于自由流通股本)',
  `pe` float DEFAULT NULL COMMENT '市盈率',
  `pe_ttm` float DEFAULT NULL COMMENT '市盈率TTM',
  `pb` float DEFAULT NULL COMMENT '市净率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iddb_tctd` (`ts_code`,`trade_date`) USING BTREE
) ENGINE=InnoDB;

