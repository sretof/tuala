DROP TABLE IF EXISTS `stk_income`;
CREATE TABLE `stk_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `f_ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实际公告日期，即发生过数据变更的最终日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告期',
  `close` decimal(12,4) DEFAULT NULL COMMENT '收盘点位',
  `turnover_rate` float DEFAULT NULL COMMENT '换手率（%）',
  `turnover_rate_f` float DEFAULT NULL COMMENT '换手率（自由流通股）',
  `volume_ratio` float DEFAULT NULL COMMENT '量比',
  `pe` float DEFAULT NULL COMMENT '市盈率（总市值/净利润）',
  `pe_ttm` float DEFAULT NULL COMMENT '市盈率（TTM）',
  `pb` float DEFAULT NULL COMMENT '市净率（总市值/净资产）',
  `ps` float DEFAULT NULL COMMENT '市销率',
  `ps_ttm` float DEFAULT NULL COMMENT '市销率（TTM）',
  `total_share` float DEFAULT NULL COMMENT '总股本 （万股）',
  `float_share` float DEFAULT NULL COMMENT '流通股本 （万股）',
  `free_share` float DEFAULT NULL COMMENT '自由流通股本 （万）',
  `total_mv` float DEFAULT NULL COMMENT '总市值 （万元）',
  `circ_mv` float DEFAULT NULL COMMENT '流通市值（万元）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_db_tctd` (`ts_code`,`trade_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

