DROP TABLE IF EXISTS `stk_adj_factor`;
CREATE TABLE `stk_adj_factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易日期',
  `adj_factor` float DEFAULT NULL COMMENT '复权因子',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_adjf_tctd` (`ts_code`,`trade_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;